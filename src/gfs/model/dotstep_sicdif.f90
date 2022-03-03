module do_tstep_mod
  use output_manager_fms, only: register_var, register_static, update_opdata
  use output_manager_fms, only: currtime
  use diag_tools, only: calc_kinetic_energy_hybrid, calc_int_lat_energy_hybrid
  use diag_tools, only: area_weighted_global_mean, get_topo
  use layout1, only: me, ipt_lats_node_r, ls_max_node, me_l_0
  use layout1, only: len_trie_ls, len_trio_ls, ls_dim, nodes
  use layout1, only: lats_node_r
  use physcons, only: con_g, con_cp
  use data_override_mod, only: data_override
  use time_manager_mod, only: time_type, get_date
  use land_model_mod, only: lnd, write_surface_restart
  use ocean_mod, only: ocn
  use cmp_comm, only: coupler_id
  use spectralgridconv, only: spectral2grid
  use wrt_restart_mod, only: wrt_restart
  use radiation_aerosol_mod, only: get_aerosols
  use error_mod, only: FATAL, WARNING, handle_error, NOTE
  use gloopb_mod, only: gloopb, initialize_gloopb
  use error_mod, only: handle_error, fatal, warning

  use resol_def
  use gg_def
  use vert_def
  
  use date_def, only: spdmax, fhour, idate
  use namelist_def
  use mpi_def
  use ozne_def
  use sfc_flx_mod
  use gloopr_mod, only: gloopr


  implicit none
  private
  integer :: id_dkinetic=0, id_dinternal=0, id_dlatent=0
  integer :: id_dkinetic1=0, id_dinternal1=0, id_dlatent1=0
  integer :: id_dkinetic2=0, id_dinternal2=0, id_dlatent2=0
  integer :: id_tice=0, id_fice=0, id_zorl=0, id_sfcemis=0
  integer :: id_topo=0, id_twater=0, id_hice=0, id_hsnow=0
  integer :: id_ps=0
  integer :: alvsf_id=0, alvwf_id=0, alnsf_id=0, alnwf_id=0, vegfrac_id=0
  integer :: vegtype_id=0
  integer :: zorl_id=0, sfcemis_id=0,o3_id =0,id_o3 =0
  integer :: tice_id=0, hsnow_id=0, twater_id=0, fice_id=0, hice_id=0
  integer :: id_alvsf=0, id_alvwf=0, id_alnsf=0, id_alnwf=0, id_vegfrac=0
  integer :: id_vegtype=0
  real, parameter :: rcont=con_g/(con_cp*1000.0)
  logical :: initialized=.false., do_energy_corr=.false.
  logical :: diag_out=.false., firsttime=.true., get_sst_before_rad=.false.
  real :: zorl_min=0.001
  real, allocatable :: topo(:,:)
  namelist /do_tstep_nml/do_energy_corr, diag_out

  public :: do_tstep, init_do_tstep
  
  contains
  subroutine do_tstep(deltim,kdt,phour, &
                      trie_ls,trio_ls, &
                      ls_node,ls_nodes,max_ls_nodes, &
                      lats_nodes_a,global_lats_a, &
                      lonsperlat, &
                      lats_nodes_r,global_lats_r, &
                      lonsperlar, &
                      epse,epso,epsedn,epsodn, &
                      snnp1ev,snnp1od,ndexev,ndexod, &
                      plnev_a,plnod_a,pddev_a,pddod_a, &
                      plnew_a,plnow_a, &
                      plnev_r,plnod_r,pddev_r,pddod_r, &
                      plnew_r,plnow_r, &
                      lslag, &
                      xlon,xlat,coszdg, sfc_fld, flx_fld, &
                      hprime,swh,hlw,fluxr,sfalb,slag,sdec,cdec, &
                      ozplin,jindx1,jindx2,ddy,pdryini, &
                      phy_f3d, phy_f2d, nblck, &
                      zhour,lsout,colat1,cfhour1,time)
  

    implicit none
  
    type(sfc_var_data) :: sfc_fld
    type(flx_var_data) :: flx_fld
    type(time_type) :: time
    character(16) :: cfhour1
    integer,intent(in) :: lonsperlat(latg)
  
    real(kind=kind_evod),intent(in):: deltim,phour
    real(kind=kind_evod),intent(inout):: zhour
  
    integer :: nblck
    real(kind=kind_evod) :: trie_ls(len_trie_ls,2,11*levs+3*levh+6)
    real(kind=kind_evod) :: trio_ls(len_trio_ls,2,11*levs+3*levh+6)
  
    integer :: ls_node(ls_dim,3)
  
    integer :: ls_nodes(ls_dim,nodes)
    integer :: max_ls_nodes(nodes)
    integer :: lats_nodes_a(nodes)
    integer :: global_lats_a(latg)
    integer :: lats_nodes_r(nodes)
    integer :: global_lats_r(latr)
    integer :: lonsperlar(latr)
  
    logical :: ifshuff
  
    real(kind=kind_evod) :: colat1
    real(kind=kind_evod) :: epse(len_trie_ls)
    real(kind=kind_evod) :: epso(len_trio_ls)
    real(kind=kind_evod) :: epsedn(len_trie_ls)
    real(kind=kind_evod) :: epsodn(len_trio_ls)
    real(kind=kind_evod) :: snnp1ev(len_trie_ls)
    real(kind=kind_evod) :: snnp1od(len_trio_ls)
    real(kind=kind_evod) :: plnev_a(len_trie_ls,latg2)
    real(kind=kind_evod) :: plnod_a(len_trio_ls,latg2)
    real(kind=kind_evod) :: pddev_a(len_trie_ls,latg2)
    real(kind=kind_evod) :: pddod_a(len_trio_ls,latg2)
    real(kind=kind_evod) :: plnew_a(len_trie_ls,latg2)
    real(kind=kind_evod) :: plnow_a(len_trio_ls,latg2)
    real(kind=kind_evod) :: plnev_r(len_trie_ls,latr2)
    real(kind=kind_evod) :: plnod_r(len_trio_ls,latr2)
    real(kind=kind_evod) :: pddev_r(len_trie_ls,latr2)
    real(kind=kind_evod) :: pddod_r(len_trio_ls,latr2)
    real(kind=kind_evod) :: plnew_r(len_trie_ls,latr2)
    real(kind=kind_evod) :: plnow_r(len_trio_ls,latr2)
    real(kind=kind_evod) :: coef00(levs,ntrac) ! temp. ozone clwater 
    real(kind=kind_evod) :: slag,sdec,cdec
    real(kind=kind_evod) :: global_times_a(latg,nodes)
    real(kind=kind_evod) :: global_times_b(latr,nodes)
    real(kind=kind_evod) :: global_times_r(latr,nodes)
    integer :: ndexev(len_trie_ls)
    integer :: ndexod(len_trio_ls)
  
    real(kind=kind_rad) :: xlon(lonr,lats_node_r)
    real(kind=kind_rad) :: xlat(lonr,lats_node_r)
    real(kind=kind_rad) :: o3(lonr,lats_node_r,levs)
    real(kind=kind_rad) :: tmp2d(lonr,lats_node_r)    
    real(kind=kind_rad) :: kinetic_s1(lonr,lats_node_r), kinetic_sm(lonr,lats_node_r)
    real(kind=kind_rad) :: p_var_2(lonr,lats_node_r,3*levs+levh), p_var_1(lonr, lats_node_r)
    real(kind=kind_rad) :: p_var_3(lonr,lats_node_r,levh)
    real(kind=kind_rad) :: latent_s1(lonr,lats_node_r), latent_sm(lonr,lats_node_r)
    real(kind=kind_rad) :: internal_s1(lonr,lats_node_r), internal_sm(lonr,lats_node_r)
    real(kind=kind_rad) :: psurf_prev(lonr,lats_node_r), temp(lonr,lats_node_r)

    real(kind=kind_rad) :: coszdg(lonr,lats_node_r), &
                           hprime(nmtvr,lonr,lats_node_r), &
                           fluxr(nfxr,lonr,lats_node_r), &
                           sfalb(lonr,lats_node_r), &
                           swh(ngptc,levs,nblck,lats_node_r), &
                           hlw(ngptc,levs,nblck,lats_node_r)
  
    real (kind=kind_phys) :: &
              phy_f3d(ngptc,levs,nblck,lats_node_r,num_p3d), &
              phy_f2d(lonr,lats_node_r,num_p2d), &
              ddy(lats_node_r)
  
    integer :: jindx1(lats_node_r),jindx2(lats_node_r)
    real :: ozplin(latsozp,levozp,pl_coeff,timeoz) !ozone pl coeff
    real(kind=kind_phys) :: pdryini
    integer :: kdt, ierr,j,k,l,locl,n
    real(kind=kind_mpi) :: coef00m(levs,ntrac) ! temp. ozone clwater 
    integer :: indlsev,jbasev
    integer :: indlsod,jbasod
    integer :: iprint
    logical :: lslag, lsout, override
    real(kind=kind_evod) :: rdeltim, rdeltim2
    real(kind=kind_rad) :: energy_strt, energy_end, mean_psurf_prev, temp_corr
    include 'function2'
  
    !  timings
    integer :: tag,ireq1,ireq2
    integer :: yy,mm,dd,hh,mins,secs

    rdeltim=1./deltim
    rdeltim2=1./(2.0*deltim)
    currtime = time 

    if (.not.liope.or.icolor.ne.2) then
       
       if(.not.initialized) call handle_error(fatal, 'dotstep: not initialized, call init_dotstep from gfs_initialize')
       
      if (firsttime) then
        allocate(topo(lonr,lats_node_r))
        call spectral2grid(trie_ls(:,:,p_gz),trio_ls(:,:,p_gz),topo,1, &
                           ls_node,ls_nodes,max_ls_nodes, &
                           lats_nodes_r,global_lats_r,lonsperlar, &
                           plnev_r,plnod_r)
        call get_topo(topo,trie_ls(:,:,p_gz),trio_ls(:,:,p_gz), &
             ls_node,ls_nodes,max_ls_nodes, &
             lats_nodes_r,global_lats_r,lonsperlar, &
             snnp1ev,snnp1od,plnev_r,plnod_r)
        firsttime=.false.
      endif
      
      call update_opdata(id_topo,topo)
    
  
    if(do_energy_corr) then 
    call calc_kinetic_energy_hybrid  &
    (trie_ls(:,:,p_qm),trie_ls(:,:,p_zem:p_zem+levs-1),trie_ls(:,:,p_dim:p_dim+levs-1), &
     trio_ls(:,:,p_qm),trio_ls(:,:,p_zem:p_zem+levs-1),trio_ls(:,:,p_dim:p_dim+levs-1), &
     ls_node,ls_nodes,max_ls_nodes,lats_nodes_r, &
     plnev_r,plnod_r, &
     epsedn,epsodn,snnp1ev,snnp1od,kinetic_sm, psurf_prev)
    
    call calc_int_lat_energy_hybrid  &
    (trie_ls(:,:,p_qm),trie_ls(:,:,p_tem:p_tem+levs-1),trie_ls(:,:,p_rm:p_rm+levs-1), &
     trio_ls(:,:,p_qm),trio_ls(:,:,p_tem:p_tem+levs-1),trio_ls(:,:,p_rm:p_rm+levs-1), &
     ls_node,ls_nodes,max_ls_nodes,lats_nodes_r, &
     plnev_r,plnod_r, &
     internal_sm,latent_sm)

     energy_strt=area_weighted_global_mean(kinetic_sm+internal_sm)
     mean_psurf_prev=area_weighted_global_mean(psurf_prev)
    endif

      trie_ls(:,:,p_dlam:p_dlam+(2+5*levs+levh))=0.0
      trio_ls(:,:,p_dlam:p_dlam+(2+5*levs+levh))=0.0

      if (lslag) then
       !jfe    call gloopa_sl
      else
        global_times_a=0.
        call gloopa(deltim,trie_ls,trio_ls, &
             ls_node,ls_nodes,max_ls_nodes, &
             lats_nodes_a,global_lats_a, &
             lonsperlat, &
             epse,epso,epsedn,epsodn, &
             snnp1ev,snnp1od,ndexev,ndexod, &
             plnev_a,plnod_a,pddev_a,pddod_a,plnew_a,plnow_a, &
             global_times_a,kdt)
          
        iprint = 0
        if (iprint .eq. 1) print*,' fin gloopa kdt = ',kdt
      endif
     
