module gloopr_mod
  use output_manager_fms, only: update_opdata
  use module_radiation_driver, only: radinit, grrad
  implicit none
  private
  public :: gloopr
  contains
  subroutine gloopr(trie_ls,trio_ls, &
                    ls_node,ls_nodes,max_ls_nodes, &
                    lats_nodes_r,global_lats_r, &
                    lonsperlar, &
                    epse,epso,epsedn,epsodn, &
                    snnp1ev,snnp1od,plnev_r,plnod_r, &
                    pddev_r,pddod_r, &
                    xlon,xlat,coszdg,coszen, &
                    hprime, &
                    sfalb, &
                    cv,cvt , &
                    cvb,swh,hlw,sfcnsw,sfcdlw,sfcemis, &
                    sfcdsw, &
                    tsflw,fluxr,phy_f3d,slag,sdec,cdec,nblck, &
                    global_times_r,o3,oro)
  
    use machine, only : kind_phys
    use funcphys, only : fpkap
    use physcons, fv => con_fvirt, rerth => con_rerth
  
    use module_radiation_astronomy,only : astronomy
    use resol_def
    use layout1
    use gg_def
    use vert_def
    use date_def, only: idate, fhour
    use namelist_def
    use coordinate_def
    use tracer_const
    use mersenne_twister, only : random_setseed, random_index, &
                                & random_stat
    use land_model_mod, only : lnd
    use ocean_mod, only: ocn
  
    implicit none
  
    real (kind=kind_phys), parameter :: qmin =1.0e-10
    real (kind=kind_evod), parameter :: typical_pgr = 95.0
    real (kind=kind_evod), parameter :: cons0 = 0.0, cons2 = 2.0
  
    !--- ... inputs:
    integer, intent(in) :: ls_node(ls_dim,3), ls_nodes(ls_dim,nodes), &
                           max_ls_nodes(nodes), lats_nodes_r(nodes), &
                           global_lats_r(latr), lonsperlar(latr)
  
    integer, intent(in) :: nblck
  
    real(kind=kind_evod), dimension(len_trie_ls), intent(in) :: &
                                           epse, epsedn, snnp1ev
  
    real(kind=kind_evod), dimension(len_trio_ls), intent(in) :: &
                                            epso, epsodn, snnp1od
  
    real(kind=kind_evod), intent(in) :: plnev_r(len_trie_ls, latr2)
    real(kind=kind_evod), intent(in) :: plnod_r(len_trio_ls, latr2)
  
    real (kind=kind_phys), dimension(lonr,lats_node_r), intent(in) :: &
                               xlon, xlat, &
                               cv, cvt, cvb,oro
  
    real (kind=kind_phys), intent(in) :: &
                            hprime(nmtvr,lonr,lats_node_r), &
                            phy_f3d(ngptc,levs,nblck,lats_node_r,num_p3d)
  
    !--- ... input and output:
    real(kind=kind_evod), intent(inout) :: &
                            trie_ls(len_trie_ls,2,11*levs+3*levh+6), &
                            trio_ls(len_trio_ls,2,11*levs+3*levh+6)
    integer :: ipt_ls
    real(kind=kind_evod) :: reall, rlcs2(jcap1)
  
    real (kind=kind_phys), intent(inout) :: &
                           fluxr (nfxr,lonr,lats_node_r)
  
    !  --- ... inputs but not used anymore:
    real(kind=kind_evod), intent(in) :: pddev_r(len_trie_ls,latr2), &
                                        pddod_r(len_trio_ls,latr2)
  
    !  --- ... outputs:
    real(kind=kind_evod), intent(out) :: global_times_r(latg,nodes)
    real(kind=kind_evod) :: for_gr_r_1(lonrx*lots,lats_dim_r), &
                            dyn_gr_r_1(lonrx*lotd,lats_dim_r), &
                            for_gr_r_2(lonrx*lots,lats_dim_r), &
                            dyn_gr_r_2(lonrx*lotd,lats_dim_r)
  
    real (kind=kind_phys), intent(out) :: swh(ngptc,levs,nblck,lats_node_r), &
                                          hlw(ngptc,levs,nblck,lats_node_r)
  
    real (kind=kind_phys),dimension(lonr,lats_node_r), intent(out) :: &
                                          coszdg, coszen, sfcnsw, sfcdlw, tsflw, &
                                          sfcdsw, sfalb

    real (kind=kind_phys),dimension(lonr,lats_node_r,levs), intent(in) ::o3    
    real (kind=kind_phys), dimension(lonr, lats_node_r), intent(inout) :: sfcemis
  
    real (kind=kind_phys), intent(out) :: slag, sdec, cdec
  
    !  --- ... locals:
    real(kind=kind_phys) :: prsl(ngptc,levs), prslk(ngptc,levs), &
                            prsi(ngptc,levp1), prsik(ngptc,levp1)
  
    real (kind=kind_phys) :: si_loc(levr+1), tsea(lonr,lats_node_r)
  
    real (kind=kind_phys) :: gu(ngptc,levs), gv1(ngptc,levs), &
                             gt(ngptc,levr), gd (ngptc,levs), &
                             gr(ngptc,levr), gr1(ngptc,levr,ntrac-1), &
                             gphi(ngptc), glam(ngptc), gq(ngptc), &
                             sumq(ngptc,levr), xcp(ngptc,levr), &
                             gtv(ngptc,levr), gtvx(ngptc,levr), &
                             gtvy(ngptc,levr)
  
    real (kind=kind_phys) :: f_ice(ngptc,levs), f_rain(ngptc,levs), &
                             r_rime(ngptc,levs)
  
    real (kind=kind_phys) :: hprime_v(ngptc), &
                             fluxr_v(ngptc,nfxr), vvel(ngptc,levs)
    real (kind=kind_phys) :: flgmin_l(ngptc), work1, work2
  
    real (kind=kind_phys) :: rinc(5), dtsw, dtlw, solcon
  
    real (kind=kind_phys), save :: facoz
  
    integer :: njeff, lon, lan, lat, iblk, lon_dim, lons_lat, istrt
    integer :: idat(8), jdat(8), iday, imon, midmon, id
    integer, parameter :: days(13) = (/ 31,28,31,30,31,30,31,31,30,31,30,31,30 /)
    integer :: lmax
  
    !  --- variables used for random number generator (thread safe mode)
    type (random_stat) :: stat
    integer :: numrdm(lonr*latr*2), ixseed(lonr,lats_node_r,2)
    integer :: ipseed, icsdlw(ngptc), icsdsw(ngptc)
    integer, parameter :: ipsdlim = 1.0e8 ! upper limit for random seeds
    integer, save :: icwp, k1oz, k2oz, midm, midp, ipsd0
  
  
    !  ---  ictm=yyyy#, controls time sensitive external data (e.g. co2, solcon, aerosols, etc)
    !     integer, parameter :: ictm =   -2 ! same as ictm=0, but add seasonal cycle from
    !                                       ! climatology. no extrapolation.
    !     integer, parameter :: ictm =   -1 ! use user provided external data set for the
    !                                       ! forecast time. no extrapolation.
    !     integer, parameter :: ictm =    0 ! use data at initial cond time, if not
    !                                       ! available, use latest, no extrapolation.
    !!    integer, parameter :: ictm =    1 ! use data at the forecast time, if not
    !                                       ! available, use latest and extrapolation.
    !     integer, parameter :: ictm =yyyy0 ! use yyyy data for the forecast time,
    !                                       ! no further data extrapolation.
    !     integer, parameter :: ictm =yyyy1 ! use yyyy data for the fcst. if needed, do
    !                                       ! extrapolation to match the fcst time.
  
    !  ---  isol controls solar constant data source
    !!    integer, parameter :: isol = 0   ! use prescribed solar constant
    !     integer, parameter :: isol = 1   ! use varying solar const with 11-yr cycle
  
    !  ---  ico2 controls co2 data source for radiation
    !     integer, parameter :: ico2 = 0   ! prescribed global mean value (old opernl)
    !!    integer, parameter :: ico2 = 1   ! use obs co2 annual mean value only
    !     integer, parameter :: ico2 = 2   ! use obs co2 monthly data with 2-d variation
  
    !  ---  ialb controls surface albedo for sw radiation
    !!    integer, parameter :: ialb = 0   ! use climatology alb, based on sfc type
    !     integer, parameter :: ialb = 1   ! use modis derived alb (to be developed)
  
    !  ---  iems controls surface emissivity and sfc air/ground temp for lw radiation
    !        ab: 2-digit control flags. a-for sfc temperature;  b-for emissivity
    !!    integer, parameter :: iems = 00  ! same air/ground temp; fixed emis = 1.0
    !!    integer, parameter :: iems = 01  ! same air/ground temp; varying veg typ based emis
    !!    integer, parameter :: iems = 10  ! diff air/ground temp; fixed emis = 1.0
    !!    integer, parameter :: iems = 11  ! diff air/ground temp; varying veg typ based emis
    !  ---  iaer  controls aerosols scheme selections
    !     old definition
    !     integer, parameter :: iaer  = 1  ! opac climatology, without volc forcing
    !     integer, parameter :: iaer  =11  ! opac climatology, with volcanic forcing
    !     integer, parameter :: iaer  = 2  ! gocart prognostic, without volc forcing
    !     integer, parameter :: iaer  =12  ! gocart prognostic, with volcanic forcing
    !     new definition in this code iaer = abc (a:volcanic; b:lw; c:sw)
    !                             b, c values: (0:none; 1:opac; 2:gocart)
    !  iaer =   0 --> no aerosol effect at all (volc, sw, lw)
    !       =   1 --> only tropospheric sw aerosols, no trop-lw and volc
    !       =  10 --> only tropospheric lw aerosols, no trop-sw and volc
    !       =  11 --> both trop-sw and trop-lw aerosols, no volc
    !       = 100 --> only strato-volc aeros, no trop-sw and trop-lw
    !       = 101 --> only sw aeros (trop + volc), no lw aeros
    !       = 110 --> only lw aeros (trop + volc), no sw aeros
    !       = 111 --> both sw and lw aeros (trop + volc)
    !
  
    !  ---  iovr controls cloud overlapping method in radiation:
    !     integer, parameter :: iovr_sw = 0  ! sw: random overlap clouds
    !!    integer, parameter :: iovr_sw = 1  ! sw: max-random overlap clouds
  
    !     integer, parameter :: iovr_lw = 0  ! lw: random overlap clouds
    !!    integer, parameter :: iovr_lw = 1  ! lw: max-random overlap clouds
  
    !  ---  isubc controls sub-column cloud approximation in radiation:
    !     integer, parameter :: isubc_sw = 0 ! sw: without sub-col clds approx
    !     integer, parameter :: isubc_sw = 1 ! sw: sub-col clds with prescribed seeds
    !     integer, parameter :: isubc_sw = 2 ! sw: sub-col clds with random seeds
  
    !     integer, parameter :: isubc_lw = 0 ! lw: without sub-col clds approx
    !     integer, parameter :: isubc_lw = 1 ! lw: sub-col clds with prescribed seeds
    !     integer, parameter :: isubc_lw = 2 ! lw: sub-col clds with random seeds
  
    !  ---  iflip indicates model vertical index direction:
    !     integer, parameter :: iflip = 0    ! virtical profile index from top to bottom
          integer, parameter :: iflip = 1    ! virtical profile index from bottom to top
    !
    !    the following parameters are from gbphys
    !
    real (kind=kind_phys), parameter :: dxmax=-16.118095651, &
                        dxmin=-9.800790154, dxinv=1.0/(dxmax-dxmin)
  
    integer :: kr, kt, kd, kq, ku, kv, dimg, kx, ky
    integer :: i, j, k, n
    integer :: kdtphi,kdtlam,ks
  
    logical :: lslag=.false., change, lprnt=.false.
    logical, save :: first=.true., sas_shal
  
    !  ---  timers:
    real(kind=8) :: rtc, timer1, timer2
  
    !===> *** ...  begin here
  
    !cmr  ls_node(1,1) ... ls_node(ls_max_node,1) : values of l
    !cmr  ls_node(1,2) ... ls_node(ls_max_node,2) : values of jbasev
    !cmr  ls_node(1,3) ... ls_node(ls_max_node,3) : values of jbasod
  
    integer :: ksd,ksplam,kspphi,ksq,ksr,kst
    integer :: ksu,ksv
  
    !  ---  number of days in a month
  
    ksd     =1*levs+0*levh+1
    kst     =2*levs+0*levh+1
    ksr     =3*levs+0*levh+1
    ksq     =3*levs+1*levh+1
    ksplam  =3*levs+1*levh+2
    kspphi  =3*levs+1*levh+3
    ksu     =3*levs+1*levh+4
    ksv     =4*levs+1*levh+4
    kdtphi  =0*levs+0*levh+1
    kdtlam  =1*levs+1*levh+1
  
    idat = 0
    idat(1) = idate(4)
    idat(2) = idate(2)
    idat(3) = idate(3)
    idat(5) = idate(1)
    rinc = 0.
    rinc(2) = fhour
    call w3movdat(rinc, idat, jdat)

    tsea(:,:)=lnd%tskin*lnd%frac + &
              ocn%twater*lnd%ofrac*ocn%fwater + &
              ocn%tice*lnd%ofrac*ocn%fice

