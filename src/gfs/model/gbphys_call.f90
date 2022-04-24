module gbphys_call_mod
  
  use time_manager_mod, only: time_type
  use gbphys_mod, only: gbphys, initialize_gbphys

  implicit none
  private

  logical :: initialized=.false.
  
  public :: gbphys_call, initialize_gbphys_call
  
  contains
  subroutine gbphys_call(solhr,clstp, &
            syn_gr_r_2,dyn_gr_r_2,anl_gr_r_2, &
            dtp,dtf,xkt2, sfc_fld, flx_fld, &
            acv,acvb,acvt, &
            swh,hlw,hprime,slag,sdec,cdec,ozplout, &
            phy_f3d, phy_f2d,nblck,kdt, &
            njeff,istrt,iblk,lat,lon_dim,lons_lat,lan, xlon, &
            temp_corr)
  
    use resol_def
    use layout1
    use gg_def
    use vert_def
    use date_def, only: fhour
    use namelist_def
    use coordinate_def
    use tracer_const
    use module_ras , only : ras_init
    use physcons, fv => con_fvirt,rd => con_rd, rvrdm1 => con_fvirt, g=>con_g
    use ozne_def
    use sfc_flx_mod
    use land_model_mod, only: lnd
    use ocean_mod, only: ocn
    implicit none
    type(sfc_var_data)        :: sfc_fld
    type(flx_var_data)        :: flx_fld
    real, parameter:: rlapse=0.65e-2
    integer :: njeff,istrt,iblk,kdt,nblck
    real(kind=kind_phys), intent(in) :: temp_corr
    real(kind=kind_phys) :: prsl(ngptc,levs)
    real(kind=kind_phys) :: prslk(ngptc,levs),dpshc(ngptc)
    real(kind=kind_phys) :: prsi(ngptc,levs+1),phii(ngptc,levs+1)
    real(kind=kind_phys) :: prsik(ngptc,levs+1),phil(ngptc,levs)
    real (kind=kind_rad) :: ugr(ngptc,levs),vgr(ngptc,levs)
    real (kind=kind_rad) :: gphi(ngptc),glam(ngptc)
    real (kind=kind_rad) :: gq(ngptc),gt(ngptc,levs)
    real (kind=kind_rad) :: gtv(ngptc,levs)
    real (kind=kind_rad) :: gtvx(ngptc,levs),gtvy(ngptc,levs)
    real (kind=kind_rad) :: sumq(ngptc,levs),xcp(ngptc,levs)
    real (kind=kind_rad) :: gr(ngptc,levs,ntrac)
    real (kind=kind_rad) :: gd(ngptc,levs)
    real (kind=kind_rad) :: adt(ngptc,levs),adr(ngptc,levs,ntrac)
    real (kind=kind_rad) :: adu(ngptc,levs),adv(ngptc,levs)
    real (kind=kind_evod) :: slag,sdec,cdec
    real (kind=kind_rad) :: xlon(lonr,lats_node_r), &
                            hprime(nmtvr,lonr,lats_node_r)
    real (kind=kind_rad) :: swh(ngptc,levs,nblck,lats_node_r)
    real (kind=kind_rad) :: hlw(ngptc,levs,nblck,lats_node_r)
    real (kind=kind_phys) :: phy_f3d(ngptc,levs,nblck,lats_node_r,num_p3d), &
                             phy_f2d(lonr,lats_node_r,num_p2d)
    real (kind=kind_phys) :: xkt2(lonr,lats_node_r,nrcm), &
                             vvel(ngptc,levs)
    real (kind=kind_phys) :: dtp,dtf
    real(kind=kind_evod) :: syn_gr_r_2(lonrx*lots,lats_dim_r)
    real(kind=kind_evod) :: dyn_gr_r_2(lonrx*lotd,lats_dim_r)
    real(kind=kind_evod) :: anl_gr_r_2(lonrx*lota,lats_dim_r)
    integer :: i,j,k,kap,kar,kat,kau,kav
    integer :: ksd,ksq,ksr,kst,ksplam,kspphi
    integer :: kdtphi,kdtlam,kss
    integer :: ksu,ksv,ksz,lan,lat
    integer :: lon_dim,lons_lat
    integer :: iz, isc, iec
    real(kind=kind_evod) :: solhr,clstp
    integer :: nlons_v(ngptc)
    real(kind=kind_evod) :: sinlat_v(ngptc),coslat_v(ngptc),rcs2_v(ngptc)
    real(kind=kind_evod) :: smc_v(ngptc,lsoil),stc_v(ngptc,lsoil),slc_v(ngptc,lsoil)
    real(kind=kind_evod) :: hprime_v(ngptc,nmtvr)
    real(kind=kind_evod) :: phy_f3dv(ngptc,levs,num_p3d), &
                            phy_f2dv(ngptc,num_p2d),rannum(ngptc,nrcm)
    logical, parameter :: flipv = .true.
    integer :: kk
    real :: ozplout(levozp,lats_node_r,pl_coeff), &
            ozplout_v(ngptc,levozp,pl_coeff)
    real(kind=kind_phys) ::  acv(lonr,lats_node_r)
    real(kind=kind_phys) :: acvb(lonr,lats_node_r)
    real(kind=kind_phys) :: acvt(lonr,lats_node_r)
    real(kind=kind_rad) :: work1, tem
    real(kind=kind_rad),parameter :: qmin=1.0e-10
  
    isc=istrt; iec=istrt+njeff-1
  
    ksq     =0*levs+0*levh+1
    ksplam  =0*levs+0*levh+2
    kspphi  =0*levs+0*levh+3
    ksu     =0*levs+0*levh+4
    ksv     =1*levs+0*levh+4
    ksz     =2*levs+0*levh+4
    ksd     =3*levs+0*levh+4
    kst     =4*levs+0*levh+4
    ksr     =5*levs+0*levh+4
  
    kdtphi  =0*levs+0*levh+1
    kdtlam  =1*levs+1*levh+1
  
    kau     =0*levs+0*levh+1
    kav     =1*levs+0*levh+1
    kat     =2*levs+0*levh+1
    kar     =3*levs+0*levh+1
    kap     =3*levs+1*levh+1
  
    ! p in cb by finite difference from henry juang not ln(p)
    if(.not.gen_coord_hybrid) then
      do j=1,njeff
        syn_gr_r_2(istrt+j-1+(ksq-1)*lon_dim,lan)= &
        exp(syn_gr_r_2(istrt+j-1+(ksq-1)*lon_dim,lan))
      enddo
    endif
    ! for omega in gen_coord_hybrid
    ! the same variables for thermodyn_id=3 for enthalpy
    if( gen_coord_hybrid ) then
      do k=1,levs
        do j=1,njeff
          gtv(j,k)= &
             syn_gr_r_2(istrt+j-1+(kst-1)*lon_dim+lon_dim*(k-1),lan)
        enddo
      enddo
      if( vertcoord_id.eq.3. ) then
        do k=1,levs
          do j=1,njeff
            gtvx(j,k)= &
            dyn_gr_r_2(istrt+j-1+(kdtlam-1)*lon_dim+lon_dim*(k-1),lan)
            gtvy(j,k)= &
            dyn_gr_r_2(istrt+j-1+(kdtphi-1)*lon_dim+lon_dim*(k-1),lan)
          enddo
        enddo
      endif
    endif
    if( gen_coord_hybrid .and. thermodyn_id.eq.3 ) then
      ! get dry temperature from enthalpy
      sumq=0.0
      xcp=0.0
      do i=1,ntrac
        if( cpi(i).ne.0.0 ) then
          kss=ksr+(i-1)*levs
          do k=1,levs
            do j=1,njeff
              work1= &
              syn_gr_r_2(istrt+j-1+(kss-1)*lon_dim+lon_dim*(k-1),lan)
              sumq(j,k)=sumq(j,k)+work1
              xcp(j,k)=xcp(j,k)+cpi(i)*work1
            enddo
          enddo
        endif
      enddo
      do k=1,levs
        do j=1,njeff
          work1=(1.-sumq(j,k))*cpi(0)+xcp(j,k)
          syn_gr_r_2(istrt+j-1+(kst-1)*lon_dim+lon_dim*(k-1),lan)= &
          syn_gr_r_2(istrt+j-1+(kst-1)*lon_dim+lon_dim*(k-1),lan)/work1
        enddo
      enddo
    else
      ! get dry temperture from virtual temperature
      do k=1,levs
        do j=1,njeff
          work1 = 1.0 + fv * &
          max(syn_gr_r_2(istrt+j-1+(ksr-1)*lon_dim+lon_dim*(k-1),lan),qmin)
          syn_gr_r_2(istrt+j-1+(kst-1)*lon_dim+lon_dim*(k-1),lan)= &
          syn_gr_r_2(istrt+j-1+(kst-1)*lon_dim+lon_dim*(k-1),lan)/work1
        enddo
      enddo
    endif
    do k=1,levs
      do j=1,njeff
        ugr(j,k)= &
        syn_gr_r_2(istrt+j-1+(ksu-1)*lon_dim+lon_dim*(k-1),lan)
        vgr(j,k)= &
        syn_gr_r_2(istrt+j-1+(ksv-1)*lon_dim+lon_dim*(k-1),lan)
        gd(j,k)= &
        syn_gr_r_2(istrt+j-1+(ksd-1)*lon_dim+lon_dim*(k-1),lan)
        gt(j,k)= &
        syn_gr_r_2(istrt+j-1+(kst-1)*lon_dim+lon_dim*(k-1),lan)+temp_corr
      enddo
    enddo
    do kk=1,ntrac
      do k=1,levs
        do j=1,njeff
          gr(j,k,kk)= &
          syn_gr_r_2(istrt+j-1+(ksr+(kk-1)*levs-1)*lon_dim &
          +lon_dim*(k-1),lan)
        enddo
      enddo
    enddo
    do j=1,njeff
      gq(j)=syn_gr_r_2(istrt+j-1+(ksq-1)*lon_dim,lan)
      gphi(j)=syn_gr_r_2(istrt+j-1+(kspphi-1)*lon_dim,lan)
      glam(j)=syn_gr_r_2(istrt+j-1+(ksplam-1)*lon_dim,lan)
    enddo
    if( gen_coord_hybrid ) then
      call hyb2press_gc(njeff,ngptc,gq, gtv, prsi,prsl,prsik, prslk)
      call omegtes_gc(njeff,ngptc,rcs2_r(min(lat,latr-lat+1)), &
                     gq,gphi,glam,gtv,gtvx,gtvy,gd,ugr,vgr,vvel)
    else if( hybrid )then
      call  hyb2press(njeff,ngptc,gq, prsi, prsl,prsik,prslk)
      call omegtes(njeff,ngptc,rcs2_r(min(lat,latr-lat+1)), &
                     gq,gphi,glam,gd,ugr,vgr,vvel)
    else
      call  sig2press(njeff,ngptc,gq,sl,si,slk,sik, &
                                      prsi,prsl,prsik,prslk)
      call omegast3(njeff,ngptc,levs, &
                    gphi,glam,ugr,vgr,gd,del, &
                    rcs2_r(min(lat,latr-lat+1)),vvel,gq,sl)
    endif
    do i=1,ngptc
      phil(i,levs)  = 0.0 ! will force calculation of geopotential in gbphys.
    enddo
    if (gen_coord_hybrid .and. thermodyn_id == 3) then
      do i=1,ngptc
        prslk(i,1) = 0.0 ! will force calculation of geopotential in gbphys.
        prsik(i,1) = 0.0 ! will force calculation of geopotential in gbphys.
      enddo
    endif
    do i=1,njeff
      dpshc(i) = 0.3 * prsi(i,1)
    enddo
    nlons_v  = lons_lat
    sinlat_v = sinlat_r(lat)
    coslat_v = coslat_r(lat)
    rcs2_v   = rcs2_r(min(lat,latr-lat+1))
    if (ntoz .gt. 0) then
      do j=1,pl_coeff
        do k=1,levozp
          do i=1,ngptc
            ozplout_v(i,k,j) = ozplout(k,lan,j)
          enddo
        enddo
      enddo
    endif
    do k=1,lsoil
      do i=1,njeff
        smc_v(i,k) = lnd%smc(istrt+i-1,lan,k)
        stc_v(i,k) = lnd%stc(istrt+i-1,lan,k)
        slc_v(i,k) = lnd%slc(istrt+i-1,lan,k)
      enddo
    enddo
    do k=1,nmtvr
      do i=1,njeff
        hprime_v(i,k) = hprime(k,istrt+i-1,lan)
      enddo
    enddo
  
    do j=1,num_p3d
      do k=1,levs
        do i=1,njeff
          phy_f3dv(i,k,j) = phy_f3d(i,k,iblk,lan,j)
        enddo
      enddo
    enddo
    do j=1,num_p2d
      do i=1,njeff
        phy_f2dv(i,j) = phy_f2d(istrt+i-1,lan,j)
      enddo
    enddo
    do j=1,nrcm
      do i=1,njeff
        rannum(i,j) = xkt2(istrt+i-1,lan,j)
      enddo
    enddo
  
    call gbphys &
  !  ---  inputs:
    ( istrt,lan,njeff,ngptc,lsm,ntrac,ncld,ntoz,ntcw, &
      nmtvr,nrcm,levozp,lonr,latr,jcap,num_p3d,num_p2d, &
      kdt,lat,me,pl_coeff,nlons_v,ncw,flgmin,crtrh, &
      ccwf,ctei_rm,clstp,dtp,dtf,fhour,solhr, &
      slag,sdec,cdec,sinlat_v,coslat_v,gq,ugr,vgr, &
      gt,gr,vvel,prsi,prsl,prslk,prsik,phii,phil, &
      rannum,ozplout_v,pl_pres,rcs2_v,dpshc, &
      hprime_v, xlon(isc:iec,lan), &
      lnd%frac(isc:iec,lan),lnd%ofrac(isc:iec,lan),lnd%slopetype(isc:iec,lan), &
      lnd%tg3(isc:iec,lan), lnd%vegfrac(isc:iec,lan),lnd%vegtype(isc:iec,lan), &
      lnd%soiltype(isc:iec,lan), sfc_fld%uustar(isc:iec,lan), &
      flx_fld%coszen(isc:iec,lan), flx_fld%sfcdsw(isc:iec,lan), &
      flx_fld%sfcnsw(isc:iec,lan), lnd%nsw(isc:iec,lan), flx_fld%sfcdlw(isc:iec,lan), &
      flx_fld%tsflw (isc:iec,lan), flx_fld%sfcemis(isc:iec,lan), &
      swh(1,1,iblk,lan), hlw(1,1,iblk,lan), ras, pre_rad, &
      trans_trac, lssav, bkgd_vdif, flipv, &
      old_monin, cnvgwd, sashal, newsas, mstrat, &
  !   input/outputs:
      ocn%hice(isc:iec,lan), ocn%fice(isc:iec,lan), ocn%fwater(isc:iec,lan), &
      ocn%tice(isc:iec,lan), ocn%twater(isc:iec,lan), lnd%tprcp(isc:iec,lan), &
      sfc_fld%cv(isc:iec,lan), sfc_fld%cvb(isc:iec,lan), sfc_fld%cvt(isc:iec,lan), &
      acv(isc:iec,lan), acvb(isc:iec,lan), acvt(isc:iec,lan),  &
      flx_fld%cldwrk(isc:iec,lan), phy_f3dv, phy_f2dv, flx_fld%ep(isc:iec,lan), &
      slc_v, smc_v, stc_v, lnd%tskin(isc:iec,lan), &
      lnd%srflag(isc:iec,lan), lnd%snwdph(isc:iec,lan), &
      lnd%sheleg(isc:iec,lan), lnd%sncovr(isc:iec,lan), &
      lnd%zorl(isc:iec,lan), ocn%zorl(isc:iec,lan), lnd%canopy(isc:iec,lan), &
      sfc_fld%ffmm  (isc:iec,lan),    sfc_fld%ffhh  (isc:iec,lan), &
      sfc_fld%f10m  (isc:iec,lan),    flx_fld%srunoff(isc:iec,lan), &
      flx_fld%evbsa (isc:iec,lan),    flx_fld%evcwa (isc:iec,lan), &
      flx_fld%snohfa(isc:iec,lan),    flx_fld%transa(isc:iec,lan), &
      flx_fld%sbsnoa(isc:iec,lan),    flx_fld%snowca(isc:iec,lan), &
      flx_fld%soilm (isc:iec,lan),    flx_fld%tmpmin(isc:iec,lan), &
      flx_fld%tmpmax(isc:iec,lan),    flx_fld%dugwd (isc:iec,lan), &
      flx_fld%dvgwd (isc:iec,lan),    flx_fld%psmean(isc:iec,lan), &
      flx_fld%bengsh(isc:iec,lan),    flx_fld%spfhmin(isc:iec,lan), &
      flx_fld%spfhmax(isc:iec,lan),   flx_fld%dusfc (isc:iec,lan), &
      flx_fld%dvsfc (isc:iec,lan),    flx_fld%dtsfc (isc:iec,lan), &
      flx_fld%dqsfc (isc:iec,lan),    flx_fld%geshem(isc:iec,lan), &
      flx_fld%gflux (isc:iec,lan),    flx_fld%runoff(isc:iec,lan), &
      flx_fld%dlwsfc(isc:iec,lan),    flx_fld%ulwsfc(isc:iec,lan), &
  !   outputs:
      adt, adr, adu, adv, &
      sfc_fld%t2m   (isc:iec,lan),    sfc_fld%q2m   (isc:iec,lan), &
      flx_fld%u10m  (isc:iec,lan),    flx_fld%v10m  (isc:iec,lan), &
      flx_fld%zlvl  (isc:iec,lan),    flx_fld%psurf (isc:iec,lan), &
      flx_fld%hpbl  (isc:iec,lan),    flx_fld%pwat  (isc:iec,lan), &
      flx_fld%t1    (isc:iec,lan),    flx_fld%q1    (isc:iec,lan), &
      flx_fld%u1    (isc:iec,lan),    flx_fld%v1    (isc:iec,lan), &
      flx_fld%chh   (isc:iec,lan),    flx_fld%cmm   (isc:iec,lan), &
      flx_fld%dlwsfci(isc:iec,lan),   flx_fld%ulwsfci(isc:iec,lan), &
      flx_fld%dswsfci(isc:iec,lan),   flx_fld%uswsfci(isc:iec,lan), &
      flx_fld%dtsfci(isc:iec,lan),    flx_fld%dqsfci(isc:iec,lan), &
      flx_fld%gfluxi(isc:iec,lan),    flx_fld%epi   (isc:iec,lan), &
      ocn%lhflx_i(isc:iec,lan), ocn%lhflx_o(isc:iec,lan), ocn%shflx_i(isc:iec,lan), &
      ocn%shflx_o(isc:iec,lan), ocn%dlw(isc:iec,lan), ocn%lprec(isc:iec,lan), &
      ocn%fprec(isc:iec,lan), ocn%drdt(isc:iec,lan), ocn%dedt(isc:iec,lan), &
      ocn%dhdt(isc:iec,lan), ocn%uflux(isc:iec,lan), ocn%vflux(isc:iec,lan), &
      ocn%totrunoff(isc:iec,lan))
  
    if( gen_coord_hybrid .and. thermodyn_id.eq.3 ) then
      ! convert dry temperature to enthalpy
      sumq=0.0
      xcp=0.0
      do i=1,ntrac
        if( cpi(i).ne.0.0 ) then
          do k=1,levs
            do j=1,njeff
              work1=adr(j,k,i)
              sumq(j,k)=sumq(j,k)+work1
              xcp(j,k)=xcp(j,k)+cpi(i)*work1
            enddo
          enddo
        endif
      enddo
      do k=1,levs
       do j=1,njeff
         work1    = (1.-sumq(j,k))*cpi(0)+xcp(j,k)
         adt(j,k) = adt(j,k)*work1
       enddo
      enddo
    else
      ! convert dry temperture to virtual temperature
      do k=1,levs
        do j=1,njeff
          work1    = 1.0 + fv * max(adr(j,k,1),qmin)
          adt(j,k) = adt(j,k)*work1
        enddo
      enddo
    endif
    if( gen_coord_hybrid .and. vertcoord_id.eq.3. ) then
      if( thermodyn_id.eq.3. ) then
        call gbphys_adv_h(njeff,ngptc,dtf,gtv,ugr,vgr,gr , gq, &
                                  adt,adu,adv,adr,prsi )
      else
        call gbphys_adv(njeff,ngptc,dtf,gtv,ugr,vgr,gr , gq, &
                                  adt,adu,adv,adr,prsi )
      endif
    endif
    call dscal(levs*ngptc,rcs2_v,adu,1)
    call dscal(levs*ngptc,rcs2_v,adv,1)
  
    do k=1,lsoil
      do i=1,njeff
        lnd%smc(istrt+i-1,lan,k) = smc_v(i,k)
        lnd%stc(istrt+i-1,lan,k) = stc_v(i,k)
        lnd%slc(istrt+i-1,lan,k) = slc_v(i,k)
      enddo
    enddo
  
    do j=1,num_p3d
      do k=1,levs
        do i=1,njeff
          phy_f3d(i,k,iblk,lan,j) = phy_f3dv(i,k,j)
        enddo
      enddo
    enddo
    do j=1,num_p2d
      do i=1,njeff
        phy_f2d(istrt+i-1,lan,j) = phy_f2dv(i,j)
      enddo
    enddo
  
    do k=1,levs
      do j=1,njeff
        anl_gr_r_2(istrt+j-1+(kat-1)*lon_dim+lon_dim*(k-1),lan)=adt(j,k)
        anl_gr_r_2(istrt+j-1+(kau-1)*lon_dim+lon_dim*(k-1),lan)=adu(j,k)
        anl_gr_r_2(istrt+j-1+(kav-1)*lon_dim+lon_dim*(k-1),lan)=adv(j,k)
      enddo
    enddo
  
    do kk=1,ntrac
      do k=1,levs
        do j=1,njeff
          anl_gr_r_2(istrt+j-1+(kar+(kk-1)*levs-1)*lon_dim &
          +lon_dim*(k-1),lan)=adr(j,k,kk)
        enddo
      enddo
    enddo
    return
  end subroutine gbphys_call

  subroutine initialize_gbphys_call(time)
    
    type(time_type), intent(in) :: time

    if (initialized) return
    
    call initialize_gbphys(time)
    
  end subroutine initialize_gbphys_call
  
end module gbphys_call_mod