!      if(inst) then 
!        call spectral2grid(trie_ls(:,:,p_w:p_w+levs-1),trio_ls(:,:,p_w:p_w+3*levs+levh-1),p_var_2,3*levs+levh, &
!                             ls_node,ls_nodes,max_ls_nodes, &
!                             lats_nodes_r,global_lats_r,lonsperlar, &
!                             plnev_r,plnod_r)
!        call update_opdata('p_w',sum(p_var_2,3))
!        call spectral2grid(trie_ls(:,:,p_ze:p_ze+levs-1),trio_ls(:,:,p_ze:p_ze+3*levs+levh-1),p_var_2,3*levs+levh, &
!                             ls_node,ls_nodes,max_ls_nodes, &
!                             lats_nodes_r,global_lats_r,lonsperlar, &
!                             plnev_r,plnod_r)
!        call update_opdata('p_ze',sum(p_var_2,3))
!        call spectral2grid(trie_ls(:,:,p_zem:p_zem+levs-1),trio_ls(:,:,p_zem:p_zem+3*levs+levh-1),p_var_2,3*levs+levh, &
!                             ls_node,ls_nodes,max_ls_nodes, &
!                             lats_nodes_r,global_lats_r,lonsperlar, &
!                             plnev_r,plnod_r)
!        call update_opdata('p_zem',sum(p_var_2,3))
!      endif

      !----------------------------------------------------------
  
      !my set to zero for every timestep
      global_times_r = 0.0
  
      if(.not.adiab) then
        if (nscyc .gt. 0) then
          if (mod(kdt,nscyc).eq.1) then
            call gcycle(me,lats_node_r,lonsperlar,global_lats_r, &
                           ipt_lats_node_r,idate,fhour,fhcyc, &
                           xlon ,xlat  , sfc_fld, ialb)
          endif
        endif
  
        if (num_p3d .eq. 3) then        ! ferrier microphysics initialization
          call init_micro(deltim, levs, ngptc*nblck*lats_node_r, num_p3d, &
                            phy_f3d(1,1,1,1,1), fhour, me)
        endif
      endif
      
      !-> coupling insertion
  
      ! lgetsstice_cc must be defined by this moment. it used to be an argument
      ! to atm_getsst, accessible here via use surface_cc. now it is defined in
      ! atm_tstep_init called above, and the use is removed. (even in the earlier
      ! version lgetsstice_cc did not have to be an actual argumnent, since
      ! it is in the module surface_cc used by atm_getsst.)

      call data_override('o3',o3,time,o3_id)
      call update_opdata(id_o3,o3)
      call data_override('vegfrac',lnd%vegfrac,time,vegfrac_id)
      call update_opdata(id_vegfrac,lnd%vegfrac)
      call data_override('rvegtype',lnd%rvegtype,time,vegtype_id,discrete_type=.true.)
      lnd%vegtype = int(lnd%rvegtype)
      call update_opdata(id_vegtype,lnd%rvegtype)
      call data_override('alvsf',lnd%alvsf,time,alvsf_id)
      call update_opdata(id_alvsf,lnd%alvsf)
      call data_override('alvwf',lnd%alvwf,time,alvwf_id)
      call update_opdata(id_alvwf,lnd%alvwf)
      call data_override('alnsf',lnd%alnsf,time,alnsf_id)
      call data_override('alnwf',lnd%alnwf,time,alnwf_id)
      call data_override('zorl',lnd%zorl,time,zorl_id)
      where(lnd%zorl<zorl_min) lnd%zorl=zorl_min
      call update_opdata(id_zorl,lnd%zorl)
      call data_override('sfcemis',flx_fld%sfcemis,time,sfcemis_id)
      flx_fld%sfcemis(:,:)=flx_fld%sfcemis*lnd%frac*(1-lnd%sncovr) + &
                           0.99*lnd%frac*lnd%sncovr + &
                           0.97*lnd%ofrac*ocn%fwater + &
                           0.98*lnd%ofrac*ocn%fice

      call update_opdata(id_sfcemis,flx_fld%sfcemis)
  
      if (get_sst_before_rad) call atm_getsstice()
      !<- coupling insertion

      if (coupler_id<0) then
         !--> For AGCM Runs
         call data_override('fice',ocn%fice,time,fice_id,override)
         if(.not. override) call handle_error(fatal, 'fice not overriden')
         ocn%fwater(:,:)=0.0
         where(lnd%ofrac>0.0) ocn%fwater(:,:)=1.0-ocn%fice(:,:)
         call data_override('hice',ocn%hice,time,hice_id,override)
         if(.not. override) call handle_error(fatal, 'hice not overriden')
         call data_override('hsnow',ocn%hsnow,time,hsnow_id,override)
         if(.not. override) call handle_error(fatal, 'hsnow not overriden')
         call data_override('tice',ocn%tice,time,tice_id,override)
         if(.not. override) call handle_error(fatal, 'tice not overriden')
         call data_override('twater',ocn%twater,time,twater_id,override)
         if(.not. override) call handle_error(fatal, 'twater not overriden')
         !<-- For AGCM Runs
      endif
       
      if (lsswr .or. lslwr) then         ! radiation call!
        if(.not.adiab) then
          call get_aerosols(time) 
          call gloopr(trie_ls,trio_ls, &
              ls_node,ls_nodes,max_ls_nodes, &
              lats_nodes_r,global_lats_r, &
              lonsperlar, &
              epse,epso,epsedn,epsodn, &
              snnp1ev,snnp1od,plnev_r,plnod_r, &
              pddev_r,pddod_r, &
              xlon,xlat,coszdg,flx_fld%coszen, &
              hprime,sfalb, &
              sfc_fld%cv,sfc_fld%cvt , &
              sfc_fld%cvb,swh,hlw,flx_fld%sfcnsw,flx_fld%sfcdlw, &
              flx_fld%sfcemis, &
              flx_fld%sfcdsw, &
              flx_fld%tsflw,fluxr,phy_f3d,slag,sdec,cdec,nblck, &
              global_times_r,o3, sfc_fld%oro)
          if (iprint .eq. 1) print*,' me = fin gloopr ',me
        endif !not.adiab
      endif
  
      if( .not. explicit ) then
        if( gen_coord_hybrid ) then 
          !$omp parallel do private(locl)
          do locl=1,ls_max_node
            call sicdife_hyb_gc(trie_ls(1,1,P_dim), trie_ls(1,1,P_tem), & 
                               trie_ls(1,1,P_qm ), trie_ls(1,1,P_x ), & 
                               trie_ls(1,1,P_y ), trie_ls(1,1,P_zq ), & 
                               trie_ls(1,1,P_di ), trie_ls(1,1,P_te ), & 
                               trie_ls(1,1,P_q ),deltim, & 
                               trie_ls(1,1,P_uln), trie_ls(1,1,P_vln), & 
                               ls_node,snnp1ev,ndexev,locl) 
  
            call sicdifo_hyb_gc(trio_ls(1,1,P_dim), trio_ls(1,1,P_tem), & 
                               trio_ls(1,1,P_qm ), trio_ls(1,1,P_x ), & 
                               trio_ls(1,1,P_y ), trio_ls(1,1,P_zq ), & 
                               trio_ls(1,1,P_di ), trio_ls(1,1,P_te ), & 
                               trio_ls(1,1,P_q ),deltim, & 
                               trio_ls(1,1,P_uln), trio_ls(1,1,P_vln), & 
                               ls_node,snnp1od,ndexod,locl) 
          enddo                                                          
        else if(hybrid)then                                            
          !$omp parallel do private(locl)
          do locl=1,ls_max_node
            call sicdife_hyb(trie_ls(1,1,P_dim), trie_ls(1,1,P_tem), &
                            trie_ls(1,1,P_qm ), trie_ls(1,1,P_x  ), &
                            trie_ls(1,1,P_y  ), trie_ls(1,1,P_zq ), &
                            trie_ls(1,1,P_di ), trie_ls(1,1,P_te ), &
                            trie_ls(1,1,P_q  ),deltim, &
                            trie_ls(1,1,P_uln), trie_ls(1,1,P_vln), &
                            ls_node,snnp1ev,ndexev,locl)
  
            call sicdifo_hyb(trio_ls(1,1,P_dim), trio_ls(1,1,P_tem), &
                            trio_ls(1,1,P_qm ), trio_ls(1,1,P_x  ), &
                            trio_ls(1,1,P_y  ), trio_ls(1,1,P_zq ), &
                            trio_ls(1,1,P_di ), trio_ls(1,1,P_te ), &
                            trio_ls(1,1,P_q  ),deltim, &
                            trio_ls(1,1,P_uln), trio_ls(1,1,P_vln), &
                            ls_node,snnp1od,ndexod,locl)
          enddo
        else ! hybrid
          ! $omp parallel do private(locl)
          do locl=1,ls_max_node
            call sicdife_sig(trie_ls(1,1,p_dim), trie_ls(1,1,p_tem), &
                            trie_ls(1,1,p_qm ), trie_ls(1,1,p_x  ), &
                            trie_ls(1,1,p_y  ), trie_ls(1,1,p_zq ), &
                            am,bm,tov,sv,deltim, &
                            trie_ls(1,1,p_uln), trie_ls(1,1,p_vln), &
                            ls_node,snnp1ev,ndexev,locl,trie_ls(1,1,p_di))
  
           call sicdifo_sig(trio_ls(1,1,p_dim), trio_ls(1,1,p_tem), &
                            trio_ls(1,1,p_qm ), trio_ls(1,1,p_x  ), &
                            trio_ls(1,1,p_y  ), trio_ls(1,1,p_zq ), &
                            am,bm,tov,sv,deltim, &
                            trio_ls(1,1,p_uln), trio_ls(1,1,p_vln), &
                            ls_node,snnp1od,ndexod,locl,trio_ls(1,1,p_di))
          enddo
        endif ! hybrid
      endif     ! not explicit          ! hmhj
      !----------------------------------------------------------
      ! hmhj compute coef00 for all, even for hybrid mode
      coef00(:,:) = 0.0
      if ( me .eq. me_l_0 ) then
        do locl=1,ls_max_node
          l=ls_node(locl,1)
          jbasev=ls_node(locl,2)
          if ( l .eq. 0 ) then
            n=0
            ! 1 corresponds to temperature,  2 corresponds to ozon, 3 to clwater
            do k=1,levs
              coef00(k,1) = trie_ls(indlsev(n,l),1,p_y +k-1)
              if (ntoz .gt. 1 .and. & 
                  .not. (hybrid.or.gen_coord_hybrid)) then
                coef00(k,ntoz) = trie_ls(indlsev(n,l),1, &
                                 (ntoz-1)*levs+p_rt+k-1)
              endif
            enddo
          endif
        end do
      end if
      coef00m = coef00
      call mpi_bcast(coef00m,levs*ntrac,mpi_r_mpi,me_l_0,mc_comp,ierr)
      coef00=coef00m
      if( gen_coord_hybrid ) then        
        call updown_gc(sl,coef00(1,1))  
      else                              
        call updown(sl,coef00(1,1))
      endif                             
      if (ntoz .gt. 1 .and. .not. (hybrid.or.gen_coord_hybrid)) then 
        call updown(sl,coef00(1,ntoz))
      endif
  
      !$omp parallel do shared(trie_ls,trio_ls) &
      !$omp shared(deltim,sl,ls_node,coef00,hybrid)
      do k=1,levs
        call deldifs(trie_ls(1,1,p_rt+k-1), trie_ls(1,1,p_w+k-1), &
                         trie_ls(1,1,p_qm    ), trie_ls(1,1,p_x+k-1), &
                         trie_ls(1,1,p_y +k-1), trie_ls(1,1,p_tem+k-1), &
                         trio_ls(1,1,p_rt+k-1), trio_ls(1,1,p_w+k-1), &
                         trio_ls(1,1,p_qm    ), trio_ls(1,1,p_x+k-1), &
                         trio_ls(1,1,p_y +k-1), trio_ls(1,1,p_tem+k-1), &
                         deltim,sl,ls_node,coef00,k,hybrid, &
                         gen_coord_hybrid)
      enddo


      if(.not.lsfwd)then
        call filtr1eo(trie_ls(1,1,p_tem), trie_ls(1,1,p_te ), &
                       trie_ls(1,1,p_y  ), trie_ls(1,1,p_dim), &
                       trie_ls(1,1,p_di ), trie_ls(1,1,p_x  ), &
                       trie_ls(1,1,p_zem), trie_ls(1,1,p_ze ), &
                       trie_ls(1,1,p_w  ), trie_ls(1,1,p_rm ), &
                       trie_ls(1,1,p_rq ), trie_ls(1,1,p_rt ), &
                       trio_ls(1,1,p_tem), trio_ls(1,1,p_te ), &
                       trio_ls(1,1,p_y  ), trio_ls(1,1,p_dim), &
                       trio_ls(1,1,p_di ), trio_ls(1,1,p_x  ), &
                       trio_ls(1,1,p_zem), trio_ls(1,1,p_ze ), &
                       trio_ls(1,1,p_w  ), trio_ls(1,1,p_rm ), &
                       trio_ls(1,1,p_rq ), trio_ls(1,1,p_rt ), &
                       filta,ls_node)
        do j=1,len_trie_ls
          trie_ls(j,1,p_qm)=trie_ls(j,1,p_q )
          trie_ls(j,2,p_qm)=trie_ls(j,2,p_q )
          trie_ls(j,1,p_q )=trie_ls(j,1,p_zq)
          trie_ls(j,2,p_q )=trie_ls(j,2,p_zq)
        enddo
        do j=1,len_trio_ls
          trio_ls(j,1,p_qm)=trio_ls(j,1,p_q )
          trio_ls(j,2,p_qm)=trio_ls(j,2,p_q )
          trio_ls(j,1,p_q )=trio_ls(j,1,p_zq)
          trio_ls(j,2,p_q )=trio_ls(j,2,p_zq)
        enddo
      else
        do j=1,len_trie_ls
          trie_ls(j,1,p_q)=trie_ls(j,1,p_zq)
          trie_ls(j,2,p_q)=trie_ls(j,2,p_zq)
        enddo
        do j=1,len_trio_ls
          trio_ls(j,1,p_q)=trio_ls(j,1,p_zq)
          trio_ls(j,2,p_q)=trio_ls(j,2,p_zq)
        enddo
      endif

    if(do_energy_corr) then 
    call calc_kinetic_energy_hybrid  &
    (trie_ls(:,:,p_zq),trie_ls(:,:,p_w:p_w+levs-1),trie_ls(:,:,p_x:p_x+levs-1), &
     trio_ls(:,:,p_zq),trio_ls(:,:,p_w:p_w+levs-1),trio_ls(:,:,p_x:p_x+levs-1), &
     ls_node,ls_nodes,max_ls_nodes,lats_nodes_r, &
     plnev_r,plnod_r, &
     epsedn,epsodn,snnp1ev,snnp1od,kinetic_s1)
    
    call calc_int_lat_energy_hybrid  &
    (trie_ls(:,:,p_zq),trie_ls(:,:,p_y:p_y+levs-1),trie_ls(:,:,p_rt:p_rt+levs-1), &
     trio_ls(:,:,p_zq),trio_ls(:,:,p_y:p_y+levs-1),trio_ls(:,:,p_rt:p_rt+levs-1), &
     ls_node,ls_nodes,max_ls_nodes,lats_nodes_r, &
     plnev_r,plnod_r, &
     internal_s1,latent_s1)

      temp_corr=0.0     
        energy_end=area_weighted_global_mean(kinetic_s1+internal_s1)
        temp_corr=rcont*(energy_strt-energy_end)/mean_psurf_prev
        if(me==0.and.diag_out) then
          print *, 'Energy error (W/m2) due to Spectral Dynamical Core: ', &
                            (energy_strt-energy_end)*rdeltim2
          print *, 'Temperature correction for Energy error is: ', temp_corr
        endif
    endif

    if (.not.get_sst_before_rad) call atm_getsstice()

      global_times_b = 0.0
      if(.not.adiab) then
        call gloopb(trie_ls,trio_ls, &
             ls_node,ls_nodes,max_ls_nodes, &
             lats_nodes_r,global_lats_r, &
             lonsperlar, &
             epse,epso,epsedn,epsodn, &
             snnp1ev,snnp1od,ndexev,ndexod, &
             plnev_r,plnod_r,pddev_r,pddod_r,plnew_r,plnow_r, &
             deltim,phour, sfc_fld, flx_fld, &
             xlon, &
             swh,hlw,hprime,slag,sdec,cdec, &
             ozplin,jindx1,jindx2,ddy,pdryini, &
             phy_f3d,  phy_f2d,nblck,kdt, &
             global_times_b, temp_corr)
      endif ! not.adiab

      call atm_sendfluxes()

      !$omp parallel do shared(trie_ls,ndexev,trio_ls,ndexod) &
      !$omp shared(sl,spdmax,deltim,ls_node)
      do k=1,levs
        call damp_speed(trie_ls(1,1,p_x+k-1), trie_ls(1,1,p_w +k-1), &
                           trie_ls(1,1,p_y+k-1), trie_ls(1,1,p_rt+k-1), &
                           ndexev, &
                           trio_ls(1,1,p_x+k-1), trio_ls(1,1,p_w +k-1), &
                           trio_ls(1,1,p_y+k-1), trio_ls(1,1,p_rt+k-1), &
                           ndexod, &
                           sl,spdmax(k),deltim,ls_node)
      enddo
      if(.not.lsfwd)then
        call filtr2eo(trie_ls(1,1,p_tem), trie_ls(1,1,p_te ), &
                       trie_ls(1,1,p_y  ), trie_ls(1,1,p_dim), &
                       trie_ls(1,1,p_di ), trie_ls(1,1,p_x  ), &
                       trie_ls(1,1,p_zem), trie_ls(1,1,p_ze ), &
                       trie_ls(1,1,p_w  ), trie_ls(1,1,p_rm ), &
                       trie_ls(1,1,p_rq ), trie_ls(1,1,p_rt ), &
                       trio_ls(1,1,p_tem), trio_ls(1,1,p_te ), &
                       trio_ls(1,1,p_y  ), trio_ls(1,1,p_dim), &
                       trio_ls(1,1,p_di ), trio_ls(1,1,p_x  ), &
                       trio_ls(1,1,p_zem), trio_ls(1,1,p_ze ), &
                       trio_ls(1,1,p_w  ), trio_ls(1,1,p_rm ), &
                       trio_ls(1,1,p_rq ), trio_ls(1,1,p_rt ), &
                       filta,ls_node)
      else
        do k=1,levs
          do j=1,len_trie_ls
            trie_ls(j,1,p_di+k-1)=trie_ls(j,1,p_x+k-1)
            trie_ls(j,2,p_di+k-1)=trie_ls(j,2,p_x+k-1)
            trie_ls(j,1,p_ze+k-1)=trie_ls(j,1,p_w+k-1)
            trie_ls(j,2,p_ze+k-1)=trie_ls(j,2,p_w+k-1)
            trie_ls(j,1,p_te+k-1)=trie_ls(j,1,p_y+k-1)
            trie_ls(j,2,p_te+k-1)=trie_ls(j,2,p_y+k-1)
          enddo
        enddo
        do k=1,levs
          do j=1,len_trio_ls
            trio_ls(j,1,p_di+k-1)=trio_ls(j,1,p_x+k-1)
            trio_ls(j,2,p_di+k-1)=trio_ls(j,2,p_x+k-1)
            trio_ls(j,1,p_ze+k-1)=trio_ls(j,1,p_w+k-1)
            trio_ls(j,2,p_ze+k-1)=trio_ls(j,2,p_w+k-1)
            trio_ls(j,1,p_te+k-1)=trio_ls(j,1,p_y+k-1)
            trio_ls(j,2,p_te+k-1)=trio_ls(j,2,p_y+k-1)
          enddo
        enddo
        do k=1,levh
          do j=1,len_trie_ls
            trie_ls(j,1,p_rq+k-1)=trie_ls(j,1,p_rt+k-1)
            trie_ls(j,2,p_rq+k-1)=trie_ls(j,2,p_rt+k-1)
          enddo
        enddo
        do k=1,levh
          do j=1,len_trio_ls
            trio_ls(j,1,p_rq+k-1)=trio_ls(j,1,p_rt+k-1)
            trio_ls(j,2,p_rq+k-1)=trio_ls(j,2,p_rt+k-1)
          enddo
        enddo
      endif
 	  if (id_ps > 0) then
      call spectral2grid(trie_ls(:,:,p_q),trio_ls(:,:,p_q),tmp2d,1, &
                        ls_node,ls_nodes,max_ls_nodes, &
                        lats_nodes_r,global_lats_r,lonsperlar, &
                        plnev_r,plnod_r)
      call update_opdata(id_ps, exp(tmp2d)*1000.0,time)
     endif

     call update_opdata(id_dkinetic2,(kinetic_sm-kinetic_s1)*rdeltim2)
     call update_opdata(id_dlatent2,(latent_sm-latent_s1)*rdeltim2)
     call update_opdata(id_dinternal2,(internal_sm-internal_s1)*rdeltim2)

    endif !.not.liope.or.icolor.ne.2

