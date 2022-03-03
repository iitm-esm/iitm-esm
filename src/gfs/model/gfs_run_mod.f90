module gfs_run_mod
  use gfs_internalstate_mod, only: gfs_internalstate
  use time_manager_mod, only: time_type, increment_date
  use time_manager_mod, only: operator(<), get_date, date_to_string
  use time_manager_mod, only: operator(>=), print_date
  use namelist_def, only: nsout, nsswr, nslwr, hybrid, lsswr, lssav, is_first_time
  use namelist_def, only: gen_coord_hybrid, lscca, lsfwd, lslwr, nsdfi, do_filter
  use namelist_def, only: adiab, igen, ngptc
  use vert_def, only: bm, tov, am, sv
  use mpi_def, only: icolor, liope
  use layout1, only: lats_node_r, ipt_lats_node_r, me
  use date_def, only: spdmax, fhour
  use resol_def, only: levs
  use do_tstep_mod, only: do_tstep
  use error_mod, only: handle_error, FATAL, WARNING
  use vert_def, only: si, sl
  use date_def, only: idate
  use land_model_mod, only: write_surface_restart
  use wrt_restart_mod, only: wrt_restart
  use namelist_def, only: restart_interval
  use output_manager_fms, only: end_output_manager
  
  implicit none
  
  contains
  subroutine gfs_run(currtime_fms, stoptime_fms, gis, rc)
    implicit none
    type(gfs_internalstate), pointer, intent(inout) :: gis
    integer, optional,                intent(out)   :: rc
    type(time_type) :: currtime_fms, stoptime_fms
    type(time_type) :: Time_restart
    integer                                         :: advancecount4, advancecounts
    integer                                         :: dd, hh, yy, mm, mins, secs
    real                                            :: timestep_sec_r
    integer                                         :: k
    real :: fhdfi
    character (len=512) :: msg

    !***********************************************************************
    !     lsfwd      logical true during a first forward step
    !     lssav      logical true during a step for which
    !                diagnostics are accumulated
    !     lscca      logical true during a step for which convective clouds
    !                are calculated from convective precipitation rates
    !     lsswr      logical true during a step for which
    !                solar radiation heating rates are computed
    !     lslwr      logical true during a step for which
    !                longwave radiation heating rates are computed
    !     phour      real forecast hour at the end of the previous timestep
    !     fhswr      real frequency of solar radiation and convective cloud
    !                (default: 1.)
    !     is_first_time  if =0 read one time level sigmas and te=tem zem=ze ...
    !     do_filter      digital filter
    !
    !     lsout controls freq. of output
    !     nsout controls freq. of output in time steps
    !     fhout controls freq. of output in hours
    !
    !     nsres time steps between writing restart files
    !     nszer time steps between zeroing fluxes
    !***********************************************************************
    
    advancecount4 = gis%kfhour*(3600/nint(gis%deltim))
    advancecounts = advancecount4
 
    timestep_sec_r = real(gis%deltim)

    !-> coupling insertion
      call atm_announce('to call atm_tiles_init',2)
      call atm_tiles_init(gis%lonr,gis%latr,gis%lonf,gis%latg,lats_node_r,ipt_lats_node_r,gis%global_lats_r,gis%lonsperlar)

      call atm_announce('to send grid',2)
      call atm_sendgrid(gis%xlon,gis%xlat)
    !<- coupling insertion
      
      fhdfi = 3.0
      if(is_first_time) then
        if(do_filter) then !------------------do digital filter
          nsdfi=nint(fhdfi*3600.0/timestep_sec_r)
          call tldfi(timestep_sec_r, advancecount4, gis%phour,        &
                 gis%trie_ls,gis%trio_ls,                             &
                 gis%ls_node,gis%ls_nodes,gis%max_ls_nodes,           &
                 gis%lats_nodes_a,gis%global_lats_a,                  &
                 gis%lonsperlat,                                      &
                 gis%lats_nodes_r,gis%global_lats_r,                  &
                 gis%lonsperlar,                                      &
                 gis%epse,gis%epso,gis%epsedn,gis%epsodn,             &
                 gis%snnp1ev,gis%snnp1od,gis%ndexev,gis%ndexod,       &
                 gis%plnev_a,gis%plnod_a,gis%pddev_a,gis%pddod_a,     &
                 gis%plnew_a,gis%plnow_a,                             &
                 gis%plnev_r,gis%plnod_r,gis%pddev_r,gis%pddod_r,     &
                 gis%plnew_r,gis%plnow_r,                             &
                 gis%lslag,                                           &
                 gis%xlon,gis%xlat,gis%coszdg,gis%sfc_fld,gis%flx_fld,&
                 gis%hprime,gis%swh,gis%hlw,gis%fluxr ,               &
                 gis%sfalb,gis%slag,gis%sdec,gis%cdec,                &
                 gis%ozplin,gis%jindx1,gis%jindx2,                    &
                 gis%ddy,gis%pdryini,                                 &
                 gis%phy_f3d,  gis%phy_f2d, gis%nblck,                &
                 gis%zhour,gis%lsout,gis%colat1,        &
                 gis%cfhour1,currtime_fms)

          gis%phour=fhour
        endif !  -----------------------------end digital filter

        advancecount4 = advancecount4 + 1
        fhour= real(advancecount4) * timestep_sec_r / 3600.0
        lssav=.true. !always true, except in digital filter
        lsswr=.true. !ex short wave radaition, used in gloopr(astronomy)
        lslwr=.true. !ex long  wave radaition, used in gloopr(astronomy)
        lsfwd=.true. !true only during forward step
        lscca=.false.!get clouds from precp.(1st step use fixio_r clds)
        gis%lsout=mod(advancecount4 ,nsout).eq.0.or.gis%phour.eq.0.

        if(hybrid)then
          call get_cd_hyb(timestep_sec_r/2.)
        else if( gen_coord_hybrid ) then                                  ! hmhj
          call get_cd_hyb_gc(timestep_sec_r/2.)                            ! hmhj
        else
          call get_cd_sig(am,bm,timestep_sec_r/2.,tov,sv)
        endif

        !performing the first time step.
        !*******************************
        call do_tstep(timestep_sec_r/2., advancecount4, gis%phour,     &
                 gis%trie_ls,gis%trio_ls,                              &
                 gis%ls_node,gis%ls_nodes,gis%max_ls_nodes,            &
                 gis%lats_nodes_a,gis%global_lats_a,                   &
                 gis%lonsperlat,                                       &
                 gis%lats_nodes_r,gis%global_lats_r,                   &
                 gis%lonsperlar,                                       &
                 gis%epse,gis%epso,gis%epsedn,gis%epsodn,              &
                 gis%snnp1ev,gis%snnp1od,gis%ndexev,gis%ndexod,        &
                 gis%plnev_a,gis%plnod_a,gis%pddev_a,gis%pddod_a,      &
                 gis%plnew_a,gis%plnow_a,                              &
                 gis%plnev_r,gis%plnod_r,gis%pddev_r,gis%pddod_r,      &
                 gis%plnew_r,gis%plnow_r,                              &
                 gis%lslag,                                            &
                 gis%xlon,gis%xlat,gis%coszdg,gis%sfc_fld,gis%flx_fld, &
                 gis%hprime,gis%swh,gis%hlw,gis%fluxr ,                &
                 gis%sfalb,gis%slag,gis%sdec,gis%cdec,                 &
                 gis%ozplin,gis%jindx1,gis%jindx2,                     &
                 gis%ddy,gis%pdryini,                                  &
                 gis%phy_f3d,  gis%phy_f2d, gis%nblck,                 &
                 gis%zhour,gis%lsout,gis%colat1,         &
                 gis%cfhour1,currtime_fms)
 
        gis%phour=fhour
        
        currtime_fms = increment_date(currtime_fms,                   &
                seconds=(advancecount4-advancecounts)*nint(gis%deltim))

      endif  ! fin first forward step if needed



