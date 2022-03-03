 module gfs_initialize_mod

 use machine, only : kind_io4
 use gfsio_module , only : gfsio_init
 use omp_lib, only: omp_get_num_threads
 use diag_tools, only: init_diag_tools
 use data_override_mod, only: init_data_override
 use interpred_mod, only: init_interpred
 use land_model_mod, only: init_land_model, read_surface_restart
 use ocean_mod, only: init_ocn
 use date_def, only: fhour, spdmax
 use error_mod, only: handle_error, FATAL, WARNING
 use albedo_mod, only: init_albedo_mod
 use module_radiation_gases, only: init_radiation_gases
 use mpp_mod, only : mpp_init
 use do_tstep_mod, only : init_do_tstep
 use output_manager_fms, only: init_output_manager_fms => init_output_manager
 use module_radiation_driver, only: init_grrad
 ! coupling insertion->
      use atm_cc, only: mpi_comm_atmos
 !<-coupling insertion

 use gfs_internalstate_mod

 implicit none

 contains

 subroutine gfs_initialize(gis, currtime_fms, stoptime_fms, rc)

  ! this subroutine set up the internal state variables,
  ! allocate internal state arrays for initializing the gfs system.
  !----------------------------------------------------------------

  use time_manager_mod, only: time_type, increment_date

  type(gfs_internalstate), pointer, intent(inout) :: gis
  integer,                          intent(out)   :: rc

  integer                 :: runduration_hour
  integer                 :: ifhmax
  integer                 :: ierr
  type(time_type)         :: currtime_fms, stoptime_fms

  integer :: l, ilat, locl, ikey, nrank_all, nfluxes
  real (kind=kind_io4) blatc4
  real (kind=kind_io4), allocatable :: pl_lat4(:), pl_pres4(:), pl_time4(:)

