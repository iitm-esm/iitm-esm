!!!!!  ==============================================================  !!!!!
!!!!!               lw-rrtm3 radiation package description             !!!!!
!!!!!  ==============================================================  !!!!!
!                                                                          !
!   this package includes ncep's modifications of the rrtm-lw radiation    !
!   code from aer inc.                                                     !
!                                                                          !
!    the lw-rrtm3 package includes these parts:                            !
!                                                                          !
!       'radlw_rrtm3_param.f'                                              !
!       'radlw_rrtm3_datatb.f'                                             !
!       'radlw_rrtm3_main.f'                                               !
!                                                                          !
!    the 'radlw_rrtm3_param.f' contains:                                   !
!                                                                          !
!       'module_radlw_cntr_para'   -- control parameters set up            !
!       'module_radlw_parameters'  -- band parameters set up               !
!                                                                          !
!    the 'radlw_rrtm3_datatb.f' contains:                                  !
!                                                                          !
!       'module_radlw_avplank'     -- plank flux data                      !
!       'module_radlw_ref'         -- reference temperature and pressure   !
!       'module_radlw_cldprlw'     -- cloud property coefficients          !
!       'module_radlw_kgbnn'       -- absorption coeffients for 16         !
!                                     bands, where nn = 01-16              !
!                                                                          !
!    the 'radlw_rrtm3_main.f' contains:                                    !
!                                                                          !
!       'module_radlw_main'        -- main lw radiation transfer           !
!                                                                          !
!    in the main module 'module_radlw_main' there are only two             !
!    externally callable subroutines:                                      !
!                                                                          !
!                                                                          !
!       'lwrad'     -- main lw radiation routine                           !
!          inputs:                                                         !
!           (play,plev,tlay,tlev,qnm,o3mr,gasvmr,                          !
!            clouds,icseed,aerosols,sfemis,sfgtmp,                         !
!            npts, nlay, nlp1, iflip, lprnt,                               !
!          outputs:                                                        !
!            hlwc,topflx,sfcflx,                                           !
!!         optional outputs:                                               !
!            HLW0,HLWB,FLXPRF)                                             !
!                                                                          !
!       'rlwinit'   -- initialization routine                              !
!          inputs:                                                         !
!           ( icwp, me, nlay, iovr, isubc )                                !
!          outputs:                                                        !
!           (none)                                                         !
!                                                                          !
!    all the lw radiation subprograms become contained subprograms         !
!    in module 'module_radlw_main' and many of them are not directly       !
!    accessable from places outside the module.                            !
!                                                                          !
!    derived data type constructs used:                                    !
!                                                                          !
!     1. radiation flux at toa: (from module 'module_radlw_parameters')    !
!          topflw_type   -  derived data type for toa rad fluxes           !
!            upfxc              total sky upward flux at toa               !
!            upfx0              clear sky upward flux at toa               !
!                                                                          !
!     2. radiation flux at sfc: (from module 'module_radlw_parameters')    !
!          sfcflw_type   -  derived data type for sfc rad fluxes           !
!            upfxc              total sky upward flux at sfc               !
!            upfx0              clear sky upward flux at sfc               !
!            dnfxc              total sky downward flux at sfc             !
!            dnfx0              clear sky downward flux at sfc             !
!                                                                          !
!     3. radiation flux profiles(from module 'module_radlw_parameters')    !
!          proflw_type    -  derived data type for rad vertical prof       !
!            upfxc              level upward flux for total sky            !
!            dnfxc              level downward flux for total sky          !
!            upfx0              level upward flux for clear sky            !
!            dnfx0              level downward flux for clear sky          !
!                                                                          !
!    external modules referenced:                                          !
!                                                                          !
!       'module machine'                                                   !
!       'module physcons'                                                  !
!       'mersenne_twister'                                                 !
!                                                                          !
!    compilation sequence is:                                              !
!                                                                          !
!       'radlw_rrtm3_param.f'                                              !
!       'radlw_rrtm3_datatb.f'                                             !
!       'radlw_rrtm3_main.f'                                               !
!                                                                          !
!    and all should be put in front of routines that use lw modules        !
!                                                                          !
!==========================================================================!
!                                                                          !
!    the original aer's program declarations:                              !
!                                                                          !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!                                                                          |
!  Copyright 2002-2007, Atmospheric & Environmental Research, Inc. (AER).  |
!  This software may be used, copied, or redistributed as long as it is    |
!  not sold and this copyright notice is reproduced on each copy made.     |
!  This model is provided as is without any express or implied warranties. |
!                       (http://www.rtweb.aer.com/)                        |
!                                                                          |
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!                                                                          !
! ************************************************************************ !
!                                                                          !
!                              rrtmg_lw                                    !
!                                                                          !
!                                                                          !
!                   a rapid radiative transfer model                       !
!                       for the longwave region                            ! 
!             for application to general circulation models                !
!                                                                          !
!                                                                          !
!            atmospheric and environmental research, inc.                  !
!                        131 hartwell avenue                               !
!                        lexington, ma 02421                               !
!                                                                          !
!                           eli j. mlawer                                  !
!                        jennifer s. delamere                              !
!                         michael j. iacono                                !
!                         shepard a. clough                                !
!                                                                          !
!                                                                          !
!                       email:  miacono@aer.com                            !
!                       email:  emlawer@aer.com                            !
!                       email:  jdelamer@aer.com                           !
!                                                                          !
!        the authors wish to acknowledge the contributions of the          !
!        following people:  steven j. taubman, karen cady-pereira,         !
!        patrick d. brown, ronald e. farren, luke chen, robert bergstrom.  !
!                                                                          !
! ************************************************************************ !
!                                                                          !
!    references:                                                           !
!    (rrtm_lw/rrtmg_lw):                                                   !
!      clough, s.A., m.w. shephard, e.j. mlawer, j.s. delamere,            !
!      m.j. iacono, k. cady-pereira, s. boukabara, and p.d. brown:         !
!      atmospheric radiative transfer modeling: a summary of the aer       !
!      codes, j. quant. spectrosc. radiat. transfer, 91, 233-244, 2005.    !
!                                                                          !
!      mlawer, e.j., s.j. taubman, p.d. brown, m.j. iacono, and s.a.       !
!      clough:  radiative transfer for inhomogeneous atmospheres: rrtm,    !
!      a validated correlated-k model for the longwave.  j. geophys. res., !
!      102, 16663-16682, 1997.                                             !
!                                                                          !
!    (mcica):                                                              !
!      pincus, r., h. w. barker, and j.-j. morcrette: a fast, flexible,    !
!      approximation technique for computing radiative transfer in         !
!      inhomogeneous cloud fields, j. geophys. res., 108(d13), 4376,       !
!      doi:10.1029/2002JD003322, 2003.                                     !
!                                                                          !
! ************************************************************************ !
!                                                                          !
!    aer's revision history:                                               !
!     this version of rrtmg_lw has been modified from rrtm_lw to use a     !
!     reduced set of g-points for application to gcms.                     !
!                                                                          !
! --  original version (derived from rrtm_lw), reduction of g-points,      !
!     other revisions for use with gcms.                                   !
!        1999: m. j. iacono, aer, inc.                                     !
! --  adapted for use with ncar/cam3.                                      !
!        may 2004: m. j. iacono, aer, inc.                                 !
! --  revised to add mcica capability.                                     !
!        nov 2005: m. j. iacono, aer, inc.                                 !
! --  conversion to f90 formatting for consistency with rrtmg_sw.          !
!        feb 2007: m. j. iacono, aer, inc.                                 !
! --  modifications to formatting to use assumed-shape arrays.             !
!        aug 2007: m. j. iacono, aer, inc.                                 !
!                                                                          !
! ************************************************************************ !
!                                                                          !
!    ncep modifications history log:                                       !
!                                                                          !
!       nov 1999,  ken campana       -- received the original code from    !
!                    aer (1998 ncar ccm version), updated to link up with  !
!                    ncep mrf model                                        !
!       jun 2000,  ken campana       -- added option to switch random and  !
!                    maximum/random cloud overlap                          !
!           2001,  shrinivas moorthi -- further updates for mrf model      !
!       may 2001,  yu-tai hou        -- updated on trace gases and cloud   !
!                    property based on rrtm_v3.0 codes.                    !
!       dec 2001,  yu-tai hou        -- rewritten code into fortran 90 std !
!                    set ncep radiation structure standard that contains   !
!                    three plug-in compatable fortran program files:       !
!                    'radlw_param.f', 'radlw_datatb.f', 'radlw_main.f'     !
!                    fixed bugs in subprograms taugb14, taugb2, etc. added !
!                    out-of-bounds protections. (a detailed note of        !
!                    up_to_date modifications/corrections by ncep was sent !
!                    to aer in 2002)                                       !
!       jun 2004,  yu-tai hou        -- added mike iacono's apr 2004       !
!                    modification of variable diffusivity angles.          !
!       apr 2005,  yu-tai hou        -- minor modifications on module      !
!                    structures include rain/snow effect (this version of  !
!                    code was given back to aer in jun 2006)               !
!       mar 2007,  yu-tai hou        -- added aerosol effect for ncep      !
!                    models using the generallized aerosol optical property!
!                    scheme for gfs model.                                 !
!       apr 2007,  yu-tai hou        -- added spectral band heating as an  !
!                    optional output to support the 500 km gfs model's     !
!                    upper stratospheric radiation calculations. and       !
!                    restructure optional outputs for easy access by       !
!                    different models.                                     !
!       oct 2008,  yu-tai hou        -- modified to include new features   !
!                    from aer's newer release v4.4-v4.7, including the     !
!                    mcica sub-grid cloud option. add rain/snow optical    !
!                    properties support to cloudy sky calculations.        !
!                    correct errors in mcica cloud optical properties for  !
!                    ebert & curry scheme (iflagice=1) that needs band     !
!                    index conversion. simplified and unified sw and lw    !
!                    sub-column cloud subroutines into one module by using !
!                    optional parameters.                                  !
!       mar 2009,  yu-tai hou        -- replaced the original random number!
!                    generator coming from the original code with ncep w3  !
!                    library to simplify the program and moved sub-column  !
!                    cloud subroutines inside the main module. added       !
!                    option of user provided permutation seeds that could  !
!                    be randomly generated from forecast time stamp.       !
!       oct 2009,  yu-tai hou        -- modified subrtines "cldprop" and   !
!                    "rlwinit" according updats from aer's rrtmg_lw v4.8.  !
!       nov 2009,  yu-tai hou        -- modified subrtine "taumol" according
!                    updats from aer's rrtmg_lw version 4.82. notice the   !
!                    cloud ice/liquid are assumed as in-cloud quantities,  !
!                    not as grid averaged quantities.                      !
!                                                                          !
!!!!!  ==============================================================  !!!!!
!!!!!                         end descriptions                         !!!!!
!!!!!  ==============================================================  !!!!!


!========================================!
      module module_radlw_main           !
!........................................!
!
      use machine,          only : kind_phys
      use physcons,         only : con_g, con_cp, con_avgd, con_amd,    &
     &                             con_amw, con_amo3
      use mersenne_twister, only : random_setseed, random_number,       &
     &                             random_stat

      use module_radlw_parameters
      use module_radlw_cntr_para
!
      use module_radlw_avplank,          only : totplnk
      use module_radlw_ref,              only : preflog, tref, chi_mls
!
      implicit none
!
      private
!
!  ...  version tag and last revision date
!     character(24), parameter :: VTAGLW='RRTM-LW v2.3g   Apr 2004'
!     character(24), parameter :: VTAGLW='RRTM-LW v2.3g   Mar 2007'
!     character(24), parameter :: VTAGLW='RRTMG-LW v4.4   Oct 2008'
!     character(24), parameter :: VTAGLW='RRTMG-LW v4.71  Mar 2009'
!     character(24), parameter :: VTAGLW='RRTMG-LW v4.8   Oct 2009'
      character(24), parameter :: VTAGLW='RRTMG-LW v4.82  Nov 2009'

!  ---  constant values
      real (kind=kind_phys), parameter :: eps     = 1.0e-6
      real (kind=kind_phys), parameter :: oneminus= 1.0-eps
      real (kind=kind_phys), parameter :: cldmin  = 1.0e-80
      real (kind=kind_phys), parameter :: bpade   = 1.0/0.278  ! pade approx constant
      real (kind=kind_phys), parameter :: stpfac  = 296.0/1013.0
      real (kind=kind_phys), parameter :: wtdiff  = 0.5        ! weight for radiance to flux conversion
      real (kind=kind_phys), parameter :: tblint  = ntbl       ! lookup table conversion factor
      real (kind=kind_phys), parameter :: f_zero  = 0.0
      real (kind=kind_phys), parameter :: f_one   = 1.0

!  ...  atomic weights for conversion from mass to volume mixing ratios
      real (kind=kind_phys), parameter :: amdw    = con_amd/con_amw
      real (kind=kind_phys), parameter :: amdo3   = con_amd/con_amo3

!  ...  band indices
      integer, dimension(nbands) :: nspa, nspb

      data nspa / 1, 1, 9, 9, 9, 1, 9, 1, 9, 1, 1, 9, 9, 1, 9, 9 /
      data nspb / 1, 1, 5, 5, 5, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0 /

!  ...  band wavenumber intervals
!     real (kind=kind_phys) :: wavenum1(nbands), wavenum2(nbands)
!     data wavenum1/                                                    &
!    &         10.,  350.,  500.,  630.,  700.,  820.,  980., 1080.,    &
!err &       1180., 1390., 1480., 1800., 2080., 2250., 2390., 2600. /
!    &       1180., 1390., 1480., 1800., 2080., 2250., 2380., 2600. /
!     data wavenum2/                                                    &
!    &        350.,  500.,  630.,  700.,  820.,  980., 1080., 1180.,    &
!err &       1390., 1480., 1800., 2080., 2250., 2390., 2600., 3250. /
!    &       1390., 1480., 1800., 2080., 2250., 2380., 2600., 3250. /
      real (kind=kind_phys) :: delwave(nbands)
      data delwave / 340., 150., 130.,  70., 120., 160., 100., 100.,    &
     &               210.,  90., 320., 280., 170., 130., 220., 650. /

!  ---  reset diffusivity angle for Bands 2-3 and 5-9 to vary (between 1.50
!       and 1.80) as a function of total column water vapor.  the function
!       has been defined to minimize flux and cooling rate errors in these bands
!       over a wide range of precipitable water values.
      real (kind=kind_phys), dimension(nbands) :: a0, a1, a2

      data a0 / 1.66,  1.55,  1.58,  1.66,  1.54, 1.454,  1.89,  1.33,  &
     &         1.668,  1.66,  1.66,  1.66,  1.66,  1.66,  1.66,  1.66 /
      data a1 / 0.00,  0.25,  0.22,  0.00,  0.13, 0.446, -0.10,  0.40,  &
     &        -0.006,  0.00,  0.00,  0.00,  0.00,  0.00,  0.00,  0.00 /
      data a2 / 0.00, -12.0, -11.7,  0.00, -0.72,-0.243,  0.19,-0.062,  &
     &         0.414,  0.00,  0.00,  0.00,  0.00,  0.00,  0.00,  0.00 /

!! ---  logical flags for optional output fields

      logical :: lhlwb  = .false.
      logical :: lhlw0  = .false.
      logical :: lflxprf= .false.

!  ---  those data will be set up only once by "rlwinit"

!  ...  fluxfac, heatfac are factors for fluxes (in w/m**2) and heating
!       rates (in k/day, or k/sec set by subroutine 'rlwinit')
!       semiss0 are default surface emissivity for each bands

      real (kind=kind_phys) :: fluxfac, heatfac, semiss0(nbands)

      real (kind=kind_phys) :: tau_tbl(0:ntbl)  !clr-sky opt dep (for cldy transfer)
      real (kind=kind_phys) :: exp_tbl(0:ntbl)  !transmittance lookup table
      real (kind=kind_phys) :: tfn_tbl(0:ntbl)  !tau transition function; i.e. the
                                                !transition of planck func from mean lyr
                                                !temp to lyr boundary temp as a func of
                                                !opt dep. "linear in tau" method is used.

!  ...  iovrlw  is the clouds overlapping control flag
!            =0: random overlapping clouds
!            =1: maximum/random overlapping clouds
!            =2: maximum overlap cloud (isubcol>0 only)

      integer :: iovrlw

!  ---  the following variables are used for sub-column cloud scheme

      integer, parameter :: ipsdlw0 = ngptlw     ! initial permutation seed
      integer, parameter :: isdlim  = 1.0e+9     ! limit for random seed

!  ...  isubcol is the sub-column cloud approximation control flag
!        =0: no sub-col cloud treatment, use grid-mean cloud quantities
!        =1: mcica sub-col, prescribed seeds for generating random numbers
!        =2: mcica sub-col, use array icseed that contains user provided
!            permutation seeds for generating random numbers
!  ...  ipsdlw is the permutation seed for sub-column clouds scheme (isubcol=1)

      integer :: isubcol, ipsdlw

!  ---  public accessable subprograms

      public lwrad, rlwinit


! ================
      contains
! ================


! --------------------------------
      subroutine lwrad                                                  &
! --------------------------------

!  ---  inputs:
     &     ( play,plev,tlay,tlev,qnm,o3mr,gasvmr,                       &
     &       clouds,icseed,aerosols,sfemis,sfgtmp,                      &
     &       npts, nlay, nlp1, iflip, lprnt,me,                         &
!  ---  outputs:
     &       hlwc,topflx,sfcflx                                         &
!! ---  optional:
     &,      HLW0,HLWB,FLXPRF                                           &
     &     )

!  ====================  defination of variables  ====================  !
!                                                                       !
!  input variables:                                                     !
!     play (npts,nlay) : layer mean pressures (mb)                      !
!     plev (npts,nlp1) : interface pressures (mb)                       !
!     tlay (npts,nlay) : layer mean temperature (k)                     !
!     tlev (npts,nlp1) : interface temperatures (k)                     !
!     qnm  (npts,nlay) : layer specific humidity (gm/gm)   *see inside  !
!     o3mr (npts,nlay) : layer ozone concentration (gm/gm) *see inside  !
!     gasvmr(npts,nlay,:): atmospheric gases amount:                    !
!                       (check module_radiation_gases for definition)   !
!       gasvmr(:,:,1)  -   co2 volume mixing ratio                      !
!       gasvmr(:,:,2)  -   n2o volume mixing ratio                      !
!       gasvmr(:,:,3)  -   ch4 volume mixing ratio                      !
!       gasvmr(:,:,4)  -   o2  volume mixing ratio                      !
!       gasvmr(:,:,5)  -   co  volume mixing ratio                      !
!       gasvmr(:,:,6)  -   cfc11 volume mixing ratio                    !
!       gasvmr(:,:,7)  -   cfc12 volume mixing ratio                    !
!       gasvmr(:,:,8)  -   cfc22 volume mixing ratio                    !
!       gasvmr(:,:,9)  -   ccl4  volume mixing ratio                    !
!     clouds(npts,nlay,:): layer cloud profiles:                        !
!                       (check module_radiation_clouds for definition)  !
!                ---  for  iflagliq > 0  ---                            !
!       clouds(:,:,1)  -   layer total cloud fraction                   !
!       clouds(:,:,2)  -   layer in-cloud liq water path   (g/m**2)     !
!       clouds(:,:,3)  -   mean eff radius for liq cloud   (micron)     !
!       clouds(:,:,4)  -   layer in-cloud ice water path   (g/m**2)     !
!       clouds(:,:,5)  -   mean eff radius for ice cloud   (micron)     !
!       clouds(:,:,6)  -   layer rain drop water path      (g/m**2)     !
!       clouds(:,:,7)  -   mean eff radius for rain drop   (micron)     !
!       clouds(:,:,8)  -   layer snow flake water path     (g/m**2)     !
!   ** fu's scheme need to be normalized by snow density (g/m**3/1.0e6) !
!       clouds(:,:,9)  -   mean eff radius for snow flake  (micron)     !
!                ---  for  iflagliq = 0  ---                            !
!       clouds(:,:,1)  -   layer total cloud fraction                   !
!       clouds(:,:,2)  -   layer cloud optical depth                    !
!       clouds(:,:,3)  -   layer cloud single scattering albedo         !
!       clouds(:,:,4)  -   layer cloud asymmetry factor                 !
!     icseed(npts)   : auxiliary special cloud related array            !
!                      when module variable isubcol=2, it provides      !
!                      permutation seed for each column profile that    !
!                      are used for generating random numbers.          !
!                      when isubcol /=2, it will not be used.           !
!     aerosols(npts,nlay,nbands,:) : aerosol optical properties         !
!                       (check module_radiation_aerosols for definition)!
!        (:,:,:,1)     - optical depth                                  !
!        (:,:,:,2)     - single scattering albedo                       !
!        (:,:,:,3)     - asymmetry parameter                            !
!     sfemis (npts)  : surface emissivity                               !
!     sfgtmp (npts)  : surface ground temperature (k)                   !
!     npts           : total number of horizontal points                !
!     nlay, nlp1     : total number of vertical layers, levels          !
!     iflip          : control flag for in/out vertical index           !
!                      =0: vertical index from toa to surface           !
!                      =1: vertical index from surface to toa           !
!     lprnt          : cntl flag for diagnostic print out               !
!                                                                       !
!  control parameters in module "module_radlw_cntr_para":               !
!     ilwrate        : heating rate unit selections                     !
!                      =1: output in k/day                              !
!                      =2: output in k/second                           !
!     iaerlw         : control flag for aerosols                        !
!                      =0: do not include aerosol effect                !
!                      >0: include aerosol effect                       !
!     irgaslw        : control flag for rare gases (ch4,n2o,o2,co, etc.)!
!                      =0: do not include rare gases                    !
!                      =1: include all rare gases                       !
!     icfclw         : control flag for cfc gases                       !
!                      =0: do not include cfc gases                     !
!                      =1: include all cfc gases                        !
!     iflagliq       : liq-cloud optical properties contrl flag         !
!                      =0: input cld opt dep, ignor iflagice            !
!                      =1: input cld liqp & reliq, hu & stamnes (1993)  !
!     iflagice       : ice-cloud optical properties contrl flag         !
!                       * * * if iflagliq == 0, iflafice is ignored     !
!                      =1: input cld icep & reice, ebert & curry (1997) !
!                      =2: input cld icep & reice, streamer (1996)      !
!                      =3: input cld icep & reice, fu (1998)            !
!                                                                       !
!  output variables:                                                    !
!     hlwc  (npts,nlay): total sky heating rate (k/day or k/sec)        !
!     topflx(npts)     : radiation fluxes at top, component:            !
!                        (check module_radlw_paramters for definition)  !
!        upfxc           - total sky upward flux at top (w/m2)          !
!        upfx0           - clear sky upward flux at top (w/m2)          !
!     sfcflx(npts)     : radiation fluxes at sfc, component:            !
!                        (check module_radlw_paramters for definition)  !
!        upfxc           - total sky upward flux at sfc (w/m2)          !
!        upfx0           - clear sky upward flux at sfc (w/m2)          !
!        dnfxc           - total sky downward flux at sfc (w/m2)        !
!        dnfx0           - clear sky downward flux at sfc (w/m2)        !
!                                                                       !
!! optional output variables:                                           !
!     hlwb(npts,nlay,nbands): spectral band total sky heating rates     !
!     hlw0  (npts,nlay): clear sky heating rate (k/day or k/sec)        !
!     flxprf(npts,nlp1): level radiative fluxes (w/m2), components:     !
!                        (check module_radlw_paramters for definition)  !
!        upfxc           - total sky upward flux                        !
!        dnfxc           - total sky dnward flux                        !
!        upfx0           - clear sky upward flux                        !
!        dnfx0           - clear sky dnward flux                        !
!                                                                       !
!  module parameters, control variables:                                !
!     nbands           - number of longwave spectral bands              !
!     maxgas           - maximum number of absorbing gaseous            !
!     maxxsec          - maximum number of cross-sections               !
!     ngptlw           - total number of g-point subintervals           !
!     ng##             - number of g-points in band (##=1-16)           !
!     ngb(ngptlw)      - band indices for each g-point                  !
!     bpade            - pade approximation constant (1/0.278)          !
!     nspa,nspb(nbands)- number of lower/upper ref atm's per band       !
!     delwave(nbands)  - longwave band width (wavenumbers)              !
!     iovrlw           - cloud overlapping control flag                 !
!            =0: random overlapping clouds                              !
!            =1: maximum/random overlapping clouds                      !
!            =2: maximum overlap cloud (used for isubcol>0 only)        !
!     ipsdlw           - permutation seed for mcica sub-col clds        !
!     isubcol          - sub-column cloud apprx control flag setup in   !
!                        subroutine 'rlwinit'                           !
!            =0: no sub-col cloud treatment, use grid-mean cloud        !
!            =1: mcica sub-col, prescribed seed for random number       !
!            =2: mcica sub-col, use array icseed that contains user     !
!                provided permutation seed for generating random numbers!
!                                                                       !
!  major local variables:                                               !
!     pavel  (nlay)         - layer pressures (mb)                      !
!     delp   (nlay)         - layer pressure thickness (mb)             !
!     tavel  (nlay)         - layer temperatures (k)                    !
!     tz     (0:nlay)       - level (interface) temperatures (k)        !
!     semiss (nbands)       - surface emissivity for each band          !
!     wx     (nlay,maxxsec) - cross-section molecules concentration     !
!     coldry (nlay)         - dry air column amount                     !
!                                   (1.e-20*molecules/cm**2)            !
!     cldfrc (0:nlp1)       - layer cloud fraction                      !
!     taucmc (nlay,ngptlw)  - layer cloud optical depth for each g-point!
!     cldfmc (nlay,ngptlw)  - layer cloud fraction for each g-point     !
!     tauaer (nlay,nbands)  - aerosol optical depths                    !
!     fracs  (nlay,ngptlw)  - planck fractions                          !
!     tautot (nlay,ngptlw)  - total optical depths (gaseous+aerosols)   !
!     colamt (nlay,maxgas)  - column amounts of absorbing gases         !
!                             1-maxgas are for watervapor, carbon       !
!                             dioxide, ozone, nitrous oxide, methane,   !
!                             oxigen, carbon monoxide, respectively     !
!                             (molecules/cm**2)                         !
!     pwvcm                 - column precipitable water vapor (cm)      !
!     secdiff(nbands)       - variable diffusivity angle defined as     !
!                             an exponential function of the column     !
!                             water amount in bands 2-3 and 5-9.        !
!                             this reduces the bias of several w/m2 in  !
!                             downward surface flux in high water       !
!                             profiles caused by using the constant     !
!                             diffusivity angle of 1.66.         (mji)  !
!     facij  (nlay)         - indicator of interpolation factors        !
!                             =0/1: indicate lower/higher temp & height !
!     selffac(nlay)         - scale factor for self-continuum, equals   !
!                          (w.v. density)/(atm density at 296K,1013 mb) !
!     selffrac(nlay)        - factor for temp interpolation of ref      !
!                             self-continuum data                       !
!     indself(nlay)         - index of the lower two appropriate ref    !
!                             temp for the self-continuum interpolation !
!     forfac (nlay)         - scale factor for w.v. foreign-continuum   !
!     forfrac(nlay)         - factor for temp interpolation of ref      !
!                             w.v. foreign-continuum data               !
!     indfor (nlay)         - index of the lower two appropriate ref    !
!                             temp for the foreign-continuum interp     !
!     laytrop               - tropopause layer index at which switch is !
!                             made from one conbination kew species to  !
!                             another.                                  !
!     jp(nlay),jt(nlay),jt1(nlay)                                       !
!                           - lookup table indexes                      !
!     totuflux(0:nlay)      - total-sky upward longwave flux (w/m2)     !
!     totdflux(0:nlay)      - total-sky downward longwave flux (w/m2)   !
!     htr(nlay)             - total-sky heating rate (k/day or k/sec)   !
!     totuclfl(0:nlay)      - clear-sky upward longwave flux (w/m2)     !
!     totdclfl(0:nlay)      - clear-sky downward longwave flux (w/m2)   !
!     htrcl(nlay)           - clear-sky heating rate (k/day or k/sec)   !
!     fnet    (0:nlay)      - net longwave flux (w/m2)                  !
!     fnetc   (0:nlay)      - clear-sky net longwave flux (w/m2)        !
!                                                                       !
!                                                                       !
!  ======================    end of definitions    ===================  !

!  ---  inputs:
      integer, intent(in) :: npts, nlay, nlp1, iflip, icseed(:)

      logical,  intent(in) :: lprnt

      real (kind=kind_phys), dimension(:,:), intent(in) :: plev, tlev,  &
     &       play, tlay, qnm, o3mr

      real (kind=kind_phys), dimension(:,:,:),intent(in) :: gasvmr,     &
     &       clouds

      real (kind=kind_phys), dimension(:),    intent(in) :: sfemis,     &
     &       sfgtmp

      real (kind=kind_phys), dimension(:,:,:,:),intent(in) :: aerosols

!  ---  outputs:
      real (kind=kind_phys), dimension(:,:), intent(out) :: hlwc

      type (topflw_type),    dimension(:),   intent(out) :: topflx
      type (sfcflw_type),    dimension(:),   intent(out) :: sfcflx

!! ---  optional outputs:
      real (kind=kind_phys),dimension(:,:,:),optional,intent(out):: hlwb
      real (kind=kind_phys),dimension(:,:),optional,intent(out):: hlw0
      type (proflw_type),   dimension(:,:),optional,intent(out):: flxprf

!  ---  locals:
      real (kind=kind_phys), dimension(0:nlp1) :: cldfrc

      real (kind=kind_phys), dimension(0:nlay) :: totuflux, totdflux,   &
     &       totuclfl, totdclfl, tz

      real (kind=kind_phys), dimension(nlay)   :: htr, htrcl

      real (kind=kind_phys), dimension(nlay)   :: pavel, tavel, delp,   &
     &       clwp, ciwp, relw, reiw, cda1, cda2, cda3, cda4,            &
     &       coldry, colbrd, h2ovmr, o3vmr, fac00, fac01, fac10, fac11, &
     &       selffac, selffrac, forfac, forfrac, minorfrac, scaleminor, &
     &       scaleminorn2, temcol

      real (kind=kind_phys), dimension(nlay,ngptlw) :: fracs, tautot,   &
     &       taucmc, cldfmc

      real (kind=kind_phys), dimension(0:nlay,nbands) :: pklev

      real (kind=kind_phys), dimension(nlay,nbands)   :: pklay,         &
     &       tauaer, htrb

      real (kind=kind_phys), dimension(nbands)        :: pkbnd,         &
     &       semiss, secdiff

!  ---  column amount of absorbing gases:
!       (:,m) m = 1-h2o, 2-co2, 3-o3, 4-n2o, 5-ch4, 6-o2, 7-co
      real (kind=kind_phys) :: colamt(nlay,maxgas)

!  ---  column cfc cross-section amounts:
!       (:,m) m = 1-ccl4, 2-cfc11, 3-cfc12, 4-cfc22
      real (kind=kind_phys) :: wx(nlay,maxxsec)

!  ---  reference ratios of binary species parameter in lower atmosphere:
!       (:,m,:) m = 1-h2o/co2, 2-h2o/o3, 3-h2o/n2o, 4-h2o/ch4, 5-n2o/co2, 6-o3/co2
      real (kind=kind_phys) :: rfrate(nlay,nrates,2)

      real (kind=kind_phys) :: fp, ft, ft1, tem0, tem1, tem2, pwvcm,    &
     &       summol, tlayfr, tlevfr, plog, stemp, tsfcfr

      integer, dimension(npts) :: ipseed
      integer, dimension(nlay) :: jp, jt, jt1, indself, indfor, indminor
      integer                  :: laytrop, jp1, indlay, indlev, indsfc, &
     &                            iplon, i, j, k, k1, me
      logical :: lcf1

!
!===> ... begin here
!

!  --- ...  initialization

      lhlwb  = present ( hlwb )
      lhlw0  = present ( hlw0 )
      lflxprf= present ( flxprf )
 
      colamt(:,:) = f_zero

!  --- ...  change random number seed value for each radiation invocation

      if     ( isubcol == 1 ) then     ! advance prescribed permutation seed
        do i = 1, npts
          ipseed(i) = ipsdlw + i
        enddo
        ipsdlw = mod( ipsdlw+npts, isdlim )
      elseif ( isubcol == 2 ) then     ! use input array of permutaion seeds
        do i = 1, npts
          ipseed(i) = icseed(i)
        enddo
      endif


!  --- ...  loop over horizontal npts profiles
 
      lab_do_iplon : do iplon = 1, npts

        if (sfemis(iplon) > eps .and. sfemis(iplon) <= 1.0) then  ! input surface emissivity
          do j = 1, nbands
            semiss(j) = sfemis(iplon)
          enddo
        else                                                      ! use default values
          do j = 1, nbands
            semiss(j) = semiss0(j)
          enddo
        endif

        stemp = sfgtmp(iplon)          ! surface ground temp

!  --- ...  prepare atmospheric profile for use in rrtm
!           the vertical index of internal array is from surface to top

!  --- ...  molecular amounts are input or converted to volume mixing ratio
!           and later then converted to molecular amount (molec/cm2) by the
!           dry air column coldry (in molec/cm2) which is calculated from the
!           layer pressure thickness (in mb), based on the hydrostatic equation
!  --- ...  and includes a correction to account for h2o in the layer.

        if (iflip == 0) then        ! input from toa to sfc

          tem1 = 100.0 * con_g
          tem2 = 1.0e-20 * 1.0e3 * con_avgd
          tz(0) = tlev(iplon,nlp1)

          do k = 1, nlay
            k1 = nlp1 - k
            pavel(k)= play(iplon,k1)
            delp(k) = plev(iplon,k1+1) - plev(iplon,k1)
            tavel(k)= tlay(iplon,k1)
            tz(k)   = tlev(iplon,k1)

!  --- ...  set absorber amount
!test use
!           h2ovmr(k)= max(f_zero,qnm(iplon,k1)*amdw)                   ! input mass mixing ratio
!           h2ovmr(k)= max(f_zero,qnm(iplon,k1))                        ! input vol mixing ratio
!           o3vmr (k)= max(f_zero,o3mr(iplon,k1))                       ! input vol mixing ratio
!ncep model use
            h2ovmr(k)= max(f_zero,qnm(iplon,k1)                         &
     &                           *amdw/(f_one-qnm(iplon,k1)))           ! input specific humidity
            o3vmr (k)= max(f_zero,o3mr(iplon,k1)*amdo3)                 ! input mass mixing ratio

!  --- ...  tem0 is the molecular weight of moist air
            tem0 = (f_one - h2ovmr(k))*con_amd + h2ovmr(k)*con_amw
            coldry(k) = tem2*delp(k) / (tem1*tem0*(f_one+h2ovmr(k)))
            temcol(k) = 1.0e-12 * coldry(k)

            colamt(k,1) = max(f_zero,    coldry(k)*h2ovmr(k))          ! h2o
            colamt(k,2) = max(temcol(k), coldry(k)*gasvmr(iplon,k1,1)) ! co2
            colamt(k,3) = max(temcol(k), coldry(k)*o3vmr(k))           ! o3
          enddo

!  --- ...  set up col amount for rare gases, convert from volume mixing ratio
!           to molec/cm2 based on coldry (scaled to 1.0e-20)

          if (irgaslw == 1) then
            do k = 1, nlay
              k1 = nlp1 - k
              colamt(k,4)=max(temcol(k), coldry(k)*gasvmr(iplon,k1,2))  ! n2o
              colamt(k,5)=max(temcol(k), coldry(k)*gasvmr(iplon,k1,3))  ! ch4
              colamt(k,6)=max(f_zero,    coldry(k)*gasvmr(iplon,k1,4))  ! o2
              colamt(k,7)=max(f_zero,    coldry(k)*gasvmr(iplon,k1,5))  ! co
            enddo
          else
            do k = 1, nlay
              colamt(k,4) = f_zero     ! n2o
              colamt(k,5) = f_zero     ! ch4
              colamt(k,6) = f_zero     ! o2
              colamt(k,7) = f_zero     ! co
            enddo
          endif

          if (icfclw == 1) then
            do k = 1, nlay
              k1 = nlp1 - k
              wx(k,1) = max( f_zero, coldry(k)*gasvmr(iplon,k1,9) )   ! ccl4
              wx(k,2) = max( f_zero, coldry(k)*gasvmr(iplon,k1,6) )   ! cf11
              wx(k,3) = max( f_zero, coldry(k)*gasvmr(iplon,k1,7) )   ! cf12
              wx(k,4) = max( f_zero, coldry(k)*gasvmr(iplon,k1,8) )   ! cf22
            enddo
          else
            wx(:,:) = f_zero
          endif

!  --- ...  set aerosol optical properties

          if (iaerlw > 0) then
            do k = 1, nlay
              k1 = nlp1 - k
              do j = 1, nbands
                tauaer(k,j) = aerosols(iplon,k1,j,1)                    &
     &                      * (f_one - aerosols(iplon,k1,j,2))
              enddo
            enddo
          else
            tauaer(:,:) = f_zero
          endif

          if (iflagliq > 0) then   ! use prognostic cloud method
            do k = 1, nlay
              k1 = nlp1 - k
              cldfrc(k)= clouds(iplon,k1,1)
              clwp(k)  = clouds(iplon,k1,2)
              relw(k)  = clouds(iplon,k1,3)
              ciwp(k)  = clouds(iplon,k1,4)
              reiw(k)  = clouds(iplon,k1,5)
              cda1(k)  = clouds(iplon,k1,6)
              cda2(k)  = clouds(iplon,k1,7)
              cda3(k)  = clouds(iplon,k1,8)
              cda4(k)  = clouds(iplon,k1,9)
            enddo
          else                       ! use diagnostic cloud method
            do k = 1, nlay
              k1 = nlp1 - k
              cldfrc(k)= clouds(iplon,k1,1)
              cda1(k)  = clouds(iplon,k1,2)
            enddo
          endif                      ! end if_iflagliq

          cldfrc(0)    = f_one       ! padding value only
          cldfrc(nlp1) = f_zero      ! padding value only

!  --- ...  compute precipitable water vapor for diffusivity angle adjustments

          tem1 = f_zero
          tem2 = f_zero
          do k = 1, nlay
            tem1 = tem1 + coldry(k) + colamt(k,1)
            tem2 = tem2 + colamt(k,1)
          enddo

          tem0 = 10.0 * tem2 / (amdw * tem1 * con_g)
          pwvcm = tem0 * plev(iplon,nlp1)

        else                        ! input from sfc to toa

          tem1 = 100.0 * con_g
          tem2 = 1.0e-20 * 1.0e3 * con_avgd
          tz(0) = tlev(iplon,1)

          do k = 1, nlay
            pavel(k)= play(iplon,k)
            delp(k) = plev(iplon,k) - plev(iplon,k+1)
            tavel(k)= tlay(iplon,k)
            tz(k)   = tlev(iplon,k+1)

!  --- ...  set absorber amount
!test use
!           h2ovmr(k)= max(f_zero,qnm(iplon,k)*amdw)                    ! input mass mixing ratio
!           h2ovmr(k)= max(f_zero,qnm(iplon,k))                         ! input vol mixing ratio
!           o3vmr (k)= max(f_zero,o3mr(iplon,k))                        ! input vol mixing ratio
!ncep model use
            h2ovmr(k)= max(f_zero,qnm(iplon,k)                          &
     &                           *amdw/(f_one-qnm(iplon,k)))            ! input specific humidity
            o3vmr (k)= max(f_zero,o3mr(iplon,k)*amdo3)                  ! input mass mixing ratio

!  --- ...  tem0 is the molecular weight of moist air
            tem0 = (f_one - h2ovmr(k))*con_amd + h2ovmr(k)*con_amw
            coldry(k) = tem2*delp(k) / (tem1*tem0*(f_one+h2ovmr(k)))
            temcol(k) = 1.0e-12 * coldry(k)

            colamt(k,1) = max(f_zero,    coldry(k)*h2ovmr(k))          ! h2o
            colamt(k,2) = max(temcol(k), coldry(k)*gasvmr(iplon,k,1))  ! co2
            colamt(k,3) = max(temcol(k), coldry(k)*o3vmr(k))           ! o3
          enddo

!  --- ...  set up col amount for rare gases, convert from volume mixing ratio
!           to molec/cm2 based on coldry (scaled to 1.0e-20)

          if (irgaslw == 1) then
            do k = 1, nlay
              colamt(k,4)=max(temcol(k), coldry(k)*gasvmr(iplon,k,2))  ! n2o
              colamt(k,5)=max(temcol(k), coldry(k)*gasvmr(iplon,k,3))  ! ch4
              colamt(k,6)=max(f_zero,    coldry(k)*gasvmr(iplon,k,4))  ! o2
              colamt(k,7)=max(f_zero,    coldry(k)*gasvmr(iplon,k,5))  ! co
            enddo
          else
            do k = 1, nlay
              colamt(k,4) = f_zero     ! n2o
              colamt(k,5) = f_zero     ! ch4
              colamt(k,6) = f_zero     ! o2
              colamt(k,7) = f_zero     ! co
            enddo
          endif

          if (icfclw == 1) then
            do k = 1, nlay
              wx(k,1) = max( f_zero, coldry(k)*gasvmr(iplon,k,9) )   ! ccl4
              wx(k,2) = max( f_zero, coldry(k)*gasvmr(iplon,k,6) )   ! cf11
              wx(k,3) = max( f_zero, coldry(k)*gasvmr(iplon,k,7) )   ! cf12
              wx(k,4) = max( f_zero, coldry(k)*gasvmr(iplon,k,8) )   ! cf22
            enddo
          else
            wx(:,:) = f_zero
          endif

!  --- ...  set aerosol optical properties

          if (iaerlw > 0) then
            do j = 1, nbands
              do k = 1, nlay
                tauaer(k,j) = aerosols(iplon,k,j,1)                     &
     &                      * (f_one - aerosols(iplon,k,j,2))
              enddo
            enddo
          else
            tauaer(:,:) = f_zero
          endif

          if (iflagliq > 0) then   ! use prognostic cloud method
            do k = 1, nlay
              cldfrc(k)= clouds(iplon,k,1)
              clwp(k)  = clouds(iplon,k,2)
              relw(k)  = clouds(iplon,k,3)
              ciwp(k)  = clouds(iplon,k,4)
              reiw(k)  = clouds(iplon,k,5)
              cda1(k)  = clouds(iplon,k,6)
              cda2(k)  = clouds(iplon,k,7)
              cda3(k)  = clouds(iplon,k,8)
              cda4(k)  = clouds(iplon,k,9)
            enddo
          else                       ! use diagnostic cloud method
            do k = 1, nlay
              cldfrc(k)= clouds(iplon,k,1)
              cda1(k)  = clouds(iplon,k,2)
            enddo
          endif                      ! end if_iflagliq

          cldfrc(0)    = f_one       ! padding value only
          cldfrc(nlp1) = f_zero      ! padding value only

!  --- ...  compute precipitable water vapor for diffusivity angle adjustments

          tem1 = f_zero
          tem2 = f_zero
          do k = 1, nlay
            tem1 = tem1 + coldry(k) + colamt(k,1)
            tem2 = tem2 + colamt(k,1)
          enddo

          tem0 = 10.0 * tem2 / (amdw * tem1 * con_g)
          pwvcm = tem0 * plev(iplon,1)

        endif                       ! if_iflip

!  --- ...  compute column amount for broadening gases

        do k = 1, nlay
          summol = f_zero
          do i = 2, maxgas
            summol = summol + colamt(k,i)
          enddo
          colbrd(k) = coldry(k) - summol
        enddo

!  --- ...  compute diffusivity angle adjustments

        tem1 = 1.80
        tem2 = 1.50
        do j = 1, nbands
          if (j==1 .or. j==4 .or. j==10) then
            secdiff(j) = 1.66
          else
            secdiff(j) = min( tem1, max( tem2,                          &
     &                   a0(j)+a1(j)*exp(a2(j)*pwvcm) ))
          endif
        enddo


!  --- ...  for cloudy atmosphere, use cldprop to set cloud optical properties

        lcf1 = .false.
        lab_do_k0 : do k = 1, nlay
          if ( cldfrc(k) > eps ) then
            lcf1 = .true.
            exit lab_do_k0
          endif
        enddo  lab_do_k0

        call cldprop                                                    &
!  ---  inputs:
     &     ( cldfrc,clwp,relw,ciwp,reiw,cda1,cda2,cda3,cda4,            &
     &       lcf1, nlay, ipseed(iplon),                                 &
!  ---  outputs:
     &       taucmc, cldfmc                                             &
     &     )

!  --- ...  calculate information needed by the radiative transfer routine
!           that is specific to this atmosphere, especially some of the
!           coefficients and indices needed to compute the optical depths
!           by interpolating data from stored reference atmospheres.

        indsfc = min(180, max(1, int(stemp-159.0) ))
        indlev = min(180, max(1, int(tz(0)-159.0) ))
        tsfcfr = stemp - int(stemp)
        tlevfr = tz(0) - int(tz(0))
        do i = 1, nbands
          tem1 = totplnk(indsfc+1,i) - totplnk(indsfc,i)
          tem2 = totplnk(indlev+1,i) - totplnk(indlev,i)
          pkbnd(i) = semiss(i) * (totplnk(indsfc,i) + tsfcfr*tem1)
          pklev(0,i) = totplnk(indlev,i) + tlevfr*tem2
        enddo

!  --- ...  begin layer loop
!           calculate the integrated Planck functions for each band at the
!           surface, level, and layer temperatures.

        laytrop = 0

        do k = 1, nlay

          indlay = min(180, max(1, int(tavel(k)-159.0) ))
          tlayfr = tavel(k) - int(tavel(k))

          indlev = min(180, max(1, int(tz(k)-159.0) ))
          tlevfr = tz(k) - int(tz(k))

!  --- ...  begin spectral band loop

          do i = 1, nbands
            pklay(k,i) = totplnk(indlay,i) + tlayfr                     &
     &                 * (totplnk(indlay+1,i) - totplnk(indlay,i))
            pklev(k,i) = totplnk(indlev,i) + tlevfr                     &
     &                 * (totplnk(indlev+1,i) - totplnk(indlev,i))
          enddo

!  --- ...  find the two reference pressures on either side of the
!           layer pressure. store them in jp and jp1. store in fp the
!           fraction of the difference (in ln(pressure)) between these
!           two values that the layer pressure lies.

          plog = log(pavel(k))
          jp(k)= max(1, min(58, int(36.0 - 5.0*(plog+0.04)) ))
          jp1  = jp(k) + 1
!  --- ...  limit pressure extrapolation at the top
          fp   = max(f_zero, min(f_one, 5.0*(preflog(jp(k))-plog) ))
!org      fp   = 5.0 * (preflog(jp(k)) - plog)

!  --- ...  determine, for each reference pressure (jp and jp1), which
!           reference temperature (these are different for each
!           reference pressure) is nearest the layer temperature but does
!           not exceed it. store these indices in jt and jt1, resp.
!           store in ft (resp. ft1) the fraction of the way between jt
!           (jt1) and the next highest reference temperature that the
!           layer temperature falls.

          tem1 = (tavel(k)-tref(jp(k))) / 15.0
          tem2 = (tavel(k)-tref(jp1    )) / 15.0
          jt (k) = max(1, min(4, int(3.0 + tem1) ))
          jt1(k) = max(1, min(4, int(3.0 + tem2) ))
!  --- ...  restrict extrapolation ranges by limiting abs(det t) < 37.5 deg
          ft  = max(-0.5, min(1.5, tem1 - float(jt (k) - 3) ))
          ft1 = max(-0.5, min(1.5, tem2 - float(jt1(k) - 3) ))
!org      ft  = tem1 - float(jt (k) - 3)
!org      ft1 = tem2 - float(jt1(k) - 3)

!  --- ...  we have now isolated the layer ln pressure and temperature,
!           between two reference pressures and two reference temperatures
!           (for each reference pressure).  we multiply the pressure
!           fraction fp with the appropriate temperature fractions to get
!           the factors that will be needed for the interpolation that yields
!           the optical depths (performed in routines taugbn for band n)

          tem1 = f_one - fp
          fac10(k) = tem1 * ft
          fac00(k) = tem1 * (f_one - ft)
          fac11(k) = fp * ft1
          fac01(k) = fp * (f_one - ft1)

          forfac(k) = pavel(k)*stpfac / (tavel(k)*(1.0 + h2ovmr(k)))
          selffac(k) = h2ovmr(k) * forfac(k)

!  --- ...  set up factors needed to separately include the minor gases
!           in the calculation of absorption coefficient

          scaleminor(k) = pavel(k) / tavel(k)
          scaleminorn2(k) = (pavel(k) / tavel(k))                       &
     &                    * (colbrd(k)/(coldry(k) + colamt(k,1)))
          tem1 = (tavel(k) - 180.8) / 7.2
          indminor(k) = min(18, max(1, int(tem1)))
          minorfrac(k) = tem1 - float(indminor(k))

!  --- ...  if the pressure is less than ~100mb, perform a different
!           set of species interpolations.

          if (plog > 4.56) then

            laytrop =  laytrop + 1

            tem1 = (332.0 - tavel(k)) / 36.0
            indfor(k) = min(2, max(1, int(tem1)))
            forfrac(k) = tem1 - float(indfor(k))

!  --- ...  set up factors needed to separately include the water vapor
!           self-continuum in the calculation of absorption coefficient.

            tem1 = (tavel(k) - 188.0) / 7.2
            indself(k) = min(9, max(1, int(tem1)-7))
            selffrac(k) = tem1 - float(indself(k) + 7)

!  --- ...  setup reference ratio to be used in calculation of binary
!           species parameter in lower atmosphere.

            rfrate(k,1,1) = chi_mls(1,jp(k)) / chi_mls(2,jp(k))
            rfrate(k,1,2) = chi_mls(1,jp(k)+1) / chi_mls(2,jp(k)+1)

            rfrate(k,2,1) = chi_mls(1,jp(k)) / chi_mls(3,jp(k))
            rfrate(k,2,2) = chi_mls(1,jp(k)+1) / chi_mls(3,jp(k)+1)

            rfrate(k,3,1) = chi_mls(1,jp(k)) / chi_mls(4,jp(k))
            rfrate(k,3,2) = chi_mls(1,jp(k)+1) / chi_mls(4,jp(k)+1)

            rfrate(k,4,1) = chi_mls(1,jp(k)) / chi_mls(6,jp(k))
            rfrate(k,4,2) = chi_mls(1,jp(k)+1) / chi_mls(6,jp(k)+1)

            rfrate(k,5,1) = chi_mls(4,jp(k)) / chi_mls(2,jp(k))
            rfrate(k,5,2) = chi_mls(4,jp(k)+1) / chi_mls(2,jp(k)+1)

          else

            tem1 = (tavel(k) - 188.0) / 36.0
            indfor(k) = 3
            forfrac(k) = tem1 - f_one

            indself(k) = 0
            selffrac(k) = f_zero

!  --- ...  setup reference ratio to be used in calculation of binary
!           species parameter in upper atmosphere.

            rfrate(k,1,1) = chi_mls(1,jp(k)) / chi_mls(2,jp(k))
            rfrate(k,1,2) = chi_mls(1,jp(k)+1) / chi_mls(2,jp(k)+1)

            rfrate(k,6,1) = chi_mls(3,jp(k)) / chi_mls(2,jp(k))
            rfrate(k,6,2) = chi_mls(3,jp(k)+1) / chi_mls(2,jp(k)+1)

          endif

!  --- ...  rescale selffac and forfac for use in taumol

          selffac(k) = colamt(k,1) * selffac(k)
          forfac(k)  = colamt(k,1) * forfac(k)

        enddo   ! end do_k layer loop


!  --- ...  calculate the gaseous optical depths and Planck fractions for
!           each longwave spectral band.

        call taumol                                                     &
!  ---  inputs:
     &     ( laytrop,pavel,coldry,colamt,colbrd,wx,tauaer,              &
     &       rfrate,fac00,fac01,fac10,fac11,jp,jt,jt1,                  &
     &       selffac,selffrac,indself,forfac,forfrac,indfor,            &
     &       minorfrac,scaleminor,scaleminorn2,indminor,                &
     &       nlay,                                                      &
!  ---  outputs:
     &       fracs, tautot                                              &
     &     )


!  --- ... call the radiative transfer routine based on cloud scheme
!          selection. clear sky calculation is done at the same time.

        if (isubcol <= 0) then

          if (iovrlw <= 0) then

            call rtrn                                                   &
!  ---  inputs:
     &     ( semiss,delp,cldfrc,taucmc,secdiff,                         &
     &       pklay,pklev,pkbnd,fracs,tautot,                            &
     &       nlay, nlp1,                                                &
!  ---  outputs:
     &       totuflux,totdflux,htr, totuclfl,totdclfl,htrcl, htrb       &
     &     )

          else

            call rtrnmr                                                 &
!  ---  inputs:
     &     ( semiss,delp,cldfrc,taucmc,secdiff,                         &
     &       pklay,pklev,pkbnd,fracs,tautot,                            &
     &       nlay, nlp1,                                                &
!  ---  outputs:
     &       totuflux,totdflux,htr, totuclfl,totdclfl,htrcl, htrb       &
     &     )

          endif   ! end if_iovrlw_block

        else

          call rtrnmc                                                   &
!  ---  inputs:
     &     ( semiss,delp,cldfmc,taucmc,secdiff,                         &
     &       pklay,pklev,pkbnd,fracs,tautot,                            &
     &       nlay, nlp1,me,                                             &
!  ---  outputs:
     &       totuflux,totdflux,htr, totuclfl,totdclfl,htrcl, htrb       &
     &     )

        endif   ! end if_isubcol_block

!  --- ...  output total-sky and clear-sky fluxes and heating rates

        topflx(iplon)%upfxc = totuflux(nlay)
        topflx(iplon)%upfx0 = totuclfl(nlay)

        sfcflx(iplon)%upfxc = totuflux(0)
        sfcflx(iplon)%upfx0 = totuclfl(0)
        sfcflx(iplon)%dnfxc = totdflux(0)
        sfcflx(iplon)%dnfx0 = totdclfl(0)

        if (iflip == 0) then        ! output from toa to sfc

!! --- ...  optional fluxes
          if ( lflxprf ) then
            do k = 0, nlay
              k1 = nlp1 - k
              flxprf(iplon,k1)%upfxc = totuflux(k)
              flxprf(iplon,k1)%dnfxc = totdflux(k)
              flxprf(iplon,k1)%upfx0 = totuclfl(k)
              flxprf(iplon,k1)%dnfx0 = totdclfl(k)
            enddo
          endif

          do k = 1, nlay
            k1 = nlp1 - k
            hlwc(iplon,k1) = htr(k)
          enddo

!! --- ...  optional clear sky heating rate
          if ( lhlw0 ) then
            do k = 1, nlay
              k1 = nlp1 - k
              hlw0(iplon,k1) = htrcl(k)
            enddo
          endif

!! --- ...  optional spectral band heating rate
          if ( lhlwb ) then
            do j = 1, nbands
            do k = 1, nlay
              k1 = nlp1 - k
              hlwb(iplon,k1,j) = htrb(k,j)
            enddo
            enddo
          endif

        else                        ! output from sfc to toa

!! --- ...  optional fluxes
          if ( lflxprf ) then
            do k = 0, nlay
              flxprf(iplon,k+1)%upfxc = totuflux(k)
              flxprf(iplon,k+1)%dnfxc = totdflux(k)
              flxprf(iplon,k+1)%upfx0 = totuclfl(k)
              flxprf(iplon,k+1)%dnfx0 = totdclfl(k)
            enddo
          endif

          do k = 1, nlay
            hlwc(iplon,k) = htr(k)
          enddo

!! --- ...  optional clear sky heating rate
          if ( lhlw0 ) then
            do k = 1, nlay
              hlw0(iplon,k) = htrcl(k)
            enddo
          endif

!! --- ...  optional spectral band heating rate
          if ( lhlwb ) then
            do j = 1, nbands
            do k = 1, nlay
              hlwb(iplon,k,j) = htrb(k,j)
            enddo
            enddo
          endif

        endif                       ! if_iflip

      enddo  lab_do_iplon

!...................................
      end subroutine lwrad
!-----------------------------------



!-----------------------------------
      subroutine rlwinit                                                &
!...................................

!  ---  inputs:
     &     ( icwp, me, nlay, iovr, isubc )
!  ---  outputs: (none)

!  ===================  program usage description  ===================  !
!                                                                       !
! purpose:  initialize non-varying module variables, conversion factors,!
! and look-up tables.                                                   !
!                                                                       !
! subprograms called:  none                                             !
!                                                                       !
!  ====================  defination of variables  ====================  !
!                                                                       !
!  inputs:                                                              !
!    icwp     -  flag of cloud schemes used by model                    !
!                =0: diagnostic scheme gives cloud tau, omiga, and g    !
!                =1: prognostic scheme gives cloud liq/ice path, etc.   !
!    me       - print control for parallel process                      !
!    nlay     - number of vertical layers                               !
!    iovr     - cloud overlapping control flag                          !
!                =0: random overlapping clouds                          !
!                =1: maximum/random overlapping clouds                  !
!                =2: maximum overlap cloud (isubcol>0 only)             !
!    isubc    - mcica sub-column cloud approximation control flag       !
!                =0: no sub-column cloud approximation                  !
!                =1: mcica sub-col approx. with prescribed initial seed !
!                =2: mcica sub-col approx. with specified initial seed  !
!                                                                       !
!  outputs: (none)                                                      !
!                                                                       !
!  control flags in module "module_radlw_cntr_para":                    !
!     ilwrate - heating rate unit selections                            !
!               =1: output in k/day                                     !
!               =2: output in k/second                                  !
!     iaerlw  - control flag for aerosols                               !
!               =0: do not include aerosol effect                       !
!               >0: include aerosol effect                              !
!     irgaslw - control flag for rare gases (ch4,n2o,o2, etc.)          !
!               =0: do not include rare gases                           !
!               =1: include all rare gases                              !
!     icfclw  - control flag for cfc gases                              !
!               =0: do not include cfc gases                            !
!               =1: include all cfc gases                               !
!     iflagliq- cloud optical properties contrl flag                    !
!               =0: input cloud opt depth from diagnostic scheme        !
!               >0: input cwp,cip, and other cloud content parameters   !
!                                                                       !
!  *******************************************************************  !
!  original code description                                            !
!                                                                       !
!  original version:       michael j. iacono; july, 1998                !
!  first revision for ncar ccm:               september, 1998           !
!  second revision for rrtm_v3.0:             september, 2002           !
!                                                                       !
!  this subroutine performs calculations necessary for the initialization
!  of the longwave model.  lookup tables are computed for use in the lw !
!  radiative transfer, and input absorption coefficient data for each   !
!  spectral band are reduced from 256 g-point intervals to 140.         !
!                                                                       !
!  *******************************************************************  !
!                                                                       !
! definitions:                                                          !
!   arrays for 10000-point look-up tables:                              !
!   tau_tbl - clear-sky optical depth (used in cloudy radiative transfer!
!   exp_tbl - exponential lookup table for tansmittance                 !
!   tfn_tbl - tau transition function; i.e. the transition of the Planck!
!             function from that for the mean layer temperature to that !
!             for the layer boundary temperature as a function of optical
!             depth. the "linear in tau" method is used to make the table
!                                                                       !
!  *******************************************************************  !
!                                                                       !
!  ======================  end of description block  =================  !

!  ---  inputs:
      integer, intent(in) :: icwp, me, nlay, iovr, isubc

!  ---  outputs: none

!  ---  locals:
      real (kind=kind_phys), parameter :: expeps = 1.e-20

      real (kind=kind_phys) :: tfn, pival, explimit

      integer               :: i

!
!===> ... begin here
!
      iovrlw  = iovr     ! assign module variable of overlap flag

      isubcol = isubc    ! assign module variable sub_col clds flag

      if ( iovrlw<0 .or. iovrlw>2 ) then
        print *,'  *** Error in specification of cloud overlap flag',   &
     &          ' IOVRLW=',iovrlw,' in RLWINIT !!'
        stop
      elseif ( iovrlw==2 .and. isubcol==0 ) then
        if (me == 0) then
          print *,'  *** IOVRLW=2 - maximum cloud overlap, is not yet', &
     &          ' available for ISUBC=0 setting!!'
          print *,'      The program uses maximum/random overlap',      &
     &          ' instead.'
        endif

        iovrlw = 1
      endif

      if (me == 0) then
        print *,' - Using AER Longwave Radiation, Version: ', VTAGLW

        if (iaerlw > 0) then
          print *,'   --- Using input aerosol parameters for LW'
        else
          print *,'   --- Aerosol effect is NOT included in LW, all'    &
     &           ,' internal aerosol parameters are set to zeros'
        endif

        if (irgaslw == 1) then
          print *,'   --- Include rare gases N2O, CH4, O2, absorptions',&
     &            ' in LW'
        else
          print *,'   --- Rare gases effect is NOT included in LW'
        endif

        if (icfclw == 1) then
          print *,'   --- Include CFC gases absorptions in LW'
        else
          print *,'   --- CFC gases effect is NOT included in LW'
        endif

        if ( isubcol == 0 ) then
          print *,'   --- Using standard grid average clouds, no ',     &
     &            'sub-column clouds approximation applied'
        elseif ( isubcol == 1 ) then
          print *,'   --- Using MCICA sub-colum clouds approximation ', &
     &            'with a prescribed sequence of permutaion seeds'
        elseif ( isubcol == 2 ) then
          print *,'   --- Using MCICA sub-colum clouds approximation ', &
     &            'with provided input array of permutation seeds'
        else
          print *,'  *** Error in specification of sub-column cloud ',  &
     &            ' control flag isubc =',isubcol,' !!'
          stop
        endif
      endif

!  --- ...  set initial permutaion seed

      ipsdlw = ipsdlw0

!  --- ...  check cloud flags for consistency

      if ((icwp == 0 .and. iflagliq /= 0) .or.                          &
     &    (icwp == 1 .and. iflagliq == 0)) then
        print *,'  *** Model cloud scheme inconsistent with LW',        &
     &          ' radiation cloud radiative property setup !!'
        stop
      endif

      if ( iflagliq<0 .or. iflagliq>1 .or.                              &
     &     iflagice<0 .or. iflagice>3 ) then
        print *,'  *** Error in specifying LW IFLAGLIQ or IFLAGICE :',  &
     &           iflagliq, iflagice
        stop
      endif

!  --- ...  setup default surface emissivity for each band here

      semiss0(:) = f_one

!  --- ...  setup constant factors for flux and heating rate
!           the 1.0e-2 is to convert pressure from mb to N/m**2

      pival = 2.0 * asin(f_one)
      fluxfac = pival * 2.0d4
!     fluxfac = 62831.85307179586                   ! = 2 * pi * 1.0e4

      if (ilwrate == 1) then
!       heatfac = 8.4391
!       heatfac = con_g * 86400. * 1.0e-2 / con_cp  !   (in k/day)
        heatfac = con_g * 864.0 / con_cp            !   (in k/day)
      else
        heatfac = con_g * 1.0e-2 / con_cp           !   (in k/second)
      endif

!  --- ...  compute lookup tables for transmittance, tau transition
!           function, and clear sky tau (for the cloudy sky radiative
!           transfer).  tau is computed as a function of the tau
!           transition function, transmittance is calculated as a
!           function of tau, and the tau transition function is
!           calculated using the linear in tau formulation at values of
!           tau above 0.01.  tf is approximated as tau/6 for tau < 0.01.
!           all tables are computed at intervals of 0.001.  the inverse
!           of the constant used in the pade approximation to the tau
!           transition function is set to b.

      tau_tbl(0) = f_zero
      exp_tbl(0) = f_one
      tfn_tbl(0) = f_zero

      tau_tbl(ntbl) = 1.e10
      exp_tbl(ntbl) = expeps
      tfn_tbl(ntbl) = f_one

      explimit = aint( -log(tiny(exp_tbl(0))) )

      do i = 1, ntbl-1
!org    tfn = float(i) / float(ntbl)
!org    tau_tbl(i) = bpade * tfn / (f_one - tfn)
        tfn = real(i, kind_phys) / real(ntbl-i, kind_phys)
        tau_tbl(i) = bpade * tfn
        if (tau_tbl(i) >= explimit) then
          exp_tbl(i) = expeps
        else
          exp_tbl(i) = exp( -tau_tbl(i) )
        endif

        if (tau_tbl(i) < 0.06) then
          tfn_tbl(i) = tau_tbl(i) / 6.0
        else
          tfn_tbl(i) = f_one - 2.0*( (f_one / tau_tbl(i))               &
     &               - ( exp_tbl(i) / (f_one - exp_tbl(i)) ) )
        endif
      enddo

!...................................
      end subroutine rlwinit
!-----------------------------------


! ----------------------------
      subroutine cldprop                                                &
! ............................
!  ---  inputs:
     &     ( cfrac,cliqp,reliq,cicep,reice,cdat1,cdat2,cdat3,cdat4,     &
     &       lcf1, nlay, ipseed,                                        &
!  ---  outputs:
     &       taucmc, cldfmc                                             &
     &     )

!  ===================  program usage description  ===================  !
!                                                                       !
! purpose:  compute the cloud optical depth(s) for each cloudy layer    !
! and g-point interval.                                                 !
!                                                                       !
! subprograms called:  none                                             !
!                                                                       !
!  ====================  defination of variables  ====================  !
!                                                                       !
!  inputs:                                                       -size- !
!    cfrac - real, layer cloud fraction                          0:nlp1 !
!        .....  for iflagliq > 0  (prognostic cloud sckeme)  - - -      !
!    cliqp - real, layer in-cloud liq water path (g/m**2)          nlay !
!    reliq - real, mean eff radius for liq cloud (micron)          nlay !
!    cicep - real, layer in-cloud ice water path (g/m**2)          nlay !
!    reice - real, mean eff radius for ice cloud (micron)          nlay !
!    cdat1 - real, layer rain drop water path  (g/m**2)            nlay !
!    cdat2 - real, effective radius for rain drop (microm)         nlay !
!    cdat3 - real, layer snow flake water path (g/m**2)            nlay !
!              (if use fu's formula it needs to be normalized by        !
!              snow density (g/m**3/1.0e6) to get unit of micron)       !
!    cdat4 - real, effective radius for snow flakes (micron)       nlay !
!        .....  for iflagliq = 0  (diagnostic cloud sckeme)  - - -      !
!    cdat1 - real, input cloud optical depth                       nlay !
!    cdat2 - real, layer cloud single scattering albedo            nlay !
!    cdat3 - real, layer cloud asymmetry factor                    nlay !
!    cdat4 - real, optional use                                    nlay !
!    cliqp - not used                                              nlay !
!    reliq - not used                                              nlay !
!    cicep - not used                                              nlay !
!    reice - not used                                              nlay !
!                                                                       !
!    lcf1  - logical, =t: cloudy column; =f: clear column.           1  !
!    nlay  - integer, number of vertical layers                      1  !
!    ipseed- permutation seed for generating random numbers (isubcol>0) !
!                                                                       !
!  outputs:                                                             !
!    taucmc - real, cloud optical depth                      nlay*ngptlw!
!    cldfmc - real, cloud fraction for each sub-column       nlay*ngptlw!
!                                                                       !
!                                                                       !
!    explanation of the method for each value of iflagliq, and iflagice.!
!    set up in module "module_radlw_cntr_para"                          !
!                                                                       !
!     iflagliq=0 : input cloud optical property (tau, ssa, asy).        !
!                  (used for diagnostic cloud method)                   !
!     iflagliq>0 : input cloud liq/ice path and effective radius, also  !
!                  require the user of 'iflagice' to specify the method !
!                  used to compute aborption due to water/ice parts.    !
!  ...................................................................  !
!                                                                       !
!     iflagliq=1:  the water droplet effective radius (microns) is input!
!                  and the opt depths due to water clouds are computed  !
!                  as in hu and stamnes, j., clim., 6, 728-742, (1993). !
!                  the values for absorption coefficients appropriate for
!                  the spectral bands in rrtm have been obtained for a  !
!                  range of effective radii by an averaging procedure   !
!                  based on the work of j. pinto (private communication).
!                  linear interpolation is used to get the absorption   !
!                  coefficients for the input effective radius.         !
!                                                                       !
!     iflagice=1:  the cloud ice path (g/m2) and ice effective radius   !
!                  (microns) are input and the optical depths due to ice!
!                  clouds are computed as in ebert and curry, jgr, 97,  !
!                  3831-3836 (1992).  the spectral regions in this work !
!                  have been matched with the spectral bands in rrtm to !
!                  as great an extent as possible:                      !
!                     e&c 1      ib = 5      rrtm bands 9-16            !
!                     e&c 2      ib = 4      rrtm bands 6-8             !
!                     e&c 3      ib = 3      rrtm bands 3-5             !
!                     e&c 4      ib = 2      rrtm band 2                !
!                     e&c 5      ib = 1      rrtm band 1                !
!     iflagice=2:  the cloud ice path (g/m2) and ice effective radius   !
!                  (microns) are input and the optical depths due to ice!
!                  clouds are computed as in rt code, streamer v3.0     !
!                  (ref: key j., streamer user's guide, cooperative     !
!                  institute for meteorological satellite studies, 2001,!
!                  96 pp.) valid range of values for re are between 5.0 !
!                  and 131.0 micron.                                    !
!     iflagice=3:  the ice generalized effective size (dge) is input and!
!                  the optical properties, are calculated as in q. fu,  !
!                  j. climate, (1998). q. fu provided high resolution   !
!                  tales which were appropriately averaged for the bands!
!                  in rrtm_lw. linear interpolation is used to get the  !
!                  coeff from the stored tables. valid range of values  !
!                  for deg are between 5.0 and 140.0 micron.            !
!                                                                       !
!  other cloud control module variables:                                !
!                                                                       !
!     isubcol =0: standard cloud scheme, no sub-col cloud approximation !
!             >0: mcica sub-col cloud scheme using ipseed as permutation!
!                 seed for generating rundom numbers                    !
!                                                                       !
!     iovrlw    : control flag for cloud overlapping method             !
!            (isubcol=1): =0:random; =1:maximum/random: =2:maximum      !
!            (isubcol=0): cloud overlap is managed by subr. rtrn/rtrnmr !
!                                                                       !
!  ======================  end of description block  =================  !
!
      use module_radlw_cldprlw

!  ---  inputs:
      integer, intent(in) :: nlay, ipseed
      logical, intent(in) :: lcf1

      real (kind=kind_phys), dimension(0:), intent(in) :: cfrac
      real (kind=kind_phys), dimension(:),  intent(in) :: cliqp, reliq, &
     &       cicep, reice, cdat1, cdat2, cdat3, cdat4

!  ---  outputs:
      real (kind=kind_phys), dimension(:,:),intent(out):: taucmc, cldfmc

!  ---  locals:
      real (kind=kind_phys), dimension(nlay,ngptlw) :: cliqmc, cicemc,  &
     &       cranmc, csnwmc

      real (kind=kind_phys), dimension(nlay)      :: cldf

      real (kind=kind_phys) ::   dgeice, factor, fint,                  &
     &       tauliq, cldliq, refliq, tauice, cldice, refice,            &
     &       tauran, cldran, refran, tausnw, cldsnw, refsnw,            &
     &       abscoliq, abscoice

      integer :: ia, ib, ic, ig, k, index

!
!===> ...  begin here
!
      do ig = 1, ngptlw
        do k = 1, nlay
          taucmc(k,ig) = f_zero
          cldfmc(k,ig) = f_zero
        enddo
      enddo

      if ( .not. lcf1 ) return     ! if clear-sky column, return

!  --- ...  compute cloud radiative properties for a cloudy column

      if ( isubcol > 0 ) then      ! mcica sub-col clouds approx

        do k = 1, nlay
          if ( cfrac(k) < cldmin ) then
            cldf(k) = f_zero
          else
            cldf(k) = cfrac(k)
          endif
        enddo

!  --- ...  call sub-column cloud generator

        call mcica_subcol                                               &
!  ---  inputs:
     &     ( cldf, cicep, cliqp, cdat1, cdat2, cdat3,                   &
     &       nlay, ngptlw, ipseed, iflagliq,                            &
!  ---  output:
     &       cldfmc, cicemc, cliqmc, cranmc, csnwmc, taucmc             &
     &     )
        if ( iflagliq == 0 ) return

      else                         ! isubcol = 0, standard approach

        if ( iflagliq == 0 ) then
          do ig = 1, ngptlw
            do k = 1, nlay
              taucmc(k,ig) = cdat1(k)
            enddo
          enddo

          return
        else
          do k = 1, nlay
            cldfmc(k,1) = cfrac(k)
            cliqmc(k,1) = cliqp(k)
            cicemc(k,1) = cicep(k)
            cranmc(k,1) = cdat1(k)
            csnwmc(k,1) = cdat3(k)
          enddo
        endif   ! end if_iflagliq_block

      endif   ! end if_isubcol_block

!  --- ...  the following are for prognostic cloud scheme (iflagliq>0)

      do ig = 1, ngptlw
        ib = ngb(ig)              ! spectral band index
        ia = ipat(ib)             ! eb_&_c band index for ice cloud coeff

        if ( isubcol > 0 ) then   ! use mcica cloud scheme
          ic = ig
        else                      ! use standard cloud scheme
          ic = 1
        endif

        do k = 1, nlay
          cldliq = cliqmc(k,ic)
          cldice = cicemc(k,ic)
          cldran = cranmc(k,ic)
          cldsnw = csnwmc(k,ic)
          refliq = max(2.5e0, min(60.0e0, reliq(k) ))
          refice = max(5.0e0, reice(k) )
          refran = cdat2(k)
          refsnw = cdat4(k)

          if ( cldfmc(k,ic) >= cldmin ) then

!  --- ...  calculation of absorption coefficients due to ice clouds.
            if ( cldice <= f_zero ) then
              abscoice = f_zero
            else

!  --- ...  ebert and curry approach for all particle sizes though somewhat
!           unjustified for large ice particles

              if ( iflagice == 1 ) then
                refice = min(130.0, max(13.0, real(refice) ))

                abscoice = max( f_zero,                                 &
     &                          absice1(1,ia) + absice1(2,ia)/refice )

!  --- ...  streamer approach for ice effective radius between 5.0 and 131.0 microns
!           and ebert and curry approach for ice eff radius greater than 131.0 microns.
!           no smoothing between the transition of the two methods.

              elseif ( iflagice == 2 ) then

                factor = (refice - 2.0) / 3.0
                index  = max( 1, min( 42, int( factor ) ))
                fint   = factor - float(index)

                abscoice = max( f_zero, absice2(index,ib) + fint        &
     &                   * (absice2(index+1,ib) - absice2(index,ib)) )

!  --- ...  fu's approach for ice effective radius between 4.8 and 135 microns
!           (generalized effective size from 5 to 140 microns)

              elseif ( iflagice == 3 ) then

                dgeice = max(5.0, 1.0315*reice(k))              ! v4.71 value
                factor = (dgeice - 2.0) / 3.0
                index  = max( 1, min( 45, int( factor ) ))
                fint   = factor - float(index)

                abscoice = max( f_zero, absice3(index,ib) + fint        &
     &                   * (absice3(index+1,ib) - absice3(index,ib)) )

              endif   ! end if_iflagice_block

            endif   ! end if_cldice_block

!  --- ...  calculation of absorption coefficients due to water clouds.

            if ( cldliq <= f_zero ) then
              abscoliq = f_zero
            else
              if ( iflagliq == 1 ) then

                factor = refliq - 1.5
                index  = max( 1, min( 57, int( factor ) ))
                fint   = factor - float(index)

                abscoliq = max( f_zero, absliq1(index,ib) + fint        &
     &                   * (absliq1(index+1,ib) - absliq1(index,ib)) )
              endif   ! end if_iflagliq_block
            endif   ! end if_cldliq_block

            tauliq = cldliq * abscoliq
            tauice = cldice * abscoice
            tauran = cldran * absrain                        ! ncar formula
            tausnw = cldsnw * abssnow0                       ! ncar formula
!           tausnw = cldsnw * abssnow1 / refsnw              ! fu's formula

            taucmc(k,ig) = tauliq + tauice + tauran + tausnw

          endif   ! end if_cldfmc_block
        enddo   ! end do_k_loop

      enddo   ! end do_ig_loop

! ..................................
      end subroutine cldprop
! ----------------------------------


! ----------------------------------
      subroutine mcica_subcol                                           &
! ..................................
!  ---  inputs:
     &    ( cldf, cicep, cliqp, cda1, cda2, cda3,                       &
     &      nlay, nsub, ipseed, iflagcld,                               &
!  ---  outputs:
     &      cldfmc, cicemc, cliqmc, cranmc, csnwmc, taucmc              &
!  ---  optional:
!    &,     ssacmc, asycmc                                              &
     &    )

!  ====================  defination of variables  ====================  !
!                                                                       !
!  input variables:                                                size !
!   cldf    - real, layer cloud fraction                           nlay !
!        - - -  for iflagcld > 0  (prognostic cloud sckeme)  - - -      !
!   cicep   - real, layer in-cloud ice water path (g/m2)           nlay !
!   cliqp   - real, layer in-cloud liquid water path (g/m2)        nlay !
!   cda1    - real, layer rain drop water path (g/m2)              nlay !
!   cda2    - real, not used                                       nlay !
!   cda3    - real, layer snow flake water path (g/m2)             nlay !
!  ** fu's scheme need to be normalized by snow density (g/m**3/1.0e6)  !
!                                                                       !
!        - - -  for iflagcld = 0  (diagnostic cloud sckeme)  - - -      !
!   cicep   - real, not used                                       nlay !
!   cliqp   - real, not used                                       nlay !
!   cda1    - real, layer cloud optical depth                      nlay !
!   cda2    - real, layer cloud single scattering albedo           nlay !
!                   non-delta scaled values                             !
!   cda3    - real, layer cloud asymmetry parameter                nlay !
!                   non-delta scaled values                             !
!                                                                       !
!   nlay    - integer, number of model vertical layers               1  !
!   nsub    - integer, number of sub columns, = number of g-points   1  !
!   ipseed  - integer, permute seed for random num generator         1  !
!    ** note : if the cloud generator is called multiple times, need    !
!              to permute the seed between each call; if between calls  !
!              for lw and sw, use values differ by the number of g-pts. !
!   iflagcld- integer, controflag for cloud optical property scheme  1  !
!               =0: direct input cld optical depth, ssa, and asy        !
!               >0: use input cld liq/ice path to calc cld opt prop     !
!                                                                       !
!  output variables:                                                    !
!   cldfmc  - real, layer cloud fraction [mcica]               nlay*nsub!
!                ---  for  iflagcld > 0  ---                            !
!   cicemc  - real, cloud ice water path [mcica]               nlay*nsub!
!   cliqmc  - real, cloud liquid water path [mcica]            nlay*nsub!
!   cranmc  - real, cloud rain drop water path [mcica]         nlay*nsub!
!   csnwmc  - real, cloud snow flake water path [mcica]        nlay*nsub!
!                ---  for  iflagcld = 0  ---                            !
!   taucmc  - real, cloud optical depth [mcica]                nlay*nsub!
!!optional output variables: (currently not used by lw)                 !
!!  ssacmc  - real, cloud single scattering albedo [mcica]     nlay*nsub!
!!  asycmc  - real, cloud asymmetry parameter [mcica]          nlay*nsub!
!                                                                       !
!                                                                       !
!  other control flags from module variables:                           !
!     iovrlw    : control flag for cloud overlapping method             !
!            (isubcol=1): =0:random; =1:maximum/random: =2:maximum      !
!            (isubcol=0): cloud overlap is managed by subr. rtrn/rtrnmr !
!                                                                       !
!  =====================    end of definitions    ====================  !

      implicit none

!  ---  inputs:
      integer, intent(in) :: nlay, nsub, ipseed, iflagcld

      real (kind=kind_phys), dimension(:),   intent(in) :: cicep,       &
     &       cliqp, cda1, cda2, cda3, cldf

!  ---  outputs:
      real (kind=kind_phys), dimension(:,:), intent(out):: cldfmc,      &
     &       cicemc, cliqmc, cranmc, csnwmc, taucmc

!! ---  optional outputs:
!!    real (kind=kind_phys), dimension(:,:), intent(out):: ssacmc,asycmc

!  ---  locals:
      real (kind=kind_phys) :: cdfunc(nlay,nsub), tem1,                 &
     &                         rand2d(nlay*nsub), rand1d(nsub)

      type (random_stat) :: stat          ! for thread safe random generator

      logical :: lcloudy(nlay,nsub)

      integer :: k, n, kn
!
!===> ...  begin here
!
!  --- ...  advance randum number generator by ipseed values

      call random_setseed                                               &
!  ---  inputs:
     &    ( ipseed,                                                     &
!  ---  outputs:
     &      stat                                                        &
     &    )

!  --- ...  sub-column set up according to overlapping assumption

      select case ( iovrlw )

        case( 0 )        ! random overlap, pick a random value at every level

          call random_number                                            &
!  ---  inputs: ( none )
!  ---  outputs:
     &     ( rand2d, stat )

          kn = 0
          do n = 1, nsub
            do k = 1, nlay
              kn = kn + 1
              cdfunc(k,n) = rand2d(kn)
            enddo
          enddo

        case( 1 )        ! max-ran overlap

          call random_number                                            &
!  ---  inputs: ( none )
!  ---  outputs:
     &     ( rand2d, stat )

          kn = 0
          do n = 1, nsub
            do k = 1, nlay
              kn = kn + 1
              cdfunc(k,n) = rand2d(kn)
            enddo
          enddo

!  ---  first pick a random number for bottom (or top) layer.
!       then walk up the column: (aer's code)
!       if layer below is cloudy, use the same rand num in the layer below
!       if layer below is clear,  use a new random number

!  ---  from bottom up
          do k = 2, nlay
            tem1 = f_one - cldf(k-1)

            do n = 1, nsub
              if ( cdfunc(k-1,n) > tem1 ) then
                cdfunc(k,n) = cdfunc(k-1,n)
              else
                cdfunc(k,n) = cdfunc(k,n) * tem1
              endif
            enddo
          enddo

!  ---  or walk down the column: (if use original author's method)
!       if layer above is cloudy, use the same rand num in the layer above
!       if layer above is clear,  use a new random number

!  ---  from top down
!         do k = nlay-1, 1, -1
!           tem1 = f_one - cldf(k+1)

!           do n = 1, nsub
!             if ( cdfunc(k+1,n) > tem1 ) then
!               cdfunc(k,n) = cdfunc(k+1,n)
!             else
!               cdfunc(k,n) = cdfunc(k,n) * tem1
!             endif
!           enddo
!         enddo

        case( 2 )        ! maximum overlap, pick same random numebr at every level

          call random_number                                            &
!  ---  inputs: ( none )
!  ---  outputs:
     &     ( rand1d, stat )

          do n = 1, nsub
            do k = 1, nlay
              cdfunc(k,n) = rand1d(n)
            enddo
          enddo

      end select

!  --- ...  generate subcolumns for homogeneous clouds

      do k = 1, nlay
        tem1 = f_one - cldf(k)

        do n = 1, nsub
          lcloudy(k,n) = cdfunc(k,n) >= tem1
        enddo
      enddo

!  --- ...  where the subcolumn is cloudy, the subcolumn cloud fraction is 1;
!           where the subcolumn is not cloudy, the subcolumn cloud fraction is 0

      do n = 1, nsub
        do k = 1, nlay
          if ( lcloudy(k,n) ) then
            cldfmc(k,n) = f_one
          else
            cldfmc(k,n) = f_zero
          endif
        enddo
      enddo

!  --- ...  comput sub-column cloud optical properties

      if ( iflagcld == 0 ) then      ! cloud optical properties are ready inputs

        do n = 1, nsub
          do k = 1, nlay
            if ( lcloudy(k,n) ) then
              taucmc(k,n) = cda1(k)
!!            ssacmc(k,n) = cda2(k)
!!            asycmc(k,n) = cda3(k)
            else
              taucmc(k,n) = f_zero
!!            ssacmc(k,n) = f_one
!!            asycmc(k,n) = f_zero
            endif
          enddo
        enddo

      else                           ! cloud liq/ice paths are inputs

!  --- ...  where there is a cloud, set the subcolumn cloud properties.

        do k = 1, nlay
          do n = 1, nsub
            if ( lcloudy(k,n) ) then
              cliqmc(k,n) = cliqp(k)
              cicemc(k,n) = cicep(k)
              cranmc(k,n) = cda1 (k)
              csnwmc(k,n) = cda3 (k)
            else
              cliqmc(k,n) = f_zero
              cicemc(k,n) = f_zero
              cranmc(k,n) = f_zero
              csnwmc(k,n) = f_zero
            endif
          enddo
        enddo

      endif

! ..................................
      end subroutine mcica_subcol
! ----------------------------------


! ----------------------------------
      subroutine rtrn                                                   &
! ..................................
!  ---  inputs:
     &     ( semiss,delp,cldfrc,taucld,secdif,                          &
     &       pklay,pklev,pkbnd,fracs,tautot,                            &
     &       nlay, nlp1,                                                &
!  ---  outputs:
     &       totuflux,totdflux,htr, totuclfl,totdclfl,htrcl, htrb       &
     &     )

!  ===================  program usage description  ===================  !
!                                                                       !
! purpose:  compute the upward/downward radiative fluxes, and heating   !
! rates for both clear or cloudy atmosphere.  clouds are assumed as     !
! randomly overlaping in a vertical colum.                              !
!                                                                       !
! subprograms called:  none                                             !
!                                                                       !
!  ====================  defination of variables  ====================  !
!                                                                       !
!  inputs:                                                     -size-   !
!   semiss  - real, lw surface emissivity                         nbands!
!   delp    - real, layer pressure thickness (mb)                  nlay !
!   cldfrc  - real, layer cloud fraction                         0:nlp1 !
!   taucld  - real, layer cloud opt depth                    nlay*ngptlw!
!   secdif  - real, secant of diffusivity angle                   nbands!
!   pklay   - real, integrated planck func at lay temp       nlay*nbands!
!   pklev   - real, integrated planck func at lev temp     0:nlay*nbands!
!   pkbnd   - real, planck value for each band                    nbands!
!   fracs   - real, planck fractions                         nlay*ngptlw!
!   tautot  - real, total optical depth (gas+aerosols)       nlay*ngptlw!
!   nlay    - integer, number of vertical layers                    1   !
!   nlp1    - integer, number of vertical levels (interfaces)       1   !
!                                                                       !
!  outputs:                                                             !
!   totuflux- real, total sky upward flux (w/m2)                 0:nlay !
!   totdflux- real, total sky downward flux (w/m2)               0:nlay !
!   htr     - real, total sky heating rate (k/sec or k/day)        nlay !
!   totuclfl- real, clear sky upward flux (w/m2)                 0:nlay !
!   totdclfl- real, clear sky downward flux (w/m2)               0:nlay !
!   htrcl   - real, clear sky heating rate (k/sec or k/day)        nlay !
!   htrb    - real, spectral band lw heating rate (k/day)    nlay*nbands!
!                                                                       !
!  module veriables:                                                    !
!   delwave - real, band wavenumber intervals                     nbands!
!   ngb     - integer, band index for each g-value                ngptlw!
!   fluxfac - real, conversion factor for fluxes (pi*2.e4)           1  !
!   heatfac - real, conversion factor for heating rates (g/cp*1e-2)  1  !
!   tblint  - real, conversion factor for look-up tbl (float(ntbl)   1  !
!   bpade   - real, pade approx constant (1/0.278)                   1  !
!   wtdiff  - real, weight for radiance to flux conversion           1  !
!   ntbl    - integer, dimension of look-up tables                   1  !
!   tau_tbl - real, clr-sky opt dep lookup table                 0:ntbl !
!   exp_tbl - real, transmittance lookup table                   0:ntbl !
!   tfn_tbl - real, tau transition function                      0:ntbl !
!                                                                       !
!  local variables:                                                     !
!    itgas  - integer, index for gases contribution look-up table    1  !
!    ittot  - integer, index for gases plus clouds  look-up table    1  !
!    reflct - real, surface reflectance                              1  !
!    atrgas - real, gaseous absorptivity                           nlay !
!    atrtot - real, gaseous and cloud absorptivity                 nlay !
!    odcld  - real, cloud optical depth                      nlay*ngptlw!
!    odepth - real, optical depth of gaseous only                    1  !
!    odtot  - real, optical depth of gas and cloud                   1  !
!    gasfac - real, gas-only pade factor, used for planck function   1  !
!    totfac - real, gas and cloud pade factor, used for planck fn    1  !
!    bbdgas - real, gas-only planck function for downward rt         1  !
!    bbugas - real, gas-only planck function for upward rt         nlay !
!    bbdtot - real, gas and cloud planck function for downward rt    1  !
!    bbutot - real, gas and cloud planck function for upward rt    nlay !
!    gassrc - real, source radiance due to gas only                  1  !
!    totsrc - real, source radiance due to gas and cloud             1  !
!    efclrfr- real, effective clear sky fraction (1-efcldfr) nlay*ngptlw!
!    rtotu  - real, spectrally summed total sky upward radiance      1  !
!    rclru  - real, spectrally summed clear sky upward radiance      1  !
!    toturad- real, total sky upward radiance by layer     0:nlay*nbands!
!    clrurad- real, clear sky upward radiance by layer     0:nlay,nbands!
!    totdrad- real, total sky downward radiance by layer   0:nlay,nbands!
!    clrdrad- real, clear sky downward radiance by layer   0:nlay,nbands!
!    radtotd- real, spectrally summed total sky downward radiance    1  !
!    radclrd- real, spectrally summed clear sky downward radiance    1  !
!    fnet   - real, net longwave flux (w/m2)                     0:nlay !
!    fnetc  - real, clear sky net longwave flux (w/m2)           0:nlay !
!                                                                       !
!                                                                       !
!  *******************************************************************  !
!  original code description                                            !
!                                                                       !
!  original version:   e. j. mlawer, et al. rrtm_v3.0                   !
!  revision for gcms:  michael j. iacono; october, 2002                 !
!  revision for f90:   michael j. iacono; june, 2006                    !
!                                                                       !
!  this program calculates the upward fluxes, downward fluxes, and      !
!  heating rates for an arbitrary clear or cloudy atmosphere. the input !
!  to this program is the atmospheric profile, all Planck function      !
!  information, and the cloud fraction by layer.  a variable diffusivity!
!  angle (secdif) is used for the angle integration. bands 2-3 and 5-9  !
!  use a value for secdif that varies from 1.50 to 1.80 as a function   !
!  of the column water vapor, and other bands use a value of 1.66.  the !
!  gaussian weight appropriate to this angle (wtdiff=0.5) is applied    !
!  here.  note that use of the emissivity angle for the flux integration!
!  can cause errors of 1 to 4 W/m2 within cloudy layers.                !
!  clouds are treated with a random cloud overlap method.               !
!                                                                       !
!  *******************************************************************  !
!  ======================  end of description block  =================  !

!  ---  inputs:
      integer, intent(in) :: nlay, nlp1

      real (kind=kind_phys), dimension(0:),  intent(in) :: cldfrc
      real (kind=kind_phys), dimension(:),   intent(in) :: semiss,      &
     &       delp, secdif, pkbnd

      real (kind=kind_phys), dimension(:,:), intent(in) :: taucld,      &
     &       pklay, fracs, tautot

      real (kind=kind_phys), dimension(0:,:),intent(in) :: pklev

!  ---  outputs:
      real (kind=kind_phys), dimension(:),  intent(out) :: htr, htrcl
      real (kind=kind_phys), dimension(:,:),intent(out) :: htrb

      real (kind=kind_phys), dimension(0:), intent(out) ::              &
     &       totuflux, totdflux, totuclfl, totdclfl

!  ---  locals:
      real (kind=kind_phys), parameter :: rec_6 = 0.166667

      real (kind=kind_phys), dimension(0:nlay,nbands) :: clrurad,       &
     &       clrdrad, toturad, totdrad
      real (kind=kind_phys), dimension(nlay,ngptlw) :: efclrfr, odcld

      real (kind=kind_phys), dimension(0:nlay) :: fnet, fnetc
      real (kind=kind_phys), dimension(nlay)   :: atrtot, atrgas,       &
     &        bbugas, bbutot, trngas

      real (kind=kind_phys) :: totsrc, gassrc, tblind, odepth, odtot,   &
     &        trntot, reflct, totfac, gasfac, flxfac, rtotu, rclru,     &
     &        plfrac, blay, bbdgas, bbdtot, dplnku, dplnkd, rad0,       &
     &        radtotd, radclrd

      integer :: ittot, itgas, ib, ig, k
!
!===> ...  begin here
!
      toturad = f_zero
      totdrad = f_zero
      clrurad = f_zero
      clrdrad = f_zero

      totuflux(0) = f_zero
      totdflux(0) = f_zero
      totuclfl(0) = f_zero
      totdclfl(0) = f_zero

      do k = 1, nlay
        totuflux(k) = f_zero
        totdflux(k) = f_zero
        totuclfl(k) = f_zero
        totdclfl(k) = f_zero
      enddo

      odcld  (:,:) = f_zero
      efclrfr(:,:) = f_one

      do ig = 1, ngptlw
        ib = ngb(ig)

        do k = 1, nlay
          if (cldfrc(k) >= eps) then
            odcld(k,ig) = secdif(ib) * taucld(k,ig)
            efclrfr(k,ig) = f_one-(f_one-exp(-odcld(k,ig)))*cldfrc(k)
          endif
        enddo
      enddo

!  --- ...  loop over all g-points

      do ig = 1, ngptlw
        ib = ngb(ig)

        radtotd = f_zero
        radclrd = f_zero

!  --- ...  downward radiative transfer loop.

        do k = nlay, 1, -1

          plfrac = fracs(k,ig)
          blay = pklay(k,ib)
          dplnku = pklev(k,ib) - blay
          dplnkd = pklev(k-1,ib) - blay
          odepth = max( f_zero, secdif(ib)*tautot(k,ig) )

!  --- ...  clear sky, gases contribution

          if (odepth <= 0.06) then
            atrgas(k) = odepth - 0.5*odepth*odepth
            trngas(k) = f_one - atrgas(k)
            gasfac    = rec_6 * odepth
          else
            tblind = odepth / (bpade + odepth)
            itgas = tblint*tblind + 0.5
            trngas(k) = exp_tbl(itgas)
            atrgas(k) = f_one - trngas(k)
            gasfac    = tfn_tbl(itgas)
          endif

          bbdgas    = plfrac*(blay + dplnkd*gasfac)
          bbugas(k) = plfrac*(blay + dplnku*gasfac)
          gassrc    = bbdgas*atrgas(k)

!  --- ...  total sky, gases+clouds contribution

          if (cldfrc(k) >= eps) then
!  --- ...  it is a cloudy layer

            odtot = odepth + odcld(k,ig)

            if (odtot < 0.06) then
              totfac    = rec_6 * odtot
              atrtot(k) = odtot - 0.5*odtot*odtot
              trntot    = f_one - atrtot(k)
            elseif (odepth <= 0.06) then
              tblind = odtot / (bpade + odtot)
              ittot  = tblint*tblind + 0.5

              totfac    = tfn_tbl(ittot)
              trntot    = exp_tbl(ittot)
              atrtot(k) = f_one - trntot
            else
              odepth = tau_tbl(itgas)
              odtot  = odepth + odcld(k,ig)
              tblind = odtot / (bpade + odtot)
              ittot  = tblint*tblind + 0.5

              totfac    = tfn_tbl(ittot)
              trntot    = exp_tbl(ittot)
              atrtot(k) = f_one - trntot
            endif

            bbdtot    = plfrac*(blay + dplnkd*totfac)
            bbutot(k) = plfrac*(blay + dplnku*totfac)
            totsrc    = bbdtot*atrtot(k)

!  --- ...  total sky radiance
            radtotd = radtotd*trngas(k)*efclrfr(k,ig) + gassrc          &
     &              + cldfrc(k)*(totsrc - gassrc)
            totdrad(k-1,ib) = totdrad(k-1,ib) + radtotd

!  --- ...  clear sky radiance
            radclrd = radclrd*trngas(k) + gassrc
            clrdrad(k-1,ib) = clrdrad(k-1,ib) + radclrd

          else

!  --- ...  it is a clear layer
            radtotd = radtotd*trngas(k) + gassrc
            totdrad(k-1,ib) = totdrad(k-1,ib) + radtotd

            radclrd = radclrd*trngas(k) + gassrc
            clrdrad(k-1,ib) = clrdrad(k-1,ib) + radclrd

          endif

        enddo   ! end do_k_loop

!  --- ...  spectral emissivity & reflectance
!           include the contribution of spectrally varying longwave emissivity
!           and reflection from the surface to the upward radiative transfer.
!     note: spectral and Lambertian reflection are identical for the
!           diffusivity angle flux integration used here.

        rad0 = fracs(1,ig) * pkbnd(ib)

!  --- ...  add in reflection of surface downward radiance.
        reflct = f_one - semiss(ib)
        rtotu = rad0 + reflct*radtotd
        rclru = rad0 + reflct*radclrd

!  --- ...  upward radiative transfer loop.
        toturad(0,ib) = toturad(0,ib) + rtotu
        clrurad(0,ib) = clrurad(0,ib) + rclru

        do k = 1, nlay

          gassrc = bbugas(k)*atrgas(k)
          totsrc = bbutot(k)*atrtot(k)

          if (cldfrc(k) >= eps) then

!  --- ...  it is a cloudy layer
            rtotu = rtotu*trngas(k)*efclrfr(k,ig) + gassrc              &
     &            + cldfrc(k)*(totsrc - gassrc)
            toturad(k,ib) = toturad(k,ib) + rtotu

            rclru = rclru*trngas(k) + gassrc
            clrurad(k,ib) = clrurad(k,ib) + rclru

          else

!  --- ...  it is a clear layer
            rtotu = rtotu*trngas(k) + gassrc
            toturad(k,ib) = toturad(k,ib) + rtotu

            rclru = rclru*trngas(k) + gassrc
            clrurad(k,ib) = clrurad(k,ib) + rclru

          endif

        enddo   ! end do_k_loop

      enddo   ! end do_ig_loop

!  --- ...  process longwave output from band for total and clear streams.
!           calculate upward, downward, and net flux.

      do ib = 1, nbands
        flxfac = wtdiff * fluxfac * delwave(ib)

        do k = 0, nlay
          toturad(k,ib) = toturad(k,ib) * flxfac
          totdrad(k,ib) = totdrad(k,ib) * flxfac
          clrurad(k,ib) = clrurad(k,ib) * flxfac
          clrdrad(k,ib) = clrdrad(k,ib) * flxfac

          totuflux(k) = totuflux(k) + toturad(k,ib)
          totdflux(k) = totdflux(k) + totdrad(k,ib)
          totuclfl(k) = totuclfl(k) + clrurad(k,ib)
          totdclfl(k) = totdclfl(k) + clrdrad(k,ib)
        enddo
      enddo

!  --- ...  calculate net fluxes and heating rates
      fnet(0) = totuflux(0) - totdflux(0)

      do k = 1, nlay
        fnet(k) = totuflux(k) - totdflux(k)
        htr (k) = heatfac*(fnet(k-1) - fnet(k)) / delp(k)
      enddo

!! --- ...  optional clear sky heating rates
      if ( lhlw0 ) then
        fnetc(0) = totuclfl(0) - totdclfl(0)

        do k = 1, nlay
          fnetc(k) = totuclfl(k) - totdclfl(k)
          htrcl(k) = heatfac*(fnetc(k-1)-fnetc(k)) / delp(k)
        enddo
      endif

!! --- ...  optional spectral band heating rates
      if ( lhlwb ) then
        do ib = 1, nbands
          fnet(0) = toturad(0,ib) - totdrad(0,ib)

          do k = 1, nlay
            fnet(k) = toturad(k,ib) - totdrad(k,ib)
            htrb(k,ib) = heatfac*(fnet(k-1)-fnet(k)) / delp(k)
          enddo
        enddo
      endif

! ..................................
      end subroutine rtrn
! ----------------------------------


! ----------------------------------
      subroutine rtrnmr                                                 &
! ..................................
!  ---  inputs:
     &     ( semiss,delp,cldfrc,taucld,secdif,                          &
     &       pklay,pklev,pkbnd,fracs,tautot,                            &
     &       nlay, nlp1,                                                &
!  ---  outputs:
     &       totuflux,totdflux,htr, totuclfl,totdclfl,htrcl, htrb       &
     &     )

!  ===================  program usage description  ===================  !
!                                                                       !
! purpose:  compute the upward/downward radiative fluxes, and heating   !
! rates for both clear or cloudy atmosphere.  clouds are assumed as in  !
! maximum-randomly overlaping in a vertical colum.                      !
!                                                                       !
! subprograms called:  none                                             !
!                                                                       !
!  ====================  defination of variables  ====================  !
!                                                                       !
!  inputs:                                                     -size-   !
!   semiss  - real, lw surface emissivity                         nbands!
!   delp    - real, layer pressure thickness (mb)                  nlay !
!   cldfrc  - real, layer cloud fraction                         0:nlp1 !
!   taucld  - real, layer cloud opt depth                    nlay*ngptlw!
!   secdif  - real, secant of diffusivity angle                   nbands!
!   pklay   - real, integrated planck func at lay temp       nlay*nbands!
!   pklev   - real, integrated planck func at lev temp     0:nlay*nbands!
!   pkbnd   - real, planck value for each band                    nbands!
!   fracs   - real, planck fractions                         nlay*ngptlw!
!   tautot  - real, total optical depth (gas+aerosols)       nlay*ngptlw!
!   nlay    - integer, number of vertical layers                    1   !
!   nlp1    - integer, number of vertical levels (interfaces)       1   !
!                                                                       !
!  outputs:                                                             !
!   totuflux- real, total sky upward flux (w/m2)                 0:nlay !
!   totdflux- real, total sky downward flux (w/m2)               0:nlay !
!   htr     - real, total sky heating rate (k/sec or k/day)        nlay !
!   totuclfl- real, clear sky upward flux (w/m2)                 0:nlay !
!   totdclfl- real, clear sky downward flux (w/m2)               0:nlay !
!   htrcl   - real, clear sky heating rate (k/sec or k/day)        nlay !
!   htrb    - real, spectral band lw heating rate (k/day)    nlay*nbands!
!                                                                       !
!  module veriables:                                                    !
!   delwave - real, band wavenumber intervals                     nbands!
!   ngb     - integer, band index for each g-value                ngptlw!
!   fluxfac - real, conversion factor for fluxes (pi*2.e4)           1  !
!   heatfac - real, conversion factor for heating rates (g/cp*1e-2)  1  !
!   tblint  - real, conversion factor for look-up tbl (float(ntbl)   1  !
!   bpade   - real, pade approx constant (1/0.278)                   1  !
!   wtdiff  - real, weight for radiance to flux conversion           1  !
!   ntbl    - integer, dimension of look-up tables                   1  !
!   tau_tbl - real, clr-sky opt dep lookup table                 0:ntbl !
!   exp_tbl - real, transmittance lookup table                   0:ntbl !
!   tfn_tbl - real, tau transition function                      0:ntbl !
!                                                                       !
!  local variables:                                                     !
!    itgas  - integer, index for gases contribution look-up table    1  !
!    ittot  - integer, index for gases plus clouds  look-up table    1  !
!    reflct - real, surface reflectance                              1  !
!    atrgas - real, gaseous absorptivity                           nlay !
!    atrtot - real, gaseous and cloud absorptivity                 nlay !
!    odcld  - real, cloud optical depth                      nlay*ngptlw!
!    odepth - real, optical depth of gaseous only                    1  !
!    odtot  - real, optical depth of gas and cloud                   1  !
!    gasfac - real, gas-only pade factor, used for planck function   1  !
!    totfac - real, gas and cloud pade factor, used for planck fn    1  !
!    bbdgas - real, gas-only planck function for downward rt         1  !
!    bbugas - real, gas-only planck function for upward rt         nlay !
!    bbdtot - real, gas and cloud planck function for downward rt    1  !
!    bbutot - real, gas and cloud planck function for upward rt    nlay !
!    gassrc - real, source radiance due to gas only                  1  !
!    totsrc - real, source radiance due to gas and cloud             1  !
!    efclrfr- real, effective clear sky fraction (1-efcldfr) nlay*ngptlw!
!    rtotu  - real, spectrally summed total sky upward radiance      1  !
!    rclru  - real, spectrally summed clear sky upward radiance      1  !
!    toturad- real, total sky upward radiance by layer     0:nlay*nbands!
!    clrurad- real, clear sky upward radiance by layer     0:nlay,nbands!
!    totdrad- real, total sky downward radiance by layer   0:nlay,nbands!
!    clrdrad- real, clear sky downward radiance by layer   0:nlay,nbands!
!    radtotd- real, spectrally summed total sky downward radiance    1  !
!    radclrd- real, spectrally summed clear sky downward radiance    1  !
!    fnet   - real, net longwave flux (w/m2)                     0:nlay !
!    fnetc  - real, clear sky net longwave flux (w/m2)           0:nlay !
!                                                                       !
!                                                                       !
!  *******************************************************************  !
!  original code description                                            !
!                                                                       !
!  original version:   e. j. mlawer, et al. rrtm_v3.0                   !
!  revision for gcms:  michael j. iacono; october, 2002                 !
!  revision for f90:   michael j. iacono; june, 2006                    !
!                                                                       !
!  this program calculates the upward fluxes, downward fluxes, and      !
!  heating rates for an arbitrary clear or cloudy atmosphere. the input !
!  to this program is the atmospheric profile, all Planck function      !
!  information, and the cloud fraction by layer.  a variable diffusivity!
!  angle (secdif) is used for the angle integration. bands 2-3 and 5-9  !
!  use a value for secdif that varies from 1.50 to 1.80 as a function   !
!  of the column water vapor, and other bands use a value of 1.66.  the !
!  gaussian weight appropriate to this angle (wtdiff=0.5) is applied    !
!  here.  note that use of the emissivity angle for the flux integration!
!  can cause errors of 1 to 4 W/m2 within cloudy layers.                !
!  clouds are treated with a maximum-random cloud overlap method.       !
!                                                                       !
!  *******************************************************************  !
!  ======================  end of description block  =================  !

!  ---  inputs:
      integer, intent(in) :: nlay, nlp1

      real (kind=kind_phys), dimension(0:),  intent(in) :: cldfrc
      real (kind=kind_phys), dimension(:),   intent(in) :: semiss,      &
     &       delp, secdif, pkbnd

      real (kind=kind_phys), dimension(:,:), intent(in) :: taucld,      &
     &       pklay, fracs, tautot

      real (kind=kind_phys), dimension(0:,:),intent(in) :: pklev

!  ---  outputs:
      real (kind=kind_phys), dimension(:),  intent(out) :: htr, htrcl
      real (kind=kind_phys), dimension(:,:),intent(out) :: htrb

      real (kind=kind_phys), dimension(0:), intent(out) ::              &
     &       totuflux, totdflux, totuclfl, totdclfl

!  ---  locals:
      real (kind=kind_phys), parameter :: rec_6 = 0.166667

      real (kind=kind_phys), dimension(0:nlay,nbands) :: clrurad,       &
     &       clrdrad, toturad, totdrad
      real (kind=kind_phys), dimension(nlay,ngptlw) :: odcld

      real (kind=kind_phys), dimension(0:nlay) :: fnet, fnetc
      real (kind=kind_phys), dimension(nlay)   :: atrtot, atrgas,       &
     &        bbugas, bbutot, trngas

      real (kind=kind_phys) :: totsrc, gassrc, tblind, odepth, odtot,   &
     &        trntot, reflct, totfac, gasfac, flxfac, rtotu, rclru,     &
     &        plfrac, blay, bbdgas, bbdtot, dplnku, dplnkd, rad0,       &
     &        radtotd, radclrd, totradd, clrradd, totradu, clrradu,     &
     &        fmax, fmin, rat1, rat2, rad, radmod

      integer :: ittot, itgas, ib, ig, k

!  dimensions for cloud overlap adjustment
      real (kind=kind_phys), dimension(nlp1) :: faccld1u, faccld2u,     &
     &        facclr1u, facclr2u, faccmb1u, faccmb2u
      real (kind=kind_phys), dimension(0:nlay) :: faccld1d, faccld2d,   &
     &        facclr1d, facclr2d, faccmb1d, faccmb2d

      logical :: lstcldu(nlay), lstcldd(nlay)
!
!===> ...  begin here
!
      do k = 1, nlp1
        faccld1u(k) = f_zero
        faccld2u(k) = f_zero
        facclr1u(k) = f_zero
        facclr2u(k) = f_zero
        faccmb1u(k) = f_zero
        faccmb2u(k) = f_zero
      enddo

      lstcldu(1) = cldfrc(1) > eps
      rat1 = f_zero
      rat2 = f_zero

      do k = 1, nlay-1

        lstcldu(k+1) = cldfrc(k+1)>eps .and. cldfrc(k)<=eps

        if (cldfrc(k) > eps) then
!  --- ...  maximum/random cloud overlap

          if (cldfrc(k+1) >= cldfrc(k)) then
            if (lstcldu(k)) then
              if (cldfrc(k) < f_one) then
                facclr2u(k+1) = (cldfrc(k+1) - cldfrc(k))               &
     &                        / (f_one - cldfrc(k))
              endif
              facclr2u(k) = f_zero
              faccld2u(k) = f_zero
            else
              fmax = max(cldfrc(k), cldfrc(k-1))
              if (cldfrc(k+1) > fmax) then
                facclr1u(k+1) = rat2
                facclr2u(k+1) = (cldfrc(k+1) - fmax)/(f_one - fmax)
              elseif (cldfrc(k+1) < fmax) then
                facclr1u(k+1) = (cldfrc(k+1) - cldfrc(k))               &
     &                        / (cldfrc(k-1) - cldfrc(k))
              else
                facclr1u(k+1) = rat2
              endif
            endif

            if (facclr1u(k+1)>f_zero .or. facclr2u(k+1)>f_zero) then
              rat1 = f_one
              rat2 = f_zero
            else
              rat1 = f_zero
              rat2 = f_zero
            endif
          else
            if (lstcldu(k)) then
              faccld2u(k+1) = (cldfrc(k) - cldfrc(k+1)) / cldfrc(k)
              facclr2u(k) = f_zero
              faccld2u(k) = f_zero
            else
              fmin = min(cldfrc(k), cldfrc(k-1))
              if (cldfrc(k+1) <= fmin) then
                faccld1u(k+1) = rat1
                faccld2u(k+1) = (fmin - cldfrc(k+1)) / fmin
              else
                faccld1u(k+1) = (cldfrc(k) - cldfrc(k+1))               &
     &                        / (cldfrc(k) - fmin)
              endif
            endif

            if (faccld1u(k+1)>f_zero .or. faccld2u(k+1)>f_zero) then
              rat1 = f_zero
              rat2 = f_one
            else
              rat1 = f_zero
              rat2 = f_zero
            endif
          endif

          faccmb1u(k+1) = facclr1u(k+1) * faccld2u(k) * cldfrc(k-1)
          faccmb2u(k+1) = faccld1u(k+1) * facclr2u(k)                   &
     &                  * (f_one - cldfrc(k-1))
        endif

      enddo

      do k = 0, nlay
        faccld1d(k) = f_zero
        faccld2d(k) = f_zero
        facclr1d(k) = f_zero
        facclr2d(k) = f_zero
        faccmb1d(k) = f_zero
        faccmb2d(k) = f_zero
      enddo

      lstcldd(nlay) = cldfrc(nlay) > eps
      rat1 = f_zero
      rat2 = f_zero

      do k = nlay, 2, -1

        lstcldd(k-1) = cldfrc(k-1) > eps .and. cldfrc(k)<=eps

        if (cldfrc(k) > eps) then

          if (cldfrc(k-1) >= cldfrc(k)) then
            if (lstcldd(k)) then
              if (cldfrc(k) < f_one) then
                facclr2d(k-1) = (cldfrc(k-1) - cldfrc(k))               &
     &                        / (f_one - cldfrc(k))
              endif

              facclr2d(k) = f_zero
              faccld2d(k) = f_zero
            else
              fmax = max(cldfrc(k), cldfrc(k+1))

              if (cldfrc(k-1) > fmax) then
                facclr1d(k-1) = rat2
                facclr2d(k-1) = (cldfrc(k-1) - fmax) / (f_one - fmax)
              elseif (cldfrc(k-1) < fmax) then
                facclr1d(k-1) = (cldfrc(k-1) - cldfrc(k))               &
     &                        / (cldfrc(k+1) - cldfrc(k))
              else
                facclr1d(k-1) = rat2
              endif
            endif

            if (facclr1d(k-1)>f_zero .or. facclr2d(k-1)>f_zero) then
              rat1 = f_one
              rat2 = f_zero
            else
              rat1 = f_zero
              rat2 = f_zero
            endif
          else
            if (lstcldd(k)) then
              faccld2d(k-1) = (cldfrc(k) - cldfrc(k-1)) / cldfrc(k)
              facclr2d(k) = f_zero
              faccld2d(k) = f_zero
            else
              fmin = min(cldfrc(k), cldfrc(k+1))

              if (cldfrc(k-1) <= fmin) then
                faccld1d(k-1) = rat1
                faccld2d(k-1) = (fmin - cldfrc(k-1)) / fmin
              else
                faccld1d(k-1) = (cldfrc(k) - cldfrc(k-1))               &
     &                        / (cldfrc(k) - fmin)
              endif
            endif

            if (faccld1d(k-1)>f_zero .or. faccld2d(k-1)>f_zero) then
              rat1 = f_zero
              rat2 = f_one
            else
              rat1 = f_zero
              rat2 = f_zero
            endif
          endif

          faccmb1d(k-1) = facclr1d(k-1) * faccld2d(k) * cldfrc(k+1)
          faccmb2d(k-1) = faccld1d(k-1) * facclr2d(k)                   &
     &                  * (f_one - cldfrc(k+1))
        endif

      enddo

      toturad = f_zero
      totdrad = f_zero
      clrurad = f_zero
      clrdrad = f_zero

      totuflux(0) = f_zero
      totdflux(0) = f_zero
      totuclfl(0) = f_zero
      totdclfl(0) = f_zero

      do k = 1, nlay
        totuflux(k) = f_zero
        totdflux(k) = f_zero
        totuclfl(k) = f_zero
        totdclfl(k) = f_zero
      enddo

      odcld(:,:) = f_zero
      do ig = 1, ngptlw
        ib = ngb(ig)

        do k = 1, nlay
          if (cldfrc(k) >= eps) then
            odcld(k,ig) = secdif(ib) * taucld(k,ig)
          endif
        enddo
      enddo

!  --- ...  loop over all g-points

      do ig = 1, ngptlw
        ib = ngb(ig)

        radtotd = f_zero
        radclrd = f_zero

!  --- ...  downward radiative transfer loop.

        do k = nlay, 1, -1

          plfrac = fracs(k,ig)
          blay = pklay(k,ib)
          dplnku = pklev(k,ib) - blay
          dplnkd = pklev(k-1,ib) - blay
          odepth = max( f_zero, secdif(ib)*tautot(k,ig) )

!  --- ...  clear sky, gases contribution

          if (odepth <= 0.06) then
            atrgas(k) = odepth - 0.5*odepth*odepth
            trngas(k) = f_one - atrgas(k)
            gasfac    = rec_6 * odepth
          else
            tblind = odepth / (bpade + odepth)
            itgas = tblint*tblind + 0.5
            trngas(k) = exp_tbl(itgas)
            atrgas(k) = f_one - trngas(k)
            gasfac    = tfn_tbl(itgas)
          endif

          bbdgas    = plfrac*(blay + dplnkd*gasfac)
          bbugas(k) = plfrac*(blay + dplnku*gasfac)
          gassrc    = bbdgas*atrgas(k)

!  --- ...  total sky, gases+clouds contribution

          if (lstcldd(k)) then
            totradd = cldfrc(k) * radtotd
            clrradd = radtotd - totradd
            rad = f_zero
          endif

          if (cldfrc(k) >= eps) then
!  --- ...  it is a cloudy layer

            odtot = odepth + odcld(k,ig)

            if (odtot < 0.06) then
              totfac    = rec_6 * odtot
              atrtot(k) = odtot - 0.5*odtot*odtot
              trntot    = f_one - atrtot(k)
            elseif (odepth <= 0.06) then
              tblind = odtot / (bpade + odtot)
              ittot  = tblint*tblind + 0.5

              totfac    = tfn_tbl(ittot)
              trntot    = exp_tbl(ittot)
              atrtot(k) = f_one - trntot
            else
              odepth = tau_tbl(itgas)
              odtot  = odepth + odcld(k,ig)
              tblind = odtot / (bpade + odtot)
              ittot  = tblint*tblind + 0.5

              totfac    = tfn_tbl(ittot)
              trntot    = exp_tbl(ittot)
              atrtot(k) = f_one - trntot
            endif

            bbdtot    = plfrac*(blay + dplnkd*totfac)
            bbutot(k) = plfrac*(blay + dplnku*totfac)
            totsrc    = bbdtot*atrtot(k)

            totradd = totradd*trntot + cldfrc(k)*totsrc
            clrradd = clrradd*trngas(k) + (f_one - cldfrc(k))*gassrc

!  --- ...  total sky radiance
            radtotd = totradd + clrradd
            totdrad(k-1,ib) = totdrad(k-1,ib) + radtotd

!  --- ...  clear sky radiance
            radclrd = radclrd*trngas(k) + gassrc
            clrdrad(k-1,ib) = clrdrad(k-1,ib) + radclrd

            radmod = rad*(facclr1d(k-1)*trngas(k)+faccld1d(k-1)*trntot) &
     &             - faccmb1d(k-1)*gassrc + faccmb2d(k-1)*totsrc

            rad = -radmod + facclr2d(k-1)*(clrradd + radmod)            &
     &                    - faccld2d(k-1)*(totradd - radmod)
            totradd = totradd + rad
            clrradd = clrradd - rad

          else

!  --- ...  it is a clear layer
            radtotd = radtotd*trngas(k) + gassrc
            totdrad(k-1,ib) = totdrad(k-1,ib) + radtotd

            radclrd = radclrd*trngas(k) + gassrc
            clrdrad(k-1,ib) = clrdrad(k-1,ib) + radclrd

          endif

        enddo   ! end do_k_loop

!  --- ...  spectral emissivity & reflectance
!           include the contribution of spectrally varying longwave emissivity
!           and reflection from the surface to the upward radiative transfer.
!     note: spectral and Lambertian reflection are identical for the
!           diffusivity angle flux integration used here.

        rad0 = fracs(1,ig) * pkbnd(ib)

!  --- ...  add in reflection of surface downward radiance.
        reflct = 1.0 - semiss(ib)
        rtotu = rad0 + reflct*radtotd
        rclru = rad0 + reflct*radclrd

!  --- ...  upward radiative transfer loop.
        toturad(0,ib) = toturad(0,ib) + rtotu
        clrurad(0,ib) = clrurad(0,ib) + rclru

        do k = 1, nlay

          gassrc = bbugas(k)*atrgas(k)
          totsrc = bbutot(k)*atrtot(k)

          if (lstcldu(k)) then
            totradu = cldfrc(k) * rtotu
            clrradu = rtotu - totradu
            rad = f_zero
          endif

          if (cldfrc(k) >= eps) then

!  --- ...  it is a cloudy layer
            trntot = f_one - atrtot(k)
            totradu = totradu*trntot + cldfrc(k)*totsrc
            clrradu = clrradu*trngas(k) + (f_one - cldfrc(k))*gassrc

!  --- ...  total sky radiance
            rtotu = totradu + clrradu
            toturad(k,ib) = toturad(k,ib) + rtotu

!  --- ...  clear sky radiance
            rclru = rclru*trngas(k) + gassrc
            clrurad(k,ib) = clrurad(k,ib) + rclru

            radmod = rad*(facclr1u(k+1)*trngas(k)+faccld1u(k+1)*trntot) &
     &             - faccmb1u(k+1)*gassrc + faccmb2u(k+1)*totsrc
            rad = -radmod + facclr2u(k+1)*(clrradu + radmod)            &
     &                    - faccld2u(k+1)*(totradu - radmod)
            totradu = totradu + rad
            clrradu = clrradu - rad

          else

!  --- ...  it is a clear layer
            rtotu = rtotu*trngas(k) + gassrc
            toturad(k,ib) = toturad(k,ib) + rtotu

            rclru = rclru*trngas(k) + gassrc
            clrurad(k,ib) = clrurad(k,ib) + rclru

          endif

        enddo   ! end do_k_loop

      enddo   ! end do_ig_loop

!  --- ...  process longwave output from band for total and clear streams.
!           calculate upward, downward, and net flux.

      do ib = 1, nbands
        flxfac = wtdiff * fluxfac * delwave(ib)

        do k = 0, nlay
          toturad(k,ib) = toturad(k,ib) * flxfac
          totdrad(k,ib) = totdrad(k,ib) * flxfac
          clrurad(k,ib) = clrurad(k,ib) * flxfac
          clrdrad(k,ib) = clrdrad(k,ib) * flxfac

          totuflux(k) = totuflux(k) + toturad(k,ib)
          totdflux(k) = totdflux(k) + totdrad(k,ib)
          totuclfl(k) = totuclfl(k) + clrurad(k,ib)
          totdclfl(k) = totdclfl(k) + clrdrad(k,ib)
        enddo
      enddo

!  --- ...  calculate net fluxes and heating rates
      fnet(0) = totuflux(0) - totdflux(0)

      do k = 1, nlay
        fnet(k) = totuflux(k) - totdflux(k)
        htr (k) = heatfac*(fnet(k-1) - fnet(k)) / delp(k)
      enddo

!! --- ...  optional clear sky heating rates
      if ( lhlw0 ) then
        fnetc(0) = totuclfl(0) - totdclfl(0)

        do k = 1, nlay
          fnetc(k) = totuclfl(k) - totdclfl(k)
          htrcl(k) = heatfac*(fnetc(k-1)-fnetc(k)) / delp(k)
        enddo
      endif

!! --- ...  optional spectral band heating rates
      if ( lhlwb ) then
        do ib = 1, nbands
          fnet(0) = toturad(0,ib) - totdrad(0,ib)

          do k = 1, nlay
            fnet(k) = toturad(k,ib) - totdrad(k,ib)
            htrb(k,ib) = heatfac*(fnet(k-1)-fnet(k)) / delp(k)
          enddo
        enddo
      endif

! .................................
      end subroutine rtrnmr
! ---------------------------------


! ---------------------------------
      subroutine rtrnmc                                                 &
! .................................
!  ---  inputs:
     &     ( semiss,delp,cldfmc,taucmc,secdif,                          &
     &       pklay,pklev,pkbnd,fracs,tautot,                            &
     &       nlay, nlp1,me,                                             &
!  ---  outputs:
     &       totuflux,totdflux,htr, totuclfl,totdclfl,htrcl, htrb       &
     &     )

!  ===================  program usage description  ===================  !
!                                                                       !
! purpose:  compute the upward/downward radiative fluxes, and heating   !
! rates for both clear or cloudy atmosphere.  clouds are treated with   !
! the mcica stochastic approach.                                        !
!                                                                       !
! subprograms called:  none                                             !
!                                                                       !
!  ====================  defination of variables  ====================  !
!                                                                       !
!  inputs:                                                     -size-   !
!   semiss  - real, lw surface emissivity                         nbands!
!   delp    - real, layer pressure thickness (mb)                  nlay !
!   cldfmc  - real, layer cloud fraction                     nlay*ngptlw!
!   taucmc  - real, layer cloud opt depth                    nlay*ngptlw!
!   secdif  - real, secant of diffusivity angle                   nbands!
!   pklay   - real, integrated planck func at lay temp       nlay*nbands!
!   pklev   - real, integrated planck func at lev temp     0:nlay*nbands!
!   pkbnd   - real, planck value for each band                    nbands!
!   fracs   - real, planck fractions                         nlay*ngptlw!
!   tautot  - real, total optical depth (gas+aerosols)       nlay*ngptlw!
!   nlay    - integer, number of vertical layers                    1   !
!   nlp1    - integer, number of vertical levels (interfaces)       1   !
!                                                                       !
!  outputs:                                                             !
!   totuflux- real, total sky upward flux (w/m2)                 0:nlay !
!   totdflux- real, total sky downward flux (w/m2)               0:nlay !
!   htr     - real, total sky heating rate (k/sec or k/day)        nlay !
!   totuclfl- real, clear sky upward flux (w/m2)                 0:nlay !
!   totdclfl- real, clear sky downward flux (w/m2)               0:nlay !
!   htrcl   - real, clear sky heating rate (k/sec or k/day)        nlay !
!   htrb    - real, spectral band lw heating rate (k/day)    nlay*nbands!
!                                                                       !
!  module veriables:                                                    !
!   delwave - real, band wavenumber intervals                     nbands!
!   ngb     - integer, band index for each g-value                ngptlw!
!   fluxfac - real, conversion factor for fluxes (pi*2.e4)           1  !
!   heatfac - real, conversion factor for heating rates (g/cp*1e-2)  1  !
!   tblint  - real, conversion factor for look-up tbl (float(ntbl)   1  !
!   bpade   - real, pade approx constant (1/0.278)                   1  !
!   wtdiff  - real, weight for radiance to flux conversion           1  !
!   ntbl    - integer, dimension of look-up tables                   1  !
!   tau_tbl - real, clr-sky opt dep lookup table                 0:ntbl !
!   exp_tbl - real, transmittance lookup table                   0:ntbl !
!   tfn_tbl - real, tau transition function                      0:ntbl !
!                                                                       !
!  local variables:                                                     !
!    itgas  - integer, index for gases contribution look-up table    1  !
!    ittot  - integer, index for gases plus clouds  look-up table    1  !
!    reflct - real, surface reflectance                              1  !
!    atrgas - real, gaseous absorptivity                           nlay !
!    atrtot - real, gaseous and cloud absorptivity                 nlay !
!    odcld  - real, cloud optical depth                      nlay*ngptlw!
!    odepth - real, optical depth of gaseous only                    1  !
!    odtot  - real, optical depth of gas and cloud                   1  !
!    gasfac - real, gas-only pade factor, used for planck function   1  !
!    totfac - real, gas and cloud pade factor, used for planck fn    1  !
!    bbdgas - real, gas-only planck function for downward rt         1  !
!    bbugas - real, gas-only planck function for upward rt         nlay !
!    bbdtot - real, gas and cloud planck function for downward rt    1  !
!    bbutot - real, gas and cloud planck function for upward rt    nlay !
!    gassrc - real, source radiance due to gas only                  1  !
!    totsrc - real, source radiance due to gas and cloud             1  !
!    efclrfr- real, effective clear sky fraction (1-efcldfr) nlay*ngptlw!
!    rtotu  - real, spectrally summed total sky upward radiance      1  !
!    rclru  - real, spectrally summed clear sky upward radiance      1  !
!    toturad- real, total sky upward radiance by layer     0:nlay*nbands!
!    clrurad- real, clear sky upward radiance by layer     0:nlay,nbands!
!    totdrad- real, total sky downward radiance by layer   0:nlay,nbands!
!    clrdrad- real, clear sky downward radiance by layer   0:nlay,nbands!
!    radtotd- real, spectrally summed total sky downward radiance    1  !
!    radclrd- real, spectrally summed clear sky downward radiance    1  !
!    fnet   - real, net longwave flux (w/m2)                     0:nlay !
!    fnetc  - real, clear sky net longwave flux (w/m2)           0:nlay !
!                                                                       !
!                                                                       !
!  *******************************************************************  !
!  original code description                                            !
!                                                                       !
!  original version:   e. j. mlawer, et al. rrtm_v3.0                   !
!  revision for gcms:  michael j. iacono; october, 2002                 !
!  revision for f90:   michael j. iacono; june, 2006                    !
!                                                                       !
!  this program calculates the upward fluxes, downward fluxes, and      !
!  heating rates for an arbitrary clear or cloudy atmosphere. the input !
!  to this program is the atmospheric profile, all Planck function      !
!  information, and the cloud fraction by layer.  a variable diffusivity!
!  angle (secdif) is used for the angle integration. bands 2-3 and 5-9  !
!  use a value for secdif that varies from 1.50 to 1.80 as a function   !
!  of the column water vapor, and other bands use a value of 1.66.  the !
!  gaussian weight appropriate to this angle (wtdiff=0.5) is applied    !
!  here.  note that use of the emissivity angle for the flux integration!
!  can cause errors of 1 to 4 W/m2 within cloudy layers.                !
!  clouds are treated with the mcica stochastic approach and            !
!  maximum-random cloud overlap.                                        !
!                                                                       !
!  *******************************************************************  !
!  ======================  end of description block  =================  !
      implicit none
!  ---  inputs:
      integer, intent(in) :: nlay, nlp1, me

      real (kind=kind_phys), dimension(:),   intent(in) :: semiss,      &
     &       delp, secdif, pkbnd

      real (kind=kind_phys), dimension(:,:), intent(in) :: taucmc,      &
     &       cldfmc, pklay, fracs, tautot

      real (kind=kind_phys), dimension(0:,:),intent(in) :: pklev

!  ---  outputs:
      real (kind=kind_phys), dimension(:),  intent(out) :: htr, htrcl
      real (kind=kind_phys), dimension(:,:),intent(out) :: htrb

      real (kind=kind_phys), dimension(0:), intent(out) ::              &
     &       totuflux, totdflux, totuclfl, totdclfl

!  ---  locals:
      real (kind=kind_phys), parameter :: rec_6 = 0.166667

      real (kind=kind_phys), dimension(0:nlay,nbands) :: clrurad,       &
     &       clrdrad, toturad, totdrad
      real (kind=kind_phys), dimension(nlay,ngptlw) :: efclrfr, odcld

      real (kind=kind_phys), dimension(0:nlay) :: fnet, fnetc
      real (kind=kind_phys), dimension(nlay)   :: atrtot, atrgas,       &
     &        bbugas, bbutot, trngas

      real (kind=kind_phys) :: totsrc, gassrc, tblind, odepth, odtot,   &
     &        trntot, reflct, totfac, gasfac, flxfac, rtotu, rclru,     &
     &        plfrac, blay, bbdgas, bbdtot, dplnku, dplnkd, rad0,       &
     &        radtotd, radclrd

      integer :: ittot, itgas, ib, ig, k
!
!===> ...  begin here
!
      toturad = f_zero
      totdrad = f_zero
      clrurad = f_zero
      clrdrad = f_zero

      totuflux(0) = f_zero
      totdflux(0) = f_zero
      totuclfl(0) = f_zero
      totdclfl(0) = f_zero

      do k = 1, nlay
        totuflux(k) = f_zero
        totdflux(k) = f_zero
        totuclfl(k) = f_zero
        totdclfl(k) = f_zero
      enddo

      do ig = 1, ngptlw
        ib = ngb(ig)

        do k = 1, nlay
          if (cldfmc(k,ig) >= eps) then
            odcld(k,ig) = secdif(ib) * taucmc(k,ig)
            efclrfr(k,ig) = f_one-(f_one-exp(-odcld(k,ig)))*cldfmc(k,ig)
          else
            odcld(k,ig) = f_zero
            efclrfr(k,ig) = f_one
          endif
        enddo
      enddo

!  --- ...  loop over all g-points

      do ig = 1, ngptlw
        ib = ngb(ig)

        radtotd = f_zero
        radclrd = f_zero

!  --- ...  downward radiative transfer loop.

        do k = nlay, 1, -1

          plfrac = fracs(k,ig)
          blay = pklay(k,ib)
          dplnku = pklev(k,ib) - blay
          dplnkd = pklev(k-1,ib) - blay
          odepth = max( f_zero, secdif(ib)*tautot(k,ig) )

!  --- ...  clear sky, gases contribution

          if (odepth <= 0.06) then
            atrgas(k) = odepth - 0.5*odepth*odepth
            trngas(k) = f_one - atrgas(k)
            gasfac    = rec_6 * odepth
          else
            tblind = odepth / (bpade + odepth)
            itgas = tblint*tblind + 0.5
            trngas(k) = exp_tbl(itgas)
            atrgas(k) = f_one - trngas(k)
            gasfac    = tfn_tbl(itgas)
          endif

          bbdgas    = plfrac*(blay + dplnkd*gasfac)
          bbugas(k) = plfrac*(blay + dplnku*gasfac)
          gassrc    = bbdgas*atrgas(k)

!  --- ...  total sky, gases+clouds contribution

          if (cldfmc(k,ig) >= eps) then
!  --- ...  it is a cloudy layer

            odtot = odepth + odcld(k,ig)

            if (odtot < 0.06) then
              totfac    = rec_6 * odtot
              atrtot(k) = odtot - 0.5*odtot*odtot
              trntot    = f_one - atrtot(k)
            elseif (odepth <= 0.06) then
              tblind = odtot / (bpade + odtot)
              ittot  = tblint*tblind + 0.5d0
              totfac    = tfn_tbl(ittot)
              trntot    = exp_tbl(ittot)
              atrtot(k) = f_one - trntot
            else
              odepth = tau_tbl(itgas)
              odtot  = odepth + odcld(k,ig)
              tblind = odtot / (bpade + odtot)
              ittot  = tblint*tblind + 0.5

              totfac    = tfn_tbl(ittot)
              trntot    = exp_tbl(ittot)
              atrtot(k) = f_one - trntot
            endif

            bbdtot    = plfrac*(blay + dplnkd*totfac)
            bbutot(k) = plfrac*(blay + dplnku*totfac)
            totsrc    = bbdtot*atrtot(k)

!  --- ...  total sky radiance
            radtotd = radtotd*trngas(k)*efclrfr(k,ig) + gassrc          &
     &              + cldfmc(k,ig)*(totsrc - gassrc)
            totdrad(k-1,ib) = totdrad(k-1,ib) + radtotd

!  --- ...  clear sky radiance
            radclrd = radclrd*trngas(k) + gassrc
            clrdrad(k-1,ib) = clrdrad(k-1,ib) + radclrd

          else

!  --- ...  it is a clear layer
            radtotd = radtotd*trngas(k) + gassrc
            totdrad(k-1,ib) = totdrad(k-1,ib) + radtotd

            radclrd = radclrd*trngas(k) + gassrc
            clrdrad(k-1,ib) = clrdrad(k-1,ib) + radclrd

          endif

        enddo   ! end do_k_loop

!  --- ...  spectral emissivity & reflectance
!           include the contribution of spectrally varying longwave emissivity
!           and reflection from the surface to the upward radiative transfer.
!     note: spectral and Lambertian reflection are identical for the
!           diffusivity angle flux integration used here.

        rad0 = fracs(1,ig) * pkbnd(ib)

!  --- ...  add in reflection of surface downward radiance.
        reflct = f_one - semiss(ib)
        rtotu = rad0 + reflct*radtotd
        rclru = rad0 + reflct*radclrd

!  --- ...  upward radiative transfer loop.
        toturad(0,ib) = toturad(0,ib) + rtotu
        clrurad(0,ib) = clrurad(0,ib) + rclru

        do k = 1, nlay

          gassrc = bbugas(k)*atrgas(k)
          totsrc = bbutot(k)*atrtot(k)

          if (cldfmc(k,ig) > eps) then

!  --- ...  it is a cloudy layer
            rtotu = rtotu*trngas(k)*efclrfr(k,ig) + gassrc              &
     &            + cldfmc(k,ig)*(totsrc - gassrc)
            toturad(k,ib) = toturad(k,ib) + rtotu

            rclru = rclru*trngas(k) + gassrc
            clrurad(k,ib) = clrurad(k,ib) + rclru

          else

!  --- ...  it is a clear layer
            rtotu = rtotu*trngas(k) + gassrc
            toturad(k,ib) = toturad(k,ib) + rtotu

            rclru = rclru*trngas(k) + gassrc
            clrurad(k,ib) = clrurad(k,ib) + rclru

          endif

        enddo   ! end do_k_loop

      enddo   ! end do_ig_loop

!  --- ...  process longwave output from band for total and clear streams.
!           calculate upward, downward, and net flux.

      do ib = 1, nbands
        flxfac = wtdiff * fluxfac * delwave(ib)

        do k = 0, nlay
          toturad(k,ib) = toturad(k,ib) * flxfac
          totdrad(k,ib) = totdrad(k,ib) * flxfac
          clrurad(k,ib) = clrurad(k,ib) * flxfac
          clrdrad(k,ib) = clrdrad(k,ib) * flxfac

          totuflux(k) = totuflux(k) + toturad(k,ib)
          totdflux(k) = totdflux(k) + totdrad(k,ib)
          totuclfl(k) = totuclfl(k) + clrurad(k,ib)
          totdclfl(k) = totdclfl(k) + clrdrad(k,ib)
        enddo
      enddo

!  --- ...  calculate net fluxes and heating rates
      fnet(0) = totuflux(0) - totdflux(0)

      do k = 1, nlay
        fnet(k) = totuflux(k) - totdflux(k)
        htr (k) = heatfac*(fnet(k-1) - fnet(k)) / delp(k)
      enddo

!! --- ...  optional clear sky heating rates
      if ( lhlw0 ) then
        fnetc(0) = totuclfl(0) - totdclfl(0)

        do k = 1, nlay
          fnetc(k) = totuclfl(k) - totdclfl(k)
          htrcl(k) = heatfac*(fnetc(k-1)-fnetc(k)) / delp(k)
        enddo
      endif

!! --- ...  optional spectral band heating rates
      if ( lhlwb ) then
        do ib = 1, nbands
          fnet(0) = toturad(0,ib) - totdrad(0,ib)

          do k = 1, nlay
            fnet(k) = toturad(k,ib) - totdrad(k,ib)
            htrb(k,ib) = heatfac*(fnet(k-1)-fnet(k)) / delp(k)
          enddo
        enddo
      endif

! ..................................
      end subroutine rtrnmc
! ----------------------------------


! ----------------------------------
      subroutine taumol                                                 &
! ..................................
!  ---  inputs:
     &     ( laytrop,pavel,coldry,colamt,colbrd,wx,tauaer,              &
     &       rfrate,fac00,fac01,fac10,fac11,jp,jt,jt1,                  &
     &       selffac,selffrac,indself,forfac,forfrac,indfor,            &
     &       minorfrac,scaleminor,scaleminorn2,indminor,                &
     &       nlay,                                                      &
!  ---  outputs:
     &       fracs, tautot                                              &
     &     )

!  ************    original subprogram description    ***************   !
!                                                                       !
!                  optical depths developed for the                     !
!                                                                       !
!                rapid radiative transfer model (rrtm)                  !
!                                                                       !
!            atmospheric and environmental research, inc.               !
!                        131 hartwell avenue                            !
!                        lexington, ma 02421                            !
!                                                                       !
!                           eli j. mlawer                               !
!                         jennifer delamere                             !
!                         steven j. taubman                             !
!                         shepard a. clough                             !
!                                                                       !
!                       email:  mlawer@aer.com                          !
!                       email:  jdelamer@aer.com                        !
!                                                                       !
!        the authors wish to acknowledge the contributions of the       !
!        following people:  karen cady-pereira, patrick d. brown,       !
!        michael j. iacono, ronald e. farren, luke chen,                !
!        robert bergstrom.                                              !
!                                                                       !
!  revision for g-point reduction: michael j. iacono; aer, inc.         !
!                                                                       !
!     taumol                                                            !
!                                                                       !
!     this file contains the subroutines taugbn (where n goes from      !
!     1 to 16).  taugbn calculates the optical depths and planck        !
!     fractions per g-value and layer for band n.                       !
!                                                                       !
!  *******************************************************************  !
!  ==================   program usage description   ==================  !
!                                                                       !
!    call  taumol                                                       !
!       inputs:                                                         !
!          ( laytrop,pavel,coldry,colamt,colbrd,wx,tauaer,              !
!            rfrate,fac00,fac01,fac10,fac11,jp,jt,jt1,                  !
!            selffac,selffrac,indself,forfac,forfrac,indfor,            !
!            minorfrac,scaleminor,scaleminorn2,indminor,                !
!            nlay,                                                      !
!       outputs:                                                        !
!            fracs, tautot )                                            !
!                                                                       !
!  subprograms called:  taugb## (## = 01 -16)                           !
!                                                                       !
!                                                                       !
!  ====================  defination of variables  ====================  !
!                                                                       !
!  inputs:                                                        size  !
!     laytrop   - integer, tropopause layer index (unitless)        1   !
!                   layer at which switch is made for key species       !
!     pavel     - real, layer pressures (mb)                       nlay !
!     coldry    - real, column amount for dry air (mol/cm2)        nlay !
!     colamt    - real, column amounts of h2o, co2, o3, n2o, ch4,       !
!                   o2, co (mol/cm**2)                       nlay*maxgas!
!     colbrd    - real, column amount of broadening gases          nlay !
!     wx        - real, cross-section amounts(mol/cm2)      nlay*maxxsec!
!     tauaer    - real, aerosol optical depth               nlay*nbands !
!     rfrate    - real, reference ratios of binary species parameter    !
!     (:,m,:)m=1-h2o/co2,2-h2o/o3,3-h2o/n2o,4-h2o/ch4,5-n2o/co2,6-o3/co2!
!     (:,:,n)n=1,2: the rates of ref press at the 2 sides of the layer  !
!                                                          nlay*nrates*2!
!     facij     - real, factors multiply the reference ks, i,j of 0/1   !
!                   for lower/higher of the 2 appropriate temperatures  !
!                   and altitudes                                  nlay !
!     jp        - real, index of lower reference pressure          nlay !
!     jt, jt1   - real, indices of lower reference temperatures    nlay !
!                   for pressure levels jp and jp+1, respectively       !
!     selffac   - real, scale factor for water vapor self-continuum     !
!                   equals (water vapor density)/(atmospheric density   !
!                   at 296k and 1013 mb)                           nlay !
!     selffrac  - real, factor for temperature interpolation of         !
!                   reference water vapor self-continuum data      nlay !
!     indself   - integer, index of lower reference temperature for     !
!                   the self-continuum interpolation               nlay !
!     forfac    - real, scale factor for w. v. foreign-continuum   nlay !
!     forfrac   - real, factor for temperature interpolation of         !
!                   reference w.v. foreign-continuum data          nlay !
!     indfor    - integer, index of lower reference temperature for     !
!                   the foreign-continuum interpolation            nlay !
!     minorfrac - real, factor for minor gases                     nlay !
!     scaleminor,scaleminorn2                                           !
!               - real, scale factors for minor gases              nlay !
!     indminor  - integer, index of lower reference temperature for     !
!                   minor gases                                    nlay !
!     nlay      - integer, total number of layers                   1   !
!                                                                       !
!  outputs:                                                             !
!     fracs     - real, planck fractions                     nlay*ngptlw!
!     tautot    - real, total optical depth (gas+aerosols)   nlay*ngptlw!
!                                                                       !
!  internal variables:                                                  !
!     ng##      - integer, number of g-values in band ## (##=01-16) 1   !
!     nspa      - integer, for lower atmosphere, the number of ref      !
!                   atmos, each has different relative amounts of the   !
!                   key species for the band                      nbands!
!     nspb      - integer, same but for upper atmosphere          nbands!
!     absa      - real, k-values for lower ref atmospheres (no w.v.     !
!                   self-continuum) (cm**2/molecule)  nspa(##)*5*13*ng##!
!     absb      - real, k-values for high ref atmospheres (all sources) !
!                   (cm**2/molecule)               nspb(##)*5*13:59*ng##!
!     ka_m'mgas'- real, k-values for low ref atmospheres minor species  !
!                   (cm**2/molecule)                          mmn##*ng##!
!     kb_m'mgas'- real, k-values for high ref atmospheres minor species !
!                   (cm**2/molecule)                          mmn##*ng##!
!     selfref   - real, k-values for w.v. self-continuum for ref atmos  !
!                   used below laytrop (cm**2/mol)               10*ng##!
!     forref    - real, k-values for w.v. foreign-continuum for ref atmos
!                   used below/above laytrop (cm**2/mol)          4*ng##!
!                                                                       !
!  ******************************************************************   !

!  ---  inputs:
      integer, intent(in) :: nlay, laytrop

      integer, dimension(:), intent(in) ::   jp, jt, jt1, indself,      &
     &       indfor, indminor

      real (kind=kind_phys), dimension(:), intent(in) :: pavel, coldry, &
     &       colbrd, fac00, fac01, fac10, fac11, selffac, selffrac,     &
     &       forfac, forfrac, minorfrac, scaleminor, scaleminorn2

      real (kind=kind_phys), dimension(:,:), intent(in) :: colamt, wx,  &
     &       tauaer

      real (kind=kind_phys), dimension(:,:,:), intent(in) :: rfrate

!  ---  outputs:
      real (kind=kind_phys), dimension(:,:),intent(out) :: fracs,tautot

!  ---  locals
      real (kind=kind_phys), dimension(nlay,ngptlw) :: taug

      integer :: ib, ig, k
!
!===> ...  begin here
!
      call taugb01
      call taugb02
      call taugb03
      call taugb04
      call taugb05
      call taugb06
      call taugb07
      call taugb08
      call taugb09
      call taugb10
      call taugb11
      call taugb12
      call taugb13
      call taugb14
      call taugb15
      call taugb16

!  ---  combine gaseous and aerosol optical depths

      do ig = 1, ngptlw
        ib = ngb(ig)

        do k = 1, nlay
          tautot(k,ig) = taug(k,ig) + tauaer(k,ib)
        enddo
      enddo

! =================
      contains
! =================

! ----------------------------------
      subroutine taugb01
! ..................................

!  ------------------------------------------------------------------  !
!  written by eli j. mlawer, atmospheric & environmental research.     !
!  revised by michael j. iacono, atmospheric & environmental research. !
!                                                                      !
!     band 1:  10-350 cm-1 (low key - h2o; low minor - n2)             !
!                          (high key - h2o; high minor - n2)           !
!                                                                      !
!  compute the optical depth by interpolating in ln(pressure) and      !
!  temperature.  below laytrop, the water vapor self-continuum and     !
!  foreign continuum is interpolated (in temperature) separately.      !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb01

!  ---  locals:
      integer :: k, ind0, ind1, inds, indf, indm, ig
      real (kind=kind_phys) :: pp, corradj, scalen2, tauself, taufor,   &
     &       taun2
!
!===> ...  begin here
!
!  ---  minor gas mapping levels:
!     lower - n2, p = 142.5490 mbar, t = 215.70 k
!     upper - n2, p = 142.5490 mbar, t = 215.70 k

!  --- ...  lower atmosphere loop

      do k = 1, laytrop

        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(1) + 1
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(1) + 1
        inds = indself(k)
        indf = indfor(k)
        indm = indminor(k)
        pp = pavel(k)
        corradj =  f_one
        if (pp < 250.0) then
          corradj = f_one - 0.15 * (250.0-pp) / 154.4
        endif
        scalen2 = colbrd(k) * scaleminorn2(k)

        do ig = 1, ng01
          tauself = selffac(k) * (selfref(inds,ig) + selffrac(k)        &
     &            * (selfref(inds+1,ig) - selfref(inds,ig)))
          taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)           &
     &            * (forref(indf+1,ig) -  forref(indf,ig))) 
          taun2   = scalen2*(ka_mn2(indm,ig) + minorfrac(k)             &
     &            * (ka_mn2(indm+1,ig) - ka_mn2(indm,ig)))

          taug(k,ig) = corradj * (colamt(k,1)                           &
     &      * (fac00(k)*absa(ind0,ig) + fac10(k)*absa(ind0+1,ig)        &
     &      +  fac01(k)*absa(ind1,ig) + fac11(k)*absa(ind1+1,ig))       &
     &      + tauself + taufor + taun2)

          fracs(k,ig) = fracrefa(ig)
        enddo
      enddo

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay

        ind0 = ((jp(k)-13)*5 + (jt (k)-1)) * nspb(1) + 1
        ind1 = ((jp(k)-12)*5 + (jt1(k)-1)) * nspb(1) + 1
        indf = indfor(k)
        indm = indminor(k)
        pp = pavel(k)
        corradj =  f_one - 0.15 * (pp / 95.6)

        scalen2 = colbrd(k) * scaleminorn2(k)
        do ig = 1, ng01
          taufor = forfac(k) * (forref(indf,ig) + forfrac(k)            &
     &           * (forref(indf+1,ig) - forref(indf,ig))) 
          taun2  = scalen2*(kb_mn2(indm,ig) + minorfrac(k)              &
     &           * (kb_mn2(indm+1,ig) - kb_mn2(indm,ig)))

          taug(k,ig) = corradj * (colamt(k,1)                           &
     &      * (fac00(k)*absb(ind0,ig) + fac10(k)*absb(ind0+1,ig)        &
     &      +  fac01(k)*absb(ind1,ig) + fac11(k)*absb(ind1+1,ig))       &
     &      + taufor + taun2)

          fracs(k,ig) = fracrefb(ig)
        enddo
      enddo

! ..................................
      end subroutine taugb01
! ----------------------------------

! ----------------------------------
      subroutine taugb02
! ..................................

!  ------------------------------------------------------------------  !
!     band 2:  350-500 cm-1 (low key - h2o; high key - h2o)            !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb02

!  ---  locals:
      integer :: k, ind0, ind1, inds, indf, ig

      real (kind=kind_phys) :: pp, corradj, tauself, taufor
!
!===> ...  begin here
!
!  --- ...  lower atmosphere loop

      do k = 1, laytrop

        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(2) + 1
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(2) + 1
        inds = indself(k)
        indf = indfor(k)
        pp = pavel(k)
        corradj = f_one - 0.05 * (pp - 100.0) / 900.0

        do ig = 1, ng02
          tauself = selffac(k) * (selfref(inds,ig) + selffrac(k)        &
     &            * (selfref(inds+1,ig) - selfref(inds,ig)))
          taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)           &
     &            * (forref(indf+1,ig) - forref(indf,ig))) 

          taug(k,ns02+ig) = corradj * (colamt(k,1)                      &
     &      * (fac00(k)*absa(ind0,ig) + fac10(k)*absa(ind0+1,ig)        &
     &      +  fac01(k)*absa(ind1,ig) + fac11(k)*absa(ind1+1,ig))       &
     &      + tauself + taufor)

          fracs(k,ns02+ig) = fracrefa(ig)
        enddo
      enddo

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay
        ind0 = ((jp(k)-13)*5 + (jt (k)-1)) * nspb(2) + 1
        ind1 = ((jp(k)-12)*5 + (jt1(k)-1)) * nspb(2) + 1
        indf = indfor(k)

        do ig = 1, ng02
          taufor = forfac(k) * (forref(indf,ig) + forfrac(k)            &
     &           * (forref(indf+1,ig) - forref(indf,ig))) 

          taug(k,ns02+ig) = colamt(k,1)                                 &
     &      * (fac00(k)*absb(ind0,ig) + fac10(k)*absb(ind0+1,ig)        &
     &      +  fac01(k)*absb(ind1,ig) + fac11(k)*absb(ind1+1,ig))       &
     &      + taufor

          fracs(k,ns02+ig) = fracrefb(ig)
        enddo
      enddo

! ..................................
      end subroutine taugb02
! ----------------------------------

! ----------------------------------
      subroutine taugb03
! ..................................

!  ------------------------------------------------------------------  !
!     band 3:  500-630 cm-1 (low key - h2o,co2; low minor - n2o)       !
!                           (high key - h2o,co2; high minor - n2o)     !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb03

!  ---  locals:
      integer :: k, ind0, ind1, inds, indf, indm, ig, js,js1, jmn2o, jpl

      real (kind=kind_phys) :: fmn2omf, ratn2o, adjfac, adjcoln2o,      &
     &      speccomb,       specparm,       specmult,       fs,         &
     &      speccomb1,      specparm1,      specmult1,      fs1,        &
     &      speccomb_mn2o,  specparm_mn2o,  specmult_mn2o,  fmn2o,      &
     &      speccomb_planck,specparm_planck,specmult_planck,fpl,        &
     &      refrat_planck_a, refrat_planck_b, refrat_m_a, refrat_m_b,   &
     &      fac000, fac100, fac200, fac010, fac110, fac210,             &
     &      fac001, fac101, fac201, fac011, fac111, fac211,             &
     &      tauself, taufor, n2om1, n2om2, absn2o, p, p4, fk0, fk1,     &
     &      fk2, temp, tau_major, tau_major1
!
!===> ...  begin here
!
!  --- ...  minor gas mapping levels:
!     lower - n2o, p = 706.272 mbar, t = 278.94 k
!     upper - n2o, p = 95.58 mbar, t = 215.7 k

      refrat_planck_a = chi_mls(1,9)/chi_mls(2,9)    ! P = 212.725 mb
      refrat_planck_b = chi_mls(1,13)/chi_mls(2,13)  ! P = 95.58   mb
      refrat_m_a      = chi_mls(1,3)/chi_mls(2,3)    ! P = 706.270 mb
      refrat_m_b      = chi_mls(1,13)/chi_mls(2,13)  ! P = 95.58   mb

!  --- ...  lower atmosphere loop

      do k = 1, laytrop

        speccomb = colamt(k,1) + rfrate(k,1,1)*colamt(k,2)
        specparm = colamt(k,1) / speccomb
        if (specparm >= oneminus) specparm = oneminus
        specmult = 8.0 * specparm
        js = 1 + int(specmult)
        fs = mod(specmult, f_one)        

        speccomb1 = colamt(k,1) + rfrate(k,1,2)*colamt(k,2)
        specparm1 = colamt(k,1) / speccomb1
        if (specparm1 >= oneminus) specparm1 = oneminus
        specmult1 = 8.0 * specparm1
        js1 = 1 + int(specmult1)
        fs1 = mod(specmult1, f_one)

        speccomb_mn2o = colamt(k,1) + refrat_m_a*colamt(k,2)
        specparm_mn2o = colamt(k,1) / speccomb_mn2o
        if (specparm_mn2o >= oneminus) specparm_mn2o = oneminus
        specmult_mn2o = 8.0 * specparm_mn2o
        jmn2o = 1 + int(specmult_mn2o)
        fmn2o = mod(specmult_mn2o, f_one)
        fmn2omf = minorfrac(k) * fmn2o

!  --- ...  in atmospheres where the amount of n2O is too great to be considered
!           a minor species, adjust the column amount of n2O by an empirical factor
!           to obtain the proper contribution.

        temp = coldry(k) * chi_mls(4,jp(k)+1)
        ratn2o = colamt(k,4) / temp
        if (ratn2o > 1.5) then
          adjfac = 0.5 + (ratn2o - 0.5)**0.65
          adjcoln2o = adjfac * temp
        else
          adjcoln2o = colamt(k,4)
        endif

        speccomb_planck = colamt(k,1) + refrat_planck_a*colamt(k,2)
        specparm_planck = colamt(k,1) / speccomb_planck
        if (specparm_planck >= oneminus) specparm_planck=oneminus
        specmult_planck = 8.0 * specparm_planck
        jpl = 1 + int(specmult_planck)
        fpl = mod(specmult_planck, f_one)

        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(3) + js
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(3) + js1
        inds = indself(k)
        indf = indfor(k)
        indm = indminor(k)

        if (specparm < 0.125) then
          p = fs - 1.0
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)
        else if (specparm > 0.875) then
          p = -fs 
          p4 = p**4
          fk0 = p4
          fk1 = 1.0 - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)
        else
          fac000 = (f_one - fs) * fac00(k)
          fac010 = (f_one - fs) * fac10(k)
          fac100 = fs * fac00(k)
          fac110 = fs * fac10(k)
        endif

        if (specparm1 < 0.125) then
          p = fs1 - 1.0
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)
        elseif (specparm1 > 0.875) then
          p = -fs1
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)
        else
          fac001 = (f_one - fs1) * fac01(k)
          fac011 = (f_one - fs1) * fac11(k)
          fac101 = fs1 * fac01(k)
          fac111 = fs1 * fac11(k)
        endif

        do ig = 1, ng03
          tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)         &
     &        * (selfref(inds+1,ig) - selfref(inds,ig)))
          taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)           &
     &        * (forref(indf+1,ig) - forref(indf,ig)))
          n2om1   = ka_mn2o(jmn2o,indm,ig) + fmn2o                      &
     &        * (ka_mn2o(jmn2o+1,indm,ig) - ka_mn2o(jmn2o,indm,ig))
          n2om2   = ka_mn2o(jmn2o,indm+1,ig) + fmn2o                    &
     &        * (ka_mn2o(jmn2o+1,indm+1,ig) - ka_mn2o(jmn2o,indm+1,ig))
          absn2o  = n2om1 + minorfrac(k) * (n2om2 - n2om1)

          if (specparm < 0.125) then
            tau_major = speccomb                                        &
     &         * (fac000*absa(ind0   ,ig) + fac100*absa(ind0+ 1,ig)     &
     &         +  fac200*absa(ind0+ 2,ig) + fac010*absa(ind0+ 9,ig)     &
     &         +  fac110*absa(ind0+10,ig) + fac210*absa(ind0+11,ig)) 
          elseif (specparm > 0.875) then
            tau_major = speccomb                                        &
     &         * (fac200*absa(ind0-1,ig) + fac100*absa(ind0   ,ig)      &
     &         +  fac000*absa(ind0+1,ig) + fac210*absa(ind0+ 8,ig)      &
     &         +  fac110*absa(ind0+9,ig) + fac010*absa(ind0+10,ig))
          else
            tau_major = speccomb                                        &
     &         * (fac000*absa(ind0  ,ig) + fac100*absa(ind0+ 1,ig)      &
     &         +  fac010*absa(ind0+9,ig) + fac110*absa(ind0+10,ig))
          endif

          if (specparm1 < 0.125) then
            tau_major1 = speccomb1                                      &
     &         * (fac001*absa(ind1   ,ig) + fac101*absa(ind1+ 1,ig)     &
     &         +  fac201*absa(ind1+ 2,ig) + fac011*absa(ind1+ 9,ig)     &
     &         +  fac111*absa(ind1+10,ig) + fac211*absa(ind1+11,ig))
          elseif (specparm1 > 0.875) then
            tau_major1 = speccomb1                                      &
     &         * (fac201*absa(ind1-1,ig) + fac101*absa(ind1   ,ig)      &
     &         +  fac001*absa(ind1+1,ig) + fac211*absa(ind1+ 8,ig)      &
     &         +  fac111*absa(ind1+9,ig) + fac011*absa(ind1+10,ig))
          else
            tau_major1 = speccomb1                                      &
     &         * (fac001*absa(ind1  ,ig) + fac101*absa(ind1+ 1,ig)      &
     &         +  fac011*absa(ind1+9,ig) + fac111*absa(ind1+10,ig))
          endif

          taug(k,ns03+ig) = tau_major + tau_major1                      &
     &                    + tauself + taufor + adjcoln2o*absn2o

          fracs(k,NS03+ig) = fracrefa(ig,jpl)                           &
     &                   + fpl*(fracrefa(ig,jpl+1) - fracrefa(ig,jpl))
        enddo   ! end do_ig_loop

      enddo     ! end do_k_loop

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay

        speccomb = colamt(k,1) + rfrate(k,1,1)*colamt(k,2)
        specparm = colamt(k,1) / speccomb
        if (specparm >= oneminus) specparm = oneminus
        specmult = 4.0 * specparm
        js = 1 + int(specmult)
        fs = mod(specmult, f_one)

        speccomb1 = colamt(k,1) + rfrate(k,1,2)*colamt(k,2)
        specparm1 = colamt(k,1) / speccomb1
        if (specparm1 >= oneminus) specparm1 = oneminus
        specmult1 = 4.0 * specparm1
        js1 = 1 + int(specmult1)
        fs1 = mod(specmult1, f_one)

        fac000 = (f_one - fs) * fac00(k)
        fac010 = (f_one - fs) * fac10(k)
        fac100 = fs * fac00(k)
        fac110 = fs * fac10(k)
        fac001 = (f_one - fs1) * fac01(k)
        fac011 = (f_one - fs1) * fac11(k)
        fac101 = fs1 * fac01(k)
        fac111 = fs1 * fac11(k)

        speccomb_mn2o = colamt(k,1) + refrat_m_b*colamt(k,2)
        specparm_mn2o = colamt(k,1) / speccomb_mn2o
        if (specparm_mn2o >= oneminus) specparm_mn2o = oneminus
        specmult_mn2o = 4.0 * specparm_mn2o
        jmn2o = 1 + int(specmult_mn2o)
        fmn2o = mod(specmult_mn2o, f_one)
        fmn2omf = minorfrac(k) * fmn2o

