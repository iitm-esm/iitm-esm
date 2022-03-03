module albedo_mod
  use error_mod, only: handle_error, FATAL, WARNING
  implicit none
  private
  logical :: initialized=.false.
  real :: snow_alb=0.85, ice_alb=0.5826
  real, parameter :: t0=273.15
  real, parameter :: MU_TS = 0.054 ! relates freezing temp to salinity
  real :: TFI = -MU_TS*30.0 ! sea ice freezing temp. = -mu*salinity
  real :: T_RANGE_MELT=1.0

  namelist/albedo_nml/snow_alb,ice_alb,T_RANGE_MELT,TFI

  interface setalbedo
    module procedure setalb_lnd
    module procedure setalb_sice
    module procedure setalb_ocean
  end interface setalbedo
 
  public :: setalbedo, init_albedo_mod
  
  contains

  subroutine init_albedo_mod
    open(14,file='gfs_namelist')
    read(14,nml=albedo_nml)
    close(14)
    initialized=.true.    
  end subroutine init_albedo_mod
 
  subroutine setalb_lnd(lmask,snowf,zorlf,coszf,hprif, &
                    alvsf,alnsf,alvwf,alnwf,facsf,facwf,IMAX, &
                    sfcalb)
!  ===================================================================  !
!                                                                       !
!  this program computes four components of surface albedos (i.e.       !
!  vis-nir, direct-diffused) according to controflag ialbflg.           !
!   1) climatological surface albedo scheme (briegleb 1992)             !
!                                                                       !
!                                                                       !
! usage:         call setalb                                            !
!                                                                       !
! subprograms called:  none                                             !
!                                                                       !
!  ====================  defination of variables  ====================  !
!                                                                       !
!  inputs:                                                              !
!     lmask (IMAX)  - true if land                                      !
!     snowf (IMAX)  - snow depth water equivalent in mm                 !
!     zorlf (IMAX)  - surface roughness in cm                           !
!     coszf (IMAX)  - cosin of solar zenith angle                       !
!     hprif (IMAX)  - topographic sdv in m                              !
!           ---  for ialbflg=0 climtological albedo scheme  ---         !
!     alvsf (IMAX)  - 60 degree vis albedo with strong cosz dependency  !
!     alnsf (IMAX)  - 60 degree nir albedo with strong cosz dependency  !
!     alvwf (IMAX)  - 60 degree vis albedo with weak cosz dependency    !
!     alnwf (IMAX)  - 60 degree nir albedo with weak cosz dependency    !
!           ---  for ialbflg=1 modis based land albedo scheme ---       !
!     alvsf (IMAX)  - visible black sky albedo at zenith 60 degree      !
!     alnsf (IMAX)  - near-ir black sky albedo at zenith 60 degree      !
!     alvwf (IMAX)  - visible white sky albedo                          !
!     alnwf (IMAX)  - near-ir white sky albedo                          !
!                                                                       !
!     facsf (IMAX)  - fractional coverage with strong cosz dependency   !
!     facwf (IMAX)  - fractional coverage with weak cosz dependency     !
!     IMAX          - array horizontal dimension                        !
!                                                                       !
!  outputs:                                                             !
!     sfcalb(IMAX,NF_ALBD)                                              !
!           ( :, 1) -     near ir direct beam albedo                    !
!           ( :, 2) -     near ir diffused albedo                       !
!           ( :, 3) -     uv+vis direct beam albedo                     !
!           ( :, 4) -     uv+vis diffused albedo                        !
!                                                                       !
!  module internal control variables:                                   !
!     ialbflg       - =0 use the default climatology surface albedo     !
!                     =1 use modis retrieved albedo and input snow cover!
!                        for land areas                                 !
!                                                                       !
!  ====================    end of description    =====================  !
!
    implicit none

    !  ---  inputs
    integer, intent(in) :: IMAX

    logical, dimension(:), intent(in) :: lmask

    real, dimension(:), intent(in) :: snowf, zorlf, coszf, hprif, &
            alvsf, alnsf, alvwf, alnwf, facsf, facwf

    !  ---  outputs
    real, dimension(:,:), intent(out) :: sfcalb

    !  ---  locals:
    real :: asnvb, asnnb, asnvd, asnnd, &
         fsno,  rfcs,  rfcw,  flnd,       &
         asnow, argh,  hrgh,  fsno0, fsno1, flnd0, csnow,      &
         a1, a2, b1, b2, b3

    real :: ffw, dtgd

    integer :: i, k

    if(.not.initialized) call handle_error(FATAL,"Module not initialized: albedo_mod")

    sfcalb(:,:) = 0.0

    do i = 1, IMAX
      if(.not.lmask(i)) cycle
      ! --- modified snow albedo scheme - units convert to m
      !     (originally snowf in mm; zorlf in cm)
      asnow = 0.02*snowf(i)
      argh  = min(0.50, max(.025, 0.01*zorlf(i)))
      hrgh  = min(1.0, max(0.20, 1.0577-1.1538e-3*hprif(i) ) )
      fsno0 = asnow / (argh + asnow) * hrgh
      fsno1 = 1.0 - fsno0
      flnd0 = 1.0
      fsno  = fsno0
      flnd  = flnd0 * fsno1
      
      ! --- diffused snow albedo

         asnvd = 0.90
         asnnd = 0.75

      ! --- direct snow albedo

      if (coszf(i) < 0.5) then
         csnow = 0.5 * (3.0 / (1.0+4.0*coszf(i)) - 1.0)
         asnvb = min( 0.98, asnvd+(1.0-asnvd)*csnow )
         asnnb = min( 0.98, asnnd+(1.0-asnnd)*csnow )
      else
         asnvb = asnvd
         asnnb = asnnd
      endif

      ! --- direct sea surface albedo

      if (coszf(i) > 0.0001) then
         rfcs = 1.4 / (1.0 + 0.8*coszf(i))
         rfcw = 1.3 / (1.0 + 0.6*coszf(i))
      else
        rfcs  = 1.0
        rfcw  = 1.0
      endif

      a1   = alvsf(i) * facsf(i)
      b1   = alvwf(i) * facwf(i)
      a2   = alnsf(i) * facsf(i)
      b2   = alnwf(i) * facwf(i)
      sfcalb(i,1) = (a2*rfcs+b2*rfcw)*flnd + asnnb*fsno
      sfcalb(i,2) = (a2 + b2) * 0.96 *flnd + asnnd*fsno
      sfcalb(i,3) = (a1*rfcs+b1*rfcw)*flnd + asnvb*fsno
      sfcalb(i,4) = (a1 + b1) * 0.96 *flnd + asnvd*fsno
    enddo    ! end_do_i_loop
    return
  end subroutine setalb_lnd
 
  subroutine setalb_sice(imask, hs, hi, ts, IMAX, alb)
    logical, intent(in) :: imask(:)
    real, intent(in) :: hs(:)  ! snow thickness (m-snow)
    real, intent(in) :: hi(:)  ! ice thickness
    real, intent(in) :: ts(:)  ! surface temperature (K)
    integer, intent(in) :: IMAX
    real, intent(out) :: alb(:,:) ! ice surface albedo (0-1)
    real :: as, ai, cs, i, ts1, fh

    if(.not.initialized) call handle_error(FATAL,"Module not initialized: albedo_mod")
    alb(:,:) = 0.0 
    do i=1,IMAX
      if(.not.imask(i)) cycle
      as = snow_alb; ai = ice_alb
      ts1=ts(i)-t0
      fh = min(atan(5.0*hi(i))/atan(5.0*0.5),1.0) ! to reduce albedo for thin ice
      if (ts1+T_RANGE_MELT > TFI) then        ! reduce albedo for melting ice
        as = snow_alb-0.1235*min((ts1+T_RANGE_MELT-TFI)/T_RANGE_MELT,1.0)
        ai = ice_alb-0.075 *min((ts1+T_RANGE_MELT-TFI)/T_RANGE_MELT,1.0)
      endif
      ai = fh*ai+(1-fh)*0.06   ! reduce the albedo of thin ice 
      cs = hs(i)/(hs(i)+0.02)  ! thin snow partially covers ice
      alb(i,:) = cs*as+(1-cs)*ai
    enddo
    return
  end subroutine setalb_sice

  subroutine setalb_ocean(omask, coszen, IMAX, alb)
    logical, intent(in) :: omask(:)
    real, intent(in) :: coszen(:)
    integer, intent(in) :: IMAX
    real, intent(out) :: alb(:,:) ! ice surface albedo (0-1)
    integer :: i 

    !this is the albedo_option 5 in mom4p1

    if(.not.initialized) call handle_error(FATAL,"Module not initialized: albedo_mod")
    alb(:,:)=0.0

    do i=1,IMAX
      if(.not.omask(i)) cycle
      if(coszen(i) .ge. 0.0) then
        alb(i,3) = 0.026/(coszen(i)**1.7+0.065)                  &
                  +0.15*(coszen(i)-0.10)*(coszen(i)-0.5)*(coszen(i)-1.0)
      else
        alb(i,3) = 0.4075 ! coszen=0 value of above expression
      endif
      alb(i,4) = 0.06
      alb(i,1) = alb(i,3)
      alb(i,2) = 0.06
    enddo
  end subroutine setalb_ocean

end module albedo_mod