! set up parameters of mpi communications.
!-------------------------------------------------------------------
 me     = gis%me
 nodes  = gis%nodes
 nlunit = gis%nam_gfs%nlunit

 call compns(gis%deltim,gis%iret,                                            &
             gis%ntrac,   gis%nxpt, gis%nypt, gis%jintmx, gis%jcap,          &
             gis%levs,    gis%levr, gis%lonf, gis%lonr,   gis%latg, gis%latr,&
             gis%ntoz,    gis%ntcw, gis%ncld, gis%lsoil,  gis%nmtvr,         &
             gis%num_p3d, gis%num_p2d, me,    gis%nam_gfs%nlunit, gis%nam_gfs%gfs_namelist)

 if(gis%iret.ne.0) then
   call handle_error(FATAL, 'incompatible namelist - aborted in main')
 endif

 call set_soilveg(me,gis%nam_gfs%nlunit)
 call set_tracer_const(gis%ntrac,me,gis%nam_gfs%nlunit)     ! hmhj

      ntrac   = gis%ntrac
      nxpt    = gis%nxpt
      nypt    = gis%nypt
      jintmx  = gis%jintmx
      jcap    = gis%jcap
      levs    = gis%levs
      levr    = gis%levr
      lonf    = gis%lonf
      lonr    = gis%lonr
      latg    = gis%latg
      latr    = gis%latr
      ntoz    = gis%ntoz
      ntcw    = gis%ntcw
      ncld    = gis%ncld
      lsoil   = gis%lsoil
      nmtvr   = gis%nmtvr
      num_p3d = gis%num_p3d
      num_p2d = gis%num_p2d
      if (gis%nam_gfs%total_member <= 1) then
        ens_nam=' '
      else
        write(ens_nam,'("_",i2.2)') gis%nam_gfs%member_id
      endif

      ivssfc  = 200509
      ivssfc_restart  = 200509
      if (ivssfc .gt. ivssfc_restart) ivssfc_restart = ivssfc
      ivsupa  = 0
      if (levs .gt. 99) ivsupa  = 200509

      levh   = ntrac*levs
      latgd   = latg+ 2*jintmx 
      jcap1  = jcap+1 
      jcap2  = jcap+2 
      latg2  = latg/2 
      latr2  = latr/2 
      levm1  = levs-1 
      levp1  = levs+1 
      lonfx  = lonf + 1 + 2*nxpt+1 
      lonrx  = lonr+2 
      lnt    = jcap2*jcap1/2 
      lnuv   = jcap2*jcap1 
      lnt2   = 2*lnt 
      lnt22  = 2*lnt+1 
      lnte   = (jcap2/2)*((jcap2/2)+1)-1 
      lnto   = (jcap2/2)*((jcap2/2)+1)-(jcap2/2) 
      lnted  = lnte 
      lntod  = lnto 

      ngrids_sfcc = 32+lsoil*3   ! no cv, cvb, cvt! includes t2m, q2m, tisfc


      if (climate) then
        ngrids_flx  = 66+38      ! additional fields (land surface + rad flux+snowfall) - yth 3/10
      else
        ngrids_flx  = 66+45      ! additional fields (land surface + rad flux_snowfall) - yth 3/10
      endif
      nfxr        = 37           ! yth 03/10 added 4 sfc sw flux components
      ngrids_gg   = 2+levs*(4+ntrac)

      gis%lnt2    = lnt2

      allocate(lat1s_a(0:jcap))
      allocate(lat1s_r(0:jcap))
      allocate(lon_dims_a(latgd))
      allocate(lon_dims_ext(latgd))
      allocate(lon_dims_r(latr))

      allocate(colrad_a(latg2))
      allocate(wgt_a(latg2))
      allocate(wgtcs_a(latg2))
      allocate(rcs2_a(latg2))
      allocate(sinlat_a(latg2))

      allocate(colrad_r(latr))
      allocate(wgt_r(latr2))
      allocate(wgtcs_r(latr2))
      allocate(rcs2_r(latr2))
      allocate(sinlat_r(latr))
      allocate(coslat_r(latr))

      allocate(am(levs,levs))
      allocate(bm(levs,levs))
      allocate(cm(levs,levs))
      allocate(dm(levs,levs,jcap1))
      allocate(tor(levs))
      allocate(si(levp1))
      allocate(sik(levp1))
      allocate(sl(levs))
      allocate(slk(levs))
      allocate(del(levs))
      allocate(rdel2(levs))
      allocate(ci(levp1))
      allocate(cl(levs))
      allocate(tov(levs))
      allocate(sv(levs))

      allocate(ak5(levp1))
      allocate(bk5(levp1))
      allocate(ck5(levp1))                                            ! hmhj
      allocate(thref(levp1))                                          ! hmhj
      allocate(ck(levs))
      allocate(dbk(levs))
      allocate(bkl(levs))
      allocate(amhyb(levs,levs))
      allocate(bmhyb(levs,levs))
      allocate(svhyb(levs))
      allocate(tor_hyb(levs))
      allocate(d_hyb_m(levs,levs,jcap1))
      allocate(dm205_hyb(jcap1,levs,levs))

      allocate(spdmax(levs))

      allocate(buff_mult(lonr,latr,ngrids_sfc))
      if (gfsio_out) then
        allocate(buff_multg(lonr*latr,ngrids_gg))
      endif

      allocate(lbasdz(4,2,levs),lbasiz(4,2,levs),detai(levp1), &
       detam(levs),etamid(levs),etaint(levp1),                 &
       sinlamg(lonf,latg2),coslamg(lonf,latg2))

      allocate(tor_sig(levs), d_m(levs,levs,jcap1),            &
         dm205(jcap1,levs,levs))
         dm205=555555555.
         d_m  =444444444.

      allocate(z(lnt2))
      allocate(z_r(lnt2))

      nfluxes = 153
      allocate(fmm(lonr*latr,nfluxes),lbmm(lonr*latr,nfluxes))
      allocate(ibufm(50,nfluxes),rbufm(50,nfluxes))

      allocate(gis%lonsperlat(latg))

      allocate(gis%lonsperlar(latr))

      if (num_reduce == 0) then
        gis%lonsperlat = lonf
        gis%lonsperlar = lonr
      else
        call set_lonsgg(gis%lonsperlat,gis%lonsperlar,num_reduce,me)
      endif

      if (ras) then
        nrcm = max(nrcmax, nint((nrcmax*gis%deltim)/600.0))
      else
        nrcm = 1
      endif

      if (ntoz .le. 0) then      ! diagnostic ozone
        rewind (kozc)
        read (kozc,end=101) latsozc, levozc, timeozc, blatc4
  101   if (levozc .lt. 10 .or. levozc .gt. 100) then
          rewind (kozc)
          levozc  = 17
          latsozc = 18
          blatc   = -85.0
        else
          blatc   = blatc4
        endif
        latsozp   = 2
        levozp    = 1
        timeoz    = 1
        pl_coeff  = 0
      else                       ! prognostic ozone
        open(kozpl,file='INPUT/global_o3prdlos.f77',status='old',form='unformatted')
        rewind (kozpl)
        read (kozpl) pl_coeff, latsozp, levozp, timeoz
        allocate (pl_lat(latsozp), pl_pres(levozp),pl_time(timeoz+1))
        allocate (pl_lat4(latsozp), pl_pres4(levozp),pl_time4(timeoz+1))
        rewind (kozpl)
        read (kozpl) pl_coeff, latsozp, levozp, timeoz, pl_lat4, pl_pres4,  &
                     pl_time4
        pl_pres(:) = pl_pres4(:)
        pl_lat(:)  = pl_lat4(:)
        pl_time(:) = pl_time4(:)
        latsozc = 2
        blatc   = 0.0
      endif
      dphiozc = -(blatc+blatc)/(latsozc-1)

      if (me .eq. 0) then
        print *,' latsozp=',latsozp,' levozp=',levozp,' timeoz=',timeoz
        print *,' latsozc=',latsozc,' levozc=',levozc,' timeozc=',        &
                  timeozc, 'dphiozc=',dphiozc
        print *,' pl_lat=',pl_lat
        print *,' pl_pres=',pl_pres
        print *,' pl_time=',pl_time
      endif
      pl_pres(:) = log(0.1*pl_pres(:))       ! natural log of pres in cbars

      allocate(gis%ozplin(latsozp,levozp,pl_coeff,timeoz)) !ozone p-l coeffcients

      p_gz  = 0*levs+0*levh+1  !      gze/o(lnte/od,2),
      p_zem = 0*levs+0*levh+2  !     zeme/o(lnte/od,2,levs),
      p_dim = 1*levs+0*levh+2  !     dime/o(lnte/od,2,levs),
      p_tem = 2*levs+0*levh+2  !     teme/o(lnte/od,2,levs),
      p_rm  = 3*levs+0*levh+2  !      rme/o(lnte/od,2,levh),
      p_qm  = 3*levs+1*levh+2  !      qme/o(lnte/od,2),
      p_ze  = 3*levs+1*levh+3  !      zee/o(lnte/od,2,levs),
      p_di  = 4*levs+1*levh+3  !      die/o(lnte/od,2,levs),
      p_te  = 5*levs+1*levh+3  !      tee/o(lnte/od,2,levs),
      p_rq  = 6*levs+1*levh+3  !      rqe/o(lnte/od,2,levh),
      p_q   = 6*levs+2*levh+3  !       qe/o(lnte/od,2),
      p_dlam= 6*levs+2*levh+4  !  dpdlame/o(lnte/od,2),
      p_dphi= 6*levs+2*levh+5  !  dpdphie/o(lnte/od,2),
      p_uln = 6*levs+2*levh+6  !     ulne/o(lnte/od,2,levs),
      p_vln = 7*levs+2*levh+6  !     vlne/o(lnte/od,2,levs),
      p_w   = 8*levs+2*levh+6  !       we/o(lnte/od,2,levs),
      p_x   = 9*levs+2*levh+6  !       xe/o(lnte/od,2,levs),
      p_y   =10*levs+2*levh+6  !       ye/o(lnte/od,2,levs),
      p_rt  =11*levs+2*levh+6  !      rte/o(lnte/od,2,levh),
      p_zq  =11*levs+3*levh+6  !      zqe/o(lnte/od,2)

      lots = 5*levs+1*levh+3 
      lotd = 6*levs+2*levh+0 
      lota = 3*levs+1*levh+1 

      kwq  = 0*levs+0*levh+1   !   qe/o_ls
      kwte = 0*levs+0*levh+2   !  tee/o_ls
      kwdz = 1*levs+0*levh+2   !  die/o_ls  zee/o_ls
      kwrq = 3*levs+0*levh+2   !  rqe/o_ls


      gis%p_gz  = 0*levs+0*levh+1  !      gze/o(lnte/od,2),
      gis%p_zem = 0*levs+0*levh+2  !     zeme/o(lnte/od,2,levs),
      gis%p_dim = 1*levs+0*levh+2  !     dime/o(lnte/od,2,levs),
      gis%p_tem = 2*levs+0*levh+2  !     teme/o(lnte/od,2,levs),
      gis%p_rm  = 3*levs+0*levh+2  !      rme/o(lnte/od,2,levh),
      gis%p_qm  = 3*levs+1*levh+2  !      qme/o(lnte/od,2),
      gis%p_ze  = 3*levs+1*levh+3  !      zee/o(lnte/od,2,levs),
      gis%p_di  = 4*levs+1*levh+3  !      die/o(lnte/od,2,levs),
      gis%p_te  = 5*levs+1*levh+3  !      tee/o(lnte/od,2,levs),
      gis%p_rq  = 6*levs+1*levh+3  !      rqe/o(lnte/od,2,levh),
      gis%p_q   = 6*levs+2*levh+3  !       qe/o(lnte/od,2),
      gis%p_dlam= 6*levs+2*levh+4  !  dpdlame/o(lnte/od,2),
      gis%p_dphi= 6*levs+2*levh+5  !  dpdphie/o(lnte/od,2),
      gis%p_uln = 6*levs+2*levh+6  !     ulne/o(lnte/od,2,levs),
      gis%p_vln = 7*levs+2*levh+6  !     vlne/o(lnte/od,2,levs),
      gis%p_w   = 8*levs+2*levh+6  !       we/o(lnte/od,2,levs),
      gis%p_x   = 9*levs+2*levh+6  !       xe/o(lnte/od,2,levs),
      gis%p_y   =10*levs+2*levh+6  !       ye/o(lnte/od,2,levs),
      gis%p_rt  =11*levs+2*levh+6  !      rte/o(lnte/od,2,levh),
      gis%p_zq  =11*levs+3*levh+6  !      zqe/o(lnte/od,2)

      gis%lots = 5*levs+1*levh+3 
      gis%lotd = 6*levs+2*levh+0 
      gis%lota = 3*levs+1*levh+1 

      allocate(gis%tee1(levs))

      gis%lslag=.false.  ! if false eulerian scheme =.true. for semilag