!  --- ...  in atmospheres where the amount of n2o is too great to be considered
!           a minor species, adjust the column amount of N2O by an empirical factor
!           to obtain the proper contribution.

        temp   = coldry(k) * chi_mls(4,jp(k)+1)
        ratn2o = colamt(k,4) / temp
        if (ratn2o > 1.5) then
          adjfac = 0.5 + (ratn2o - 0.5)**0.65
          adjcoln2o = adjfac * temp
        else
          adjcoln2o = colamt(k,4)
        endif

        speccomb_planck = colamt(k,1) + refrat_planck_b*colamt(k,2)
        specparm_planck = colamt(k,1) / speccomb_planck
        if (specparm_planck >= oneminus) specparm_planck=oneminus
        specmult_planck = 4.0 * specparm_planck
        jpl = 1 + int(specmult_planck)
        fpl = mod(specmult_planck, f_one)

        ind0 = ((jp(k)-13)*5 + (jt (k)-1)) * nspb(3) + js
        ind1 = ((jp(k)-12)*5 + (jt1(k)-1)) * nspb(3) + js1
        indf = indfor(k)
        indm = indminor(k)

        do ig = 1, ng03
          taufor = forfac(k) * (forref(indf,ig) + forfrac(k)            &
     &           * (forref(indf+1,ig) - forref(indf,ig))) 
          n2om1 = kb_mn2o(jmn2o,indm,ig) + fmn2o                        &
     &       * (kb_mn2o(jmn2o+1,indm,ig) - kb_mn2o(jmn2o,indm,ig))
          n2om2 = kb_mn2o(jmn2o,indm+1,ig) + fmn2o                      &
     &       * (kb_mn2o(jmn2o+1,indm+1,ig) - kb_mn2o(jmn2o,indm+1,ig))
          absn2o = n2om1 + minorfrac(k) * (n2om2 - n2om1)

          taug(k,ns03+ig) = speccomb                                    &
     &       * (fac000*absb(ind0  ,ig) + fac100*absb(ind0+1,ig)         &
     &       +  fac010*absb(ind0+5,ig) + fac110*absb(ind0+6,ig))        &
     &       + speccomb1                                                &
     &       * (fac001*absb(ind1  ,ig) + fac101*absb(ind1+1,ig)         &
     &       +  fac011*absb(ind1+5,ig) + fac111*absb(ind1+6,ig))        &
     &       + taufor + adjcoln2o*absn2o            

          fracs(k,ns03+ig) = fracrefb(ig,jpl) + fpl                     &
     &       * (fracrefb(ig,jpl+1)-fracrefb(ig,jpl))
        enddo

      enddo