!     initializations for the semi-implicit solver
!     ********************************************

 if(hybrid)then
     call get_cd_hyb(timestep_sec_r)
 else if( gen_coord_hybrid ) then                                       ! hmhj
     call get_cd_hyb_gc(timestep_sec_r)                                 ! hmhj
 else
     call get_cd_sig(am,bm,timestep_sec_r,tov,sv)
 endif

 lssav=.true. !always true, except in digital filter
 lsfwd=.false. !true only during forward step


!***********************************************************************
!     time loop
!***********************************************************************

 call get_date(currtime_fms,yy, mm, dd, hh, mins, secs)
 Time_restart = increment_date(currtime_fms, restart_interval(1), restart_interval(2), &
                restart_interval(3), restart_interval(4), restart_interval(5), &
                restart_interval(6))

 if(me==0) print *, ' before main do loop, currtime=',yy, mm, dd, hh, mins, secs

 main_time_loop: do while(currtime_fms<stoptime_fms)
        currtime_fms = increment_date(currtime_fms, seconds=nint(gis%deltim)) 
        advancecount4 = advancecount4 + 1
        fhour= real(advancecount4) * timestep_sec_r / 3600.0
        gis%lsout=mod(advancecount4 ,nsout).eq.0
        lscca=mod(advancecount4 ,nsswr).eq.0
        lsswr=mod(advancecount4 ,nsswr).eq.1
        lslwr=mod(advancecount4 ,nslwr).eq.1
      if (me == 0) call print_date(currtime_fms,'Forecast Date')
      call do_tstep(timestep_sec_r, advancecount4, gis%phour,          &
                 gis%trie_ls,gis%trio_ls,                              &
                 gis%ls_node,gis%ls_nodes,gis%max_ls_nodes,            &
                 gis%lats_nodes_a,gis%global_lats_a,                   &
                 gis%lonsperlat,                                       &
                 gis%lats_nodes_r,gis%global_lats_r,                   &
                 gis%lonsperlar,                                       &
                 gis%epse,gis%epso,gis%epsedn,gis%epsodn,              &
                 gis%snnp1ev,gis%snnp1od,gis%ndexev,gis%ndexod,        &
                 gis%plnev_a,gis%plnod_a,gis%pddev_a,gis%pddod_a,      &
                 gis%plnew_a,gis%plnow_a,                              &
                 gis%plnev_r,gis%plnod_r,gis%pddev_r,gis%pddod_r,      &
                 gis%plnew_r,gis%plnow_r,                              &
                 gis%lslag,                                            &
                 gis%xlon,gis%xlat,gis%coszdg,gis%sfc_fld,gis%flx_fld, &
                 gis%hprime,gis%swh,gis%hlw,gis%fluxr ,                &
                 gis%sfalb,gis%slag,gis%sdec,gis%cdec,                 &
                 gis%ozplin,gis%jindx1,gis%jindx2,                     &
                 gis%ddy,gis%pdryini,                                  &
                 gis%phy_f3d,  gis%phy_f2d, gis%nblck,                 &
                 gis%zhour,gis%lsout,gis%colat1,         &
                 gis%cfhour1,currtime_fms)
        

       if (.not.liope.or.icolor.ne.2) then
        do k=1,levs
          if(spdmax(k).gt.0. .and. spdmax(k).lt.1000.) then
            continue
          else
            write(msg,*)'Unphysical maximum speed',spdmax(k),              &
                       ' me=',me,' k=',k
            call handle_error(FATAL, msg)
          endif
        enddo
       endif

      if( currtime_fms >= Time_restart ) then
        Time_restart = increment_date(currtime_fms, restart_interval(1), restart_interval(2), &
                       restart_interval(3), restart_interval(4), restart_interval(5), &
                       restart_interval(6))

        call wrt_restart(gis%trie_ls,gis%trio_ls, &
             gis%sfc_fld, &
             si,sl,fhour,idate, &
             igen,gis%pdryini, &
             gis%ls_node,gis%ls_nodes,gis%max_ls_nodes, &
             gis%global_lats_r,gis%lonsperlar,gis%snnp1ev,gis%snnp1od, &
             gis%phy_f3d, gis%phy_f2d, ngptc, gis%nblck, adiab, currtime_fms)

        call write_surface_restart(currtime_fms)
        if (me==0) then
          open(25,file='RESTART/'//trim(date_to_string(currtime_fms))//'.atm.res')
          call get_date(currtime_fms,yy,mm,dd,hh,mins,secs)
          write( 25, '(6i6,8x,a)' )yy,mm,dd,hh,mins,secs, &
             'Current model time: year, month, day, hour, minute, second'
          close(25)
        endif
      endif

      gis%phour=fhour
 end do main_time_loop

 call wrt_restart(gis%trie_ls,gis%trio_ls, &
         gis%sfc_fld, &
         si,sl,fhour,idate, &
         igen,gis%pdryini, &
         gis%ls_node,gis%ls_nodes,gis%max_ls_nodes, &
         gis%global_lats_r,gis%lonsperlar,gis%snnp1ev,gis%snnp1od, &
         gis%phy_f3d, gis%phy_f2d, ngptc, gis%nblck, adiab)

 call write_surface_restart()
 if (me==0) then
   open(25,file='RESTART/atm.res')
   call get_date(currtime_fms,yy,mm,dd,hh,mins,secs)
   write( 25, '(6i6,8x,a)' )yy,mm,dd,hh,mins,secs, &
   'Current model time: year, month, day, hour, minute, second'
   close(25)
 endif

 if (me==0) then
    call get_date(currtime_fms,yy,mm,dd,hh,mins,secs)
    print *, 'end of run currtime:',yy,mm,dd,hh,mins,secs
    call get_date(stoptime_fms,yy,mm,dd,hh,mins,secs)
    print *, 'end of run stoptime:',yy,mm,dd,hh,mins,secs
    write(*,*) 'END OF RUN'
 end if
 if (icolor/=2) call end_output_manager(currtime_fms)

 if(present(rc)) then
     rc = 0 
 end if

end subroutine gfs_run

end module gfs_run_mod