!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
!!
!!      create io communicator and comp communicator
!!
      if (me == 0) write(*,*) 'io option ,liope :',liope

      mpi_comm_all=mpi_comm_atmos
      nodes=gis%nodes
      
      call mpi_comm_dup(mpi_comm_all, mpi_comm_all_dup, ierr)
      call mpi_barrier (mpi_comm_all_dup,               ierr)

      if (nodes == 1) liope=.false.
      if (liope) then
        call mpi_comm_rank(mpi_comm_all_dup,nrank_all,ierr)
        icolor=1
        ikey=1
        nodes_comp=nodes-1
        if (nrank_all.eq.nodes-1) then
!!  io server
          write(*,*) 'io server task'
          icolor=2
          gis%kcolor=mpi_undefined
          call mpi_comm_split(mpi_comm_all_dup,icolor,ikey,mc_io,ierr)
          call mpi_comm_split(mpi_comm_all_dup,gis%kcolor,ikey,mc_comp,ierr)
        else
          icolor=mpi_undefined
          gis%kcolor=1
          call mpi_comm_split(mpi_comm_all_dup,gis%kcolor,ikey,mc_comp,ierr)
          call mpi_comm_split(mpi_comm_all_dup,icolor,ikey,mc_io,ierr)
          call mpi_comm_size(mc_comp,nodes,ierr)
        endif
      else
        icolor=2
        mc_comp=mpi_comm_all_dup
        nodes_comp=nodes
      endif

      if (me.eq.0) then
      print 100, jcap,levs
100   format (' smf ',i3,i3,' created august 2000 ev od ri ')
!$omp parallel 
      print*,'number of threads is ',omp_get_num_threads()
!$omp end parallel
        if (liope) then
          print*,'number of mpi procs is ',nodes
          print*,'number of mpi io procs is 1 (nodes)'
        else
          print*,'number of mpi procs is ',nodes
        endif
      endif

      gis%cons0    =    0.0d0
      gis%cons0p5  =    0.5d0
      gis%cons1200 = 1200.d0
      gis%cons3600 = 3600.d0

      if (liope) then
         if (icolor.eq.2) then
           ls_dim = jcap1
         else
           ls_dim = (jcap1-1)/nodes+1
         endif
      else
         ls_dim = (jcap1-1)/nodes+1
      endif
!cxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
      allocate (      gis%ls_node (ls_dim*3) )
      allocate (      gis%ls_nodes(ls_dim,nodes) )
      allocate (  gis%max_ls_nodes(nodes) )

      allocate (  gis%lats_nodes_a(nodes) )
      allocate ( gis%global_lats_a(latg) )

      allocate (  gis%lats_nodes_r(nodes) )
      allocate ( gis%global_lats_r(latr) )

      allocate (   gis%lats_nodes_ext(nodes) )
      allocate ( gis%global_lats_ext(latg+2*jintmx+2*nypt*(nodes-1)) )
!c
!c
      gis%iprint = 0
      call get_ls_node( me, gis%ls_node, ls_max_node, gis%iprint )
!c
!c
      len_trie_ls=0
      len_trio_ls=0
      do locl=1,ls_max_node
           gis%ls_node(locl+  ls_dim)=len_trie_ls
          gis%ls_node(locl+2*ls_dim)=len_trio_ls
         l=gis%ls_node(locl)
         len_trie_ls=len_trie_ls+(jcap+3-l)/2
         len_trio_ls=len_trio_ls+(jcap+2-l)/2
      enddo
!c
!c
      allocate (       gis%epse  (len_trie_ls) )
      allocate (       gis%epso  (len_trio_ls) )
      allocate (       gis%epsedn(len_trie_ls) )
      allocate (       gis%epsodn(len_trio_ls) )
!c
      allocate (      gis%snnp1ev(len_trie_ls) )
      allocate (      gis%snnp1od(len_trio_ls) )
!c
      allocate (       gis%ndexev(len_trie_ls) )
      allocate (       gis%ndexod(len_trio_ls) )
!c
      allocate (      gis%plnev_a(len_trie_ls,latg2) )
      allocate (      gis%plnod_a(len_trio_ls,latg2) )
      allocate (      gis%pddev_a(len_trie_ls,latg2) )
      allocate (      gis%pddod_a(len_trio_ls,latg2) )
      allocate (      gis%plnew_a(len_trie_ls,latg2) )
      allocate (      gis%plnow_a(len_trio_ls,latg2) )
!c
      allocate (      gis%plnev_r(len_trie_ls,latr2) )
      allocate (      gis%plnod_r(len_trio_ls,latr2) )
      allocate (      gis%pddev_r(len_trie_ls,latr2) )
      allocate (      gis%pddod_r(len_trio_ls,latr2) )
      allocate (      gis%plnew_r(len_trie_ls,latr2) )
      allocate (      gis%plnow_r(len_trio_ls,latr2) )
!c
      gis%maxstp=36

 
      if(me.eq.0) print*,'from compns : iret=',gis%iret,' nsout=',nsout, &
       ' nsswr=',nsswr,' nslwr=',nslwr,' nszer=',nszer,   &
       ' nsdfi=',nsdfi,' nscyc=',nscyc,' ras=',ras
!!
!     if predicted ozon is desired set jo3=2
      jo3=2          !using predicted ozone in radiation.