! ..................................
      end subroutine taugb03
! ----------------------------------

! ----------------------------------
      subroutine taugb04
! ..................................

!  ------------------------------------------------------------------  !
!     band 4:  630-700 cm-1 (low key - h2o,co2; high key - o3,co2)     !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb04

!  ---  locals:
      integer :: k, ind0, ind1, inds, indf, ig, js, js1, jpl

      real (kind=kind_phys) :: tauself, taufor, p, p4, fk0, fk1, fk2,   &
     &      speccomb,       specparm,       specmult,       fs,         &
     &      speccomb1,      specparm1,      specmult1,      fs1,        &
     &      speccomb_planck,specparm_planck,specmult_planck,fpl,        &
     &      fac000, fac100, fac200, fac010, fac110, fac210,             &
     &      fac001, fac101, fac201, fac011, fac111, fac211,             &
     &      refrat_planck_a, refrat_planck_b, tau_major, tau_major1
!
!===> ...  begin here
!
      refrat_planck_a = chi_mls(1,11)/chi_mls(2,11)     ! P = 142.5940 mb
      refrat_planck_b = chi_mls(3,13)/chi_mls(2,13)     ! P = 95.58350 mb

!  --- ...  lower atmosphere loop

      do k = 1, laytrop

        speccomb = colamt(k,1) + rfrate(k,1,1)*colamt(k,2)
        specparm = colamt(k,1) / speccomb
        if (specparm >= oneminus) specparm = oneminus
        specmult = 8.0 * specparm
        js = 1 + int(specmult)
        fs = mod(specmult, f_one)

        speccomb1 = colamt(k,1) + rfrate(k,1,2)*colamt(k,2)
        specparm1 = colamt(k,1) / speccomb1
        if (specparm1 >= oneminus) specparm1 = oneminus
        specmult1 = 8.0 * specparm1
        js1 = 1 + int(specmult1)
        fs1 = mod(specmult1, f_one)

        speccomb_planck = colamt(k,1) + refrat_planck_a*colamt(k,2)
        specparm_planck = colamt(k,1) / speccomb_planck
        if (specparm_planck >= oneminus) specparm_planck=oneminus
        specmult_planck = 8.0 * specparm_planck
        jpl = 1 + int(specmult_planck)
        fpl = mod(specmult_planck, 1.0)

        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(4) + js
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(4) + js1
        inds = indself(k)
        indf = indfor(k)

        if (specparm < 0.125) then
          p = fs - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)
        elseif (specparm > 0.875) then
          p = -fs 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)
        else
          fac000 = (f_one - fs) * fac00(k)
          fac010 = (f_one - fs) * fac10(k)
          fac100 = fs * fac00(k)
          fac110 = fs * fac10(k)
        endif

        if (specparm1 < 0.125) then
          p = fs1 - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)
        elseif (specparm1 > 0.875) then
          p = -fs1 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)
        else
          fac001 = (f_one - fs1) * fac01(k)
          fac011 = (f_one - fs1) * fac11(k)
          fac101 = fs1 * fac01(k)
          fac111 = fs1 * fac11(k)
        endif

        do ig = 1, ng04
          tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)         &
     &            * (selfref(inds+1,ig) - selfref(inds,ig)))
          taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)           &
     &            * (forref(indf+1,ig) - forref(indf,ig))) 

          if (specparm < 0.125) then
            tau_major = speccomb                                        &
     &         * (fac000*absa(ind0   ,ig) + fac100*absa(ind0+ 1,ig)     &
     &         +  fac200*absa(ind0+ 2,ig) + fac010*absa(ind0+ 9,ig)     &
     &         +  fac110*absa(ind0+10,ig) + fac210*absa(ind0+11,ig))
          elseif (specparm > 0.875) then
            tau_major = speccomb                                        &
     &         * (fac200*absa(ind0-1,ig) + fac100*absa(ind0   ,ig)      &
     &         +  fac000*absa(ind0+1,ig) + fac210*absa(ind0+ 8,ig)      &
     &         +  fac110*absa(ind0+9,ig) + fac010*absa(ind0+10,ig))
          else
            tau_major = speccomb                                        &
     &         * (fac000*absa(ind0  ,ig) + fac100*absa(ind0+ 1,ig)      &
     &         +  fac010*absa(ind0+9,ig) + fac110*absa(ind0+10,ig))
          endif

          if (specparm1 < 0.125) then
            tau_major1 = speccomb1                                      &
     &         * (fac001*absa(ind1   ,ig) + fac101*absa(ind1+ 1,ig)     &
     &         +  fac201*absa(ind1+ 2,ig) + fac011*absa(ind1+ 9,ig)     &
     &         +  fac111*absa(ind1+10,ig) + fac211*absa(ind1+11,ig))
          elseif (specparm1 > 0.875) then
            tau_major1 = speccomb1                                      &
     &         * (fac201*absa(ind1-1,ig) + fac101*absa(ind1   ,ig)      &
     &         +  fac001*absa(ind1+1,ig) + fac211*absa(ind1+ 8,ig)      &
     &         +  fac111*absa(ind1+9,ig) + fac011*absa(ind1+10,ig))
          else
            tau_major1 = speccomb1                                      &
     &         * (fac001*absa(ind1  ,ig) + fac101*absa(ind1+ 1,ig)      &
     &         +  fac011*absa(ind1+9,ig) + fac111*absa(ind1+10,ig))
          endif

          taug(k,ns04+ig) = tau_major + tau_major1 + tauself + taufor

          fracs(k,ns04+ig) = fracrefa(ig,jpl)                           &
     &                + fpl*(fracrefa(ig,jpl+1) - fracrefa(ig,jpl))
        enddo   ! end do_ig_loop

      enddo     ! end do_k_loop

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay

        speccomb = colamt(k,3) + rfrate(k,6,1)*colamt(k,2)
        specparm = colamt(k,3) / speccomb
        if (specparm >= oneminus) specparm = oneminus
        specmult = 4.0 * specparm
        js = 1 + int(specmult)
        fs = mod(specmult, f_one)

        speccomb1 = colamt(k,3) + rfrate(k,6,2)*colamt(k,2)
        specparm1 = colamt(k,3) / speccomb1
        if (specparm1 >= oneminus) specparm1 = oneminus
        specmult1 = 4.0 * specparm1
        js1 = 1 + int(specmult1)
        fs1 = mod(specmult1, f_one)

        fac000 = (f_one - fs) * fac00(k)
        fac010 = (f_one - fs) * fac10(k)
        fac100 = fs * fac00(k)
        fac110 = fs * fac10(k)
        fac001 = (f_one - fs1) * fac01(k)
        fac011 = (f_one - fs1) * fac11(k)
        fac101 = fs1 * fac01(k)
        fac111 = fs1 * fac11(k)

        speccomb_planck = colamt(k,3) + refrat_planck_b*colamt(k,2)
        specparm_planck = colamt(k,3) / speccomb_planck
        if (specparm_planck >= oneminus) specparm_planck=oneminus
        specmult_planck = 4.0 * specparm_planck
        jpl = 1 + int(specmult_planck)
        fpl = mod(specmult_planck, f_one)

        ind0 = ((jp(k)-13)*5 + (jt (k)-1)) * nspb(4) + js
        ind1 = ((jp(k)-12)*5 + (jt1(k)-1)) * nspb(4) + js1

        do ig = 1, ng04
          taug(k,ns04+ig) =  speccomb                                   &
     &       * (fac000*absb(ind0  ,ig) + fac100*absb(ind0+1,ig)         &
     &       +  fac010*absb(ind0+5,ig) + fac110*absb(ind0+6,ig))        &
     &       + speccomb1                                                &
     &       * (fac001*absb(ind1  ,ig) + fac101*absb(ind1+1,ig)         &
     &       +  fac011*absb(ind1+5,ig) + fac111*absb(ind1+6,ig)) 

          fracs(k,ns04+ig) = fracrefb(ig,jpl) + fpl                     &
     &       * (fracrefb(ig,jpl+1) - fracrefb(ig,jpl))
        enddo

