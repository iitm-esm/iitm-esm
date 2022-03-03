module gloopb_mod
  use land_model_mod, only :lnd
  use ocean_mod, only: ocn
  use time_manager_mod, only: time_type
  use gbphys_call_mod, only: gbphys_call, initialize_gbphys_call
  implicit none
  private
  
  logical :: initialized=.false.
  
  public :: gloopb, initialize_gloopb
  contains

  subroutine gloopb(trie_ls,trio_ls,ls_node,ls_nodes,max_ls_nodes, &
                    lats_nodes_r,global_lats_r,lonsperlar, &
                    epse,epso,epsedn,epsodn, &
                    snnp1ev,snnp1od,ndexev,ndexod, &
                    plnev_r,plnod_r,pddev_r,pddod_r,plnew_r,plnow_r, &
                    tstep,phour,sfc_fld, flx_fld, xlon, &
                    swh,hlw,hprime,slag,sdec,cdec, &
                    ozplin,jindx1,jindx2,ddy,pdryini, &
                    phy_f3d, phy_f2d,nblck,kdt, &
                    global_times_b, temp_corr)
  
  
    use resol_def
    use layout1
    use gg_def
    use vert_def
    use date_def, only: idate, fhour
    use namelist_def
    use coordinate_def
    use bfilt_def
    use module_ras , only : ras_init
  
    use physcons, grav => con_g , rerth => con_rerth
    use ozne_def
    use sfc_flx_mod
    use mersenne_twister
    implicit none
  
    type(sfc_var_data)        :: sfc_fld
    type(flx_var_data)        :: flx_fld
  
    integer njeff,istrt,lon,iblk,kdt
  
    integer nblck
    !type(time_type), intent(in) :: time
    real(kind=kind_phys)    typdel(levs)
    real(kind=kind_phys), intent(in) :: temp_corr
    real(kind=kind_evod) trie_ls(len_trie_ls,2,11*levs+3*levh+6)
    real(kind=kind_evod) trio_ls(len_trio_ls,2,11*levs+3*levh+6)
    real(kind=kind_evod) trie_ls_rqt(len_trie_ls,2,levs)
    real(kind=kind_evod) trio_ls_rqt(len_trio_ls,2,levs)
    real(kind=kind_evod) trie_ls_sfc(len_trie_ls,2)
    real(kind=kind_evod) trio_ls_sfc(len_trio_ls,2)
    real(kind=kind_evod) slag,sdec,cdec,phour
    real(kind=kind_rad) xlon(lonr,lats_node_r)
    real(kind=kind_rad) hprime(nmtvr,lonr,lats_node_r)
    real(kind=kind_rad)  swh(ngptc,levs,nblck,lats_node_r)
    real(kind=kind_rad)  hlw(ngptc,levs,nblck,lats_node_r)
    real(kind=kind_phys) phy_f3d(ngptc,levs,nblck,lats_node_r,num_p3d), &
                         phy_f2d(lonr,lats_node_r,num_p2d)
    real (kind=kind_phys) dtphys,dtp,dtf
    real (kind=kind_evod) tstep
    real (kind=kind_phys) pdryini
    integer              ls_node(ls_dim,3)
    integer              ls_nodes(ls_dim,nodes)
    integer              max_ls_nodes(nodes)
    integer              lats_nodes_r(nodes)
    integer              global_lats_r(latr)
    integer                 lonsperlar(latr)
    integer dimg
    real(kind=kind_evod)    epse(len_trie_ls)
    real(kind=kind_evod)    epso(len_trio_ls)
    real(kind=kind_evod)  epsedn(len_trie_ls)
    real(kind=kind_evod)  epsodn(len_trio_ls)
    real(kind=kind_evod) snnp1ev(len_trie_ls)
    real(kind=kind_evod) snnp1od(len_trio_ls)
    integer               ndexev(len_trie_ls)
    integer               ndexod(len_trio_ls)
    real(kind=kind_evod)   plnev_r(len_trie_ls,latr2)
    real(kind=kind_evod)   plnod_r(len_trio_ls,latr2)
    real(kind=kind_evod)   pddev_r(len_trie_ls,latr2)
    real(kind=kind_evod)   pddod_r(len_trio_ls,latr2)
    real(kind=kind_evod)   plnew_r(len_trie_ls,latr2)
    real(kind=kind_evod)   plnow_r(len_trio_ls,latr2)
    integer lotn
    real(kind=kind_evod) for_gr_r_1(lonrx*lots,lats_dim_r)
    real(kind=kind_evod) dyn_gr_r_1(lonrx*lotd,lats_dim_r)
    real(kind=kind_evod) bak_gr_r_1(lonrx*lota,lats_dim_r)
    real(kind=kind_evod) for_gr_r_2(lonrx*lots,lats_dim_r)
    real(kind=kind_evod) dyn_gr_r_2(lonrx*lotd,lats_dim_r)
    real(kind=kind_evod) bak_gr_r_2(lonrx*lota,lats_dim_r)
    integer              i,j,k,ksq
    integer              kst,kdtphi,kdtlam
    integer              l,lan,lat,lmax,locl
    integer              lon_dim,lons_lat,n
    integer nsphys
    real(kind=kind_evod) pwatg(latr),pwatj(lats_node_r), &
                         pwatp,ptotg(latr),sumwa,sumto, &
                         ptotj(lats_node_r),pcorr,pdryg, &
                         solhr,clstp
    integer              ipt_ls
    real(kind=kind_evod) reall
    real(kind=kind_evod) rlcs2(jcap1)
    real(kind=kind_evod) typical_pgr
    real*8 rtc ,timer1,timer2
    real(kind=kind_evod) global_times_b(latr,nodes)
    integer              indlsev,jbasev
    integer              indlsod,jbasod
    include 'function2'
    real(kind=kind_evod) cons0   !constant
    logical lslag
    logical, parameter :: flipv = .true.
    ! for nasa ozone production and distruction rates:(input throu fixio)
    real ozplin(latsozp,levozp,pl_coeff,timeoz)
    integer jindx1(lats_node_r),jindx2(lats_node_r)!for ozone interpolaton
    real ddy(lats_node_r)                          !for ozone interpolaton
    real ozplout(levozp,lats_node_r,pl_coeff)
    real(kind=kind_phys), allocatable :: acv(:,:),acvb(:,:),acvt(:,:)
    save acv,acvb,acvt
    real (kind=kind_phys) rannum(lonr*latr*nrcm),xkt2(lonr,lats_node_r,nrcm)
    integer iseed, nrc, seed0
    integer nf0,nf1,nt,indod,indev
    real(kind=kind_evod) fd2
    real(kind=kind_evod) wrk(1)
    real :: tmpr
    logical first,ladj
    parameter (ladj=.true.)
    data first/.true./
    save    first, seed0
    real(kind=kind_evod), parameter :: cons_0=0.0, cons_24=24.0, &
                                       cons_99=99.0, cons_1p0d9=1.0e9
  !--------------------------------------------------------------------
  
    ksq     = 0*levs + 0*levh + 1
    kst     = 4*levs + 0*levh + 4
    kdtphi  = 0*levs + 0*levh + 1
    kdtlam  = 1*levs+1*levh+1
  
    if (first) then
      allocate (bfilte(lnt2),bfilto(lnt2))
      !initializations for the gloopb filter
      !*************************************
      nf0=(jcap+1)*2/3  ! highest wavenumber gloopb filter keeps fully
      nf1=(jcap+1)      ! lowest wavenumber gloopb filter removes fully
      fd2=1./(nf1-nf0)**2
      do locl=1,ls_max_node
        l=ls_node(locl,1)
        jbasev=ls_node(locl,2)
        indev=indlsev(l,l)
        do n=l,jcap,2
          bfilte(indev)=max(1.-fd2*max(n-nf0,0)**2,cons_0)     !constant
          indev=indev+1
        enddo
        if (mod(l,2).eq.mod(jcap+1,2)) bfilte(indev)=1.
      enddo
      do locl=1,ls_max_node
        l=ls_node(locl,1)
        jbasod=ls_node(locl,3)
        indod=indlsod(l+1,l)
        do n=l+1,jcap,2
          bfilto(indod)=max(1.-fd2*max(n-nf0,0)**2,cons_0)     !constant
          indod=indod+1
        enddo
        if (mod(l,2).ne.mod(jcap+1,2)) bfilto(indod)=1.
      enddo
      allocate (acv(lonr,lats_node_r))
      allocate (acvb(lonr,lats_node_r))
      allocate (acvt(lonr,lats_node_r))
      !seed0 = idate(1) + idate(2) + idate(3) + idate(4)
      seed0 = 2009+12+12+0
      call random_setseed(seed0)
      call random_number(wrk)
      seed0 = seed0 + nint(wrk(1)*1000.0)
      if (me .eq. 0) then
        if (num_p3d .eq. 3) print *,' using ferrier-microphysics'
        if (num_p3d .eq. 4) print *,' using zhao-microphysics'
      endif