!c
      gis%lats_nodes_ext = 0
      call getcon(gis%nges,gis%nradr,gis%nradf,gis%nnmod,               &
           gis%n3,gis%n4,gis%nflps,gis%nsigi,gis%nsigs,gis%nsfci,       &
           gis%nznli,gis%nsfcf,gis%nznlf,gis%nsfcs,gis%nznls,           &
           gis%ndgi,gis%ndgf,gis%ngpken,                                &
           gis%mods,gis%niter,gis%ini,gis%nstep,gis%nfiles,             &
           gis%ksout,gis%ifges,gis%ibrad,                               &
           gis%ls_node,gis%ls_nodes,gis%max_ls_nodes,                   &
           gis%lats_nodes_a,gis%global_lats_a,                          &
           gis%lonsperlat,                                              &
           gis%lats_nodes_r,gis%global_lats_r,                          &
           gis%lonsperlar,                                              &
           gis%lats_nodes_ext,gis%global_lats_ext,                      &
           gis%epse,gis%epso,gis%epsedn,gis%epsodn,                     &
           gis%snnp1ev,gis%snnp1od,gis%ndexev,gis%ndexod,               &
           gis%plnev_a,gis%plnod_a,gis%pddev_a,gis%pddod_a,             &
           gis%plnew_a,gis%plnow_a,                                     &
           gis%plnev_r,gis%plnod_r,gis%pddev_r,gis%pddod_r,             &
           gis%plnew_r,gis%plnow_r,gis%colat1)
!!
      call sfcvar_aldata(lonr,lats_node_r,lsoil,gis%sfc_fld,ierr)
      call flxvar_aldata(lonr,lats_node_r,gis%flx_fld,ierr)

      allocate (   gis%xlon(lonr,lats_node_r))
      allocate (   gis%xlonf(lonr,lats_node_r))
      allocate (   gis%xlat(lonr,lats_node_r))
      allocate (   gis%coszdg(lonr,lats_node_r))
      allocate (   gis%sfalb(lonr,lats_node_r))
      allocate (   gis%hprime(nmtvr,lonr,lats_node_r))
      allocate (   gis%fluxr(nfxr,lonr,lats_node_r))

      gis%nblck=lonr/ngptc+1
      allocate (   gis%swh(ngptc,levs,gis%nblck,lats_node_r))
      allocate (   gis%hlw(ngptc,levs,gis%nblck,lats_node_r))

      allocate (gis%jindx1(lats_node_r),gis%jindx2(lats_node_r))
      allocate (gis%ddy(lats_node_r))
!
      allocate (gis%phy_f3d(ngptc,levs,gis%nblck,lats_node_r,num_p3d))
      allocate (gis%phy_f2d(lonr,lats_node_r,num_p2d))
!
      if (gfsio_out .or. gfsio_in) then
        call gfsio_init(ierr)
      endif

      if (icolor /= 2 .or. .not. liope) then
        if (num_p3d .gt. 0) gis%phy_f3d = 0.0
        if (num_p2d .gt. 0) gis%phy_f2d = 0.0
      endif
!!
!!
! modified by weiyu.
!-------------------
      if (.not.liope.or.icolor.ne.2) then
!!
      allocate (      gis%trie_ls(len_trie_ls,2,11*levs+3*levh+6) )
      allocate (      gis%trio_ls(len_trio_ls,2,11*levs+3*levh+6) )
!c
      allocate (     gis%syn_ls_a(4*ls_dim,gis%lots,latg2) )
      allocate (     gis%dyn_ls_a(4*ls_dim,gis%lotd,latg2) )
!c
      allocate (   gis%syn_gr_a_1(lonfx*gis%lots,lats_dim_ext) )
      allocate (   gis%syn_gr_a_2(lonfx*gis%lots,lats_dim_ext) )
      allocate (   gis%dyn_gr_a_1(lonfx*gis%lotd,lats_dim_ext) )
      allocate (   gis%dyn_gr_a_2(lonfx*gis%lotd,lats_dim_ext) )
      allocate (   gis%anl_gr_a_1(lonfx*gis%lota,lats_dim_ext) )
      allocate (   gis%anl_gr_a_2(lonfx*gis%lota,lats_dim_ext) )
!!
      endif !(.not.liope.or.icolor.ne.2)
!!
      if (me == 0) then
        print*, ' lats_dim_a=', lats_dim_a, ' lats_node_a=', lats_node_a
        print*, ' lats_dim_ext=', lats_dim_ext,              &
                ' lats_node_ext=', lats_node_ext
        print*, ' lats_dim_r=', lats_dim_r, ' lats_node_r=', lats_node_r
      endif
!
      if (gis%lslag) then
        ilat=lats_node_ext
      else
        ilat=lats_node_a
      endif

!c......................................................................

      write(*,*) 'number of latitudes ext. :',lats_node_ext,              &
                  lats_dim_ext,lats_node_a

      print *,' sig_ini=',gis%nam_gfs%sig_ini,' sig_ini2=',gis%nam_gfs%sig_ini2 &
             ,' sfc_ini=',gis%nam_gfs%sfc_ini
      gis%pdryini = 0.0
      call spect_fields(gis%n1, gis%n2,                                &
        gis%pdryini, gis%trie_ls,  gis%trio_ls,                        &
        gis%ls_node, gis%ls_nodes, gis%max_ls_nodes,                   &
        gis%snnp1ev, gis%snnp1od,  gis%phy_f3d,  gis%phy_f2d,          &
        gis%global_lats_r,  gis%nblck,   gis%lonsperlar,               &
        gis%epse, gis%epso, gis%plnev_r, gis%plnod_r,                  &
                            gis%plnew_r, gis%plnow_r, gis%lats_nodes_r,&
        gis%nam_gfs%sig_ini, gis%nam_gfs%sig_ini2)
!!
      call fix_fields(gis%lonsperlar,gis%global_lats_r,                &
        gis%xlon,gis%xlonf,gis%xlat,gis%sfc_fld,                       &
        gis%hprime,gis%jindx1,gis%jindx2,gis%ddy,                      &
        gis%ozplin,gis%nam_gfs%sfc_ini)
 
      tov = 0.0
      if (.not. (hybrid.or.gen_coord_hybrid) ) then                   ! hmhj
       call setsig(si,ci,del,sl,cl,rdel2,tov,me)
       am=-8888888.
       bm=-7777777.
       call amhmtm(del,sv,am)
       call bmdi_sig(ci,bm)
      endif
      call deldifs(gis%epse,gis%epse,gis%epse,gis%epse,gis%epse,gis%epse,      & ! hmhj
                   gis%epso,gis%epso,gis%epso,gis%epso,gis%epso,gis%epso,      & ! hmhj
                   gis%cons0,sl,gis%ls_node,gis%epse,0,hybrid,gen_coord_hybrid)  ! hmhj
 