!  --- ...  empirical modification to code to improve stratospheric cooling rates
!           for co2. revised to apply weighting for g-point reduction in this band.

        taug(k,ns04+ 8) = taug(k,ns04+ 8) * 0.92
        taug(k,ns04+ 9) = taug(k,ns04+ 9) * 0.88
        taug(k,ns04+10) = taug(k,ns04+10) * 1.07
        taug(k,ns04+11) = taug(k,ns04+11) * 1.1
        taug(k,ns04+12) = taug(k,ns04+12) * 0.99
        taug(k,ns04+13) = taug(k,ns04+13) * 0.88
        taug(k,ns04+14) = taug(k,ns04+14) * 0.943

      enddo   ! end do_k_loop

! ..................................
      end subroutine taugb04
! ----------------------------------

! ----------------------------------
      subroutine taugb05
! ..................................

!  ------------------------------------------------------------------  !
!     band 5:  700-820 cm-1 (low key - h2o,co2; low minor - o3, ccl4)  !
!                           (high key - o3,co2)                        !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb05

!  ---  locals: 
      integer :: k, ind0, ind1, inds, indf, indm, ig, js, js1, jmo3, jpl

      real (kind=kind_phys)  :: tauself, taufor, o3m1, o3m2, abso3,     &
     &      speccomb,       specparm,       specmult,       fs,         &
     &      speccomb1,      specparm1,      specmult1,      fs1,        &
     &      speccomb_mo3,   specparm_mo3,   specmult_mo3,   fmo3,       &
     &      speccomb_planck,specparm_planck,specmult_planck,fpl,        &
     &      refrat_planck_a, refrat_planck_b, refrat_m_a,               &
     &      fac000, fac100, fac200, fac010, fac110, fac210,             &
     &      fac001, fac101, fac201, fac011, fac111, fac211,             &
     &      p, p4, fk0, fk1, fk2
