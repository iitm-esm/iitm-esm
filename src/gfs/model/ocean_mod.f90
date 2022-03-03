module ocean_mod
  use resol_def, only : nx=>lonr
  use layout1, only : ny=>lats_node_r
  use mpi_def, only : icolor
  use machine , only : kind_phys
  use funcphys, only : fpvs
  use physcons, only : cp => con_cp, rd => con_rd, eps => con_eps,  &
                       epsm1 => con_epsm1, hvap => con_hvap,        &
                       rvrdm1 => con_fvirt


  implicit none
  private

  real, parameter :: del_temp = 0.1
  real, parameter :: del_temp_inv = 1./del_temp
  logical :: ocean_initialised=.false.
  integer, allocatable :: ilat(:)

  type ocean_type
    logical, allocatable :: mask(:,:) ! Ocean Mask
    real, allocatable :: twater(:,:) ! Ocean surface Water Temperature (K)
    real, allocatable :: twater_r(:,:) ! Ocean surface Water Temperature (K)
    real, allocatable :: tice(:,:) ! Ocean surface Ice Temperature (K)
    real, allocatable :: tice_r(:,:) ! Ocean surface Ice Temperature (K)
    real, allocatable :: fice(:,:) ! Sea-Ice Fraction
    real, allocatable :: fwater(:,:) ! Sea-Water Fraction
    real, allocatable :: hice(:,:) ! Sea-Ice Depth
    real, allocatable :: hsnow(:,:) ! Sea-Ice Snow Depth
    real, allocatable :: zorl(:,:) ! Surface Roughness in cm
    real, allocatable :: nsw_o(:,:) ! Net SW for ocean-water points 
    real, allocatable :: nsw_i(:,:) ! Net Sw for Ocean-Ice points
    real, allocatable :: dlw(:,:) ! Downward Longwave
    real, allocatable :: shflx_i(:,:) ! Sensible heat flux to ocean-Ice
    real, allocatable :: shflx_o(:,:) ! Sensible heat flux to ocean-water
    real, allocatable :: lhflx_i(:,:) ! Latent heat flux to ocean-Ice
    real, allocatable :: lhflx_o(:,:) ! Latent heat flux to ocean-Water
    real, allocatable :: lprec(:,:) ! Liquid Precipitation
    real, allocatable :: fprec(:,:) ! Frozen Precipitation
    real, allocatable :: drdt(:,:) 
    real, allocatable :: dhdt(:,:)
    real, allocatable :: dedt(:,:)
    real, allocatable :: uflux(:,:)
    real, allocatable :: vflux(:,:)
    real, allocatable :: totrunoff(:,:)
  end type

  public :: ocean_type, init_ocn, end_ocn, surface_ocean

  type(ocean_type), public :: ocn

  contains

  subroutine init_ocn
    if(icolor==2) return
    if(ocean_initialised) return
    allocate(ocn%mask(nx,ny))
    allocate(ocn%twater(nx,ny))
    allocate(ocn%twater_r(nx,ny))
    allocate(ocn%tice(nx,ny))
    allocate(ocn%tice_r(nx,ny))
    allocate(ocn%fice(nx,ny))
    allocate(ocn%fwater(nx,ny))
    allocate(ocn%hice(nx,ny))
    allocate(ocn%hsnow(nx,ny))
    allocate(ocn%zorl(nx,ny))
    allocate(ocn%nsw_o(nx,ny))
    allocate(ocn%nsw_i(nx,ny))
    allocate(ocn%dlw(nx,ny))
    allocate(ocn%shflx_i(nx,ny)) ! Sensible heat flux to ocean-Ice
    allocate(ocn%shflx_o(nx,ny)) ! Sensible heat flux to ocean-water
    allocate(ocn%lhflx_i(nx,ny)) ! Latent heat flux to ocean-Ice
    allocate(ocn%lhflx_o(nx,ny)) ! Latent heat flux to ocean-Water
    allocate(ocn%lprec(nx,ny)) ! Liquid Precipitation
    allocate(ocn%fprec(nx,ny)) ! Frozen Precipitation
    allocate(ocn%drdt(nx,ny)) 
    allocate(ocn%dhdt(nx,ny))
    allocate(ocn%dedt(nx,ny))
    allocate(ocn%uflux(nx,ny))
    allocate(ocn%vflux(nx,ny))
    allocate(ocn%totrunoff(nx,ny))

    ocn%mask(:,:)=0.0
    ocn%twater(:,:)=0.0
    ocn%twater_r(:,:)=0.0
    ocn%tice(:,:)=0.0
    ocn%tice_r(:,:)=0.0
    ocn%fice(:,:)=0.0
    ocn%fwater(:,:)=0.0
    ocn%hice(:,:)=0.0
    ocn%hsnow(:,:)=0.0
    ocn%zorl(:,:)=0.000001
    ocn%nsw_o(:,:)=0.0
    ocn%nsw_i(:,:)=0.0
    ocn%dlw(:,:)=0.0
    ocn%shflx_i(:,:)=0.0 ! Sensible heat flux to ocean-Ice
    ocn%shflx_o(:,:)=0.0 ! Sensible heat flux to ocean-water
    ocn%lhflx_i(:,:)=0.0 ! Latent heat flux to ocean-Ice
    ocn%lhflx_o(:,:)=0.0 ! Latent heat flux to ocean-Water
    ocn%lprec(:,:)=0.0 ! Liquid Precipitation
    ocn%fprec(:,:)=0.0 ! Frozen Precipitation
    ocn%drdt(:,:)=0.0 
    ocn%dhdt(:,:)=0.0
    ocn%dedt(:,:)=0.0
    ocn%uflux(:,:)=0.0
    ocn%vflux(:,:)=0.0
    ocn%totrunoff(:,:)=0.0

    ocean_initialised=.true.
  end subroutine init_ocn

  subroutine end_ocn
    if(icolor==2) return
    deallocate(ocn%mask)
    deallocate(ocn%twater)
    deallocate(ocn%twater_r)
    deallocate(ocn%tice)
    deallocate(ocn%tice_r)
    deallocate(ocn%fice)
    deallocate(ocn%fwater)
    deallocate(ocn%hice)
    deallocate(ocn%hsnow)
    deallocate(ocn%zorl)
    deallocate(ocn%nsw_o)
    deallocate(ocn%nsw_i)
    deallocate(ocn%dlw)
    deallocate(ocn%shflx_i) ! Sensible heat flux to ocean-Ice
    deallocate(ocn%shflx_o) ! Sensible heat flux to ocean-water
    deallocate(ocn%lhflx_i) ! Latent heat flux to ocean-Ice
    deallocate(ocn%lhflx_o) ! Latent heat flux to ocean-Water
    deallocate(ocn%lprec) ! Liquid Precipitation
    deallocate(ocn%fprec) ! Frozen Precipitation
    deallocate(ocn%drdt) 
    deallocate(ocn%dhdt)
    deallocate(ocn%dedt)
    deallocate(ocn%uflux)
    deallocate(ocn%vflux)
    deallocate(ocn%totrunoff)
  end subroutine end_ocn

  subroutine surface_ocean(im,ps,wind,t1,q1,tskin,cm,ch, &
               prsl1,prslki,mask, &
               qsurf, cmm, chh, evap, hflx, shflx, lhflx, dhdt, dedt)
  
    ! ===================================================================== !
    !  description:                                                         !
    !                                                                       !
    !  usage:                                                               !
    !                                                                       !
    !    call sfc_ocean                                                     !
    !       inputs:                                                         !
    !          ( im, ps, u1, v1, t1, q1, tskin, cm, ch,                 !
    !            prsl1, prslki, slimsk, ddvel, flag_iter,                   !
    !       outputs:                                                        !
    !            qsurf, cmm, chh, evap, hflx )                              !
    !                                                                       !
    !                                                                       !
    !  subprograms/functions called: fpvs                                   !
    !                                                                       !
    !                                                                       !
    !  program history log:                                                 !
    !         xxxx  --             created                                  !
    !    oct  2006  -- h. wei      modified (need description)              !
    !    apr  2009  -- y.-t. hou   modified to match the modified gbphys_v.f!
    !                     rmoved unused variable from argument list.        !
    !                     reformatted code and added program documentation. !
    !                                                                       !
    !                                                                       !
    !  ====================  defination of variables  ====================  !
    !                                                                       !
    !  inputs:                                                       size   !
    !     im       - integer, horizontal dimension                     1    !
    !     ps       - real, surface pressure                            im   !
    !     u1, v1   - real, u/v component of surface layer wind         im   !
    !     t1       - real, surface layer mean temperature ( k )        im   !
    !     q1       - real, surface layer mean specific humidity        im   !
    !     tskin    - real, ground surface skin temperature ( k )       im   !
    !     cm       - real, surface exchange coeff for momentum (m/s)   im   !
    !     ch       - real, surface exchange coeff heat & moisture(m/s) im   !
    !     prsl1    - real, surface layer mean pressure                 im   !
    !     prslki   - real,                                             im   !
    !     slimsk   - real, sea/land/ice mask (=0/1/2)                  im   !
    !     ddvel    - real,                                             im   !
    !     flag_iter- logical,                                          im   !
    !                                                                       !
    !  outputs:                                                             !
    !     qsurf    - real, specific humidity at sfc                    im   !
    !     cmm      - real,                                             im   !
    !     chh      - real,                                             im   !
    !     evap     - real, evaperation from latent heat flux           im   !
    !     hflx     - real, sensible heat flux                          im   !
    !                                                                       !
    ! ===================================================================== !
    ! GFS - MOM
    ! qsurf - q_surf0 in surface_flux_1d
    ! cmm = cm * wind !cm and wind is available.
    ! chh = rho * ch * wind !rho, ch, wind is available.
    ! evap = flux_q in surface_flux_1d
    ! hflx = flux_t in surface_flux_1d
  
    implicit none
    !  ---  constant parameters:
    real (kind=kind_phys), parameter :: cpinv  = 1.0/cp
    real (kind=kind_phys), parameter :: hvapi  = 1.0/hvap
    real (kind=kind_phys), parameter :: elocp  = hvap/cp
  
    !  ---  inputs:
    integer, intent(in) :: im
    real (kind=kind_phys), dimension(im), intent(in) :: ps, wind,   &
          t1, q1, tskin, cm, ch, prsl1, prslki
    logical, intent(in) :: mask(im)
  
    !  ---  outputs:
    real (kind=kind_phys), dimension(im), intent(out) :: qsurf,       &
       &       cmm, chh, evap, hflx, lhflx, shflx
  
    real (kind=kind_phys), dimension(im), intent(inout) :: dhdt, dedt
    
    !  ---  locals:
    real (kind=kind_phys), dimension(im) :: psurf, ps1, q0, qss,      &
       &       rch, rho, theta1, tv1, qss1
  
    real (kind=kind_phys) :: tem
  
    integer :: i
  
    !===> ...  begin here
  
    qsurf(:)=0.0; cmm(:)=0.0; chh(:)=0.0; evap(:)=0.0; hflx(:)=0.0
    lhflx(:)=0.0; shflx(:)=0.0
  
    !  --- ...  initialize variables. all units are supposedly m.k.s. unless specified
    !           psurf is in pascals, wind is wind speed, theta1 is adiabatic surface
    !           temp from level 1, rho is density, qss is sat. hum. at surface
    do i = 1, im
      if (mask(i)) then
        psurf(i) = 1000.0 * ps(i)
        ps1(i)   = 1000.0 * prsl1(i)
        theta1(i) = t1(i) * prslki(i)
  
        q0(i) = max( q1(i), 1.0e-8 )
        tv1(i) = t1(i) * (1.0 + rvrdm1*q0(i))
        rho(i) = ps1(i) / (rd*tv1(i))
  
        qss(i) = fpvs( tskin(i) )
        qss(i) = eps*qss(i) / (psurf(i) + epsm1*qss(i))

        qss1(i) = fpvs( tskin(i) + del_temp )
        qss1(i) = eps*qss1(i) / (psurf(i) + epsm1*qss1(i))
      endif
    enddo
  
    !  --- ...  rcp = rho cp ch v
  
    do i = 1, im
      if ( mask(i) ) then
        rch(i) = rho(i) * cp * ch(i) * wind(i)
        cmm(i) = cm(i) * wind(i)
        chh(i) = rho(i) * ch(i) * wind(i)
        dhdt(i) = rch(i)
      endif
    enddo
  
    !  --- ...  sensible and latent heat flux over open water
  
    do i = 1, im
      if ( mask(i) ) then
        hflx(i) = rch(i) * (tskin(i) - theta1(i))
        evap(i) = elocp*rch(i) * (qss(i) - q0(i))
        qsurf(i) = qss(i)
        dedt(i) = cpinv*rch(i)*(qss1(i)-qss(i))*del_temp_inv
      endif
    enddo
  
    do i = 1, im
      if ( mask(i) ) then
        tem     = 1.0 / rho(i)
        shflx(i) = hflx(i) ! Check units
        lhflx(i) = evap(i)*hvapi ! Check units
        hflx(i) = hflx(i) * tem * cpinv
        evap(i) = evap(i) * tem * hvapi
      endif
    enddo
    return
  end subroutine surface_ocean
end module ocean_mod