!    if (lsout) then
     ! call wrtout(phour,fhour,zhour,idate, &
     !               trie_ls,trio_ls, &
     !               sl,si, &
     !               ls_node,ls_nodes,max_ls_nodes, &
     !               sfc_fld, flx_fld, &
     !               fluxr,pdryini, &
     !               lats_nodes_r,global_lats_r,lonsperlar,nblck, &
     !               colat1,cfhour1,pl_coeff, &
     !               epsedn,epsodn,snnp1ev,snnp1od,plnev_r,plnod_r, &
     !               plnew_r,plnow_r,time)
  
!    endif ! if ls_out
!    if (reshuff_lats_r) then  
!      if (.not.liope.or.icolor.ne.2) then
!        !my gather lat timings for load balancing
!        ifshuff = .false.
!      endif ! .not.liope.or.icolor.ne.2
!      tag = kdt
!      print*,' me, nodes,kdt = ',me,nodes,kdt
!      if (me .eq. 0) then
!        print*,' before mpi_isend ****sending global_lats_r = ', &
!              global_lats_r
!        call mpi_isend(global_lats_r,latr,mpi_integer, &
!                       nodes,tag,mpi_comm_all,ireq1,ierr)
!      elseif (liope .and. icolor .eq. 2) then
!        print*, ' before mpi_irecv global_lats_r for io node = ', &
!             global_lats_r
!        call mpi_irecv(global_lats_r,latr,mpi_integer, &
!                       0,tag,mpi_comm_all,ireq2,ierr)     
!      endif
!      if (liope .and. icolor .eq. 2) &
!            print*,' after mpi_irecv global_lats_r for io node = ', &
!             global_lats_r
!    endif ! reshuff_lats_r
!    if (mod(kdt,nszer).eq.0 .and. lsout) then
!      call flx_init(flx_fld,ierr)
!      zhour = fhour
!      fluxr = 0.
!    endif
    return
  end subroutine do_tstep
  
  subroutine init_do_tstep(time)
    type(time_type), intent(in) :: time

    if (initialized) return
    
    open(10,file='gfs_namelist')
    read(10,nml=do_tstep_nml)
    if(me==0) write(*,nml=do_tstep_nml)
    close(10)
    
    if (icolor/=2) then

			call initialize_gloopb(time)
    
    	id_dkinetic=register_var('dkinetic',time)
		id_ps=register_var('ps1',time)
    	id_dinternal=register_var('dinternal',time)
    	id_dlatent=register_var('dlatent',time)
    	id_dkinetic1=register_var('dkinetic1',time)
    	id_dinternal1=register_var('dinternal1',time)
    	id_dlatent1=register_var('dlatent1',time)
    	id_dkinetic2=register_var('dkinetic2',time)
    	id_dinternal2=register_var('dinternal2',time)
    	id_dlatent2=register_var('dlatent2',time)
    	id_vegfrac=register_var('vegfrac',time,'Vegetation Fraction','1')
    	id_alvsf=register_var('alvsf',time)
    	id_alvwf=register_var('alvwf',time)
    	id_fice=register_var('fice',time,'Sea-Ice Concentration','1')
    	id_tice=register_var('tice',time,'Sea-Ice Surface Temperature','K')
    	id_twater=register_var('twater',time,'Sea-Water Surface Temperature','K')
    	id_hice=register_var('hice',time,'Sea-Ice Thickness','m')
      id_zorl=register_var('zorl',time,'Roughness Length Over Land','cm')
    	id_hsnow=register_var('hsnow',time,'Snow Thickness over Sea-Ice ','m')
    	id_sfcemis=register_var('sfcemis',time,'Surface Emissivity','1')
    	id_topo=register_static('topo','Topography','m')

    endif
    
    initialized=.true.
  end subroutine init_do_tstep

end module do_tstep_mod