! modified by weiyu yang to fix the bug related to the "runduration".
!--------------------------------------------------------------------

      runduration_hour  = nint(fhmax)

      ifhmax = nint(fhmax)

      if (runduration_hour <= 0) then
        call handle_error(FATAL, "Run Duration is <= 0, check fhmax")
      endif

      stoptime_fms = increment_date(currtime_fms,days=runduration_hour/24,hours=mod(runduration_hour,24))

      if (me.eq.0) then
        call out_para(gis%deltim)
      endif

      if (me.eq.0) then
        print *,' the gsm will forecast ',runduration_hour,' hours',      &
                ' from hour ',gis%kfhour,' to hour ',runduration_hour+gis%kfhour
      endif

      gis%zhour  = fhour
      gis%fluxr=0.

      call flx_init(gis%flx_fld,ierr)
      
      if (icolor/=2) call mpp_init(localcomm=mc_comp)
      
      call init_interpred(gis%xlon, gis%xlonf, gis%global_lats_r, gis%lonsperlar)

      call init_diag_tools(gis%global_lats_r,gis%lonsperlar)

      call init_data_override(gis%global_lats_r,gis%lonsperlar)

      call init_land_model(gis%global_lats_r,gis%lonsperlar)

      call init_ocn()

      call init_albedo_mod()

      call read_surface_restart()
 
      call init_radiation_gases()
      if (icolor/=2) then
         call init_output_manager_fms(gis%xlat(1,:), gis%xlonf(:,1), gis%global_lats_r, gis%lonsperlar, currtime_fms)
         call init_grrad(currtime_fms,levs)
      endif

      call init_do_tstep(currtime_fms)

      call system('mkdir -p RESTART')

      call system('mkdir -p OUTPUT/ATM')

 end subroutine gfs_initialize

 subroutine set_lonsgg(lonsperlat,lonsperlar,num_reduce,me)
      use resol_def
      use reduce_lons_grid_module, only : reduce_grid           ! hmhj
      integer num_reduce, me                                    ! hmhj
      integer lonsperlat(latg),lonsperlar(latr)

      integer lonsperlat_62(94),lonsperlar_62(94)
      integer lonsperlat_126(190),lonsperlar_126(190)
      integer lonsperlat_170(256),lonsperlar_170(256)
      integer lonsperlat_190(288),lonsperlar_190(288)
      integer lonsperlat_254(384),lonsperlar_254(384)
      integer lonsperlat_382(576),lonsperlar_382(576)
      integer lonsperlat_510(766),lonsperlar_510(766)
      integer lonsperlat_574(880),lonsperlar_574(880)

      data lonsperlat_62/                                                &
        30,  30,  30,  40,  48,  56,  60,  72,  72,  80,  90,  90,       &
        96, 110, 110, 120, 120, 128, 144, 144, 144, 144, 154, 160,       &
       160, 168, 168, 180, 180, 180, 180, 180, 180, 192, 192, 192,       &
       192, 192, 192, 192, 192, 192, 192, 192, 192, 192, 192, 47*0/

      data lonsperlar_62/                                                &
        30,  30,  30,  40,  48,  56,  60,  72,  72,  80,  90,  90,       &
        96, 110, 110, 120, 120, 128, 144, 144, 144, 144, 154, 160,       &
       160, 168, 168, 180, 180, 180, 180, 180, 180, 192, 192, 192,       &
       192, 192, 192, 192, 192, 192, 192, 192, 192, 192, 192, 47*0/

      data lonsperlat_126      /                                         &
          30,   30,   36,   48,   56,   60,   72,   72,   80,   90,      &
          96,  110,  110,  120,  120,  128,  144,  144,  154,  160,      &
         160,  180,  180,  180,  192,  192,  210,  210,  220,  220,      &
         240,  240,  240,  240,  240,  252,  256,  280,  280,  280,      &
         280,  288,  288,  288,  288,  308,  308,  308,  320,  320,      &
         320,  320,  330,  330,  360,  360,  360,  360,  360,  360,      &
         360,  360,  360,  360,  360,  360,  384,  384,  384,  384,      &
         384,  384,  384,  384,  384,  384,  384,  384,  384,  384,      &
         384,  384,  384,  384,  384,  384,  384,  384,  384,  384,      &
         384,  384,  384,  384,  384, 95*0 /
 
      data lonsperlar_126      /                                         &
          30,   30,   36,   48,   56,   60,   72,   72,   80,   90,      &
          96,  110,  110,  120,  120,  128,  144,  144,  154,  160,      &
         160,  180,  180,  180,  192,  192,  210,  210,  220,  220,      &
         240,  240,  240,  240,  240,  252,  256,  280,  280,  280,      &
         280,  288,  288,  288,  288,  308,  308,  308,  320,  320,      &
         320,  320,  330,  330,  360,  360,  360,  360,  360,  360,      &
         360,  360,  360,  360,  360,  360,  384,  384,  384,  384,      &
         384,  384,  384,  384,  384,  384,  384,  384,  384,  384,      &
         384,  384,  384,  384,  384,  384,  384,  384,  384,  384,      &
         384,  384,  384,  384,  384, 95*0 /
 
      data lonsperlat_170 /                                              &
         48,  48,  48,  48,  48,  56,  60,  72,  72,  80,  90,  96,      &
        110, 110, 120, 120, 128, 144, 144, 144, 154, 160, 168, 180,      &
        180, 180, 192, 210, 210, 220, 220, 240, 240, 240, 240, 240,      &
        252, 256, 280, 280, 280, 288, 288, 288, 308, 308, 320, 320,      &
        320, 320, 330, 360, 360, 360, 360, 360, 360, 360, 384, 384,      &
        384, 384, 384, 384, 420, 420, 420, 440, 440, 440, 440, 440,      &
        440, 440, 440, 440, 462, 462, 462, 462, 462, 480, 480, 480,      &
        480, 480, 480, 480, 480, 480, 480, 480, 504, 504, 504, 504,      &
        504, 504, 504, 504, 504, 512, 512, 512, 512, 512, 512, 512,      &
        512, 512, 512, 512, 512, 512, 512, 512, 512, 512, 512, 512,      &
        512, 512, 512, 512, 512, 512, 512, 512, 128*0 /
 
      data lonsperlar_170 /                                              &
         48,  48,  48,  48,  48,  56,  60,  72,  72,  80,  90,  96,      &
        110, 110, 120, 120, 128, 144, 144, 144, 154, 160, 168, 180,      &
        180, 180, 192, 210, 210, 220, 220, 240, 240, 240, 240, 240,      &
        252, 256, 280, 280, 280, 288, 288, 288, 308, 308, 320, 320,      &
        320, 320, 330, 360, 360, 360, 360, 360, 360, 360, 384, 384,      &
        384, 384, 384, 384, 420, 420, 420, 440, 440, 440, 440, 440,      &
        440, 440, 440, 440, 462, 462, 462, 462, 462, 480, 480, 480,      &
        480, 480, 480, 480, 480, 480, 480, 480, 504, 504, 504, 504,      &
        504, 504, 504, 504, 504, 512, 512, 512, 512, 512, 512, 512,      &
        512, 512, 512, 512, 512, 512, 512, 512, 512, 512, 512, 512,      &
        512, 512, 512, 512, 512, 512, 512, 512, 128*0 /
 
      data lonsperlat_190 /                                              &
        64,  64,  64,  64,  64,  64,  64,  70,  80,  84,                 &
        88, 110, 110, 110, 120, 126, 132, 140, 144, 154,                 &
       160, 168, 176, 176, 192, 192, 198, 210, 210, 220,                 &
       220, 240, 240, 240, 252, 252, 256, 264, 280, 280,                 &
       280, 288, 308, 308, 308, 320, 320, 320, 330, 336,                 &
       352, 352, 352, 352, 360, 384, 384, 384, 384, 384,                 &
       396, 396, 420, 420, 420, 420, 420, 440, 440, 440,                 &
       440, 440, 448, 448, 462, 462, 462, 480, 480, 480,                 &
       480, 480, 504, 504, 504, 504, 504, 504, 504, 512,                 &
       512, 528, 528, 528, 528, 528, 528, 560, 560, 560,                 &
       560, 560, 560, 560, 560, 560, 560, 560, 560, 560,                 &
       560, 576, 576, 576, 576, 576, 576, 576, 576, 576,                 &
       576, 576, 576, 576, 576, 576, 576, 576, 576, 576,                 &
       576, 576, 576, 576, 576, 576, 576, 576, 576, 576,                 &
       576, 576, 576, 576, 144*   0/