!
!===> ...  begin here
!
!  --- ...  minor gas mapping level :
!     lower - o3, p = 317.34 mbar, t = 240.77 k
!     lower - ccl4

!  --- ...  calculate reference ratio to be used in calculation of Planck
!           fraction in lower/upper atmosphere.

      refrat_planck_a = chi_mls(1,5)/chi_mls(2,5)      ! P = 473.420 mb
      refrat_planck_b = chi_mls(3,43)/chi_mls(2,43)    ! P = 0.2369  mb
      refrat_m_a = chi_mls(1,7)/chi_mls(2,7)           ! P = 317.348 mb

!  --- ...  lower atmosphere loop

      do k = 1, laytrop
        speccomb = colamt(k,1) + rfrate(k,1,1)*colamt(k,2)
        specparm = colamt(k,1) / speccomb
        if (specparm >= oneminus) specparm = oneminus
        specmult = 8.0 * specparm
        js = 1 + int(specmult)
        fs = mod(specmult, f_one)

        speccomb1 = colamt(k,1) + rfrate(k,1,2)*colamt(k,2)
        specparm1 = colamt(k,1) / speccomb1
        if (specparm1 >= oneminus) specparm1 = oneminus
        specmult1 = 8.0 * specparm1
        js1 = 1 + int(specmult1)
        fs1 = mod(specmult1, f_one)

        speccomb_mo3 = colamt(k,1) + refrat_m_a*colamt(k,2)
        specparm_mo3 = colamt(k,1) / speccomb_mo3
        if (specparm_mo3 >= oneminus) specparm_mo3 = oneminus
        specmult_mo3 = 8.0 * specparm_mo3
        jmo3 = 1 + int(specmult_mo3)
        fmo3 = mod(specmult_mo3, f_one)

        speccomb_planck = colamt(k,1) + refrat_planck_a*colamt(k,2)
        specparm_planck = colamt(k,1) / speccomb_planck
        if (specparm_planck >= oneminus) specparm_planck=oneminus
        specmult_planck = 8.0 * specparm_planck
        jpl= 1 + int(specmult_planck)
        fpl = mod(specmult_planck, f_one)

        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(5) + js
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(5) + js1
        inds = indself(k)
        indf = indfor(k)
        indm = indminor(k)

        if (specparm < 0.125 .and. specparm1 < 0.125) then
          p = fs - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)

          p = fs1 - 1.0
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)

          do ig = 1, ng05
            tauself = selffac(k) * (selfref(inds,ig) + selffrac(k)      &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            o3m1 = ka_mo3(jmo3,indm,ig) + fmo3                          &
     &           * (ka_mo3(jmo3+1,indm,ig) - ka_mo3(jmo3,indm,ig))
            o3m2 = ka_mo3(jmo3,indm+1,ig) + fmo3                        &
     &           * (ka_mo3(jmo3+1,indm+1,ig) - ka_mo3(jmo3,indm+1,ig))
            abso3 = o3m1 + minorfrac(k)*(o3m2-o3m1)

            taug(k,ns05+ig) = speccomb                                  &
     &         * (fac000*absa(ind0   ,ig) + fac100*absa(ind0+ 1,ig)     &
     &         +  fac200*absa(ind0+ 2,ig) + fac010*absa(ind0+ 9,ig)     &
     &         +  fac110*absa(ind0+10,ig) + fac210*absa(ind0+11,ig))    &
     &         + speccomb1                                              &
     &         * (fac001*absa(ind1   ,ig) + fac101*absa(ind1+ 1,ig)     &
     &         +  fac201*absa(ind1+ 2,ig) + fac011*absa(ind1+ 9,ig)     &
     &         +  fac111*absa(ind1+10,ig) + fac211*absa(ind1+11,ig))    &
     &         + tauself + taufor + abso3*colamt(k,3)                   &
     &         + wx(k,1)*ccl4(ig)

            fracs(k,ns05+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1) - fracrefa(ig,jpl))
          enddo
        elseif (specparm > 0.875 .and. specparm1 > 0.875) then
          p = -fs 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)

          p = -fs1 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)

          do ig = 1, ng05
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            o3m1 = ka_mo3(jmo3,indm,ig) + fmo3                          &
     &           * (ka_mo3(jmo3+1,indm,ig) - ka_mo3(jmo3,indm,ig))
            o3m2 = ka_mo3(jmo3,indm+1,ig) + fmo3                        &
     &           * (ka_mo3(jmo3+1,indm+1,ig) - ka_mo3(jmo3,indm+1,ig))
            abso3 = o3m1 + minorfrac(k)*(o3m2-o3m1)

            taug(k,ns05+ig) = speccomb                                  &
     &         * (fac200*absa(ind0-1,ig) + fac100*absa(ind0   ,ig)      &
     &         +  fac000*absa(ind0+1,ig) + fac210*absa(ind0+ 8,ig)      &
     &         +  fac110*absa(ind0+9,ig) + fac010*absa(ind0+10,ig))     &
     &         + speccomb1                                              &
     &         * (fac201*absa(ind1-1,ig) + fac101*absa(ind1   ,ig)      &
     &         +  fac001*absa(ind1+1,ig) + fac211*absa(ind1+ 8,ig)      &
     &         +  fac111*absa(ind1+9,ig) + fac011*absa(ind1+10,ig))     &
     &         + tauself + taufor + abso3*colamt(k,3)                   &
     &         + wx(k,1)*ccl4(ig)

            fracs(k,ns05+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        else
          fac000 = (f_one - fs) * fac00(k)
          fac010 = (f_one - fs) * fac10(k)
          fac100 = fs * fac00(k)
          fac110 = fs * fac10(k)

          fac001 = (f_one - fs1) * fac01(k)
          fac011 = (f_one - fs1) * fac11(k)
          fac101 = fs1 * fac01(k)
          fac111 = fs1 * fac11(k)

          do ig = 1, ng05
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            o3m1 = ka_mo3(jmo3,indm,ig) + fmo3                          &
     &           * (ka_mo3(jmo3+1,indm,ig)-ka_mo3(jmo3,indm,ig))
            o3m2 = ka_mo3(jmo3,indm+1,ig) + fmo3                        &
     &           * (ka_mo3(jmo3+1,indm+1,ig)-ka_mo3(jmo3,indm+1,ig))
            abso3 = o3m1 + minorfrac(k)*(o3m2-o3m1)

            taug(k,ns05+ig) = speccomb                                  &
     &         * (fac000*absa(ind0  ,ig) + fac100*absa(ind0+ 1,ig)      &
     &         +  fac010*absa(ind0+9,ig) + fac110*absa(ind0+10,ig))     &
     &         + speccomb1                                              &
     &         * (fac001*absa(ind1  ,ig) + fac101*absa(ind1+ 1,ig)      &
     &         +  fac011*absa(ind1+9,ig) + fac111*absa(ind1+10,ig))     &
     &         + tauself + taufor + abso3*colamt(k,3)                   &
     &         + wx(k,1)*ccl4(ig)

            fracs(k,ns05+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        endif
      enddo

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay
        speccomb = colamt(k,3) + rfrate(k,6,1)*colamt(k,2)
        specparm = colamt(k,3) / speccomb
        if (specparm >= oneminus) specparm = oneminus
        specmult = 4.0 * specparm
        js = 1 + int(specmult)
        fs = mod(specmult, f_one)

        speccomb1 = colamt(k,3) + rfrate(k,6,2)*colamt(k,2)
        specparm1 = colamt(k,3) / speccomb1
        if (specparm1 >= oneminus) specparm1 = oneminus
        specmult1 = 4.0 * specparm1
        js1 = 1 + int(specmult1)
        fs1 = mod(specmult1, f_one)

        fac000 = (1.0 - fs) * fac00(k)
        fac010 = (1.0 - fs) * fac10(k)
        fac100 = fs * fac00(k)
        fac110 = fs * fac10(k)
        fac001 = (1.0 - fs1) * fac01(k)
        fac011 = (1.0 - fs1) * fac11(k)
        fac101 = fs1 * fac01(k)
        fac111 = fs1 * fac11(k)

        speccomb_planck = colamt(k,3) + refrat_planck_b*colamt(k,2)
        specparm_planck = colamt(k,3) / speccomb_planck
        if (specparm_planck >= oneminus) specparm_planck=oneminus
        specmult_planck = 4.0 * specparm_planck
        jpl= 1 + int(specmult_planck)
        fpl = mod(specmult_planck, f_one)

        ind0 = ((jp(k)-13)*5 + (jt (k)-1)) * nspb(5) + js
        ind1 = ((jp(k)-12)*5 + (jt1(k)-1)) * nspb(5) + js1
         
        do ig = 1, ng05
          taug(k,ns05+ig) = speccomb                                    &
     &       * (fac000*absb(ind0  ,ig) + fac100*absb(ind0+1,ig)         &
     &       +  fac010*absb(ind0+5,ig) + fac110*absb(ind0+6,ig))        &
     &       + speccomb1                                                &
     &       * (fac001*absb(ind1  ,ig) + fac101*absb(ind1+1,ig)         &
     &       +  fac011*absb(ind1+5,ig) + fac111*absb(ind1+6,ig))        &
     &       + wx(k,1) * ccl4(ig)

          fracs(k,ns05+ig) = fracrefb(ig,jpl) + fpl                     &
     &       * (fracrefb(ig,jpl+1)-fracrefb(ig,jpl))
        enddo
      enddo

! ..................................
      end subroutine taugb05
! ----------------------------------

! ----------------------------------
      subroutine taugb06
! ..................................

!  ------------------------------------------------------------------  !
!     band 6:  820-980 cm-1 (low key - h2o; low minor - co2)           !
!                           (high key - none; high minor - cfc11, cfc12)
!  ------------------------------------------------------------------  !

      use module_radlw_kgb06

!  ---  locals: 
      integer :: k, ind0, ind1, inds, indf, indm, ig

      real (kind=kind_phys) :: ratco2, adjfac, adjcolco2, tauself,      &
     &      taufor, absco2, temp
!
!===> ...  begin here
!
!  --- ...  minor gas mapping level:
!     lower - co2, p = 706.2720 mb, t = 294.2 k
!     upper - cfc11, cfc12

!  --- ...  lower atmosphere loop

      do k = 1, laytrop

!  --- ...  in atmospheres where the amount of co2 is too great to be considered
!           a minor species, adjust the column amount of co2 by an empirical factor
!           to obtain the proper contribution.

        temp   = coldry(k) * chi_mls(2,jp(k)+1)
        ratco2 = colamt(k,2) / temp
        if (ratco2 > 3.0) then
          adjfac = 2.0 + (ratco2-2.0)**0.77
          adjcolco2 = adjfac * temp
        else
          adjcolco2 = colamt(k,2)
        endif

        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(6) + 1
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(6) + 1
        inds = indself(k)
        indf = indfor(k)
        indm = indminor(k)

        do ig = 1, ng06
          tauself = selffac(k) * (selfref(inds,ig) + selffrac(k)        &
     &            * (selfref(inds+1,ig) - selfref(inds,ig)))
          taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)           &
     &            * (forref(indf+1,ig) - forref(indf,ig)))
          absco2 = (ka_mco2(indm,ig) + minorfrac(k)                     &
     &           * (ka_mco2(indm+1,ig) - ka_mco2(indm,ig)))

          taug(k,ns06+ig) = colamt(k,1)                                 &
     &       * (fac00(k)*absa(ind0,ig) + fac10(k)*absa(ind0+1,ig)       &
     &       +  fac01(k)*absa(ind1,ig) + fac11(k)*absa(ind1+1,ig))      &
     &       + tauself + taufor + adjcolco2*absco2                      &
     &       + wx(k,2)*cfc11adj(ig) + wx(k,3)*cfc12(ig)

          fracs(k,ns06+ig) = fracrefa(ig)
        enddo
      enddo