!      if (fhour .eq. 0.0) then
!        do j=1,lats_node_r
!          do i=1,lonr
!            phy_f2d(i,j,num_p2d) = 0.0
!          enddo
!        enddo
!      endif
      if (ras) call ras_init(levs, me)
      first = .false.
    endif
    dtphys=3600.
    nsphys=max(int(2*tstep/dtphys+0.9999),1)
    dtp=2*tstep/nsphys
    dtf=0.5*dtp
    if(lsfwd) dtf=dtp
  
    !solhr=mod(phour+idate(1),cons_24)
    solhr=mod(phour+2009,cons_24)
    !...  set switch for saving convective clouds
    if(lscca.and.lsswr) then
      clstp=1100+min(fhswr,fhour,cons_99)  !initialize,accumulate,convert
    elseif(lscca) then
      clstp=0100+min(fhswr,fhour,cons_99)  !accumulate,convert
    elseif(lsswr) then
      clstp=1100                       !initialize,accumulate
    else
      clstp=0100                       !accumulate
    endif
  
    !iseed = mod(100.0*sqrt(fhour*3600),cons_1p0d9) + 1 + seed0
    iseed = mod(100.0*sqrt(1.*3600),cons_1p0d9) + 1 + seed0
  
    call random_setseed(iseed)
    call random_number(rannum)
    do nrc=1,nrcm
      do j=1,lats_node_r
         lat=global_lats_r(ipt_lats_node_r-1+j)
         do i=1,lonr
            xkt2(i,j,nrc) = rannum(i+(lat-1)*lonr+(nrc-1)*latr)
         enddo
      enddo
    enddo
  
    if(.not.random_xkt2)then
      if(kdt.lt.3)print*,'random_xkt2=',random_xkt2
      xkt2 = 0.6
    endif
    ! doing ozone i/o and latitudinal interpolation to local gauss lats
    if (ntoz .gt. 0) then
      call ozinterpol(me,lats_node_r,lats_node_r,idate,fhour, &
                       jindx1,jindx2,ozplin,ozplout,ddy)
    endif
    lslag=.false.
    call delnpe(trie_ls(1,1,p_zq   ), &
                   trio_ls(1,1,p_dphi), &
                   trie_ls(1,1,p_dlam), &
                   epse,epso,ls_node)
  
    call delnpo(trio_ls(1,1,p_zq   ), &
                   trie_ls(1,1,p_dphi), &
                   trio_ls(1,1,p_dlam), &
                   epse,epso,ls_node)
  
    !$omp parallel do shared(trie_ls,trio_ls) &
    !$omp shared(epsedn,epsodn,snnp1ev,snnp1od,ls_node) &
    !$omp private(k)
    do k=1,levs
      call dezouv(trie_ls(1,1,p_x  +k-1), trio_ls(1,1,p_w  +k-1), &
                      trie_ls(1,1,p_uln+k-1), trio_ls(1,1,p_vln+k-1), &
                      epsedn,epsodn,snnp1ev,snnp1od,ls_node)
  
      call dozeuv(trio_ls(1,1,p_x  +k-1), trie_ls(1,1,p_w  +k-1), &
                      trio_ls(1,1,p_uln+k-1), trie_ls(1,1,p_vln+k-1), &
                      epsedn,epsodn,snnp1ev,snnp1od,ls_node)
    enddo
    dimg=0
    call sumflna_r(trie_ls(1,1,p_q), &
                   trio_ls(1,1,p_q), &
                   lat1s_r, &
                   plnev_r,plnod_r, &
                   lots,ls_node,latr2, &
                   lslag,lats_dim_r,lots,for_gr_r_1, &
                   ls_nodes,max_ls_nodes, &
                   lats_nodes_r,global_lats_r, &
                   lats_node_r,ipt_lats_node_r,lon_dims_r,dimg, &
                   lonsperlar,lonrx,latr)
    pwatg=0.
    ptotg=0.
    if( vertcoord_id.eq.3. ) then
      call sumder2_r(trie_ls(1,1,p_te), &
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
    endif
  
    do lan=1,lats_node_r
      timer1=rtc()
      lat = global_lats_r(ipt_lats_node_r-1+lan)
      lon_dim = lon_dims_r(lan)
      lons_lat = lonsperlar(lat)
      if( vertcoord_id.eq.3. ) then
        !------------------------------------
        !!  calculate t rq u v zonal derivs. by multiplication with i*l
        !!  note rlcs2=rcs2*l/rerth
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
        end do
      endif
      call four2grid_thread(for_gr_r_1(1,lan),for_gr_r_2(1,lan), &
                        lon_dim,lons_lat,lonrx,5*levs+levh+3,lan,me)
      if( vertcoord_id.eq.3. ) then
        call four2grid_thread(dyn_gr_r_1((kdtphi-1)*lon_dim+1,lan), &
                              dyn_gr_r_2((kdtphi-1)*lon_dim+1,lan), &
                              lon_dim,lons_lat,lonrx,levs,lan,me)
        call four2grid_thread(dyn_gr_r_1((kdtlam-1)*lon_dim+1,lan), &
                              dyn_gr_r_2((kdtlam-1)*lon_dim+1,lan), &
                              lon_dim,lons_lat,lonrx,levs,lan,me)
      endif
      timer2=rtc()
      global_times_b(lat,me+1)=timer2-timer1
    enddo
    do lan=1,lats_node_r
      lat = global_lats_r(ipt_lats_node_r-1+lan)
      lon_dim = lon_dims_r(lan)
      lons_lat = lonsperlar(lat)
      pwatp=0.
      !$omp parallel do  schedule(dynamic,1) private(lon) &
      !$omp private(njeff,istrt,iblk)
      do lon=1,lons_lat,ngptc
        njeff=min(ngptc,lons_lat-lon+1)
        istrt=lon
        if (ngptc.ne.1) then
          iblk=lon/ngptc+1
        else
          iblk=lon
        endif
        call gbphys_call(solhr,clstp, &
               for_gr_r_2,dyn_gr_r_2,bak_gr_r_2, &
               dtp,dtf,xkt2, sfc_fld, flx_fld, &
               acv,acvb,acvt, &
               swh,hlw,hprime,slag,sdec,cdec,ozplout, &
               phy_f3d, phy_f2d,nblck,kdt, &
               njeff,istrt,iblk,lat,lon_dim,lons_lat,lan,xlon, &
               temp_corr)
  
      enddo   !lon
      ptotj(lan)=0.
      do j=1,lons_lat
        ptotj(lan)=ptotj(lan)+for_gr_r_2(j+(ksq   -1)*lon_dim,lan)
        pwatp     = pwatp + flx_fld%pwat(j,lan)
      enddo
      pwatj(lan)=pwatp*grav/(2.*lonsperlar(lat)*1.e3)
      ptotj(lan)=ptotj(lan)/(2.*lonsperlar(lat))
    enddo   !lan
    tmpr=1.0/nslwr
     lnd%tskinr(:,:)=lnd%tskinr(:,:)+(lnd%tskin*lnd%frac + &
            ocn%twater*lnd%ofrac*ocn%fwater + &
            ocn%tice*lnd%ofrac*ocn%fice)*tmpr

    lotn=3*levs+1*levh
    do lan=1,lats_node_r
      lat = global_lats_r(ipt_lats_node_r-1+lan)
      lon_dim = lon_dims_r(lan)
      lons_lat = lonsperlar(lat)
      call grid2four_thread(bak_gr_r_2(1,lan),bak_gr_r_1(1,lan), &
                            lon_dim,lons_lat,lonrx,lotn)
    enddo
    call excha(lats_nodes_r,global_lats_r,ptotj,pwatj,ptotg,pwatg)
    sumwa=0.
    sumto=0.
    do lat=1,latr
       sumto=sumto+wgt_r(min(lat,latr-lat+1))*ptotg(lat)
       sumwa=sumwa+wgt_r(min(lat,latr-lat+1))*pwatg(lat)
    enddo
    pdryg=sumto-sumwa
    if (pdryini .le. 0.) pdryini = pdryg
    if( gen_coord_hybrid ) then
      pcorr=(pdryini-pdryg)      *sqrt(2.)
    else
      pcorr=(pdryini-pdryg)/sumto*sqrt(2.)
    endif
    dimg=0
    call four2fln(lslag,lats_dim_r,lota,lotn,bak_gr_r_1, &
                    ls_nodes,max_ls_nodes, &
                    lats_nodes_r,global_lats_r,lon_dims_r, &
                    lats_node_r,ipt_lats_node_r,dimg, &
                    lat1s_r,lonrx,latr,latr2, &
                    trie_ls(1,1,p_ze), trio_ls(1,1,p_ze), &
                    plnew_r, plnow_r, &
                    ls_node)
  
  
    !$omp parallel do shared(trie_ls,trio_ls) &
    !$omp shared(epse,epso,ls_node) &
    !$omp private(k)
    do k=1,levs
      call uveodz(trie_ls(1,1,p_ze +k-1), trio_ls(1,1,p_di +k-1), &
                      trie_ls(1,1,p_uln+k-1), trio_ls(1,1,p_vln+k-1), &
                      epse,epso,ls_node)
  
      call uvoedz(trio_ls(1,1,p_ze +k-1), trie_ls(1,1,p_di +k-1), &
                      trio_ls(1,1,p_uln+k-1), trie_ls(1,1,p_vln+k-1), &
                      epse,epso,ls_node)
    enddo
    do k=1,levs
      do i=1,len_trie_ls
        trie_ls(i,1,p_w+k-1)=trie_ls(i,1,p_w+k-1)+bfilte(i)* &
        (trie_ls(i,1,p_vln+k-1)-trie_ls(i,1,p_w+k-1))
  
        trie_ls_rqt(i,1,k)=bfilte(i)* &
        (trie_ls(i,1,p_rq+k-1)-trie_ls(i,1,p_rt+k-1))
  
        trie_ls(i,1,p_rt+k-1)=trie_ls(i,1,p_rt+k-1)+bfilte(i)* &
        (trie_ls(i,1,p_rq+k-1)-trie_ls(i,1,p_rt+k-1))
  
        trie_ls(i,2,p_w+k-1)=trie_ls(i,2,p_w+k-1)+bfilte(i)* &
        (trie_ls(i,2,p_vln+k-1)-trie_ls(i,2,p_w+k-1))
  
        trie_ls_rqt(i,2,k)=bfilte(i)* &
        (trie_ls(i,2,p_rq+k-1)-trie_ls(i,2,p_rt+k-1))
  
        trie_ls(i,2,p_rt+k-1)=trie_ls(i,2,p_rt+k-1)+bfilte(i)* &
        (trie_ls(i,2,p_rq+k-1)-trie_ls(i,2,p_rt+k-1))
      enddo
    enddo
    do k=1,levs
      do i=1,len_trio_ls
        trio_ls(i,1,p_w+k-1)=trio_ls(i,1,p_w+k-1)+bfilto(i)* &
        (trio_ls(i,1,p_vln+k-1)-trio_ls(i,1,p_w+k-1))
  
        trio_ls_rqt(i,1,k)=bfilto(i)* &
        (trio_ls(i,1,p_rq+k-1)-trio_ls(i,1,p_rt+k-1))
  
        trio_ls(i,1,p_rt+k-1)=trio_ls(i,1,p_rt+k-1)+bfilto(i)* &
        (trio_ls(i,1,p_rq+k-1)-trio_ls(i,1,p_rt+k-1))
  
        trio_ls(i,2,p_w+k-1)=trio_ls(i,2,p_w+k-1)+bfilto(i)* &
        (trio_ls(i,2,p_vln+k-1)-trio_ls(i,2,p_w+k-1))
  
        trio_ls_rqt(i,2,k)=bfilto(i)* &
        (trio_ls(i,2,p_rq+k-1)-trio_ls(i,2,p_rt+k-1))
  
        trio_ls(i,2,p_rt+k-1)=trio_ls(i,2,p_rt+k-1)+bfilto(i)* &
        (trio_ls(i,2,p_rq+k-1)-trio_ls(i,2,p_rt+k-1))
      enddo
    enddo
    do nt=2,ntrac
      do k=levs*(nt-2)+1,levs*(nt-1)
        do i=1,len_trie_ls
          trie_ls(i,1,p_rt+levs+k-1)=trie_ls(i,1,p_rt+levs+k-1)+bfilte(i)* &
          (trie_ls(i,1,p_rq+levs+k-1)-trie_ls(i,1,p_rt+levs+k-1))
  
          trie_ls(i,2,p_rt+levs+k-1)=trie_ls(i,2,p_rt+levs+k-1)+bfilte(i)* &
          (trie_ls(i,2,p_rq+levs+k-1)-trie_ls(i,2,p_rt+levs+k-1))
        enddo
        do i=1,len_trio_ls
          trio_ls(i,1,p_rt+levs+k-1)=trio_ls(i,1,p_rt+levs+k-1)+bfilto(i)* &
          (trio_ls(i,1,p_rq+levs+k-1)-trio_ls(i,1,p_rt+levs+k-1))
  
          trio_ls(i,2,p_rt+levs+k-1)=trio_ls(i,2,p_rt+levs+k-1)+bfilto(i)* &
          (trio_ls(i,2,p_rq+levs+k-1)-trio_ls(i,2,p_rt+levs+k-1))
        enddo
      enddo
    enddo
    if(hybrid)then
      !get some sigma distribution and compute   typdel from it.
      typical_pgr=85.
      do k=1,levp1
        si(levs+2-k)= ak5(k)/typical_pgr+bk5(k)
      enddo
    endif
    do k=1,levs
      typdel(k)= si(k)-si(k+1)
    enddo
    if (ladj) then
      trie_ls(:,:,p_zq)=0.
      trio_ls(:,:,p_zq)=0.
      if (me.eq.me_l_0) then
        trie_ls(1,1,p_zq)=pcorr
      endif
      if( gen_coord_hybrid ) then
        trie_ls_sfc=0.0
        trio_ls_sfc=0.0
        do k=1,levs
          do i=1,len_trie_ls
            trie_ls_sfc(i,1)=trie_ls_sfc(i,1)+typdel(k)*trie_ls_rqt(i,1,k)
            trie_ls_sfc(i,2)=trie_ls_sfc(i,2)+typdel(k)*trie_ls_rqt(i,2,k)
          enddo
          do i=1,len_trio_ls
            trio_ls_sfc(i,1)=trio_ls_sfc(i,1)+typdel(k)*trio_ls_rqt(i,1,k)
            trio_ls_sfc(i,2)=trio_ls_sfc(i,2)+typdel(k)*trio_ls_rqt(i,2,k)
          enddo
        enddo
        do i=1,len_trie_ls
          trie_ls(i,1,p_zq)=trie_ls(i,1,p_zq)+ &
                            trie_ls(i,1,p_q )*trie_ls_sfc(i,1)
          trie_ls(i,2,p_zq)=trie_ls(i,2,p_zq)+ &
                            trie_ls(i,2,p_q )*trie_ls_sfc(i,2)
        enddo
        do i=1,len_trio_ls
          trio_ls(i,1,p_zq)=trio_ls(i,1,p_zq)+ &
                            trio_ls(i,1,p_q )*trio_ls_sfc(i,1)
          trio_ls(i,2,p_zq)=trio_ls(i,2,p_zq)+ &
                            trio_ls(i,2,p_q )*trio_ls_sfc(i,2)
        enddo
      else
        do k=1,levs
          do i=1,len_trie_ls
            trie_ls(i,1,p_zq)=trie_ls(i,1,p_zq)+typdel(k)*trie_ls_rqt(i,1,k)
            trie_ls(i,2,p_zq)=trie_ls(i,2,p_zq)+typdel(k)*trie_ls_rqt(i,2,k)
          enddo
          do i=1,len_trio_ls
            trio_ls(i,1,p_zq)=trio_ls(i,1,p_zq)+typdel(k)*trio_ls_rqt(i,1,k)
            trio_ls(i,2,p_zq)=trio_ls(i,2,p_zq)+typdel(k)*trio_ls_rqt(i,2,k)
          enddo
        enddo
      endif
      do k=1,levs
        do i=1,len_trie_ls
          trie_ls(i,1,p_di+k-1)=bfilte(i)* &
          (trie_ls(i,1,p_uln+k-1)-trie_ls(i,1,p_x+k-1))
  
          trie_ls(i,1,p_te+k-1)=bfilte(i)* &
          (trie_ls(i,1,p_te+k-1)-trie_ls(i,1,p_y+k-1))
  
          trie_ls(i,2,p_di+k-1)=bfilte(i)* &
          (trie_ls(i,2,p_uln+k-1)-trie_ls(i,2,p_x+k-1))
  
          trie_ls(i,2,p_te+k-1)=bfilte(i)* &
          (trie_ls(i,2,p_te+k-1)-trie_ls(i,2,p_y+k-1))
        enddo
        do i=1,len_trio_ls
          trio_ls(i,1,p_di+k-1)=bfilto(i)* &
          (trio_ls(i,1,p_uln+k-1)-trio_ls(i,1,p_x+k-1))
  
          trio_ls(i,1,p_te+k-1)=bfilto(i)* &
          (trio_ls(i,1,p_te+k-1)-trio_ls(i,1,p_y+k-1))
  
          trio_ls(i,2,p_di+k-1)=bfilto(i)* &
          (trio_ls(i,2,p_uln+k-1)-trio_ls(i,2,p_x+k-1))
  
          trio_ls(i,2,p_te+k-1)=bfilto(i)* &
          (trio_ls(i,2,p_te+k-1)-trio_ls(i,2,p_y+k-1))
        enddo
      enddo
      if( gen_coord_hybrid ) then
        !$omp parallel do private(locl)
        do locl=1,ls_max_node
          call impadje_hyb_gc(trie_ls(1,1,p_x),trie_ls(1,1,p_y), &
                             trie_ls(1,1,p_q),trie_ls(1,1,p_di), &
                             trie_ls(1,1,p_te),trie_ls(1,1,p_zq), &
                             tstep, &
                             trie_ls(1,1,p_uln),trie_ls(1,1,p_vln), &
                             snnp1ev,ndexev,ls_node,locl)
  
          call impadjo_hyb_gc(trio_ls(1,1,p_x),trio_ls(1,1,p_y), &
                             trio_ls(1,1,p_q),trio_ls(1,1,p_di), &
                             trio_ls(1,1,p_te),trio_ls(1,1,p_zq), &
                             tstep, &
                             trio_ls(1,1,p_uln),trio_ls(1,1,p_vln), &
                             snnp1od,ndexod,ls_node,locl)
        enddo
      else if(hybrid)then
        !$omp parallel do private(locl)
        do locl=1,ls_max_node
          call impadje_hyb(trie_ls(1,1,p_x),trie_ls(1,1,p_y), &
                    trie_ls(1,1,p_q),trie_ls(1,1,p_di), &
                    trie_ls(1,1,p_te),trie_ls(1,1,p_zq), &
                             tstep, &
                    trie_ls(1,1,p_uln),trie_ls(1,1,p_vln), &
                    snnp1ev,ndexev,ls_node,locl)
  
          call impadjo_hyb(trio_ls(1,1,p_x),trio_ls(1,1,p_y), &
                    trio_ls(1,1,p_q),trio_ls(1,1,p_di), &
                    trio_ls(1,1,p_te),trio_ls(1,1,p_zq), &
                             tstep, &
                    trio_ls(1,1,p_uln),trio_ls(1,1,p_vln), &
                    snnp1od,ndexod,ls_node,locl)
        enddo
      else
        !$omp parallel do private(locl)
        do locl=1,ls_max_node
          call impadje(trie_ls(1,1,p_x),trie_ls(1,1,p_y), &
                    trie_ls(1,1,p_q),trie_ls(1,1,p_di), &
                    trie_ls(1,1,p_te),trie_ls(1,1,p_zq), &
                    am,bm,sv,tstep, &
                    trie_ls(1,1,p_uln),trie_ls(1,1,p_vln), &
                    snnp1ev,ndexev,ls_node,locl)
  
          call impadjo(trio_ls(1,1,p_x),trio_ls(1,1,p_y), &
                    trio_ls(1,1,p_q),trio_ls(1,1,p_di), &
                    trio_ls(1,1,p_te),trio_ls(1,1,p_zq), &
                    am,bm,sv,tstep, &
                    trio_ls(1,1,p_uln),trio_ls(1,1,p_vln), &
                    snnp1od,ndexod,ls_node,locl)
        enddo
      endif
    else
      if (me.eq.me_l_0) then
        trie_ls(1,1,p_q)=trie_ls(1,1,p_q)+pcorr
      endif
      ! testing mass correction on sep 25
      do k=1,levs
        do i=1,len_trie_ls
          trie_ls(i,1,p_q)=trie_ls(i,1,p_q)+del(k)*trie_ls_rqt(i,1,k)
          trie_ls(i,2,p_q)=trie_ls(i,2,p_q)+del(k)*trie_ls_rqt(i,2,k)
        enddo
        do i=1,len_trio_ls
          trio_ls(i,1,p_q)=trio_ls(i,1,p_q)+del(k)*trio_ls_rqt(i,1,k)
          trio_ls(i,2,p_q)=trio_ls(i,2,p_q)+del(k)*trio_ls_rqt(i,2,k)
        enddo
      enddo
      ! testing mass correction on sep 25
      do k=1,levs
        do i=1,len_trie_ls
          trie_ls(i,1,p_x+k-1)=trie_ls(i,1,p_x+k-1)+bfilte(i)* &
          (trie_ls(i,1,p_uln+k-1)-trie_ls(i,1,p_x+k-1))
  
          trie_ls(i,2,p_x+k-1)=trie_ls(i,2,p_x+k-1)+bfilte(i)* &
          (trie_ls(i,2,p_uln+k-1)-trie_ls(i,2,p_x+k-1))
  
          trie_ls(i,1,p_y+k-1)=trie_ls(i,1,p_y+k-1)+bfilte(i)* &
          (trie_ls(i,1,p_te+k-1)-trie_ls(i,1,p_y+k-1))
  
          trie_ls(i,2,p_y+k-1)=trie_ls(i,2,p_y+k-1)+bfilte(i)* &
          (trie_ls(i,2,p_te+k-1)-trie_ls(i,2,p_y+k-1))
        enddo
        do i=1,len_trio_ls
          trio_ls(i,1,p_x+k-1)=trio_ls(i,1,p_x+k-1)+bfilto(i)* &
          (trio_ls(i,1,p_uln+k-1)-trio_ls(i,1,p_x+k-1))
  
          trio_ls(i,2,p_x+k-1)=trio_ls(i,2,p_x+k-1)+bfilto(i)* &
          (trio_ls(i,2,p_uln+k-1)-trio_ls(i,2,p_x+k-1))
  
          trio_ls(i,1,p_y+k-1)=trio_ls(i,1,p_y+k-1)+bfilto(i)* &
          (trio_ls(i,1,p_te+k-1)-trio_ls(i,1,p_y+k-1))
  
          trio_ls(i,2,p_y+k-1)=trio_ls(i,2,p_y+k-1)+bfilto(i)* &
          (trio_ls(i,2,p_te+k-1)-trio_ls(i,2,p_y+k-1))
        enddo
      enddo
    endif
    return
  end subroutine gloopb

  subroutine initialize_gloopb(time)
    type(time_type), intent(in) :: time

    if (initialized) return
    
    call initialize_gbphys_call(time)

    initialized=.true.
  end subroutine initialize_gloopb
  
end module gloopb_mod