!
      data lonsperlar_190 /                                              &
        64,  64,  64,  64,  64,  64,  64,  70,  80,  84,                 &
        88, 110, 110, 110, 120, 126, 132, 140, 144, 154,                 &
       160, 168, 176, 176, 192, 192, 198, 210, 210, 220,                 &
       220, 240, 240, 240, 252, 252, 256, 264, 280, 280,                 &
       280, 288, 308, 308, 308, 320, 320, 320, 330, 336,                 &
       352, 352, 352, 352, 360, 384, 384, 384, 384, 384,                 &
       396, 396, 420, 420, 420, 420, 420, 440, 440, 440,                 &
       440, 440, 448, 448, 462, 462, 462, 480, 480, 480,                 &
       480, 480, 504, 504, 504, 504, 504, 504, 504, 512,                 &
       512, 528, 528, 528, 528, 528, 528, 560, 560, 560,                 &
       560, 560, 560, 560, 560, 560, 560, 560, 560, 560,                 &
       560, 576, 576, 576, 576, 576, 576, 576, 576, 576,                 &
       576, 576, 576, 576, 576, 576, 576, 576, 576, 576,                 &
       576, 576, 576, 576, 576, 576, 576, 576, 576, 576,                 &
       576, 576, 576, 576, 144*   0/
 
      data lonsperlat_254      /                                         &
          64,   64,   64,   64,   64,   64,   72,   72,   80,   90,      &
          96,  110,  110,  120,  120,  128,  144,  144,  154,  160,      &
         168,  180,  180,  180,  192,  192,  210,  220,  220,  240,      &
         240,  240,  240,  252,  256,  280,  280,  280,  288,  288,      &
         288,  308,  308,  320,  320,  320,  330,  360,  360,  360,      &
         360,  360,  360,  384,  384,  384,  384,  420,  420,  420,      &
         440,  440,  440,  440,  440,  440,  462,  462,  462,  480,      &
         480,  480,  480,  480,  480,  504,  504,  504,  504,  512,      &
         512,  560,  560,  560,  560,  560,  560,  576,  576,  576,      &
         576,  576,  576,  576,  576,  616,  616,  616,  616,  616,      &
         616,  640,  640,  640,  640,  640,  640,  640,  640,  640,      &
         640,  660,  660,  660,  720,  720,  720,  720,  720,  720,      &
         720,  720,  720,  720,  720,  720,  720,  720,  720,  720,      &
         720,  720,  720,  720,  720,  720,  720,  720,  768,  768,      &
         768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
         768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
         768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
         768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
         768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
         768,  768,  192*0/
 
      data lonsperlar_254      /                                         &
          64,   64,   64,   64,   64,   64,   72,   72,   80,   90,      &
          96,  110,  110,  120,  120,  128,  144,  144,  154,  160,      &
         168,  180,  180,  180,  192,  192,  210,  220,  220,  240,      &
         240,  240,  240,  252,  256,  280,  280,  280,  288,  288,      &
         288,  308,  308,  320,  320,  320,  330,  360,  360,  360,      &
         360,  360,  360,  384,  384,  384,  384,  420,  420,  420,      &
         440,  440,  440,  440,  440,  440,  462,  462,  462,  480,      &
         480,  480,  480,  480,  480,  504,  504,  504,  504,  512,      &
         512,  560,  560,  560,  560,  560,  560,  576,  576,  576,      &
         576,  576,  576,  576,  576,  616,  616,  616,  616,  616,      &
         616,  640,  640,  640,  640,  640,  640,  640,  640,  640,      &
         640,  660,  660,  660,  720,  720,  720,  720,  720,  720,      &
         720,  720,  720,  720,  720,  720,  720,  720,  720,  720,      &
         720,  720,  720,  720,  720,  720,  720,  720,  768,  768,      &
         768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
         768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
         768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
         768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
         768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
         768,  768,  192*0/
 
      data lonsperlat_382      /                                         &
         64,  64,  64,  64,  64,  64,  64,  70,  80,  84,                &
         88,  96, 110, 110, 120, 126, 132, 140, 144, 154,                &
        160, 168, 176, 180, 192, 192, 198, 210, 220, 220,                &
        224, 240, 240, 252, 252, 256, 264, 280, 280, 280,                &
        288, 308, 308, 308, 320, 320, 330, 336, 352, 352,                &
        352, 360, 384, 384, 384, 384, 396, 396, 420, 420,                &
        420, 420, 440, 440, 440, 448, 448, 462, 462, 480,                &
        480, 480, 504, 504, 504, 504, 512, 528, 528, 528,                &
        560, 560, 560, 560, 560, 560, 576, 576, 616, 616,                &
        616, 616, 616, 616, 616, 616, 630, 630, 640, 640,                &
        660, 660, 660, 660, 672, 672, 704, 704, 704, 704,                &
        704, 704, 720, 720, 720, 768, 768, 768, 768, 768,                &
        768, 768, 768, 768, 768, 792, 792, 792, 792, 792,                &
        840, 840, 840, 840, 840, 840, 840, 840, 840, 840,                &
        880, 880, 880, 880, 880, 880, 880, 880, 880, 880,                &
        896, 896, 896, 896, 924, 924, 924, 924, 924, 924,                &
        960, 960, 960, 960, 960, 960, 960, 960, 960, 960,                &
        990, 990, 990, 990, 990, 990, 990, 990,1008,1008,                &
       1008,1008,1008,1008,1024,1024,1024,1024,1024,1024,                &
       1056,1056,1056,1056,1056,1056,1056,1056,1056,1056,                &
       1120,1120,1120,1120,1120,1120,1120,1120,1120,1120,                &
       1120,1120,1120,1120,1120,1120,1120,1120,1120,1120,                &
       1120,1120,1120,1120,1120,1120,1120,1120,1120,1120,                &
       1120,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
       1152,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
       1152,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
       1152,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
       1152,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
       1152,1152,1152,1152,1152,1152,1152,1152, 288*   0/
 
      data lonsperlar_382      /                                         &
         64,  64,  64,  64,  64,  64,  64,  70,  80,  84,                &
         88,  96, 110, 110, 120, 126, 132, 140, 144, 154,                &
        160, 168, 176, 180, 192, 192, 198, 210, 220, 220,                &
        224, 240, 240, 252, 252, 256, 264, 280, 280, 280,                &
        288, 308, 308, 308, 320, 320, 330, 336, 352, 352,                &
        352, 360, 384, 384, 384, 384, 396, 396, 420, 420,                &
        420, 420, 440, 440, 440, 448, 448, 462, 462, 480,                &
        480, 480, 504, 504, 504, 504, 512, 528, 528, 528,                &
        560, 560, 560, 560, 560, 560, 576, 576, 616, 616,                &
        616, 616, 616, 616, 616, 616, 630, 630, 640, 640,                &
        660, 660, 660, 660, 672, 672, 704, 704, 704, 704,                &
        704, 704, 720, 720, 720, 768, 768, 768, 768, 768,                &
        768, 768, 768, 768, 768, 792, 792, 792, 792, 792,                &
        840, 840, 840, 840, 840, 840, 840, 840, 840, 840,                &
        880, 880, 880, 880, 880, 880, 880, 880, 880, 880,                &
        896, 896, 896, 896, 924, 924, 924, 924, 924, 924,                &
        960, 960, 960, 960, 960, 960, 960, 960, 960, 960,                &
        990, 990, 990, 990, 990, 990, 990, 990,1008,1008,                &
       1008,1008,1008,1008,1024,1024,1024,1024,1024,1024,                &
       1056,1056,1056,1056,1056,1056,1056,1056,1056,1056,                &
       1120,1120,1120,1120,1120,1120,1120,1120,1120,1120,                &
       1120,1120,1120,1120,1120,1120,1120,1120,1120,1120,                &
       1120,1120,1120,1120,1120,1120,1120,1120,1120,1120,                &
       1120,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
       1152,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
       1152,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
       1152,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
       1152,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
       1152,1152,1152,1152,1152,1152,1152,1152, 288*   0/
 
      data lonsperlat_510      /                                         &
          64,   64,   64,   64,   64,   64,   72,   72,   80,   90,      &
          96,  110,  110,  120,  120,  128,  144,  144,  154,  160,      &
         168,  180,  180,  180,  192,  210,  210,  220,  220,  240,      &
         240,  240,  240,  252,  256,  280,  280,  288,  288,  288,      &
         308,  308,  320,  320,  320,  330,  360,  360,  360,  360,      &
         360,  384,  384,  384,  384,  420,  420,  440,  440,  440,      &
         440,  440,  440,  462,  462,  462,  480,  480,  480,  480,      &
         504,  504,  504,  504,  512,  512,  560,  560,  560,  560,      &
         576,  576,  576,  576,  576,  576,  616,  616,  616,  616,      &
         640,  640,  640,  640,  640,  640,  640,  660,  720,  720,      &
         720,  720,  720,  720,  720,  720,  720,  720,  720,  720,      &
         720,  768,  768,  768,  768,  768,  768,  768,  768,  840,      &
         840,  840,  840,  840,  840,  840,  840,  880,  880,  880,      &
         880,  880,  880,  880,  880,  880,  880,  924,  924,  924,      &
         924,  924,  924,  924,  960,  960,  960,  960,  960,  960,      &
         960,  960,  960,  960,  960,  990,  990,  990, 1008, 1008,      &
        1008, 1008, 1008, 1024, 1024, 1024, 1024, 1024, 1120, 1120,      &
        1120, 1120, 1120, 1120, 1120, 1120, 1120, 1120, 1120, 1120,      &
        1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152,      &
        1152, 1152, 1152, 1152, 1152, 1152, 1232, 1232, 1232, 1232,      &
        1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232, 1260, 1260,      &
        1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260,      &
        1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1320,      &
        1320, 1320, 1320, 1386, 1386, 1386, 1386, 1386, 1386, 1386,      &
        1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386,      &
        1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440,      &
        1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440,      &
        1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440,      &
        1440, 1440, 1440, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536,  383*0/
 
      data lonsperlar_510      /                                         &
          64,   64,   64,   64,   64,   64,   72,   72,   80,   90,      &
          96,  110,  110,  120,  120,  128,  144,  144,  154,  160,      &
         168,  180,  180,  180,  192,  210,  210,  220,  220,  240,      &
         240,  240,  240,  252,  256,  280,  280,  288,  288,  288,      &
         308,  308,  320,  320,  320,  330,  360,  360,  360,  360,      &
         360,  384,  384,  384,  384,  420,  420,  440,  440,  440,      &
         440,  440,  440,  462,  462,  462,  480,  480,  480,  480,      &
         504,  504,  504,  504,  512,  512,  560,  560,  560,  560,      &
         576,  576,  576,  576,  576,  576,  616,  616,  616,  616,      &
         640,  640,  640,  640,  640,  640,  640,  660,  720,  720,      &
         720,  720,  720,  720,  720,  720,  720,  720,  720,  720,      &
         720,  768,  768,  768,  768,  768,  768,  768,  768,  840,      &
         840,  840,  840,  840,  840,  840,  840,  880,  880,  880,      &
         880,  880,  880,  880,  880,  880,  880,  924,  924,  924,      &
         924,  924,  924,  924,  960,  960,  960,  960,  960,  960,      &
         960,  960,  960,  960,  960,  990,  990,  990, 1008, 1008,      &
        1008, 1008, 1008, 1024, 1024, 1024, 1024, 1024, 1120, 1120,      &
        1120, 1120, 1120, 1120, 1120, 1120, 1120, 1120, 1120, 1120,      &
        1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152,      &
        1152, 1152, 1152, 1152, 1152, 1152, 1232, 1232, 1232, 1232,      &
        1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232, 1260, 1260,      &
        1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260,      &
        1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1320,      &
        1320, 1320, 1320, 1386, 1386, 1386, 1386, 1386, 1386, 1386,      &
        1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386,      &
        1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440,      &
        1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440,      &
        1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440,      &
        1440, 1440, 1440, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536,  383*0/

      data lonsperlat_574      /                                         &
          18,   28,   32,   42,   48,   56,   64,   72,   80,   84,      &
          90,  110,  110,  110,  120,  126,  132,  140,  144,  154,      &
         160,  168,  176,  176,  192,  192,  198,  210,  210,  220,      &
         224,  240,  240,  252,  252,  256,  264,  280,  280,  288,      &
         288,  308,  308,  308,  320,  320,  330,  330,  352,  352,      &
         352,  360,  384,  384,  384,  384,  396,  396,  420,  420,      &
         420,  420,  440,  440,  440,  448,  462,  462,  462,  480,      &
         480,  480,  504,  504,  504,  504,  512,  528,  528,  528,      &
         560,  560,  560,  560,  560,  576,  576,  576,  616,  616,      &
         616,  616,  616,  616,  630,  630,  630,  640,  660,  660,      &
         660,  660,  672,  672,  704,  704,  704,  704,  704,  720,      &
         720,  720,  768,  768,  768,  768,  768,  768,  768,  768,      &
         770,  792,  792,  792,  792,  840,  840,  840,  840,  840,      &
         840,  840,  840,  880,  880,  880,  880,  880,  880,  880,      &
         896,  896,  896,  896,  924,  924,  924,  924,  924,  960,      &
         960,  960,  960,  960,  960,  960,  990,  990,  990,  990,      &
         990, 1008, 1008, 1008, 1008, 1024, 1024, 1024, 1056, 1056,      &
        1056, 1056, 1056, 1056, 1120, 1120, 1120, 1120, 1120, 1120,      &
        1120, 1120, 1120, 1120, 1120, 1120, 1120, 1152, 1152, 1152,      &
        1152, 1152, 1152, 1152, 1232, 1232, 1232, 1232, 1232, 1232,      &
        1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232,      &
        1232, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1280, 1280,      &
        1280, 1280, 1280, 1320, 1320, 1320, 1320, 1320, 1320, 1320,      &
        1320, 1320, 1344, 1344, 1344, 1344, 1344, 1344, 1386, 1386,      &
        1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386, 1408,      &
        1408, 1408, 1408, 1408, 1440, 1440, 1440, 1440, 1440, 1440,      &
        1440, 1440, 1440, 1440, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1584, 1584, 1584, 1584, 1584, 1584,      &
        1584, 1584, 1584, 1584, 1584, 1584, 1584, 1584, 1584, 1584,      &
        1584, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680,      &
        1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680,      &
        1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680,      &
        1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680,      &
        1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
         440*0/

      data lonsperlar_574      /                                         &
          18,   28,   32,   42,   48,   56,   64,   72,   80,   84,      &
          90,  110,  110,  110,  120,  126,  132,  140,  144,  154,      &
         160,  168,  176,  176,  192,  192,  198,  210,  210,  220,      &
         224,  240,  240,  252,  252,  256,  264,  280,  280,  288,      &
         288,  308,  308,  308,  320,  320,  330,  330,  352,  352,      &
         352,  360,  384,  384,  384,  384,  396,  396,  420,  420,      &
         420,  420,  440,  440,  440,  448,  462,  462,  462,  480,      &
         480,  480,  504,  504,  504,  504,  512,  528,  528,  528,      &
         560,  560,  560,  560,  560,  576,  576,  576,  616,  616,      &
         616,  616,  616,  616,  630,  630,  630,  640,  660,  660,      &
         660,  660,  672,  672,  704,  704,  704,  704,  704,  720,      &
         720,  720,  768,  768,  768,  768,  768,  768,  768,  768,      &
         770,  792,  792,  792,  792,  840,  840,  840,  840,  840,      &
         840,  840,  840,  880,  880,  880,  880,  880,  880,  880,      &
         896,  896,  896,  896,  924,  924,  924,  924,  924,  960,      &
         960,  960,  960,  960,  960,  960,  990,  990,  990,  990,      &
         990, 1008, 1008, 1008, 1008, 1024, 1024, 1024, 1056, 1056,      &
        1056, 1056, 1056, 1056, 1120, 1120, 1120, 1120, 1120, 1120,      &
        1120, 1120, 1120, 1120, 1120, 1120, 1120, 1152, 1152, 1152,      &
        1152, 1152, 1152, 1152, 1232, 1232, 1232, 1232, 1232, 1232,      &
        1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232,      &
        1232, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1280, 1280,      &
        1280, 1280, 1280, 1320, 1320, 1320, 1320, 1320, 1320, 1320,      &
        1320, 1320, 1344, 1344, 1344, 1344, 1344, 1344, 1386, 1386,      &
        1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386, 1408,      &
        1408, 1408, 1408, 1408, 1440, 1440, 1440, 1440, 1440, 1440,      &
        1440, 1440, 1440, 1440, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
        1536, 1536, 1536, 1536, 1584, 1584, 1584, 1584, 1584, 1584,      &
        1584, 1584, 1584, 1584, 1584, 1584, 1584, 1584, 1584, 1584,      &
        1584, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680,      &
        1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680,      &
        1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680,      &
        1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680,      &
        1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
        1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
         440*0/


      integer i
      if (num_reduce < 0) then
        if (jcap .eq. 62) then
          lonsperlat=lonsperlat_62
          lonsperlar=lonsperlar_62
        endif
        if (jcap .eq. 126) then
          lonsperlat=lonsperlat_126
          lonsperlar=lonsperlar_126
        endif
        if (jcap .eq. 170) then
          lonsperlat=lonsperlat_170
          lonsperlar=lonsperlar_170
        endif
        if (jcap .eq. 190) then
          lonsperlat=lonsperlat_190
          lonsperlar=lonsperlar_190
        endif
        if (jcap .eq. 254) then
          lonsperlat=lonsperlat_254
          lonsperlar=lonsperlar_254
        endif
        if (jcap .eq. 382) then
          lonsperlat=lonsperlat_382
          lonsperlar=lonsperlar_382
        endif
        if (jcap .eq. 510) then
          lonsperlat=lonsperlat_510
          lonsperlar=lonsperlar_510
        endif
        if (jcap .eq. 574) then
          lonsperlat=lonsperlat_574
          lonsperlar=lonsperlar_574
        endif
      endif

      if (jcap .ne. 62 .and. jcap .ne. 126 .and. jcap .ne. 170 .and.     &
          jcap .ne. 190 .and. jcap .ne. 574 .and.                        &
          jcap .ne. 254 .and. jcap .ne. 382 .and. jcap .ne. 510) then
         if ( me == 0 ) then
           print*,' non standard resolution  - lonsperlar/lonsperlat',   &
                  ' computed locally'
         endif
         call reduce_grid (abs(num_reduce),jcap,latg,lonsperlat)        ! hmhj
         lonsperlar=lonsperlat                                          ! hmhj
         if ( me == 0 ) then
           print*,' reduced grid is computed - lonsperlar/lonsperlat '  ! hmhj
         endif
      endif

      if ( me == 0 ) then
        print*,' jcap = ',jcap
        print*,'min,max of lonsperlat = ',minval(lonsperlat),            &
                maxval(lonsperlat)
        print*,'min,max of lonsperlar = ',minval(lonsperlar),            &
                maxval(lonsperlar)
      endif
 end subroutine set_lonsgg

 end module gfs_initialize_mod