!  --- ...  upper atmosphere loop
!           nothing important goes on above laytrop in this band.

      do k = laytrop+1, nlay
        do ig = 1, ng06
          taug(k,ns06+ig) = wx(k,2)*cfc11adj(ig) + wx(k,3)*cfc12(ig)

          fracs(k,ns06+ig) = fracrefa(ig)
        enddo
      enddo

! ..................................
      end subroutine taugb06
! ----------------------------------

! ----------------------------------
      subroutine taugb07
! ..................................

!  ------------------------------------------------------------------  !
!     band 7:  980-1080 cm-1 (low key - h2o,o3; low minor - co2)       !
!                            (high key - o3; high minor - co2)         !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb07

!  ---  locals:
      integer :: k, ind0, ind1, inds, indf, indm, ig, js,js1, jmco2, jpl

      real (kind=kind_phys) :: tauself, taufor, co2m1, co2m2, absco2,   &
     &      speccomb,       specparm,       specmult,       fs,         &
     &      speccomb1,      specparm1,      specmult1,      fs1,        &
     &      speccomb_mco2,  specparm_mco2,  specmult_mco2,  fmco2,      &
     &      speccomb_planck,specparm_planck,specmult_planck,fpl,        &
     &      refrat_planck_a, refrat_m_a, ratco2, adjfac, adjcolco2,     &
     &      fac000, fac100, fac200, fac010, fac110, fac210,             &
     &      fac001, fac101, fac201, fac011, fac111, fac211,             &
     &      p, p4, fk0, fk1, fk2, temp