!    tsea(:,:)=lnd%tskinr(:,:)
!    lnd%tskinr(:,:)=0.0

    if (ntoz .le. 0) then                ! climatological ozone!
      iday   = jdat(3)
      imon   = jdat(2)
      midmon = days(imon)/2 + 1
      change = first .or. &
            ((iday .eq. midmon) .and. (jdat(5).eq.0))
  
      if (change) then
        if(iday .lt. midmon) then
          k1oz = mod(imon+10,12) + 1
          midm = days(k1oz)/2 + 1
          k2oz = imon
          midp = days(k1oz) + midmon
        else
          k1oz = imon
          midm = midmon
          k2oz = mod(imon,12) + 1
          midp = days(k2oz)/2 + 1 + days(k1oz)
        endif
      endif
  
      if (iday .lt. midmon) then
         id = iday + days(k1oz)
      else
         id = iday
      endif
      facoz = real (id-midm) / real (midp-midm)
    endif
  
    if (first) then
      sas_shal = sashal .and. (.not. ras)
      if( hybrid.or.gen_coord_hybrid ) then
        if( gen_coord_hybrid ) then
          si_loc(levr+1) = si(levp1)
          do k=1,levr
            si_loc(k) = si(k)
          enddo
        else
        !  ---  get some sigma distribution for radiation-cloud initialization
          si_loc(levr+1)= ak5(1)/typical_pgr+bk5(1)
          do k=1,levr
            si_loc(levr+1-k)= ak5(levp1-levr+k)/typical_pgr &
                                + bk5(levp1-levr+k)
          enddo
        endif
      else
        do k = 1, levr
          si_loc(k) = si(k)
        enddo
        si_loc(levr+1) = si(levp1)
      endif       ! end_if_hybrid
  
      !  --- determin prognostic/diagnostic cloud scheme
      icwp   = 0
      if (ntcw > 0) icwp = 1
  
      !  ---  generate initial permutation seed for random number generator
  
      if ( isubc_lw==2 .or. isubc_sw==2 ) then
        !ipsd0 = 17*idate(1) + 43*idate(2) + 37*idate(3) + 23*idate(4)
        ipsd0 = 17*2009 + 43*12 + 37*12 + 23*0
        if ( me == 0 ) then
          print *,'  radiation sub-cloud initial seed =',ipsd0,       &
                                               ' idate =',idate
        endif
      endif
      first = .false.
    endif         ! end_if_first
  
    !===> *** ...  radiation initialization
  
    dtsw  = 3600.0 * fhswr
    dtlw  = 3600.0 * fhlwr
  
    call radinit                                                      &
    !  ---  input:
             ( si_loc, levr, iflip, idat, jdat, ictm, isol, ico2,         &
               iaer, ialb, iems, icwp, num_p3d, isubc_sw, isubc_lw,       &
               iovr_sw, iovr_lw, me )
    !  ---  output: ( none )
  
  
    !===> *** ...  astronomy for sw radiation calculation.
  
    call astronomy                                                    &
    !  ---  inputs:
             ( lonsperlar, global_lats_r, sinlat_r, coslat_r, xlon,       &
               fhswr, jdat,                                               &
               lonr, lats_node_r, latr, ipt_lats_node_r, lsswr, me,       &
    !  ---  outputs:
               solcon, slag, sdec, cdec, coszen, coszdg                   &
              )
  
  
    !===> *** ...  generate 2-d random seeds array for sub-grid cloud-radiation
  
    if ( isubc_lw==2 .or. isubc_sw==2 ) then
      ipseed = mod(nint(100.0*sqrt(real(sum(jdat))*3600)), ipsdlim) + 1 + ipsd0
      call random_setseed( ipseed,stat)
      call random_index(ipsdlim,numrdm,stat)
  
      do k = 1, 2
        do j = 1, lats_node_r
          lat = global_lats_r(ipt_lats_node_r-1+j)
  
          do i = 1, lonr
            ixseed(i,j,k) = numrdm(i+(lat-1)*lonr+(k-1)*latr)
          enddo
        enddo
      enddo
    endif
  
    !===> *** ...  spectrum to grid transformation for radiation calculation.
  
    call delnpe(trie_ls(1,1,p_q   ), &
                    trio_ls(1,1,p_dphi), &
                    trie_ls(1,1,p_dlam), &
                    epse,epso,ls_node)
  
    call delnpo(trio_ls(1,1,p_q   ), &
                    trie_ls(1,1,p_dphi), &
                    trio_ls(1,1,p_dlam), &
                    epse,epso,ls_node)
  
    !$omp parallel do shared(trie_ls,trio_ls) &
    !$omp shared(epsedn,epsodn,snnp1ev,snnp1od,ls_node) &
    !$omp private(k)
    do k=1,levs
      call dezouv(trie_ls(1,1,p_di +k-1), trio_ls(1,1,p_ze +k-1), &
                       trie_ls(1,1,p_uln+k-1), trio_ls(1,1,p_vln+k-1), &
                       epsedn,epsodn,snnp1ev,snnp1od,ls_node)
  
      call dozeuv(trio_ls(1,1,p_di +k-1), trie_ls(1,1,p_ze +k-1), &
                       trio_ls(1,1,p_uln+k-1), trie_ls(1,1,p_vln+k-1), &
                       epsedn,epsodn,snnp1ev,snnp1od,ls_node)
    enddo
  
    dimg=0
  
    call sumflna_r(trie_ls(1,1,p_ze), &
                    trio_ls(1,1,p_ze), &
                    lat1s_r, &
                    plnev_r,plnod_r, &
                    lots,ls_node,latr2, &
                    lslag,lats_dim_a,lots,for_gr_r_1, &
                    ls_nodes,max_ls_nodes, &
                    lats_nodes_r,global_lats_r, &
                    lats_node_r,ipt_lats_node_r,lon_dims_r,dimg, &
                    lonsperlar,lonrx,latr)
  
    if( vertcoord_id.eq.3. ) then
      call sumdera_r(trie_ls(1,1,p_te), &
                     trio_ls(1,1,p_te), &
                     lat1s_r, &
                     pddev_r,pddod_r, &
                     levs,ls_node,latr2, &
                     lslag,lats_dim_r,lotd, &
                     dyn_gr_r_1, &
                     ls_nodes,max_ls_nodes, &
                     lats_nodes_r,global_lats_r, &
                     lats_node_r,ipt_lats_node_r,lon_dims_r,dimg, &
                     lonsperlar,lonrx,latr)
  
    endif     ! vertcoord_id=3
  
    do lan=1,lats_node_r
      timer1=rtc()
      lat = global_lats_r(ipt_lats_node_r-1+lan)
      lon_dim = lon_dims_r(lan)
      lons_lat = lonsperlar(lat)
      if( gen_coord_hybrid .and. vertcoord_id.eq.3. ) then
        lmax = min(jcap,lons_lat/2)
        ipt_ls=min(lat,latr-lat+1)
        do i=1,lmax+1
          if ( ipt_ls .ge. lat1s_r(i-1) ) then
            reall=i-1
            rlcs2(i)=reall*rcs2_r(ipt_ls)/rerth
          else
            rlcs2(i)=cons0     !constant
          endif
        enddo
        !$omp parallel do private(k,i)
        do k=1,levs
          do i=1,lmax+1
            dyn_gr_r_1(2*i-1+(kdtlam-2+k)*lon_dim,lan)= &
               -for_gr_r_1(2*i  +(kst   -2+k)*lon_dim,lan)*rlcs2(i)
            dyn_gr_r_1(2*i  +(kdtlam-2+k)*lon_dim,lan)= &
                for_gr_r_1(2*i-1+(kst   -2+k)*lon_dim,lan)*rlcs2(i)
          enddo
        enddo
      endif       ! gc and vertcoord_id=3
  
      call four2grid_thread(for_gr_r_1(1,lan),for_gr_r_2(1,lan),     &
                         lon_dim,lons_lat,lonrx,5*levs+levh+3,lan,me)
  
      if( gen_coord_hybrid.and.vertcoord_id.eq.3. ) then
              call four2grid_thread(dyn_gr_r_1(1,lan),dyn_gr_r_2(1,lan), &
                            lon_dim,lons_lat,lonrx,levs,lan,me)
              call four2grid_thread(dyn_gr_r_1((kdtlam-1)*lon_dim+1,lan), &
                                   dyn_gr_r_2((kdtlam-1)*lon_dim+1,lan), &
                                   lon_dim,lons_lat,lonrx,levs,lan,me)
      endif       ! gc and vertcoord_id=3
  
      if( .not. gen_coord_hybrid ) then
        do k = 1, levs
          kr = (ksr + k - 2) * lon_dim
          kt = (kst + k - 2) * lon_dim
          do j = 1, lons_lat
            if (for_gr_r_2(j+kr,lan) <= 0.0) then
              for_gr_r_2(j+kr,lan) = qmin
            endif
            for_gr_r_2(j+kt,lan) = for_gr_r_2(j+kt,lan)               &
                                   / (1.0 + fv*for_gr_r_2(j+kr,lan))
          enddo
        enddo
        kq = (ksq - 1)*lon_dim
        do j = 1, lons_lat
          for_gr_r_2(j+kq,lan) = exp( for_gr_r_2(j+kq,lan) )
        enddo
      endif
      timer2=rtc()
      global_times_r(lat,me+1)=timer2-timer1
    enddo   !lan
  
    !===> *** ...  starting latitude loop
    do lan=1,lats_node_r
      lat = global_lats_r(ipt_lats_node_r-1+lan)
      lons_lat = lonsperlar(lat)
  
    !!$omp parallel do schedule(dynamic,1) private(lon,j,k,lon_dim) &
    !!$omp private(istrt,njeff,iblk,ku,kv,kd,kq,kt,kr,kx,ky,ks,n) &
    !!$omp private(vvel,gu,gv1,gd,gt,gr,gr1,gq,gphi,glam) &
    !!$omp private(gtv,gtvx,gtvy,sumq,xcp) &
    !!$omp private(hprime_v,fluxr_v,f_ice,f_rain,r_rime) &
    !!$omp private(prslk,prsl,prsik,prsi) &
    !!$omp private(icsdsw,icsdlw)
  
      do lon=1,lons_lat,ngptc
        lon_dim = lon_dims_r(lan)
        njeff   = min(ngptc,lons_lat-lon+1)
        istrt   = lon
        if (ngptc.ne.1) then
          iblk  = lon/ngptc+1
        else
          iblk  = lon
        endif
        do k = 1, levs
          ku = lon - 1 + (ksu + k - 2)*lon_dim
          kv = lon - 1 + (ksv + k - 2)*lon_dim
          kd = lon - 1 + (ksd + k - 2)*lon_dim
          do j = 1, njeff
            gu(j,k)  = for_gr_r_2(j+ku,lan)
            gv1(j,k) = for_gr_r_2(j+kv,lan)
            gd(j,k)  = for_gr_r_2(j+kd,lan)
          enddo
        enddo
  
        if( gen_coord_hybrid ) then
          do k=1,levr
            kt = lon - 1 + (kst + k - 2)*lon_dim
            kr = lon - 1 + (ksr + k - 2)*lon_dim
            do j=1,njeff
              gtv(j,k)   = for_gr_r_2(j+kt,lan)
              gr(j,k)    = max(qmin, for_gr_r_2(j+kr,lan))
            enddo
          enddo
          if( vertcoord_id.eq.3. ) then
            do k=1,levr
              kx = lon - 1 + (kdtlam + k - 2)*lon_dim
              ky = lon - 1 + (kdtphi + k - 2)*lon_dim
              do j=1,njeff
                gtvx(j,k)  = dyn_gr_r_2(j+kx,lan)
                gtvy(j,k)  = dyn_gr_r_2(j+ky,lan)
              enddo
            enddo
          endif
          if( thermodyn_id.eq.3 ) then
          ! get dry temperature from enthalpy
            sumq=0.0
            xcp=0.0
            do i=1,ntrac
              if( cpi(i).ne.0.0 ) then
                ks=ksr+(i-1)*levs
                do k=1,levr
                  kr = lon - 1 + (ks + k - 2)*lon_dim
                  do j=1,njeff
                    sumq(j,k)=sumq(j,k)+for_gr_r_2(j+kr,lan)
                    xcp(j,k)=xcp(j,k)+cpi(i)*for_gr_r_2(j+kr,lan)
                  enddo
                enddo
              endif
            enddo
            do k=1,levr
              do j=1,njeff
                xcp(j,k)=(1.-sumq(j,k))*cpi(0)+xcp(j,k)
                gt(j,k)=gtv(j,k)/xcp(j,k)
              enddo
            enddo
          else if( thermodyn_id.le.1 ) then
          ! get dry temperature from virtual temperature
            do k=1,levr
             do j=1,njeff
               gt(j,k)    = gtv(j,k) / (1.+fv*gr(j,k))
             enddo
            enddo
          else
          ! get dry temperature from dry temperature
            do k=1,levr
              do j=1,njeff
                gt(j,k)    = gtv(j,k)
              enddo
            enddo
          endif
        else
          do k = 1, levr
            kt = lon - 1 + (kst + k - 2)*lon_dim
            kr = lon - 1 + (ksr + k - 2)*lon_dim
            do j = 1, njeff
              gt(j,k)  = for_gr_r_2(j+kt,lan)
              gr(j,k)  = for_gr_r_2(j+kr,lan)
            enddo
          enddo
        endif
  
        ! debug if(any(gt<0.)) "Error: Layer temperature (K) Negative"
  
        !    remaining tracers
  
        do n = 1, ntrac-1
          do k = 1, levr
            kr = lon - 1 + (ksr + n*levs + k - 2)*lon_dim
            do j = 1, njeff
              gr1(j,k,n) = for_gr_r_2(j+kr,lan)
            enddo
          enddo
        enddo
        kq = lon - 1 + (ksq - 1)*lon_dim
        kt = lon - 1 + (kspphi - 1)*lon_dim
        kr = lon - 1 + (ksplam - 1)*lon_dim
        do j = 1, njeff
          gq  (j) = for_gr_r_2(j+kq,lan)
          gphi(j) = for_gr_r_2(j+kt,lan)
          glam(j) = for_gr_r_2(j+kr,lan)
        enddo
  
        !---  vertical structure variables:   del,si,sl,prslk,prdel
  
        if( gen_coord_hybrid ) then
          call  hyb2press_gc(njeff,ngptc,gq,gtv,prsi,prsl,prsik,prslk)
          call omegtes_gc(njeff,ngptc,rcs2_r(min(lat,latr-lat+1)), &
                            gq,gphi,glam,gtv,gtvx,gtvy,gd,gu,gv1,vvel)
        elseif (hybrid) then
          call  hyb2press(njeff,ngptc,gq, prsi, prsl,prsik, prslk)
          call omegtes(njeff,ngptc,rcs2_r(min(lat,latr-lat+1)), &
                          gq,gphi,glam,gd,gu,gv1,vvel)
        else
          call  sig2press(njeff,ngptc,gq,sl,si,slk,sik, &
                                         prsi,prsl,prsik,prslk)
          call omegast3(njeff,ngptc,levs, &
                      gphi,glam,gu,gv1,gd,del, &
                      rcs2_r(min(lat,latr-lat+1)),vvel,gq,sl)
        endif
  
        if (levr .lt. levs) then
          do j=1,njeff
            prsi(j,levr+1) = prsi(j,levp1)
            prsl(j,levr)   = (prsi(j,levp1)+prsi(j,levr)) * 0.5
            prsik(j,levr+1) = prslk(j,levp1)
            prslk(j,levr)   = fpkap(prsl(j,levr)*1000.0)
          enddo
        endif
  
        do j=1,njeff
          hprime_v(j) = hprime(1,istrt+j-1,lan)
        enddo
  
        do k=1,nfxr
          do j=1,njeff
            fluxr_v(j,k) = fluxr(k,istrt+j-1,lan)
          enddo
        enddo
        if (num_p3d == 3) then
          do k = 1, levr
            do j = 1, njeff
              f_ice (j,k) = phy_f3d(j,k,iblk,lan,1)
              f_rain(j,k) = phy_f3d(j,k,iblk,lan,2)
              r_rime(j,k) = phy_f3d(j,k,iblk,lan,3)
            enddo
          enddo
        endif
        work1 = (log(coslat_r(lat) / (lons_lat*latg)) - dxmin) * dxinv
        work1 = max(0.0, min(1.0,work1))
        work2 = flgmin(1)*work1 + flgmin(2)*(1.0-work1)
        do j=1,njeff
          flgmin_l(j) = work2
        enddo
  
        !*** ...  assign random seeds for sw and lw radiations
  
        if ( isubc_lw==2 .or. isubc_sw==2 ) then
          do j = 1, njeff
            icsdsw(j) = ixseed(istrt+j-1,lan,1)
            icsdlw(j) = ixseed(istrt+j-1,lan,2)
          enddo
        endif
        
        call grrad                                                    &
           !  ---  inputs:
             ( prsi,prsl,prslk,gt,gr,gr1,vvel,lnd%frac(lon,lan),          &
               xlon(lon,lan),xlat(lon,lan),tsea(lon,lan),ocn%tice(lon,lan), &
               ocn%hice(lon,lan), lnd%sheleg(lon,lan), ocn%hsnow(lon,lan), &
               lnd%zorl(lon,lan),hprime_v,                                &
               lnd%alvsf(lon,lan),lnd%alnsf(lon,lan),lnd%alvwf(lon,lan),  &
               lnd%alnwf(lon,lan),lnd%facsf(lon,lan),lnd%facwf(lon,lan),  &
               ocn%fice(lon,lan),o3(lon:lon+njeff-1,lan,1:levs),          &
               solcon,coszen(lon,lan),coszdg(lon,lan),k1oz,k2oz,facoz,    &
               cv(lon,lan),cvt(lon,lan),cvb(lon,lan),                     &
               iovr_sw,f_ice,f_rain,r_rime,flgmin_l,                      &
               icsdsw,icsdlw, num_p3d,ntcw-1,ncld,ntoz-1,ntrac-1,nfxr,    &
               dtlw,dtsw, lsswr,lslwr,lssav,sas_shal,norad_precip,        &
               crick_proof, ccnorm,                                       &
               ngptc,njeff,levr,iflip, me, lprnt, lon, lan,               &
               !passing oro for aero data interp
                prsik,oro(lon,lan), &
               !  ---  outputs:
               swh(1,1,iblk,lan),sfcnsw(lon,lan),sfcdsw(lon,lan),         &
               sfalb(lon,lan),                                            &
               hlw(1,1,iblk,lan),sfcdlw(lon,lan),tsflw(lon,lan),          &
               sfcemis(lon,lan),                                          &
               lnd%nsw(lon,lan), ocn%nsw_i(lon,lan), ocn%nsw_o(lon,lan),  &
               !  --  input/output:
               fluxr_v)
  
        do k=1,nfxr
          do j=1,njeff
            fluxr(k,istrt+j-1,lan) = fluxr_v(j,k)
          enddo
        enddo
        if (levr .lt. levs) then
          do k=levr+1,levs
            do j=1,njeff
              hlw(j,k,iblk,lan) = hlw(j,levr,iblk,lan)
              swh(j,k,iblk,lan) = swh(j,levr,iblk,lan)
            enddo
          enddo
        endif
      enddo
    enddo
    return
  end subroutine gloopr
end module gloopr_mod