!
!===> ...  begin here
!
!  --- ...  minor gas mapping level :
!     lower - co2, p = 706.2620 mbar, t= 278.94 k
!     upper - co2, p = 12.9350 mbar, t = 234.01 k

!  --- ...  calculate reference ratio to be used in calculation of Planck
!           fraction in lower atmosphere.

      refrat_planck_a = chi_mls(1,3)/chi_mls(3,3)     ! P = 706.2620 mb
      refrat_m_a = chi_mls(1,3)/chi_mls(3,3)          ! P = 706.2720 mb

!  --- ...  lower atmosphere loop

      do k = 1, laytrop
        speccomb = colamt(k,1) + rfrate(k,2,1)*colamt(k,3)
        specparm = colamt(k,1) / speccomb
        if (specparm >= oneminus) specparm = oneminus
        specmult = 8.0 * specparm
        js = 1 + int(specmult)
        fs = mod(specmult, f_one)

        speccomb1 = colamt(k,1) + rfrate(k,2,2)*colamt(k,3)
        specparm1 = colamt(k,1) / speccomb1
        if (specparm1 >= oneminus) specparm1 = oneminus
        specmult1 = 8.0 * specparm1
        js1 = 1 + int(specmult1)
        fs1 = mod(specmult1, f_one)

        speccomb_mco2 = colamt(k,1) + refrat_m_a*colamt(k,3)
        specparm_mco2 = colamt(k,1) / speccomb_mco2
        if (specparm_mco2 >= oneminus) specparm_mco2 = oneminus
        specmult_mco2 = 8.0 * specparm_mco2
        jmco2 = 1 + int(specmult_mco2)
        fmco2 = mod(specmult_mco2, f_one)

!  --- ...  in atmospheres where the amount of CO2 is too great to be considered
!           a minor species, adjust the column amount of CO2 by an empirical factor
!           to obtain the proper contribution.

        temp   = coldry(k) * chi_mls(2,jp(k)+1)
        ratco2 = colamt(k,2) / temp
        if (ratco2 > 3.0) then
          adjfac = 3.0 + (ratco2-3.0)**0.79
          adjcolco2 = adjfac * temp
        else
          adjcolco2 = colamt(k,2)
        endif

        speccomb_planck = colamt(k,1) + refrat_planck_a*colamt(k,3)
        specparm_planck = colamt(k,1) / speccomb_planck
        if (specparm_planck >= oneminus) specparm_planck=oneminus
        specmult_planck = 8.0 * specparm_planck
        jpl= 1 + int(specmult_planck)
        fpl = mod(specmult_planck, f_one)

        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(7) + js
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(7) + js1
        inds = indself(k)
        indf = indfor(k)
        indm = indminor(k)

        if (specparm < 0.125 .and. specparm1 < 0.125) then
          p = fs - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)

          p = fs1 - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)

          do ig = 1, ng07
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            co2m1 = ka_mco2(jmco2,indm,ig) + fmco2                      &
     &         * (ka_mco2(jmco2+1,indm,ig) - ka_mco2(jmco2,indm,ig))
            co2m2 = ka_mco2(jmco2,indm+1,ig) + fmco2                    &
     &         * (ka_mco2(jmco2+1,indm+1,ig) - ka_mco2(jmco2,indm+1,ig))
            absco2 = co2m1 + minorfrac(k) * (co2m2 - co2m1)

            taug(k,ns07+ig) = speccomb                                  &
     &         * (fac000*absa(ind0   ,ig) + fac100*absa(ind0+ 1,ig)     &
     &         +  fac200*absa(ind0+ 2,ig) + fac010*absa(ind0+ 9,ig)     &
     &         +  fac110*absa(ind0+10,ig) + fac210*absa(ind0+11,ig))    &
     &         + speccomb1                                              &
     &         * (fac001*absa(ind1   ,ig) + fac101*absa(ind1+ 1,ig)     &
     &         +  fac201*absa(ind1+ 2,ig) + fac011*absa(ind1+ 9,ig)     &
     &         +  fac111*absa(ind1+10,ig) + fac211*absa(ind1+11,ig))    &
     &         + tauself + taufor + adjcolco2*absco2

            fracs(k,ns07+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        elseif (specparm > 0.875 .and. specparm1 > 0.875) then
          p = -fs 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)

          p = -fs1 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)

          do ig = 1, ng07
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            co2m1 = ka_mco2(jmco2,indm,ig) + fmco2                      &
     &         * (ka_mco2(jmco2+1,indm,ig) - ka_mco2(jmco2,indm,ig))
            co2m2 = ka_mco2(jmco2,indm+1,ig) + fmco2                    &
     &         * (ka_mco2(jmco2+1,indm+1,ig) - ka_mco2(jmco2,indm+1,ig))
            absco2 = co2m1 + minorfrac(k) * (co2m2 - co2m1)

            taug(k,ns07+ig) = speccomb                                  &
     &         * (fac200*absa(ind0-1,ig) + fac100*absa(ind0   ,ig)      &
     &         +  fac000*absa(ind0+1,ig) + fac210*absa(ind0+ 8,ig)      &
     &         +  fac110*absa(ind0+9,ig) + fac010*absa(ind0+10,ig))     &
     &         + speccomb1                                              &
     &         * (fac201*absa(ind1-1,ig) + fac101*absa(ind1   ,ig)      &
     &         +  fac001*absa(ind1+1,ig) + fac211*absa(ind1+ 8,ig)      &
     &         +  fac111*absa(ind1+9,ig) + fac011*absa(ind1+10,ig))     &
     &         + tauself + taufor + adjcolco2*absco2

            fracs(k,ns07+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        else
          fac000 = (f_one - fs) * fac00(k)
          fac010 = (f_one - fs) * fac10(k)
          fac100 = fs * fac00(k)
          fac110 = fs * fac10(k)

          fac001 = (f_one - fs1) * fac01(k)
          fac011 = (f_one - fs1) * fac11(k)
          fac101 = fs1 * fac01(k)
          fac111 = fs1 * fac11(k)

          do ig = 1, ng07
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            co2m1 = ka_mco2(jmco2,indm,ig) + fmco2                      &
     &         * (ka_mco2(jmco2+1,indm,ig) - ka_mco2(jmco2,indm,ig))
            co2m2 = ka_mco2(jmco2,indm+1,ig) + fmco2                    &
     &         * (ka_mco2(jmco2+1,indm+1,ig) - ka_mco2(jmco2,indm+1,ig))
            absco2 = co2m1 + minorfrac(k) * (co2m2 - co2m1)

            taug(k,ns07+ig) = speccomb                                  &
     &         * (fac000*absa(ind0  ,ig) + fac100*absa(ind0+ 1,ig)      &
     &         +  fac010*absa(ind0+9,ig) + fac110*absa(ind0+10,ig))     &
     &         + speccomb1                                              &
     &         * (fac001*absa(ind1  ,ig) + fac101*absa(ind1+ 1,ig)      &
     &         +  fac011*absa(ind1+9,ig) + fac111*absa(ind1+10,ig))     &
     &         + tauself + taufor + adjcolco2*absco2

            fracs(k,ns07+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        endif
      enddo

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay

!  --- ...  in atmospheres where the amount of co2 is too great to be considered
!           a minor species, adjust the column amount of co2 by an empirical factor
!           to obtain the proper contribution.

        temp   = coldry(k) * chi_mls(2,jp(k)+1)
        ratco2 = colamt(k,2) / temp
        if (ratco2 > 3.0) then
          adjfac = 2.0 + (ratco2-2.0)**0.79
          adjcolco2 = adjfac * temp
        else
          adjcolco2 = colamt(k,2)
        endif

        ind0 = ((jp(k)-13)*5 + (jt (k)-1)) * nspb(7) + 1
        ind1 = ((jp(k)-12)*5 + (jt1(k)-1)) * nspb(7) + 1
        indm = indminor(k)

        do ig = 1, ng07
          absco2 = kb_mco2(indm,ig) + minorfrac(k)                      &
     &           * (kb_mco2(indm+1,ig) - kb_mco2(indm,ig))

          taug(k,ns07+ig) = colamt(k,3)                                 &
     &       * (fac00(k)*absb(ind0,ig) + fac10(k)*absb(ind0+1,ig)       &
     &       +  fac01(k)*absb(ind1,ig) + fac11(k)*absb(ind1+1,ig))      &
     &       + adjcolco2 * absco2

          fracs(k,ns07+ig) = fracrefb(ig)
        enddo

!  --- ...  empirical modification to code to improve stratospheric cooling rates
!           for o3.  revised to apply weighting for g-point reduction in this band.

        taug(k,ns07+ 6) = taug(k,ns07+ 6) * 0.92
        taug(k,ns07+ 7) = taug(k,ns07+ 7) * 0.88
        taug(k,ns07+ 8) = taug(k,ns07+ 8) * 1.07
        taug(k,ns07+ 9) = taug(k,ns07+ 9) * 1.1
        taug(k,ns07+10) = taug(k,ns07+10) * 0.99
        taug(k,ns07+11) = taug(k,ns07+11) * 0.855
      enddo

! ..................................
      end subroutine taugb07
! ----------------------------------

! ----------------------------------
      subroutine taugb08
! ..................................

!  ------------------------------------------------------------------  !
!     band 8:  1080-1180 cm-1 (low key - h2o; low minor - co2,o3,n2o)  !
!                             (high key - o3; high minor - co2, n2o)   !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb08

!  ---  locals:
      integer :: k, ind0, ind1, inds, indf, indm, ig

      real (kind=kind_phys) :: tauself, taufor, absco2, abso3, absn2o,  &
     &      ratco2, adjfac, adjcolco2, temp
!
!===> ...  begin here
!
!  --- ...  minor gas mapping level:
!     lower - co2, p = 1053.63 mb, t = 294.2 k
!     lower - o3,  p = 317.348 mb, t = 240.77 k
!     lower - n2o, p = 706.2720 mb, t= 278.94 k
!     lower - cfc12,cfc11
!     upper - co2, p = 35.1632 mb, t = 223.28 k
!     upper - n2o, p = 8.716e-2 mb, t = 226.03 k

!  --- ...  lower atmosphere loop

      do k = 1, laytrop

!  --- ...  in atmospheres where the amount of co2 is too great to be considered
!           a minor species, adjust the column amount of co2 by an empirical factor
!           to obtain the proper contribution.

        temp   = coldry(k) * chi_mls(2,jp(k)+1)
        ratco2 = colamt(k,2) / temp
        if (ratco2 > 3.0) then
          adjfac = 2.0 + (ratco2-2.0)**0.65
          adjcolco2 = adjfac * temp
        else
          adjcolco2 = colamt(k,2)
        endif

        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(8) + 1
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(8) + 1
        inds = indself(k)
        indf = indfor(k)
        indm = indminor(k)

        do ig = 1, ng08
          tauself = selffac(k) * (selfref(inds,ig) + selffrac(k)        &
     &            * (selfref(inds+1,ig) - selfref(inds,ig)))
          taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)           &
     &            * (forref(indf+1,ig) - forref(indf,ig)))
          absco2 = (ka_mco2(indm,ig) + minorfrac(k)                     &
     &           * (ka_mco2(indm+1,ig) - ka_mco2(indm,ig)))
          abso3  = (ka_mo3(indm,ig) + minorfrac(k)                      &
     &           * (ka_mo3(indm+1,ig) - ka_mo3(indm,ig)))
          absn2o = (ka_mn2o(indm,ig) + minorfrac(k)                     &
     &           * (ka_mn2o(indm+1,ig) - ka_mn2o(indm,ig)))

          taug(k,ns08+ig) = colamt(k,1)                                 &
     &       * (fac00(k)*absa(ind0,ig) + fac10(k)*absa(ind0+1,ig)       &
     &       +  fac01(k)*absa(ind1,ig) + fac11(k)*absa(ind1+1,ig))      &
     &       + tauself + taufor + adjcolco2*absco2 +colamt(k,3)*abso3   &
     &       + colamt(k,4)*absn2o + wx(k,3)*cfc12(ig)                   &
     &       + wx(k,4)*cfc22adj(ig)

          fracs(k,ns08+ig) = fracrefa(ig)
        enddo
      enddo

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay

!  --- ...  in atmospheres where the amount of co2 is too great to be considered
!           a minor species, adjust the column amount of co2 by an empirical factor
!           to obtain the proper contribution.

        temp   = coldry(k) * chi_mls(2,jp(k)+1)
        ratco2 = colamt(k,2) / temp
        if (ratco2 > 3.0) then
          adjfac = 2.0 + (ratco2-2.0)**0.65
          adjcolco2 = adjfac * temp
        else
          adjcolco2 = colamt(k,2)
        endif

        ind0 = ((jp(k)-13)*5 + (jt (k)-1)) * nspb(8) + 1
        ind1 = ((jp(k)-12)*5 + (jt1(k)-1)) * nspb(8) + 1
        indm = indminor(k)

        do ig = 1, ng08
          absco2 = (kb_mco2(indm,ig) + minorfrac(k)                     &
     &           * (kb_mco2(indm+1,ig) - kb_mco2(indm,ig)))
          absn2o = (kb_mn2o(indm,ig) + minorfrac(k)                     &
     &           * (kb_mn2o(indm+1,ig) - kb_mn2o(indm,ig)))

          taug(k,ns08+ig) = colamt(k,3)                                 &
     &       * (fac00(k)*absb(ind0,ig) + fac10(k)*absb(ind0+1,ig)       &
     &       +  fac01(k)*absb(ind1,ig) + fac11(k)*absb(ind1+1,ig))      &
     &       + adjcolco2*absco2 + colamt(k,4)*absn2o                    &
     &       + wx(k,3)*cfc12(ig) + wx(k,4)*cfc22adj(ig)

          fracs(k,ns08+ig) = fracrefb(ig)
        enddo
      enddo

! ..................................
      end subroutine taugb08
! ----------------------------------

! ----------------------------------
      subroutine taugb09
! ..................................

!  ------------------------------------------------------------------  !
!     band 9:  1180-1390 cm-1 (low key - h2o,ch4; low minor - n2o)     !
!                             (high key - ch4; high minor - n2o)       !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb09

!  ---  locals:
      integer :: k, ind0, ind1, inds, indf, indm, ig, js,js1, jmn2o, jpl

      real (kind=kind_phys) :: tauself, taufor, n2om1, n2om2, absn2o,   &
     &      speccomb,       specparm,       specmult,       fs,         &
     &      speccomb1,      specparm1,      specmult1,      fs1,        &
     &      speccomb_mn2o,  specparm_mn2o,  specmult_mn2o,  fmn2o,      &
     &      speccomb_planck,specparm_planck,specmult_planck,fpl,        &
     &      refrat_planck_a, refrat_m_a, ratn2o, adjfac, adjcoln2o,     &
     &      fac000, fac100, fac200, fac010, fac110, fac210,             &
     &      fac001, fac101, fac201, fac011, fac111, fac211,             &
     &      p, p4, fk0, fk1, fk2, temp
!
!===> ...  begin here
!
!  --- ...  minor gas mapping level :
!     lower - n2o, p = 706.272 mbar, t = 278.94 k
!     upper - n2o, p = 95.58 mbar, t = 215.7 k

!  --- ...  calculate reference ratio to be used in calculation of Planck
!           fraction in lower/upper atmosphere.

      refrat_planck_a = chi_mls(1,9)/chi_mls(6,9)       ! P = 212 mb
      refrat_m_a = chi_mls(1,3)/chi_mls(6,3)            ! P = 706.272 mb

!  --- ...  lower atmosphere loop

      do k = 1, laytrop
        speccomb = colamt(k,1) + rfrate(k,4,1)*colamt(k,5)
        specparm = colamt(k,1) / speccomb
        if (specparm >= oneminus) specparm = oneminus
        specmult = 8.0 * specparm
        js = 1 + int(specmult)
        fs = mod(specmult, f_one)

        speccomb1 = colamt(k,1) + rfrate(k,4,2)*colamt(k,5)
        specparm1 = colamt(k,1) / speccomb1
        if (specparm1 >= oneminus) specparm1 = oneminus
        specmult1 = 8.0 * specparm1
        js1 = 1 + int(specmult1)
        fs1 = mod(specmult1, f_one)

        speccomb_mn2o = colamt(k,1) + refrat_m_a*colamt(k,5)
        specparm_mn2o = colamt(k,1) / speccomb_mn2o
        if (specparm_mn2o >= oneminus) specparm_mn2o = oneminus
        specmult_mn2o = 8.0 * specparm_mn2o
        jmn2o = 1 + int(specmult_mn2o)
        fmn2o = mod(specmult_mn2o, f_one)

!  --- ...  in atmospheres where the amount of n2o is too great to be considered
!           a minor species, adjust the column amount of n2o by an empirical factor
!           to obtain the proper contribution.

        temp   = coldry(k) * chi_mls(4,jp(k)+1)
        ratn2o = colamt(k,4) / temp
        if (ratn2o > 1.5) then
          adjfac = 0.5 + (ratn2o-0.5)**0.65
          adjcoln2o = adjfac * temp
        else
          adjcoln2o = colamt(k,4)
        endif

        speccomb_planck = colamt(k,1) + refrat_planck_a*colamt(k,5)
        specparm_planck = colamt(k,1) / speccomb_planck
        if (specparm_planck >= oneminus) specparm_planck=oneminus
        specmult_planck = 8.0 * specparm_planck
        jpl= 1 + int(specmult_planck)
        fpl = mod(specmult_planck, f_one)

        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(9) + js
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(9) + js1
        inds = indself(k)
        indf = indfor(k)
        indm = indminor(k)

        if (specparm < 0.125 .and. specparm1 < 0.125) then
          p = fs - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)

          p = fs1 - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)

          do ig = 1, ng09
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            n2om1 = ka_mn2o(jmn2o,indm,ig) + fmn2o                      &
     &         * (ka_mn2o(jmn2o+1,indm,ig) - ka_mn2o(jmn2o,indm,ig))
            n2om2 = ka_mn2o(jmn2o,indm+1,ig) + fmn2o                    &
     &         * (ka_mn2o(jmn2o+1,indm+1,ig) - ka_mn2o(jmn2o,indm+1,ig))
            absn2o = n2om1 + minorfrac(k) * (n2om2 - n2om1)

            taug(k,ns09+ig) = speccomb                                  &
     &         * (fac000*absa(ind0   ,ig) + fac100*absa(ind0+ 1,ig)     &
     &         +  fac200*absa(ind0+ 2,ig) + fac010*absa(ind0+ 9,ig)     &
     &         +  fac110*absa(ind0+10,ig) + fac210*absa(ind0+11,ig))    &
     &         + speccomb1                                              &
     &         * (fac001*absa(ind1   ,ig) + fac101*absa(ind1+ 1,ig)     &
     &         +  fac201*absa(ind1+ 2,ig) + fac011*absa(ind1+ 9,ig)     &
     &         +  fac111*absa(ind1+10,ig) + fac211*absa(ind1+11,ig))    &
     &         + tauself + taufor + adjcoln2o*absn2o            

            fracs(k,ns09+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        elseif (specparm > 0.875 .and. specparm1 > 0.875) then
          p = -fs 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)

          p = -fs1 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)

          do ig = 1, ng09
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            n2om1 = ka_mn2o(jmn2o,indm,ig) + fmn2o                      &
     &         * (ka_mn2o(jmn2o+1,indm,ig) - ka_mn2o(jmn2o,indm,ig))
            n2om2 = ka_mn2o(jmn2o,indm+1,ig) + fmn2o                    &
     &         * (ka_mn2o(jmn2o+1,indm+1,ig) - ka_mn2o(jmn2o,indm+1,ig))
            absn2o = n2om1 + minorfrac(k) * (n2om2 - n2om1)

            taug(k,ns09+ig) = speccomb                                  &
     &         * (fac200*absa(ind0-1,ig) + fac100*absa(ind0   ,ig)      &
     &         +  fac000*absa(ind0+1,ig) + fac210*absa(ind0+ 8,ig)      &
     &         +  fac110*absa(ind0+9,ig) + fac010*absa(ind0+10,ig))     &
     &         + speccomb1                                              &
     &         * (fac201*absa(ind1-1,ig) + fac101*absa(ind1   ,ig)      &
     &         +  fac001*absa(ind1+1,ig) + fac211*absa(ind1+ 8,ig)      &
     &         +  fac111*absa(ind1+9,ig) + fac011*absa(ind1+10,ig))     &
     &         + tauself + taufor + adjcoln2o*absn2o            

            fracs(k,ns09+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1) - fracrefa(ig,jpl))
          enddo
        else
          fac000 = (f_one - fs) * fac00(k)
          fac010 = (f_one - fs) * fac10(k)
          fac100 = fs * fac00(k)
          fac110 = fs * fac10(k)

          fac001 = (f_one - fs1) * fac01(k)
          fac011 = (f_one - fs1) * fac11(k)
          fac101 = fs1 * fac01(k)
          fac111 = fs1 * fac11(k)

          do ig = 1, ng09
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            n2om1 = ka_mn2o(jmn2o,indm,ig) + fmn2o                      &
     &         * (ka_mn2o(jmn2o+1,indm,ig) - ka_mn2o(jmn2o,indm,ig))
            n2om2 = ka_mn2o(jmn2o,indm+1,ig) + fmn2o                    &
     &         * (ka_mn2o(jmn2o+1,indm+1,ig) - ka_mn2o(jmn2o,indm+1,ig))
            absn2o = n2om1 + minorfrac(k) * (n2om2 - n2om1)

            taug(k,ns09+ig) = speccomb                                  &
     &         * (fac000*absa(ind0  ,ig) + fac100*absa(ind0+ 1,ig)      &
     &         +  fac010*absa(ind0+9,ig) + fac110*absa(ind0+10,ig))     &
     &         + speccomb1                                              &
     &         * (fac001*absa(ind1  ,ig) + fac101*absa(ind1+ 1,ig)      &
     &         +  fac011*absa(ind1+9,ig) + fac111*absa(ind1+10,ig))     &
     &         + tauself + taufor + adjcoln2o*absn2o            

            fracs(k,ns09+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        endif
      enddo

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay

!  --- ...  in atmospheres where the amount of n2o is too great to be considered
!           a minor species, adjust the column amount of n2o by an empirical factor
!           to obtain the proper contribution.

        temp   = coldry(k) * chi_mls(4,jp(k)+1)
        ratn2o = colamt(k,4) / temp
        if (ratn2o > 1.5) then
          adjfac = 0.5 + (ratn2o - 0.5)**0.65
          adjcoln2o = adjfac * temp
        else
          adjcoln2o = colamt(k,4)
        endif

        ind0 = ((jp(k)-13)*5 + (jt (k)-1)) * nspb(9) + 1
        ind1 = ((jp(k)-12)*5 + (jt1(k)-1)) * nspb(9) + 1
        indm = indminor(k)

        do ig = 1, ng09
          absn2o = kb_mn2o(indm,ig) + minorfrac(k)                      &
     &           * (kb_mn2o(indm+1,ig) - kb_mn2o(indm,ig))

          taug(k,ns09+ig) = colamt(k,5)                                 &
     &       * (fac00(k)*absb(ind0,ig) + fac10(k)*absb(ind0+1,ig)       &
     &       +  fac01(k)*absb(ind1,ig) + fac11(k)*absb(ind1+1,ig))      &
     &       + adjcoln2o*absn2o

          fracs(k,ns09+ig) = fracrefb(ig)
        enddo
      enddo

! ..................................
      end subroutine taugb09
! ----------------------------------

! ----------------------------------
      subroutine taugb10
! ..................................

!  ------------------------------------------------------------------  !
!     band 10:  1390-1480 cm-1 (low key - h2o; high key - h2o)         !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb10

!  ---  locals:
      integer :: k, ind0, ind1, inds, indf, ig

      real (kind=kind_phys) :: tauself, taufor
!
!===> ...  begin here
!
!  --- ...  lower atmosphere loop

      do k = 1, laytrop
        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(10) + 1
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(10) + 1
        inds = indself(k)
        indf = indfor(k)

        do ig = 1, ng10
          tauself = selffac(k) * (selfref(inds,ig) + selffrac(k)        &
     &            * (selfref(inds+1,ig) - selfref(inds,ig)))
          taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)           &
     &            * (forref(indf+1,ig) - forref(indf,ig))) 

          taug(k,ns10+ig) = colamt(k,1)                                 &
     &       * (fac00(k)*absa(ind0,ig) + fac10(k)*absa(ind0+1,ig)       &
     &       +  fac01(k)*absa(ind1,ig) + fac11(k)*absa(ind1+1,ig))      &
     &       + tauself + taufor

          fracs(k,ns10+ig) = fracrefa(ig)
        enddo
      enddo

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay
        ind0 = ((jp(k)-13)*5 + (jt (k)-1)) * nspb(10) + 1
        ind1 = ((jp(k)-12)*5 + (jt1(k)-1)) * nspb(10) + 1
        indf = indfor(k)

        do ig = 1, ng10
          taufor = forfac(k) * (forref(indf,ig) + forfrac(k)            &
     &           * (forref(indf+1,ig) - forref(indf,ig))) 

          taug(k,ns10+ig) = colamt(k,1)                                 &
     &       * (fac00(k)*absb(ind0,ig) + fac10(k)*absb(ind0+1,ig)       &
     &       +  fac01(k)*absb(ind1,ig) + fac11(k)*absb(ind1+1,ig))      &
     &       + taufor

          fracs(k,ns10+ig) = fracrefb(ig)
        enddo
      enddo

! ..................................
      end subroutine taugb10
! ----------------------------------

! ----------------------------------
      subroutine taugb11
! ..................................

!  ------------------------------------------------------------------  !
!     band 11:  1480-1800 cm-1 (low - h2o; low minor - o2)             !
!                              (high key - h2o; high minor - o2)       !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb11

!  ---  locals:
      integer :: k, ind0, ind1, inds, indf, indm, ig

      real (kind=kind_phys) :: scaleo2, tauself, taufor, tauo2
!
!===> ...  begin here
!
!  --- ...  minor gas mapping level :
!     lower - o2, p = 706.2720 mbar, t = 278.94 k
!     upper - o2, p = 4.758820 mbarm t = 250.85 k

!  --- ...  lower atmosphere loop

      do k = 1, laytrop
        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(11) + 1
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(11) + 1
        inds = indself(k)
        indf = indfor(k)
        indm = indminor(k)
        scaleo2 = colamt(k,6) * scaleminor(k)

        do ig = 1, ng11
          tauself = selffac(k) * (selfref(inds,ig) + selffrac(k)        &
     &            * (selfref(inds+1,ig) - selfref(inds,ig)))
          taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)           &
     &            * (forref(indf+1,ig) - forref(indf,ig)))
          tauo2 = scaleo2 * (ka_mo2(indm,ig) + minorfrac(k)             &
     &          * (ka_mo2(indm+1,ig) - ka_mo2(indm,ig)))

          taug(k,ns11+ig) = colamt(k,1)                                 &
     &       * (fac00(k)*absa(ind0,ig) + fac10(k)*absa(ind0+1,ig)       &
     &       +  fac01(k)*absa(ind1,ig) + fac11(k)*absa(ind1+1,ig))      &
     &       + tauself + taufor + tauo2

          fracs(k,ns11+ig) = fracrefa(ig)
        enddo
      enddo

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay
        ind0 = ((jp(k)-13)*5 + (jt (k)-1)) * nspb(11) + 1
        ind1 = ((jp(k)-12)*5 + (jt1(k)-1)) * nspb(11) + 1
        indf = indfor(k)
        indm = indminor(k)
        scaleo2 = colamt(k,6) * scaleminor(k)

        do ig = 1, ng11
          taufor = forfac(k) * (forref(indf,ig) + forfrac(k)            &
     &           * (forref(indf+1,ig) - forref(indf,ig))) 
          tauo2  = scaleo2 * (kb_mo2(indm,ig) + minorfrac(k)            &
     &           * (kb_mo2(indm+1,ig) - kb_mo2(indm,ig)))

          taug(k,ns11+ig) = colamt(k,1)                                 &
     &       * (fac00(k)*absb(ind0,ig) + fac10(k)*absb(ind0+1,ig)       &
     &       +  fac01(k)*absb(ind1,ig) + fac11(k)*absb(ind1+1,ig))      &
     &       + taufor + tauo2

          fracs(k,ns11+ig) = fracrefb(ig)
        enddo
      enddo

! ..................................
      end subroutine taugb11
! ----------------------------------

! ----------------------------------
      subroutine taugb12
! ..................................

!  ------------------------------------------------------------------  !
!     band 12:  1800-2080 cm-1 (low - h2o,co2; high - nothing)         !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb12

!  ---  locals:
      integer :: k, ind0, ind1, inds, indf, ig, js, js1, jpl

      real (kind=kind_phys) :: tauself, taufor, refrat_planck_a,        &
     &      speccomb,       specparm,       specmult,       fs,         &
     &      speccomb1,      specparm1,      specmult1,      fs1,        &
     &      speccomb_planck,specparm_planck,specmult_planck,fpl,        &
     &      fac000, fac100, fac200, fac010, fac110, fac210,             &
     &      fac001, fac101, fac201, fac011, fac111, fac211,             &
     &      p, p4, fk0, fk1, fk2
!
!===> ...  begin here
!
!  --- ...  calculate reference ratio to be used in calculation of Planck
!           fraction in lower/upper atmosphere.

      refrat_planck_a = chi_mls(1,10)/chi_mls(2,10)      ! P =   174.164 mb

!  --- ...  lower atmosphere loop

      do k = 1, laytrop
        speccomb = colamt(k,1) + rfrate(k,1,1)*colamt(k,2)
        specparm = colamt(k,1) / speccomb
        if (specparm >= oneminus) specparm = oneminus
        specmult = 8.0 * specparm
        js = 1 + int(specmult)
        fs = mod(specmult, f_one)

        speccomb1 = colamt(k,1) + rfrate(k,1,2)*colamt(k,2)
        specparm1 = colamt(k,1) / speccomb1
        if (specparm1 >= oneminus) specparm1 = oneminus
        specmult1 = 8.0 * specparm1
        js1 = 1 + int(specmult1)
        fs1 = mod(specmult1, f_one)

        speccomb_planck = colamt(k,1) + refrat_planck_a*colamt(k,2)
        specparm_planck = colamt(k,1) / speccomb_planck
        if (specparm_planck >= oneminus) specparm_planck=oneminus
        specmult_planck = 8.0 * specparm_planck
        jpl= 1 + int(specmult_planck)
        fpl = mod(specmult_planck, f_one)

        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(12) + js
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(12) + js1
        inds = indself(k)
        indf = indfor(k)

        if (specparm < 0.125 .and. specparm1 < 0.125) then
          p = fs - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)

          p = fs1 - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)

          do ig = 1, ng12
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 

            taug(k,ns12+ig) = speccomb                                  &
     &         * (fac000*absa(ind0   ,ig) + fac100*absa(ind0+ 1,ig)     &
     &         +  fac200*absa(ind0+ 2,ig) + fac010*absa(ind0+ 9,ig)     &
     &         +  fac110*absa(ind0+10,ig) + fac210*absa(ind0+11,ig))    &
     &         + speccomb1                                              &
     &         * (fac001*absa(ind1   ,ig) + fac101*absa(ind1+ 1,ig)     &
     &         +  fac201*absa(ind1+ 2,ig) + fac011*absa(ind1+ 9,ig)     &
     &         +  fac111*absa(ind1+10,ig) + fac211*absa(ind1+11,ig))    &
     &         + tauself + taufor

            fracs(k,ns12+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        elseif (specparm > 0.875 .and. specparm1 > 0.875) then
          p = -fs 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)

          p = -fs1 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)

          do ig = 1, ng12
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 

            taug(k,ns12+ig) = speccomb                                  &
     &         * (fac200*absa(ind0-1,ig) + fac100*absa(ind0   ,ig)      &
     &         +  fac000*absa(ind0+1,ig) + fac210*absa(ind0+ 8,ig)      &
     &         +  fac110*absa(ind0+9,ig) + fac010*absa(ind0+10,ig))     &
     &         + speccomb1                                              &
     &         * (fac201*absa(ind1-1,ig) + fac101*absa(ind1   ,ig)      &
     &         +  fac001*absa(ind1+1,ig) + fac211*absa(ind1+ 8,ig)      &
     &         +  fac111*absa(ind1+9,ig) + fac011*absa(ind1+10,ig))     &
     &         + tauself + taufor

            fracs(k,ns12+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        else
          fac000 = (f_one - fs) * fac00(k)
          fac010 = (f_one - fs) * fac10(k)
          fac100 = fs * fac00(k)
          fac110 = fs * fac10(k)

          fac001 = (f_one - fs1) * fac01(k)
          fac011 = (f_one - fs1) * fac11(k)
          fac101 = fs1 * fac01(k)
          fac111 = fs1 * fac11(k)

          do ig = 1, ng12
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 

            taug(k,ns12+ig) = speccomb                                  &
     &         * (fac000*absa(ind0  ,ig) + fac100*absa(ind0+ 1,ig)      &
     &         +  fac010*absa(ind0+9,ig) + fac110*absa(ind0+10,ig))     &
     &         + speccomb1                                              &
     &         * (fac001*absa(ind1  ,ig) + fac101*absa(ind1+ 1,ig)      &
     &         +  fac011*absa(ind1+9,ig) + fac111*absa(ind1+10,ig))     &
     &         + tauself + taufor

            fracs(k,ns12+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        endif
      enddo

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay
        do ig = 1, ng12
          taug(k,ns12+ig) = f_zero
          fracs(k,ns12+ig) = f_zero
        enddo
      enddo

! ..................................
      end subroutine taugb12
! ----------------------------------

! ----------------------------------
      subroutine taugb13
! ..................................

!  ------------------------------------------------------------------  !
!     band 13:  2080-2250 cm-1 (low key-h2o,n2o; high minor-o3 minor)  !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb13

!  ---  locals:
      integer :: k, ind0, ind1, inds, indf, indm, ig, js, js1, jmco2,   &
     &           jmco, jpl

      real (kind=kind_phys) :: tauself, taufor, co2m1, co2m2, absco2,   &
     &      speccomb,       specparm,       specmult,       fs,         &
     &      speccomb1,      specparm1,      specmult1,      fs1,        &
     &      speccomb_mco2,  specparm_mco2,  specmult_mco2,  fmco2,      &
     &      speccomb_mco,   specparm_mco,   specmult_mco,   fmco,       &
     &      speccomb_planck,specparm_planck,specmult_planck,fpl,        &
     &      refrat_planck_a, refrat_m_a, refrat_m_a3, ratco2,           &
     &      adjfac, adjcolco2, com1, com2, absco, abso3,                &
     &      fac000, fac100, fac200, fac010, fac110, fac210,             &
     &      fac001, fac101, fac201, fac011, fac111, fac211,             &
     &      p, p4, fk0, fk1, fk2, temp
!
!===> ...  begin here
!
!  --- ...  minor gas mapping levels :
!     lower - co2, p = 1053.63 mb, t = 294.2 k
!     lower - co, p = 706 mb, t = 278.94 k
!     upper - o3, p = 95.5835 mb, t = 215.7 k

!  --- ...  calculate reference ratio to be used in calculation of Planck
!           fraction in lower/upper atmosphere.

      refrat_planck_a = chi_mls(1,5)/chi_mls(4,5)        ! P = 473.420 mb (Level 5)
      refrat_m_a = chi_mls(1,1)/chi_mls(4,1)             ! P = 1053. (Level 1)
      refrat_m_a3 = chi_mls(1,3)/chi_mls(4,3)            ! P = 706. (Level 3)

!  --- ...  lower atmosphere loop

      do k = 1, laytrop
        speccomb = colamt(k,1) + rfrate(k,3,1)*colamt(k,4)
        specparm = colamt(k,1) / speccomb
        if (specparm >= oneminus) specparm = oneminus
        specmult = 8.0 * specparm
        js = 1 + int(specmult)
        fs = mod(specmult, f_one)

        speccomb1 = colamt(k,1) + rfrate(k,3,2)*colamt(k,4)
        specparm1 = colamt(k,1) / speccomb1
        if (specparm1 >= oneminus) specparm1 = oneminus
        specmult1 = 8.0 * specparm1
        js1 = 1 + int(specmult1)
        fs1 = mod(specmult1, f_one)

        speccomb_mco2 = colamt(k,1) + refrat_m_a*colamt(k,4)
        specparm_mco2 = colamt(k,1) / speccomb_mco2
        if (specparm_mco2 >= oneminus) specparm_mco2 = oneminus
        specmult_mco2 = 8.0 * specparm_mco2
        jmco2 = 1 + int(specmult_mco2)
        fmco2 = mod(specmult_mco2, f_one)

!  --- ...  in atmospheres where the amount of co2 is too great to be considered
!           a minor species, adjust the column amount of co2 by an empirical factor
!           to obtain the proper contribution.

        temp   = coldry(k) * 3.55e-4
        ratco2 = colamt(k,2) / temp
        if (ratco2 > 3.0) then
          adjfac = 2.0 + (ratco2-2.0)**0.68
          adjcolco2 = adjfac * temp
        else
          adjcolco2 = colamt(k,2)
        endif

        speccomb_mco = colamt(k,1) + refrat_m_a3*colamt(k,4)
        specparm_mco = colamt(k,1) / speccomb_mco
        if (specparm_mco >= oneminus) specparm_mco = oneminus
        specmult_mco = 8.0 * specparm_mco
        jmco = 1 + int(specmult_mco)
        fmco = mod(specmult_mco, f_one)

        speccomb_planck = colamt(k,1) + refrat_planck_a*colamt(k,4)
        specparm_planck = colamt(k,1) / speccomb_planck
        if (specparm_planck >= oneminus) specparm_planck=oneminus
        specmult_planck = 8.0 * specparm_planck
        jpl= 1 + int(specmult_planck)
        fpl = mod(specmult_planck, f_one)

        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(13) + js
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(13) + js1
        inds = indself(k)
        indf = indfor(k)
        indm = indminor(k)

        if (specparm < 0.125 .and. specparm1 < 0.125) then
          p = fs - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)

          p = fs1 - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)

          do ig = 1, ng13
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            co2m1 = ka_mco2(jmco2,indm,ig) + fmco2                      &
     &         * (ka_mco2(jmco2+1,indm,ig) - ka_mco2(jmco2,indm,ig))
            co2m2 = ka_mco2(jmco2,indm+1,ig) + fmco2                    &
     &         * (ka_mco2(jmco2+1,indm+1,ig) - ka_mco2(jmco2,indm+1,ig))
            absco2 = co2m1 + minorfrac(k) * (co2m2 - co2m1)
            com1 = ka_mco(jmco,indm,ig) + fmco                          &
     &           * (ka_mco(jmco+1,indm,ig) - ka_mco(jmco,indm,ig))
            com2 = ka_mco(jmco,indm+1,ig) + fmco                        &
     &           * (ka_mco(jmco+1,indm+1,ig) - ka_mco(jmco,indm+1,ig))
            absco = com1 + minorfrac(k) * (com2 - com1)

            taug(k,ns13+ig) = speccomb                                  &
     &         * (fac000*absa(ind0   ,ig) + fac100*absa(ind0+ 1,ig)     &
     &         +  fac200*absa(ind0+ 2,ig) + fac010*absa(ind0+ 9,ig)     &
     &         +  fac110*absa(ind0+10,ig) + fac210*absa(ind0+11,ig))    &
     &         + speccomb1                                              &
     &         * (fac001*absa(ind1   ,ig) + fac101*absa(ind1+ 1,ig)     &
     &         +  fac201*absa(ind1+ 2,ig) + fac011*absa(ind1+ 9,ig)     &
     &         +  fac111*absa(ind1+10,ig) + fac211*absa(ind1+11,ig))    &
     &         + tauself + taufor + adjcolco2*absco2                    &
     &         + colamt(k,7)*absco

            fracs(k,ns13+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        elseif (specparm > 0.875 .and. specparm1 > 0.875) then
          p = -fs 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)

          p = -fs1 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)

          do ig = 1, ng13
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            co2m1 = ka_mco2(jmco2,indm,ig) + fmco2                      &
     &         * (ka_mco2(jmco2+1,indm,ig) - ka_mco2(jmco2,indm,ig))
            co2m2 = ka_mco2(jmco2,indm+1,ig) + fmco2                    &
     &         * (ka_mco2(jmco2+1,indm+1,ig) - ka_mco2(jmco2,indm+1,ig))
            absco2 = co2m1 + minorfrac(k) * (co2m2 - co2m1)
            com1 = ka_mco(jmco,indm,ig) + fmco                          &
     &           * (ka_mco(jmco+1,indm,ig) - ka_mco(jmco,indm,ig))
            com2 = ka_mco(jmco,indm+1,ig) + fmco                        &
     &           * (ka_mco(jmco+1,indm+1,ig) - ka_mco(jmco,indm+1,ig))
            absco = com1 + minorfrac(k) * (com2 - com1)

            taug(k,ns13+ig) = speccomb                                  &
     &         * (fac200*absa(ind0-1,ig) + fac100*absa(ind0   ,ig)      &
     &         +  fac000*absa(ind0+1,ig) + fac210*absa(ind0+ 8,ig)      &
     &         +  fac110*absa(ind0+9,ig) + fac010*absa(ind0+10,ig))     &
     &         + speccomb1                                              &
     &         * (fac201*absa(ind1-1,ig) + fac101*absa(ind1   ,ig)      &
     &         +  fac001*absa(ind1+1,ig) + fac211*absa(ind1+ 8,ig)      &
     &         +  fac111*absa(ind1+9,ig) + fac011*absa(ind1+10,ig))     &
     &         + tauself + taufor + adjcolco2*absco2                    &
     &         + colamt(k,7)*absco

            fracs(k,ns13+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        else
          fac000 = (f_one - fs) * fac00(k)
          fac010 = (f_one - fs) * fac10(k)
          fac100 = fs * fac00(k)
          fac110 = fs * fac10(k)

          fac001 = (f_one - fs1) * fac01(k)
          fac011 = (f_one - fs1) * fac11(k)
          fac101 = fs1 * fac01(k)
          fac111 = fs1 * fac11(k)

          do ig = 1, ng13
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            co2m1 = ka_mco2(jmco2,indm,ig) + fmco2                      &
     &         * (ka_mco2(jmco2+1,indm,ig) - ka_mco2(jmco2,indm,ig))
            co2m2 = ka_mco2(jmco2,indm+1,ig) + fmco2                    &
     &         * (ka_mco2(jmco2+1,indm+1,ig) - ka_mco2(jmco2,indm+1,ig))
            absco2 = co2m1 + minorfrac(k) * (co2m2 - co2m1)
            com1 = ka_mco(jmco,indm,ig) + fmco                          &
     &           * (ka_mco(jmco+1,indm,ig) - ka_mco(jmco,indm,ig))
            com2 = ka_mco(jmco,indm+1,ig) + fmco                        &
     &           * (ka_mco(jmco+1,indm+1,ig) - ka_mco(jmco,indm+1,ig))
            absco = com1 + minorfrac(k) * (com2 - com1)

            taug(k,ns13+ig) = speccomb                                  &
     &         * (fac000*absa(ind0  ,ig) + fac100*absa(ind0+ 1,ig)      &
     &         +  fac010*absa(ind0+9,ig) + fac110*absa(ind0+10,ig))     &
     &         + speccomb1                                              &
     &         * (fac001*absa(ind1  ,ig) + fac101*absa(ind1+ 1,ig)      &
     &         +  fac011*absa(ind1+9,ig) + fac111*absa(ind1+10,ig))     &
     &         + tauself + taufor + adjcolco2*absco2                    &
     &         + colamt(k,7)*absco

            fracs(k,ns13+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        endif
      enddo

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay
        indm = indminor(k)
        do ig = 1, ng13
          abso3 = kb_mo3(indm,ig) + minorfrac(k)                        &
     &          * (kb_mo3(indm+1,ig) - kb_mo3(indm,ig))

          taug(k,ns13+ig) = colamt(k,3)*abso3

          fracs(k,ns13+ig) =  fracrefb(ig)
        enddo
      enddo

! ..................................
      end subroutine taugb13
! ----------------------------------

! ----------------------------------
      subroutine taugb14
! ..................................

!  ------------------------------------------------------------------  !
!     band 14:  2250-2380 cm-1 (low - co2; high - co2)                 !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb14

!  ---  locals:
      integer :: k, ind0, ind1, inds, indf, ig

      real (kind=kind_phys) :: tauself, taufor
!
!===> ...  begin here
!
!  --- ...  lower atmosphere loop

      do k = 1, laytrop
        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(14) + 1
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(14) + 1
        inds = indself(k)
        indf = indfor(k)

        do ig = 1, ng14
          tauself = selffac(k) * (selfref(inds,ig) + selffrac(k)        &
     &            * (selfref(inds+1,ig) - selfref(inds,ig)))
          taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)           &
     &            * (forref(indf+1,ig) - forref(indf,ig))) 

          taug(k,ns14+ig) = colamt(k,2)                                 &
     &       * (fac00(k)*absa(ind0,ig) + fac10(k)*absa(ind0+1,ig)       &
     &       +  fac01(k)*absa(ind1,ig) + fac11(k)*absa(ind1+1,ig))      &
     &       + tauself + taufor

          fracs(k,ns14+ig) = fracrefa(ig)
        enddo
      enddo

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay
        ind0 = ((jp(k)-13)*5 + (jt (k)-1)) * nspb(14) + 1
        ind1 = ((jp(k)-12)*5 + (jt1(k)-1)) * nspb(14) + 1

        do ig = 1, ng14
          taug(k,ns14+ig) = colamt(k,2)                                 &
     &       * (fac00(k)*absb(ind0,ig) + fac10(k)*absb(ind0+1,ig)       &
     &       +  fac01(k)*absb(ind1,ig) + fac11(k)*absb(ind1+1,ig))

          fracs(k,ns14+ig) = fracrefb(ig)
        enddo
      enddo

! ..................................
      end subroutine taugb14
! ----------------------------------

! ----------------------------------
      subroutine taugb15
! ..................................

!  ------------------------------------------------------------------  !
!     band 15:  2380-2600 cm-1 (low - n2o,co2; low minor - n2)         !
!                              (high - nothing)                        !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb15

!  ---  locals:
      integer :: k, ind0, ind1, inds, indf, indm, ig, js, js1, jmn2, jpl

      real (kind=kind_phys) :: scalen2, tauself, taufor,                &
     &      speccomb,       specparm,       specmult,       fs,         &
     &      speccomb1,      specparm1,      specmult1,      fs1,        &
     &      speccomb_mn2,   specparm_mn2,   specmult_mn2,   fmn2,       &
     &      speccomb_planck,specparm_planck,specmult_planck,fpl,        &
     &      refrat_planck_a, refrat_m_a, n2m1, n2m2, taun2,             &
     &      fac000, fac100, fac200, fac010, fac110, fac210,             &
     &      fac001, fac101, fac201, fac011, fac111, fac211,             &
     &      p, p4, fk0, fk1, fk2
!
!===> ...  begin here
!
!  --- ...  minor gas mapping level :
!     lower - nitrogen continuum, P = 1053., T = 294.

!  --- ...  calculate reference ratio to be used in calculation of Planck
!           fraction in lower atmosphere.

      refrat_planck_a = chi_mls(4,1)/chi_mls(2,1)      ! P = 1053. mb (Level 1)
      refrat_m_a = chi_mls(4,1)/chi_mls(2,1)           ! P = 1053. mb

!  --- ...  lower atmosphere loop

      do k = 1, laytrop
        speccomb = colamt(k,4) + rfrate(k,5,1)*colamt(k,2)
        specparm = colamt(k,4) / speccomb
        if (specparm >= oneminus) specparm = oneminus
        specmult = 8.0 * specparm
        js = 1 + int(specmult)
        fs = mod(specmult, f_one)

        speccomb1 = colamt(k,4) + rfrate(k,5,2)*colamt(k,2)
        specparm1 = colamt(k,4) / speccomb1
        if (specparm1 >= oneminus) specparm1 = oneminus
        specmult1 = 8.0 * specparm1
        js1 = 1 + int(specmult1)
        fs1 = mod(specmult1, f_one)

        speccomb_mn2 = colamt(k,4) + refrat_m_a*colamt(k,2)
        specparm_mn2 = colamt(k,4) / speccomb_mn2
        if (specparm_mn2 >= oneminus) specparm_mn2 = oneminus
        specmult_mn2 = 8.0 * specparm_mn2
        jmn2 = 1 + int(specmult_mn2)
        fmn2 = mod(specmult_mn2, f_one)

        speccomb_planck = colamt(k,4) + refrat_planck_a*colamt(k,2)
        specparm_planck = colamt(k,4) / speccomb_planck
        if (specparm_planck >= oneminus) specparm_planck=oneminus
        specmult_planck = 8.0 * specparm_planck
        jpl= 1 + int(specmult_planck)
        fpl = mod(specmult_planck, f_one)

        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(15) + js
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(15) + js1
        inds = indself(k)
        indf = indfor(k)
        indm = indminor(k)
         
        scalen2 = colbrd(k) * scaleminor(k)
        if (specparm < 0.125 .and. specparm1 < 0.125) then
          p = fs - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)

          p = fs1 - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)

          do ig = 1, ng15
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            n2m1 = ka_mn2(jmn2,indm,ig) + fmn2                          &
     &           * (ka_mn2(jmn2+1,indm,ig) - ka_mn2(jmn2,indm,ig))
            n2m2 = ka_mn2(jmn2,indm+1,ig) + fmn2                        &
     &           * (ka_mn2(jmn2+1,indm+1,ig) - ka_mn2(jmn2,indm+1,ig))
            taun2 = scalen2 * (n2m1 + minorfrac(k) * (n2m2 - n2m1))

            taug(k,ns15+ig) = speccomb                                  &
     &         * (fac000*absa(ind0   ,ig) + fac100*absa(ind0+ 1,ig)     &
     &         +  fac200*absa(ind0+ 2,ig) + fac010*absa(ind0+ 9,ig)     &
     &         +  fac110*absa(ind0+10,ig) + fac210*absa(ind0+11,ig))    &
     &         + speccomb1                                              &
     &         * (fac001*absa(ind1   ,ig) + fac101*absa(ind1+ 1,ig)     &
     &         +  fac201*absa(ind1+ 2,ig) + fac011*absa(ind1+ 9,ig)     &
     &         +  fac111*absa(ind1+10,ig) + fac211*absa(ind1+11,ig))    &
     &         + tauself + taufor + taun2

            fracs(k,ns15+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo

        elseif (specparm > 0.875 .and. specparm1 > 0.875) then
          p = -fs 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)

          p = -fs1 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)

          do ig = 1, ng15
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            n2m1 = ka_mn2(jmn2,indm,ig) + fmn2                          &
     &           * (ka_mn2(jmn2+1,indm,ig) - ka_mn2(jmn2,indm,ig))
            n2m2 = ka_mn2(jmn2,indm+1,ig) + fmn2                        &
     &           * (ka_mn2(jmn2+1,indm+1,ig) - ka_mn2(jmn2,indm+1,ig))
            taun2 = scalen2 * (n2m1 + minorfrac(k) * (n2m2 - n2m1))

            taug(k,ns15+ig) = speccomb                                  &
     &         * (fac200*absa(ind0-1,ig) + fac100*absa(ind0   ,ig)      &
     &         +  fac000*absa(ind0+1,ig) + fac210*absa(ind0+ 8,ig)      &
     &         +  fac110*absa(ind0+9,ig) + fac010*absa(ind0+10,ig))     &
     &         + speccomb1                                              &
     &         * (fac201*absa(ind1-1,ig) + fac101*absa(ind1   ,ig)      &
     &         +  fac001*absa(ind1+1,ig) + fac211*absa(ind1+ 8,ig)      &
     &         +  fac111*absa(ind1+9,ig) + fac011*absa(ind1+10,ig))     &
     &         + tauself + taufor + taun2

            fracs(k,ns15+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo

        else
          fac000 = (f_one - fs) * fac00(k)
          fac010 = (f_one - fs) * fac10(k)
          fac100 = fs * fac00(k)
          fac110 = fs * fac10(k)

          fac001 = (f_one - fs1) * fac01(k)
          fac011 = (f_one - fs1) * fac11(k)
          fac101 = fs1 * fac01(k)
          fac111 = fs1 * fac11(k)

          do ig = 1, ng15
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 
            n2m1 = ka_mn2(jmn2,indm,ig) + fmn2                          &
     &           * (ka_mn2(jmn2+1,indm,ig) - ka_mn2(jmn2,indm,ig))
            n2m2 = ka_mn2(jmn2,indm+1,ig) + fmn2                        &
     &           * (ka_mn2(jmn2+1,indm+1,ig) - ka_mn2(jmn2,indm+1,ig))
            taun2 = scalen2 * (n2m1 + minorfrac(k) * (n2m2 - n2m1))

            taug(k,ns15+ig) = speccomb                                  &
     &         * (fac000*absa(ind0  ,ig) + fac100*absa(ind0+ 1,ig)      &
     &         +  fac010*absa(ind0+9,ig) + fac110*absa(ind0+10,ig))     &
     &         + speccomb1                                              &
     &         * (fac001*absa(ind1  ,ig) + fac101*absa(ind1+ 1,ig)      &
     &         +  fac011*absa(ind1+9,ig) + fac111*absa(ind1+10,ig))     &
     &         + tauself + taufor + taun2

            fracs(k,ns15+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        endif
      enddo

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay
        do ig = 1, ng15
          taug(k,ns15+ig) = f_zero

          fracs(k,ns15+ig) = f_zero
        enddo
      enddo

! ..................................
      end subroutine taugb15
! ----------------------------------

! ----------------------------------
      subroutine taugb16
! ..................................

!  ------------------------------------------------------------------  !
!     band 16:  2600-3250 cm-1 (low key- h2o,ch4; high key - ch4)      !
!  ------------------------------------------------------------------  !

      use module_radlw_kgb16

!  ---  locals:
      integer :: k, ind0, ind1, inds, indf, ig, js, js1, jpl

      real (kind=kind_phys) :: tauself, taufor, refrat_planck_a,        &
     &      speccomb,       specparm,       specmult,       fs,         &
     &      speccomb1,      specparm1,      specmult1,      fs1,        &
     &      speccomb_planck,specparm_planck,specmult_planck,fpl,        &
     &      fac000, fac100, fac200, fac010, fac110, fac210,             &
     &      fac001, fac101, fac201, fac011, fac111, fac211,             &
     &      p, p4, fk0, fk1, fk2
!
!===> ...  begin here
!
!  --- ...  calculate reference ratio to be used in calculation of Planck
!           fraction in lower atmosphere.

      refrat_planck_a = chi_mls(1,6)/chi_mls(6,6)        ! P = 387. mb (Level 6)

!  --- ...  lower atmosphere loop

      do k = 1, laytrop
        speccomb = colamt(k,1) + rfrate(k,4,1)*colamt(k,5)
        specparm = colamt(k,1) / speccomb
        if (specparm >= oneminus) specparm = oneminus
        specmult = 8.0 * specparm
        js = 1 + int(specmult)
        fs = mod(specmult, f_one)

        speccomb1 = colamt(k,1) + rfrate(k,4,2)*colamt(k,5)
        specparm1 = colamt(k,1) / speccomb1
        if (specparm1 >= oneminus) specparm1 = oneminus
        specmult1 = 8.0 * specparm1
        js1 = 1 + int(specmult1)
        fs1 = mod(specmult1, f_one)

        speccomb_planck = colamt(k,1) + refrat_planck_a*colamt(k,5)
        specparm_planck = colamt(k,1) / speccomb_planck
        if (specparm_planck >= oneminus) specparm_planck=oneminus
        specmult_planck = 8.0 * specparm_planck
        jpl= 1 + int(specmult_planck)
        fpl = mod(specmult_planck, f_one)

        ind0 = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(16) + js
        ind1 = ( jp(k)   *5 + (jt1(k)-1)) * nspa(16) + js1
        inds = indself(k)
        indf = indfor(k)

        if (specparm < 0.125 .and. specparm1 < 0.125) then
          p = fs - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)

          p = fs1 - f_one
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)

          do ig = 1, ng16
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 

            taug(k,ns16+ig) = speccomb                                  &
     &         * (fac000*absa(ind0   ,ig) + fac100*absa(ind0+ 1,ig)     &
     &         +  fac200*absa(ind0+ 2,ig) + fac010*absa(ind0+ 9,ig)     &
     &         +  fac110*absa(ind0+10,ig) + fac210*absa(ind0+11,ig))    &
     &         + speccomb1                                              &
     &         * (fac001*absa(ind1   ,ig) + fac101*absa(ind1+ 1,ig)     &
     &         +  fac201*absa(ind1+ 2,ig) + fac011*absa(ind1+ 9,ig)     &
     &         +  fac111*absa(ind1+10,ig) + fac211*absa(ind1+11,ig))    &
     &         + tauself + taufor

            fracs(k,ns16+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1) - fracrefa(ig,jpl))
          enddo
        elseif (specparm > 0.875 .and. specparm1 > 0.875) then
          p = -fs 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac000 = fk0*fac00(k)
          fac100 = fk1*fac00(k)
          fac200 = fk2*fac00(k)
          fac010 = fk0*fac10(k)
          fac110 = fk1*fac10(k)
          fac210 = fk2*fac10(k)

          p = -fs1 
          p4 = p**4
          fk0 = p4
          fk1 = f_one - p - 2.0*p4
          fk2 = p + p4
          fac001 = fk0*fac01(k)
          fac101 = fk1*fac01(k)
          fac201 = fk2*fac01(k)
          fac011 = fk0*fac11(k)
          fac111 = fk1*fac11(k)
          fac211 = fk2*fac11(k)

          do ig = 1, ng16
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 

            taug(k,ns16+ig) = speccomb                                  &
     &         * (fac200*absa(ind0-1,ig) + fac100*absa(ind0   ,ig)      &
     &         +  fac000*absa(ind0+1,ig) + fac210*absa(ind0+ 8,ig)      &
     &         +  fac110*absa(ind0+9,ig) + fac010*absa(ind0+10,ig))     &
     &         + speccomb1                                              &
     &         * (fac201*absa(ind1-1,ig) + fac101*absa(ind1   ,ig)      &
     &         +  fac001*absa(ind1+1,ig) + fac211*absa(ind1+ 8,ig)      &
     &         +  fac111*absa(ind1+9,ig) + fac011*absa(ind1+10,ig))     &
     &         + tauself + taufor

            fracs(k,ns16+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        else
          fac000 = (f_one - fs) * fac00(k)
          fac010 = (f_one - fs) * fac10(k)
          fac100 = fs * fac00(k)
          fac110 = fs * fac10(k)

          fac001 = (f_one - fs1) * fac01(k)
          fac011 = (f_one - fs1) * fac11(k)
          fac101 = fs1 * fac01(k)
          fac111 = fs1 * fac11(k)

          do ig = 1, ng16
            tauself = selffac(k)* (selfref(inds,ig) + selffrac(k)       &
     &              * (selfref(inds+1,ig) - selfref(inds,ig)))
            taufor  = forfac(k) * (forref(indf,ig) + forfrac(k)         &
     &              * (forref(indf+1,ig) - forref(indf,ig))) 

            taug(k,ns16+ig) = speccomb                                  &
     &         * (fac000*absa(ind0  ,ig) + fac100*absa(ind0+ 1,ig)      &
     &         +  fac010*absa(ind0+9,ig) + fac110*absa(ind0+10,ig))     &
     &         + speccomb1                                              &
     &         * (fac001*absa(ind1  ,ig) + fac101*absa(ind1+ 1,ig)      &
     &         +  fac011*absa(ind1+9,ig) + fac111*absa(ind1+10,ig))     &
     &         + tauself + taufor

            fracs(k,ns16+ig) = fracrefa(ig,jpl) + fpl                   &
     &         * (fracrefa(ig,jpl+1)-fracrefa(ig,jpl))
          enddo
        endif

      enddo

!  --- ...  upper atmosphere loop

      do k = laytrop+1, nlay
        ind0 = ((jp(k)-13)*5 + (jt (k)-1)) * nspb(16) + 1
        ind1 = ((jp(k)-12)*5 + (jt1(k)-1)) * nspb(16) + 1

        do ig = 1, ng16
          taug(k,ns16+ig) = colamt(k,5)                                 &
     &       * (fac00(k)*absb(ind0,ig) + fac10(k)*absb(ind0+1,ig)       &
     &       +  fac01(k)*absb(ind1,ig) + fac11(k)*absb(ind1+1,ig))

          fracs(k,ns16+ig) = fracrefb(ig)
        enddo
      enddo

! ..................................
      end subroutine taugb16
! ----------------------------------

! ..................................
      end subroutine taumol
!-----------------------------------





!
!........................................!
      end module module_radlw_main       !
!========================================!

