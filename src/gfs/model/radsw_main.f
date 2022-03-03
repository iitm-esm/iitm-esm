!!!!!  ==============================================================  !!!!!
!!!!!              sw-rrtm3 radiation package description              !!!!!
!!!!!  ==============================================================  !!!!!
!                                                                          !
!   this package includes ncep's modifications of the rrtm-sw radiation    !
!   code from aer inc.                                                     !
!                                                                          !
!   the sw-rrtm3 package includes these parts:                             !
!                                                                          !
!      'radsw_rrtm3_param.f'                                               !
!      'radsw_rrtm3_datatb.f'                                              !
!      'radsw_rrtm3_main.f'                                                !
!                                                                          !
!   the 'radsw_rrtm3_param.f' contains:                                    !
!                                                                          !
!      'module_radsw_cntr_para'   -- control parameters set up             !
!      'module_radsw_parameters'  -- band parameters set up                !
!                                                                          !
!   the 'radsw_rrtm3_datatb.f' contains:                                   !
!                                                                          !
!      'module_radsw_ref'         -- reference temperature and pressure    !
!      'module_radsw_cldprtb'     -- cloud property coefficients table     !
!      'module_radsw_sflux'       -- spectral distribution of solar flux   !
!      'module_radsw_kgbnn'       -- absorption coeffients for 14          !
!                                    bands, where nn = 16-29               !
!                                                                          !
!   the 'radsw_rrtm3_main.f' contains:                                     !
!                                                                          !
!      'module_radsw_main'        -- main sw radiation transfer            !
!                                                                          !
!   in the main module 'module_radsw_main' there are only two              !
!   externally callable subroutines:                                       !
!                                                                          !
!      'swrad'      -- main sw radiation routine                           !
!         inputs:                                                          !
!           (plyr,plvl,tlyr,tlvl,qlyr,olyr,gasvmr,                         !
!            clouds,icseed,aerosols,sfcalb,                                !
!            cosz,solcon,NDAY,idxday,                                      !
!            npts, nlay, nlp1, iflip, lprnt,                               !
!         outputs:                                                         !
!            hswc,topflx,sfcflx,                                           !
!!        optional outputs:                                                !
!            HSW0,HSWB,FLXPRF,FDNCMP)                                      !
!           )                                                              !
!                                                                          !
!      'rswinit'    -- initialization routine                              !
!         inputs:                                                          !
!           ( icwp, me, nlay, iovr, isubc )                                !
!         outputs:                                                         !
!           (none)                                                         !
!                                                                          !
!   all the sw radiation subprograms become contained subprograms          !
!   in module 'module_radsw_main' and many of them are not directly        !
!   accessable from places outside the module.                             !
!                                                                          !
!    derived data type constructs used:                                    !
!                                                                          !
!     1. radiation flux at toa: (from module 'module_radsw_parameters')    !
!          topfsw_type   -  derived data type for toa rad fluxes           !
!            upfxc              total sky upward flux at toa               !
!            dnfxc              total sky downward flux at toa             !
!            upfx0              clear sky upward flux at toa               !
!                                                                          !
!     2. radiation flux at sfc: (from module 'module_radsw_parameters')    !
!          sfcfsw_type   -  derived data type for sfc rad fluxes           !
!            upfxc              total sky upward flux at sfc               !
!            dnfxc              total sky downward flux at sfc             !
!            upfx0              clear sky upward flux at sfc               !
!            dnfx0              clear sky downward flux at sfc             !
!                                                                          !
!     3. radiation flux profiles(from module 'module_radsw_parameters')    !
!          profsw_type    -  derived data type for rad vertical prof       !
!            upfxc              level upward flux for total sky            !
!            dnfxc              level downward flux for total sky          !
!            upfx0              level upward flux for clear sky            !
!            dnfx0              level downward flux for clear sky          !
!                                                                          !
!     4. surface component fluxes(from module 'module_radsw_parameters'    !
!          cmpfsw_type    -  derived data type for component sfc flux      !
!            uvbfc              total sky downward uv-b flux at sfc        !
!            uvbf0              clear sky downward uv-b flux at sfc        !
!            nirbm              surface downward nir direct beam flux      !
!            nirdf              surface downward nir diffused flux         !
!            visbm              surface downward uv+vis direct beam flx    !
!            visdf              surface downward uv+vis diffused flux      !
!                                                                          !
!   external modules referenced:                                           !
!                                                                          !
!       'module machine'                                                   !
!       'module physcons'                                                  !
!       'mersenne_twister'                                                 !
!                                                                          !
!   compilation sequence is:                                               !
!                                                                          !
!      'radsw_rrtm3_param.f'                                               !
!      'radsw_rrtm3_datatb.f'                                              !
!      'radsw_rrtm3_main.f'                                                !
!                                                                          !
!   and all should be put in front of routines that use sw modules         !
!                                                                          !
!==========================================================================!
!                                                                          !
!   the original program declarations:                                     !
!                                                                          !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!                                                                          !
!  Copyright 2002-2007, Atmospheric & Environmental Research, Inc. (AER).  !
!  This software may be used, copied, or redistributed as long as it is    !
!  not sold and this copyright notice is reproduced on each copy made.     !
!  This model is provided as is without any express or implied warranties. !
!                       (http://www.rtweb.aer.com/)                        !
!                                                                          !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!                                                                          !
! ************************************************************************ !
!                                                                          !
!                              rrtmg_sw                                    !
!                                                                          !
!                                                                          !
!                   a rapid radiative transfer model                       !
!                    for the solar spectral region                         !
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
!        following people:  steven j. taubman, patrick d. brown,           !
!        ronald e. farren, luke chen, robert bergstrom.                    !
!                                                                          !
! ************************************************************************ !
!                                                                          !
!    references:                                                           !
!    (rrtm_sw/rrtmg_sw):                                                   !
!      clough, s.a., m.w. shephard, e.j. mlawer, j.s. delamere,            !
!      m.j. iacono, k. cady-pereira, s. boukabara, and p.d. brown:         !
!      atmospheric radiative transfer modeling: a summary of the aer       !
!      codes, j. quant. spectrosc. radiat. transfer, 91, 233-244, 2005.    !
!                                                                          !
!    (mcica):                                                              !
!      pincus, r., h. w. barker, and j.-j. morcrette: a fast, flexible,    !
!      approximation technique for computing radiative transfer in         !
!      inhomogeneous cloud fields, j. geophys. res., 108(d13), 4376,       !
!      doi:10.1029/2002jd003322, 2003.                                     !
!                                                                          !
! ************************************************************************ !
!                                                                          !
!    aer's revision history:                                               !
!     this version of rrtmg_sw has been modified from rrtm_sw to use a     !
!     reduced set of g-point intervals and a two-stream model for          !
!     application to gcms.                                                 !
!                                                                          !
! --  original version (derived from rrtm_sw)                              !
!        2002: aer. inc.                                                   !
! --  conversion to f90 formatting; addition of 2-stream radiative transfer!
!        feb 2003: j.-j. morcrette, ecmwf                                  !
! --  additional modifications for gcm application                         !
!        aug 2003: m. j. iacono, aer inc.                                  !
! --  total number of g-points reduced from 224 to 112.  original          !
!     set of 224 can be restored by exchanging code in module parrrsw.f90  !
!     and in file rrtmg_sw_init.f90.                                       !
!        apr 2004: m. j. iacono, aer, inc.                                 !
! --  modifications to include output for direct and diffuse               !
!     downward fluxes.  there are output as "true" fluxes without          !
!     any delta scaling applied.  code can be commented to exclude         !
!     this calculation in source file rrtmg_sw_spcvrt.f90.                 !
!        jan 2005: e. j. mlawer, m. j. iacono, aer, inc.                   !
! --  revised to add mcica capability.                                     !
!        nov 2005: m. j. iacono, aer, inc.                                 !
! --  reformatted for consistency with rrtmg_lw.                           !
!        feb 2007: m. j. iacono, aer, inc.                                 !
! --  modifications to formatting to use assumed-shape arrays.             !
!        aug 2007: m. j. iacono, aer, inc.                                 !
!                                                                          !
! ************************************************************************ !
!                                                                          !
!   ncep modifications history log:                                        !
!                                                                          !
!       sep 2003,  yu-tai hou        -- received aer's rrtm-sw gcm version !
!                    code (v224)                                           !
!       nov 2003,  yu-tai hou        -- corrected errors in direct/diffuse !
!                    surface alabedo components.                           !
!       jan 2004,  yu-tai hou        -- modified code into standard modular!
!                    f9x code for ncep models. the original three cloud    !
!                    control flags are simplified into two: iflagliq and   !
!                    iflagice. combined the org subr sw_224 and setcoef    !
!                    into radsw (the main program); put all kgb##together  !
!                    and reformat into a separated data module; combine    !
!                    reftra and vrtqdr as swflux; optimized taumol and all !
!                    taubgs to form a contained subroutines.               !
!       jun 2004,  yu-tai hou        -- modified code based on aer's faster!
!                    version rrtmg_sw (v2.0) with 112 g-points.            !
!       mar 2005,  yu-tai hou        -- modified to aer v2.3, correct cloud!
!                    scaling error, total sky properties are delta scaled  !
!                    after combining clear and cloudy parts. the testing   !
!                    criterion of ssa is saved before scaling. added cloud !
!                    layer rain and snow contributions. all cloud water    !
!                    partical contents are treated the same way as other   !
!                    atmos particles.                                      !
!       apr 2005,  yu-tai hou        -- modified on module structures (this!
!                    version of code was given back to aer in jun 2006)    !
!       nov 2006,  yu-tai hou        -- modified code to include the       !
!                    generallized aerosol optical property scheme for gcms.!
!       apr 2007,  yu-tai hou        -- added spectral band heating as an  !
!                    optional output to support the 500km model's upper    !
!                    stratospheric radiation calculations. restructure     !
!                    optional outputs for easy access by different models. !
!       oct 2008,  yu-tai hou        -- modified to include new features   !
!                    from aer's newer release v3.5-v3.61, including mcica  !
!                    sub-grid cloud option and true direct/diffuse fluxes  !
!                    without delta scaling. added rain/snow opt properties !
!                    support to cloudy sky calculations. simplified and    !
!                    unified sw and lw sub-column cloud subroutines into   !
!                    one module by using optional parameters.              !
!       mar 2009,  yu-tai hou        -- replaced the original random number!
!                    generator coming with the original code with ncep w3  !
!                    library to simplify the program and moved sub-column  !
!                    cloud subroutines inside the main module. added       !
!                    option of user provided permutation seeds that could  !
!                    be randomly generated from forecast time stamp.       !
!       mar 2009,  yu-tai hou        -- replaced random number generator   !
!                    programs coming from the original code with the ncep  !
!                    w3 library to simplify the program and moved sub-col  !
!                    cloud subroutines inside the main module. added       !
!                    option of user provided permutation seeds that could  !
!                    be randomly generated from forecast time stamp.       !
!       nov 2009,  yu-tai hou        -- updated to aer v3.7-v3.8 version.  !
!                    notice the input cloud ice/liquid are assumed as      !
!                    in-cloud quantities, not grid average quantities.     !
!                                                                          !
!!!!!  ==============================================================  !!!!!
!!!!!                         end descriptions                         !!!!!
!!!!!  ==============================================================  !!!!!


!========================================!
      module module_radsw_main           !
!........................................!
!
      use machine,          only : kind_phys
      use physcons,         only : con_g, con_cp, con_avgd, con_amd,    &
     &                             con_amw, con_amo3

      use module_radsw_parameters
      use module_radsw_cntr_para
      use mersenne_twister, only : random_setseed, random_number,       &
     &                             random_stat
!
      use module_radsw_ref,              only : preflog, tref
      use module_radsw_sflux
!
      implicit none
!
      private
!
!  ---  version tag and last revision date
!     character(24), parameter :: VTAGSW='RRTM-SW 112v2.0 jul 2004'
!     character(24), parameter :: VTAGSW='RRTM-SW 112v2.3 mar 2005'
!     character(24), parameter :: VTAGSW='RRTM-SW 112v2.3 Apr 2007'
!     character(24), parameter :: VTAGSW='RRTMG-SW v3.5   Oct 2008'
!     character(24), parameter :: VTAGSW='RRTMG-SW v3.61  Oct 2008'
!     character(24), parameter :: VTAGSW='RRTMG-SW v3.7   Nov 2009'
      character(24), parameter :: VTAGSW='RRTMG-SW v3.8   Nov 2009'

!  ---  constant values
      real (kind=kind_phys), parameter :: eps     = 1.0e-6
      real (kind=kind_phys), parameter :: oneminus= 1.0 - eps
      real (kind=kind_phys), parameter :: bpade   = 1.0/0.278  ! pade approx constant
      real (kind=kind_phys), parameter :: stpfac  = 296.0/1013.0
      real (kind=kind_phys), parameter :: ftiny   = 1.0e-12
      real (kind=kind_phys), parameter :: s0      = 1368.22    ! internal solar const
                                                               ! adj through input
      real (kind=kind_phys), parameter :: f_zero  = 0.0
      real (kind=kind_phys), parameter :: f_one   = 1.0

!  ---  atomic weights for conversion from mass to volume mixing ratios
      real (kind=kind_phys), parameter :: amdw    = con_amd/con_amw
      real (kind=kind_phys), parameter :: amdo3   = con_amd/con_amo3

!  ---  band indices
      integer, dimension(nblow:nbhgh) :: nspa, nspb, idxalb, idxsfc,    &
     &                                   idxebc

      data nspa(:) /  9, 9, 9, 9, 1, 9, 9, 1, 9, 1, 0, 1, 9, 1 /
      data nspb(:) /  1, 5, 1, 1, 1, 5, 1, 0, 1, 0, 0, 1, 5, 1 /

      data idxalb(:) / 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 1 /  ! band index for albedo
!     data idxsfc(:) / 1, 1, 1, 1, 1, 1, 1, 1, 0, 2, 2, 2, 2, 1 /  ! band index for sfc flux
      data idxsfc(:) / 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 1 /  ! band index for sfc flux
      data idxebc(:) / 5, 5, 4, 4, 3, 3, 2, 2, 1, 1, 1, 1, 1, 5 /  ! band index for cld prop

!  ---  band wavenumber intervals
!     real (kind=kind_phys), dimension(nblow:nbhgh):: wavenum1,wavenum2
!     data wavenum1(:)  /                                               &
!    &         2600.0, 3250.0, 4000.0, 4650.0, 5150.0, 6150.0, 7700.0,  &
!    &         8050.0,12850.0,16000.0,22650.0,29000.0,38000.0,  820.0 /
!     data wavenum2(:)  /                                               &
!              3250.0, 4000.0, 4650.0, 5150.0, 6150.0, 7700.0, 8050.0,  &
!    &        12850.0,16000.0,22650.0,29000.0,38000.0,50000.0, 2600.0 /
!     real (kind=kind_phys), dimension(nblow:nbhgh) :: delwave
!     data delwave(:)   /                                               &
!    &          650.0,  750.0,  650.0,  500.0, 1000.0, 1550.0,  350.0,  &
!    &         4800.0, 3150.0, 6650.0, 6350.0, 9000.0,12000.0, 1780.0 /

      integer, parameter :: nuvb = 27            !uv-b band index

!! ---  logical flags for optional output fields

      logical :: lhswb  = .false.
      logical :: lhsw0  = .false.
      logical :: lflxprf= .false.
      logical :: lfdncmp= .false.

!  ---  those data will be set up only once by "rswinit"

      real (kind=kind_phys) :: exp_tbl(0:NTBMX)

!  ...  heatfac is the factor for heating rates
!       (in k/day, or k/sec set by subroutine 'rswinit')

      real (kind=kind_phys) :: heatfac

!  ...  iovrsw  is the clouds overlapping control flag
!        =0: random overlapping clouds
!        =1: maximum/random overlapping clouds
!        =2: maximum overlap cloud

      integer :: iovrsw

!  ---  the following variables are used for sub-column cloud scheme

      integer, parameter :: ipsdsw0 = 1          ! initial permutation seed
      integer, parameter :: isdlim  = 1.0e+9     ! limit for random seed

!  ...  isubcol is the sub-column cloud approximation control flag
!        =0: no sub-col cloud treatment, use grid-mean cloud quantities
!        =1: mcica sub-col, prescribed seeds for generating random numbers
!        =2: mcica sub-col, use array icseed that contains user provided
!            permutation seed for generating random numbers


      integer :: isubcol, ipsdsw

!  ---  public accessable subprograms

      public swrad, rswinit


! =================
      contains
! =================


!-----------------------------------
      subroutine swrad                                                  &
!...................................

!  ---  inputs:
     &     ( plyr,plvl,tlyr,tlvl,qlyr,olyr,gasvmr,                      &
     &       clouds,icseed,aerosols,sfcalb,                             &
     &       cosz,solcon,NDAY,idxday,                                   &
     &       npts, nlay, nlp1, iflip, lprnt,                            &
!  ---  outputs:
     &       hswc,topflx,sfcflx                                         &
!! ---  optional:
     &,      HSW0,HSWB,FLXPRF,FDNCMP                                    &
     &     )

!  ====================  defination of variables  ====================  !
!                                                                       !
!  input variables:                                                     !
!   plyr (npts,nlay) : model layer mean pressure in mb                  !
!   plvl (npts,nlp1) : model level pressure in mb                       !
!   tlyr (npts,nlay) : model layer mean temperature in k                !
!   tlvl (npts,nlp1) : model level temperature in k    (not in use)     !
!   qlyr (npts,nlay) : layer specific humidity in gm/gm   *see inside   !
!   olyr (npts,nlay) : layer ozone concentration in gm/gm               !
!   gasvmr(npts,nlay,:): atmospheric constent gases:                    !
!                      (check module_radiation_gases for definition)    !
!      gasvmr(:,:,1)  - co2 volume mixing ratio                         !
!      gasvmr(:,:,2)  - n2o volume mixing ratio                         !
!      gasvmr(:,:,3)  - ch4 volume mixing ratio                         !
!      gasvmr(:,:,4)  - o2  volume mixing ratio                         !
!      gasvmr(:,:,5)  - co  volume mixing ratio        (not used)       !
!      gasvmr(:,:,6)  - cfc11 volume mixing ratio      (not used)       !
!      gasvmr(:,:,7)  - cfc12 volume mixing ratio      (not used)       !
!      gasvmr(:,:,8)  - cfc22 volume mixing ratio      (not used)       !
!      gasvmr(:,:,9)  - ccl4  volume mixing ratio      (not used)       !
!   clouds(npts,nlay,:): cloud profile                                  !
!                      (check module_radiation_clouds for definition)   !
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
!   aerosols(npts,nlay,nbdsw,:) : aerosol optical properties            !
!                      (check module_radiation_aerosols for definition) !
!         (:,:,:,1)   - optical depth                                   !
!         (:,:,:,2)   - single scattering albedo                        !
!         (:,:,:,3)   - asymmetry parameter                             !
!   sfcalb(npts, : ) : surface albedo in fraction                       !
!                      (check module_radiation_surface for definition)  !
!         ( :, 1 )    - near ir direct beam albedo                      !
!         ( :, 2 )    - near ir diffused albedo                         !
!         ( :, 3 )    - uv+vis direct beam albedo                       !
!         ( :, 4 )    - uv+vis diffused albedo                          !
!   cosz  (npts)     : cosine of solar zenith angle                     !
!   solcon           : solar constant                      (w/m**2)     !
!   NDAY             : num of daytime points                            !
!   idxday(npts)     : index array for daytime points                   !
!   npts             : number of horizontal points                      !
!   nlay,nlp1        : vertical layer/lavel numbers                     !
!   iflip            : control flag for direction of vertical index     !
!                     =0: index from toa to surface                     !
!                     =1: index from surface to toa                     !
!   lprnt            : logical check print flag                         !
!                                                                       !
!  control parameters in module "module_radsw_cntr_para":               !
!   iswrate: heating rate unit selections                               !
!            =1: output in k/day                                        !
!            =2: output in k/second                                     !
!   iaersw : flags for aerosols effect                                  !
!            =0: without aerosol effect                                 !
!            >0: include aerosol effect                                 !
!   imodsw : control flag for 2-stream transfer scheme                  !
!            =1; delta-eddington    (joseph et al., 1976)               !
!            =2: pifm               (zdunkowski et al., 1980)           !
!            =3: discrete ordinates (liou, 1973)                        !
!   irgassw: control flag for rare gases (ch4,n2o,o2, etc.)             !
!            =0: do not include rare gases                              !
!            =1: include all rare gases                                 !
!   iflagliq:control flag for liq-cloud optical properties              !
!            =0: input cloud optical depth, fixed ssa, asy              !
!            =1: use hu and stamnes(1993) method for liq cld            !
!            =2: not used                                               !
!   iflagice:control flag for ice-cloud optical properties              !
!            =0: not used                                               !
!            =1: use ebert and curry (1992) scheme for ice clouds       !
!            =2: use streamer v3.0 (2001) method for ice clouds         !
!            =3: use fu's method (1996) for ice clouds                  !
!                                                                       !
!  output variables:                                                    !
!   hswc  (npts,nlay): total sky heating rates (k/sec or k/day)         !
!   topflx(npts)     : radiation fluxes at toa (w/m**2), components:    !
!                      (check module_radsw_parameters for definition)   !
!     upfxc            - total sky upward flux at toa                   !
!     dnflx            - total sky downward flux at toa                 !
!     upfx0            - clear sky upward flux at toa                   !
!   sfcflx(npts)     : radiation fluxes at sfc (w/m**2), components:    !
!                      (check module_radsw_parameters for definition)   !
!     upfxc            - total sky upward flux at sfc                   !
!     dnfxc            - total sky downward flux at sfc                 !
!     upfx0            - clear sky upward flux at sfc                   !
!     dnfx0            - clear sky downward flux at sfc                 !
!                                                                       !
!!optional outputs variables:                                           !
!   hswb(npts,nlay,nbdsw): spectral band total sky heating rates        !
!   hsw0  (npts,nlay): clear sky heating rates (k/sec or k/day)         !
!   flxprf(npts,nlp1): level radiation fluxes (w/m**2), components:     !
!                      (check module_radsw_parameters for definition)   !
!     dnfxc            - total sky downward flux at interface           !
!     upfxc            - total sky upward flux at interface             !
!     dnfx0            - clear sky downward flux at interface           !
!     upfx0            - clear sky upward flux at interface             !
!   fdncmp(npts)     : component surface downward fluxes (w/m**2):      !
!                      (check module_radsw_parameters for definition)   !
!     uvbfc            - total sky downward uv-b flux at sfc            !
!     uvbf0            - clear sky downward uv-b flux at sfc            !
!     nirbm            - downward surface nir direct beam flux          !
!     nirdf            - downward surface nir diffused flux             !
!     visbm            - downward surface uv+vis direct beam flux       !
!     visdf            - downward surface uv+vis diffused flux          !
!                                                                       !
!  module parameters, control variables:                                !
!     nblow,nbhgh      - lower and upper limits of spectral bands       !
!     maxgas           - maximum number of absorbing gaseous            !
!     ngptsw           - total number of g-point subintervals           !
!     ng##             - number of g-points in band (##=16-29)          !
!     ngb(ngptsw)      - band indices for each g-point                  !
!     bpade            - pade approximation constant (1/0.278)          !
!     nspa,nspb(nblow:nbhgh)                                            !
!                      - number of lower/upper ref atm's per band       !
!     iovrsw           - cloud overlapping control flag                 !
!            =0: random overlapping clouds                              !
!            =1: maximum/random overlapping clouds                      !
!            =2: maximum overlap cloud                                  !
!     ipsdsw           - permutation seed for mcica sub-col clds        !
!     isubcol          - sub-column cloud apprx control flag setup in   !
!                        subroutine 'rswinit'                           !
!            =0: no sub-col cloud treatment, use grid-mean cloud        !
!            =1: mcica sub-col, prescribed seed for random number       !
!            =2: mcica sub-col, use array icseed that contains user     !
!                provided permutation seed for generating random number !
!                                                                       !
!  major local variables:                                               !
!     pavel  (nlay)         - layer pressures (mb)                      !
!     delp   (nlay)         - layer pressure thickness (mb)             !
!     tavel  (nlay)         - layer temperatures (k)                    !
!     coldry (nlay)         - dry air column amount                     !
!                                   (1.e-20*molecules/cm**2)            !
!     cldfrc (nlay,ngptsw)  - layer cloud fraction                      !
!     taucw  (nlay,ngptsw)  - cloud optical depth                       !
!     ssacw  (nlay,ngptsw)  - cloud single scattering albedo (weighted) !
!     asycw  (nlay,ngptsw)  - cloud asymmetry factor         (weighted) !
!     tauaer (nlay,nbdsw)   - aerosol optical depths                    !
!     ssaaer (nlay,nbdsw)   - aerosol single scattering albedo          !
!     asyaer (nlay,nbdsw)   - aerosol asymmetry factor                  !
!     colamt (nlay,maxgas)  - column amounts of absorbing gases         !
!                             1 to maxgas are for h2o, co2, o3, n2o,    !
!                             ch4, o2, co, respectively (mol/cm**2)     !
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
!     laytrop               - layer at which switch is made from one    !
!                             combination of key species to another     !
!     jp(nlay),jt(nlay),jt1(nlay)                                       !
!                           - lookup table indexes                      !
!     flxucb(nlp1,nbdsw)    - spectral bnd total-sky upward flx (w/m2)  !
!     flxdcb(nlp1,nbdsw)    - spectral bnd total-sky downward flx (w/m2)!
!     flxu0b(nlp1,nbdsw)    - spectral bnd clear-sky upward flx (w/m2)  !
!     flxd0b(nlp1,nbdsw)    - spectral b d clear-sky downward flx (w/m2)!
!                                                                       !
!                                                                       !
!  =====================    end of definitions    ====================  !

!  ---  inputs:
      integer, intent(in) :: npts, nlay, nlp1, iflip, NDAY, icseed(:)

      integer, intent(in) :: idxday(:)

      logical, intent(in) :: lprnt

      real (kind=kind_phys), dimension(:,:), intent(in) :: plvl, tlvl,  &
     &       plyr, tlyr, qlyr, olyr, sfcalb

      real (kind=kind_phys), dimension(:,:,:),   intent(in) :: gasvmr,  &
     &       clouds
      real (kind=kind_phys), dimension(:,:,:,:), intent(in) :: aerosols

      real (kind=kind_phys), intent(in) :: cosz(:), solcon

!  ---  outputs:
      real (kind=kind_phys), dimension(:,:), intent(out) :: hswc

      type (topfsw_type),    dimension(:),   intent(out) :: topflx
      type (sfcfsw_type),    dimension(:),   intent(out) :: sfcflx

!! ---  optional outputs:
      real (kind=kind_phys),dimension(:,:,:),optional,intent(out):: hswb
      real (kind=kind_phys),dimension(:,:),  optional,intent(out):: hsw0
      type (profsw_type), dimension(:,:),optional, intent(out) :: flxprf
      type (cmpfsw_type), dimension(:),  optional, intent(out) :: fdncmp

!  ---  locals:
      real (kind=kind_phys), dimension(nlay) :: pavel, tavel, delp,     &
     &       coldry, colmol, h2ovmr, o3vmr, temcol, cliqp, reliq,       &
     &       cicep, reice, cdat1, cdat2, cdat3, cdat4, cfrac

      real (kind=kind_phys), dimension(nlay) :: plog, forfac, forfrac,  &
     &       selffac, selffrac, fac00, fac01, fac10, fac11

      real (kind=kind_phys), dimension(nlay,nbdsw) :: tauae,ssaae,asyae
      real (kind=kind_phys), dimension(nlay,ngptsw):: cldfrc, taucog,   &
     &       taucw, ssacw, asycw

      real (kind=kind_phys), dimension(2) :: albbm, albdf

      real (kind=kind_phys) ::  colamt(nlay,maxgas)

      real (kind=kind_phys), dimension(nlp1) :: fnetc, flxdc, flxuc,    &
     &       flxd0, flxu0
      real (kind=kind_phys), dimension(nlp1,nbdsw) :: flxdcb, flxucb,   &
     &       flxd0b, flxu0b

      real (kind=kind_phys) :: cosz1, sntz1, tem0, tem1, tem2, s0fac,   &
     &       fp, fp1, ft, ft1, ssolar, zdpgcp, zcf0, zcf1

!! ---  used for optional outputs
      real (kind=kind_phys), dimension(2) :: sfbmc, sfbm0, sfdfc, sfdf0
      real (kind=kind_phys) :: suvbf0, suvbfc
      real (kind=kind_phys) :: fnet0(nlp1), fnetb(nlp1,nbdsw)

      integer, dimension(npts) :: ipseed
      integer, dimension(nlay) :: indfor, indself, jp, jt, jt1

      integer :: i, ib, ipt, j1, j2, k, kk, jp1, laytrop, mb

!
!===> ... begin here
!

      lhswb  = present ( hswb )
      lhsw0  = present ( hsw0 )
      lflxprf= present ( flxprf )
      lfdncmp= present ( fdncmp )

!  --- ...  compute solar constant adjustment factor according to solcon.
!      ***  s0, the solar constant at toa in w/m**2, is hard-coded with
!           each spectra band, the total flux is about 1368.22 w/m**2.

      s0fac = solcon / s0

!  --- ...  initial output arrays

      hswc(:,:) = f_zero
      topflx = topfsw_type ( f_zero, f_zero, f_zero )
      sfcflx = sfcfsw_type ( f_zero, f_zero, f_zero, f_zero )

!! --- ...  initial optional outputs
      if ( lflxprf ) then
        flxprf = profsw_type ( f_zero, f_zero, f_zero, f_zero )
      endif

      if ( lfdncmp ) then
        fdncmp = cmpfsw_type (f_zero,f_zero,f_zero,f_zero,f_zero,f_zero)
      endif

      if ( lhsw0 ) then
        hsw0(:,:) = f_zero
      endif

      if ( lhswb ) then
        hswb(:,:,:) = f_zero
      endif

!  --- ...  change random number seed value for each radiation invocation

      if     ( isubcol == 1 ) then     ! advance prescribed permutation seed
        do i = 1, npts
          ipseed(i) = ipsdsw + i
        enddo
        ipsdsw = mod( ipsdsw+npts, isdlim )
      elseif ( isubcol == 2 ) then     ! use input array of permutaion seeds
        do i = 1, npts
          ipseed(i) = icseed(i)
        enddo
      endif

!     if ( lprnt ) then
!       print *,'  In radsw, isubcol, ipsdsw,ipseed =',                 &
!    &           isubcol, ipsdsw, ipseed
!     endif

!  --- ...  loop over each daytime grid point

      lab_do_ipt : do ipt = 1, NDAY

        j1 = idxday(ipt)

        cosz1  = cosz(j1)
        sntz1  = f_one / cosz(j1)
        ssolar = s0fac * cosz(j1)
        zcf0   = f_one
        zcf1   = f_one
        laytrop= nlay

        colamt(:,:) = f_zero

!  --- ...  surface albedo: bm,df - dir,dif;  1,2 - nir,uvv
        albbm(1) = sfcalb(j1,1)
        albdf(1) = sfcalb(j1,2)
        albbm(2) = sfcalb(j1,3)
        albdf(2) = sfcalb(j1,4)

!  --- ...  prepare atmospheric profile for use in rrtm
!           the vertical index of internal array is from surface to top

        if (iflip == 0) then        ! input from toa to sfc

          tem1 = 100.0 * con_g
          tem2 = 1.0e-20 * 1.0e3 * con_avgd

          do k = 1, nlay
            kk = nlp1 - k
            pavel(k) = plyr(j1,kk)
            tavel(k) = tlyr(j1,kk)
            delp (k) = plvl(j1,kk+1) - plvl(j1,kk)

!  --- ...  set absorber amount
!test use
!           h2ovmr(k)= max(f_zero,qlyr(j1,kk)*amdw)                     ! input mass mixing ratio
!           h2ovmr(k)= max(f_zero,qlyr(j1,kk))                          ! input vol mixing ratio
!           o3vmr (k)= max(f_zero,olyr(j1,kk))                          ! input vol mixing ratio
!ncep model use
            h2ovmr(k)= max(f_zero,qlyr(j1,kk)*amdw/(f_one-qlyr(j1,kk))) ! input specific humidity
            o3vmr (k)= max(f_zero,olyr(j1,kk)*amdo3)                    ! input mass mixing ratio

            tem0 = (f_one - h2ovmr(k))*con_amd + h2ovmr(k)*con_amw
            coldry(k) = tem2 * delp(k) / (tem1*tem0*(f_one + h2ovmr(k)))
            temcol(k) = 1.0e-12 * coldry(k)

            colamt(k,1) = max(f_zero,    coldry(k)*h2ovmr(k))         ! h2o
            colamt(k,2) = max(temcol(k), coldry(k)*gasvmr(j1,kk,1))   ! co2
            colamt(k,3) = max(f_zero,    coldry(k)*o3vmr(k))          ! o3
          enddo

!  --- ...  set aerosol optical properties

          if (iaersw > 0) then
            do ib = 1, nbdsw
              do k = 1, nlay
                kk = nlp1 - k

                tauae(k,ib) = aerosols(j1,kk,ib,1)
                ssaae(k,ib) = aerosols(j1,kk,ib,2)
                asyae(k,ib) = aerosols(j1,kk,ib,3)
              enddo
            enddo
          else
            tauae(:,:) = f_zero
            ssaae(:,:) = f_one
            asyae(:,:) = f_zero
          endif

          if (iflagliq > 0) then   ! use prognostic cloud method
            do k = 1, nlay
              kk = nlp1 - k
              cfrac(k) = clouds(j1,kk,1)      ! cloud fraction
              cliqp(k) = clouds(j1,kk,2)      ! cloud liq path
              reliq(k) = clouds(j1,kk,3)      ! liq partical effctive radius
              cicep(k) = clouds(j1,kk,4)      ! cloud ice path
              reice(k) = clouds(j1,kk,5)      ! ice partical effctive radius
              cdat1(k) = clouds(j1,kk,6)      ! cloud rain drop path
              cdat2(k) = clouds(j1,kk,7)      ! rain partical effctive radius
              cdat3(k) = clouds(j1,kk,8)      ! cloud snow path
              cdat4(k) = clouds(j1,kk,9)      ! snow partical effctive radius
            enddo
          else                     ! use diagnostic cloud method
            do k = 1, nlay
              kk = nlp1 - k
              cfrac(k) = clouds(j1,kk,1)      ! cloud fraction
              cdat1(k) = clouds(j1,kk,2)      ! cloud optical depth
              cdat2(k) = clouds(j1,kk,3)      ! cloud single scattering albedo
              cdat3(k) = clouds(j1,kk,4)      ! cloud asymmetry factor
            enddo
          endif                    ! end if_iflagliq

        else                        ! input from sfc to toa

          tem1 = 100.0 * con_g
          tem2 = 1.0e-20 * 1.0e3 * con_avgd

          do k = 1, nlay
            pavel(k) = plyr(j1,k)
            tavel(k) = tlyr(j1,k)
            delp (k) = plvl(j1,k) - plvl(j1,k+1)

!  --- ...  set absorber amount
!test use
!           h2ovmr(k)= max(f_zero,qlyr(j1,k)*amdw)                    ! input mass mixing ratio
!           h2ovmr(k)= max(f_zero,qlyr(j1,k))                         ! input vol mixing ratio
!           o3vmr (k)= max(f_zero,olyr(j1,k))                         ! input vol mixing ratio
!ncep model use
            h2ovmr(k)= max(f_zero,qlyr(j1,k)*amdw/(f_one-qlyr(j1,k))) ! input specific humidity
            o3vmr (k)= max(f_zero,olyr(j1,k)*amdo3)                   ! input mass mixing ratio

            tem0 = (f_one - h2ovmr(k))*con_amd + h2ovmr(k)*con_amw
            coldry(k) = tem2 * delp(k) / (tem1*tem0*(f_one + h2ovmr(k)))
            temcol(k) = 1.0e-12 * coldry(k)

            colamt(k,1) = max(f_zero,    coldry(k)*h2ovmr(k))         ! h2o
            colamt(k,2) = max(temcol(k), coldry(k)*gasvmr(j1,k,1))    ! co2
            colamt(k,3) = max(f_zero,    coldry(k)*o3vmr(k))          ! o3
          enddo

!  --- ...  set aerosol optical properties

          if (iaersw > 0) then
            do ib = 1, nbdsw
              do k = 1, nlay
                tauae(k,ib) = aerosols(j1,k,ib,1)
                ssaae(k,ib) = aerosols(j1,k,ib,2)
                asyae(k,ib) = aerosols(j1,k,ib,3)
              enddo
            enddo
          else
            tauae(:,:) = f_zero
            ssaae(:,:) = f_one
            asyae(:,:) = f_zero
          endif

          if (iflagliq > 0) then   ! use prognostic cloud method
            do k = 1, nlay
              cfrac(k) = clouds(j1,k,1)       ! cloud fraction
              cliqp(k) = clouds(j1,k,2)       ! cloud liq path
              reliq(k) = clouds(j1,k,3)       ! liq partical effctive radius
              cicep(k) = clouds(j1,k,4)       ! cloud ice path
              reice(k) = clouds(j1,k,5)       ! ice partical effctive radius
              cdat1(k) = clouds(j1,k,6)       ! cloud rain drop path
              cdat2(k) = clouds(j1,k,7)       ! rain partical effctive radius
              cdat3(k) = clouds(j1,k,8)       ! cloud snow path
              cdat4(k) = clouds(j1,k,9)       ! snow partical effctive radius
            enddo
          else                     ! use diagnostic cloud method
            do k = 1, nlay
              cfrac(k) = clouds(j1,k,1)       ! cloud fraction
              cdat1(k) = clouds(j1,k,2)       ! cloud optical depth
              cdat2(k) = clouds(j1,k,3)       ! cloud single scattering albedo
              cdat3(k) = clouds(j1,k,4)       ! cloud asymmetry factor
            enddo
          endif                    ! end if_iflagliq

        endif                       ! if_iflip

!  --- ...  set up gas column amount, convert from volume mixing ratio
!           to molec/cm2 based on coldry (scaled to 1.0e-20)

        if (iflip == 0) then        ! input from toa to sfc

          if (irgassw == 1) then
            do k = 1, nlay
              kk = nlp1 - k
              colamt(k,4) = max(temcol(k), coldry(k)*gasvmr(j1,kk,2))  ! n2o
              colamt(k,5) = max(temcol(k), coldry(k)*gasvmr(j1,kk,3))  ! ch4
              colamt(k,6) = max(temcol(k), coldry(k)*gasvmr(j1,kk,4))  ! o2
!             colamt(k,7) = max(temcol(k), coldry(k)*gasvmr(j1,kk,5))  ! co - notused
            enddo
          else
            do k = 1, nlay
              colamt(k,4) = temcol(k)                                  ! n2o
              colamt(k,5) = temcol(k)                                  ! ch4
              colamt(k,6) = temcol(k)                                  ! o2
!             colamt(k,7) = temcol(k)                                  ! co - notused
            enddo
          endif

        else                        ! input from sfc to toa

          if (irgassw == 1) then
            do k = 1, nlay
              colamt(k,4) = max(temcol(k), coldry(k)*gasvmr(j1,k,2))   ! n2o
              colamt(k,5) = max(temcol(k), coldry(k)*gasvmr(j1,k,3))   ! ch4
              colamt(k,6) = max(temcol(k), coldry(k)*gasvmr(j1,k,4))   ! o2
!             colamt(k,7) = max(temcol(k), coldry(k)*gasvmr(j1,k,5))   ! co - notused
            enddo
          else
            do k = 1, nlay
              colamt(k,4) = temcol(k)                                  ! n2o
              colamt(k,5) = temcol(k)                                  ! ch4
              colamt(k,6) = temcol(k)                                  ! o2
!             colamt(k,7) = temcol(k)                                  ! co - notused
            enddo
          endif

        endif                       ! if_iflip

!  --- ...  compute fractions of clear sky view

        if (iovrsw == 0) then                    ! random overlapping
          do k = 1, nlay
            zcf0 = zcf0 * (f_one - cfrac(k))
          enddo
        else if (iovrsw == 1) then               ! max/ran overlapping
          do k = 1, nlay
            if (cfrac(k) > ftiny) then                ! cloudy layer
              zcf1 = min ( zcf1, f_one-cfrac(k) )
            elseif (zcf1 < f_one) then                ! clear layer
              zcf0 = zcf0 * zcf1
              zcf1 = f_one
            endif
          enddo
          zcf0 = zcf0 * zcf1
        else if (iovrsw == 2) then               ! maximum overlapping
          do k = 1, nlay
            zcf0 = min ( zcf0, f_one-cfrac(k) )
          enddo
        endif

        if (zcf0 <= ftiny) zcf0 = f_zero
        if (zcf0 > oneminus) zcf0 = f_one
        zcf1 = f_one - zcf0

!  --- ...  compute cloud optical properties

        call cldprop                                                    &
!  ---  inputs:
     &     ( cfrac,cliqp,reliq,cicep,reice,cdat1,cdat2,cdat3,cdat4,     &
     &       zcf1, nlay, ipseed(j1),                                    &
!    &       zcf1, nlay, ipseed(ipt),                                   &
!  ---  outputs:
     &       taucw, ssacw, asycw, cldfrc                                &
     &     )

!  --- ...  calculate needed column amounts. using e = 1334.2 cm-1.

        do k = 1, nlay
          colmol(k) = coldry(k) + colamt(k,1)
          forfac(k) = pavel(k)*stpfac / (tavel(k)*(f_one + h2ovmr(k)))
        enddo

        do k = 1, nlay

!  --- ...  find the two reference pressures on either side of the
!           layer pressure.  store them in jp and jp1.  store in fp the
!           fraction of the difference (in ln(pressure)) between these
!           two values that the layer pressure lies.

          plog(k) = log(pavel(k))
          jp(k) = max(1, min(58, int(36.0 - 5.0*(plog(k)+0.04)) ))
          jp1   = jp(k) + 1
          fp    = 5.0 * (preflog(jp(k)) - plog(k))

!  --- ...  determine, for each reference pressure (jp and jp1), which
!          reference temperature (these are different for each reference
!          pressure) is nearest the layer temperature but does not exceed it.
!          store these indices in jt and jt1, resp. store in ft (resp. ft1)
!          the fraction of the way between jt (jt1) and the next highest
!          reference temperature that the layer temperature falls.

          tem1 = (tavel(k) - tref(jp(k))) / 15.0
          tem2 = (tavel(k) - tref(jp1  )) / 15.0
          jt (k) = max(1, min(4, int(3.0 + tem1) ))
          jt1(k) = max(1, min(4, int(3.0 + tem2) ))
          ft  = tem1 - float(jt (k) - 3)
          ft1 = tem2 - float(jt1(k) - 3)

!  --- ...  we have now isolated the layer ln pressure and temperature,
!           between two reference pressures and two reference temperatures
!           (for each reference pressure).  we multiply the pressure
!           fraction fp with the appropriate temperature fractions to get
!           the factors that will be needed for the interpolation that yields
!           the optical depths (performed in routines taugbn for band n).

          fp1 = f_one - fp
          fac10(k) = fp1 * ft
          fac00(k) = fp1 * (f_one - ft)
          fac11(k) = fp  * ft1
          fac01(k) = fp  * (f_one - ft1)

        enddo    ! end_do_k_loop

        do k = 1, nlay

!  --- ...  if the pressure is less than ~100mb, perform a different
!           set of species interpolations.

          if ( plog(k) > 4.56 ) then

            laytrop =  k

!  --- ...  set up factors needed to separately include the water vapor
!           foreign-continuum in the calculation of absorption coefficient.

            tem1 = (332.0 - tavel(k)) / 36.0
            indfor (k) = min(2, max(1, int(tem1)))
            forfrac(k) = tem1 - float(indfor(k))

!  --- ...  set up factors needed to separately include the water vapor
!           self-continuum in the calculation of absorption coefficient.

            tem2 = (tavel(k) - 188.0) / 7.2
            indself (k) = min(9, max(1, int(tem2)-7))
            selffrac(k) = tem2 - float(indself(k) + 7)
            selffac (k) = h2ovmr(k) * forfac(k)

          else

!  --- ...  set up factors needed to separately include the water vapor
!           foreign-continuum in the calculation of absorption coefficient.

            tem1 = (tavel(k) - 188.0) / 36.0
            indfor (k) = 3
            forfrac(k) = tem1 - f_one

            indself (k) = 0
            selffrac(k) = f_zero
            selffac (k) = f_zero

          endif

        enddo    ! end_do_k_loop

!  --- ...  call the 2-stream radiation transfer model

        if ( lfdncmp ) then

          call spcvrt                                                   &
!  ---  inputs:
     &     ( colamt, colmol, cosz1, sntz1, albbm, albdf, zcf1,          &
     &       cldfrc, taucw, ssacw, asycw, tauae, ssaae, asyae,          &
     &       forfac, forfrac, indfor, selffac, selffrac, indself,       &
     &       fac00, fac01, fac10, fac11, jp, jt, jt1, laytrop,          &
     &       nlay, nlp1,                                                &
!  ---  outputs:
     &       flxdcb, flxucb, flxd0b, flxu0b                             &
!! ---  optional outputs:
     &,      SFBMC=sfbmc,SFDFC=sfdfc,SFBM0=sfbm0,SFDF0=sfdf0            &
     &,      SUVBF0=suvbf0,SUVBFC=suvbfc                                &
     &     )

          if ( isubcol > 0 ) then        ! mcica cld scheme

!! --- ...  optional uv-b surface downward flux

            fdncmp(j1)%uvbf0 = ssolar * suvbf0
            fdncmp(j1)%uvbfc = ssolar * suvbfc

!! --- ...  optional beam and diffuse sfc fluxes

            fdncmp(j1)%nirbm = ssolar * sfbmc(1)
            fdncmp(j1)%nirdf = ssolar * sfdfc(1)
            fdncmp(j1)%visbm = ssolar * sfbmc(2)
            fdncmp(j1)%visdf = ssolar * sfdfc(2)

          else                           ! std cld scheme, scale fluxes

!! --- ...  optional uv-b surface downward flux

            fdncmp(j1)%uvbf0 = ssolar * suvbf0
            fdncmp(j1)%uvbfc = ssolar * (zcf1*suvbfc + zcf0*suvbf0)

!! --- ...  optional beam and diffuse sfc fluxes

            fdncmp(j1)%nirbm = ssolar * (zcf1*sfbmc(1) + zcf0*sfbm0(1))
            fdncmp(j1)%nirdf = ssolar * (zcf1*sfdfc(1) + zcf0*sfdf0(1))
            fdncmp(j1)%visbm = ssolar * (zcf1*sfbmc(2) + zcf0*sfbm0(2))
            fdncmp(j1)%visdf = ssolar * (zcf1*sfdfc(2) + zcf0*sfdf0(2))

          endif     ! end if_isubcol_block
        else

          call spcvrt                                                   &
!  ---  inputs:
     &     ( colamt, colmol, cosz1, sntz1, albbm, albdf, zcf1,          &
     &       cldfrc, taucw, ssacw, asycw, tauae, ssaae, asyae,          &
     &       forfac, forfrac, indfor, selffac, selffrac, indself,       &
     &       fac00, fac01, fac10, fac11, jp, jt, jt1, laytrop,          &
     &       nlay, nlp1,                                                &
!  ---  outputs:
     &       flxdcb, flxucb, flxd0b, flxu0b                             &
     &     )

        endif    ! end if_lfdncmp

        if ( isubcol == 0 ) then         ! std cld scheme, scale fluxes
          do mb = 1, nbdsw
            do k = 1, nlp1
              flxucb(k,mb) = zcf1*flxucb(k,mb) + zcf0*flxu0b(k,mb)
              flxdcb(k,mb) = zcf1*flxdcb(k,mb) + zcf0*flxd0b(k,mb)
            enddo
          enddo
        endif

        do k = 1, nlp1
          flxuc(k) = f_zero
          flxdc(k) = f_zero
          flxu0(k) = f_zero
          flxd0(k) = f_zero
        enddo

        do k = 1, nlp1
          do mb = 1, nbdsw
            flxuc(k) = flxuc(k) + flxucb(k,mb)
            flxdc(k) = flxdc(k) + flxdcb(k,mb)
            flxu0(k) = flxu0(k) + flxu0b(k,mb)
            flxd0(k) = flxd0(k) + flxd0b(k,mb)
          enddo
        enddo

        do k = 1, nlp1
          flxuc(k) = ssolar * flxuc(k)
          flxdc(k) = ssolar * flxdc(k)
          flxu0(k) = ssolar * flxu0(k)
          flxd0(k) = ssolar * flxd0(k)
          fnetc(k) = flxdc(k) - flxuc(k)
        enddo

!  --- ...  toa and sfc fluxes

        topflx(j1)%upfxc = flxuc(nlp1)
        topflx(j1)%dnfxc = flxdc(nlp1)
        topflx(j1)%upfx0 = flxu0(nlp1)

        sfcflx(j1)%upfxc = flxuc(1)
        sfcflx(j1)%dnfxc = flxdc(1)
        sfcflx(j1)%upfx0 = flxu0(1)
        sfcflx(j1)%dnfx0 = flxd0(1)

        if (iflip == 0) then        ! output from toa to sfc

!  --- ...  compute heating rates

          do k = 1, nlay
            kk = nlp1 - k
            hswc(j1,kk) = (fnetc(k+1) - fnetc(k)) * heatfac / delp(k)
          enddo

!! --- ...  optional flux profiles

          if ( lflxprf ) then
            do k = 1, nlp1
              kk = nlp1 - k + 1
              flxprf(j1,kk)%upfxc = flxuc(k)
              flxprf(j1,kk)%dnfxc = flxdc(k)
              flxprf(j1,kk)%upfx0 = flxu0(k)
              flxprf(j1,kk)%dnfx0 = flxd0(k)
            enddo
          endif

!! --- ...  optional clear sky heating rates

          if ( lhsw0 ) then
            fnet0(:) = flxd0(:) - flxu0(:)

            do k = 1, nlay
              kk = nlp1 - k
              hsw0(j1,kk) = (fnet0(k+1) - fnet0(k)) * heatfac / delp(k)
            enddo
          endif

!! --- ...  optional spectral band heating rates

          if ( lhswb ) then
            fnetb(:,:) = ssolar * (flxdcb(:,:) - flxucb(:,:))

            do k = 1, nlay
              kk = nlp1 - k
              do mb = 1, nbdsw
                hswb(j1,kk,mb) = (fnetb(k+1,mb) - fnetb(k,mb))          &
     &                         * heatfac / delp(k)
              enddo
            enddo
          endif

        else                        ! output from sfc to toa

!  --- ...  compute heating rates

          do k = 1, nlay
            hswc(j1,k) = (fnetc(k+1) - fnetc(k)) * heatfac / delp(k)
          enddo

!! --- ...  optional flux profiles

          if ( lflxprf ) then
            do k = 1, nlp1
              flxprf(j1,k)%upfxc = flxuc(k)
              flxprf(j1,k)%dnfxc = flxdc(k)
              flxprf(j1,k)%upfx0 = flxu0(k)
              flxprf(j1,k)%dnfx0 = flxd0(k)
            enddo
          endif

!! --- ...  optional clear sky heating rates

          if ( lhsw0 ) then
            fnet0(:) = flxd0(:) - flxu0(:)

            do k = 1, nlay
              hsw0(j1,k) = (fnet0(k+1) - fnet0(k)) * heatfac / delp(k)
            enddo
          endif

!! --- ...  optional spectral band heating rates

          if ( lhswb ) then
            fnetb(:,:) = ssolar * (flxdcb(:,:) - flxucb(:,:))

            do k = 1, nlay
              do mb = 1, nbdsw
                hswb(j1,k,mb) = (fnetb(k+1,mb) - fnetb(k,mb))           &
     &                        * heatfac / delp(k)
              enddo
            enddo
          endif

        endif                       ! if_iflip

      enddo   lab_do_ipt

      return
!...................................
      end subroutine swrad
!-----------------------------------


!-----------------------------------
      subroutine rswinit                                                &
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
!                =2: maximum overlap cloud                              !
!    isubc    - mcica sub-column cloud approximation control flag       !
!                =0: no sub-column cloud approximation                  !
!                =1: mcica sub-col approx. with prescribed initial seed !
!                =2: mcica sub-col approx. with specified initial seed  !
!                                                                       !
!  outputs: (none)                                                      !
!                                                                       !
!  control flags in module "module_radsw_cntr_para":                    !
!     iswrate - heating rate unit selections                            !
!               =1: output in k/day                                     !
!               =2: output in k/second                                  !
!     iaersw  - flags for aerosols effect                               !
!               =0: without aerosol effect                              !
!               >0: include aerosol effect                              !
!     imodsw  - control flag for 2-stream transfer scheme               !
!               =1; delta-eddington    (joseph et al., 1976)            !
!               =2: pifm               (zdunkowski et al., 1980)        !
!               =3: discrete ordinates (liou, 1973)                     !
!     irgassw - control flag for rare gases (ch4,n2o,o2, etc.)          !
!               =0: do not include rare gases                           !
!               =1: include all rare gases                              !
!     iflagliq- cloud optical properties contrl flag                    !
!               =0: input cloud opt depth from diagnostic scheme        !
!               >0: input cwp,cip, and other cloud content parameters   !
!                                                                       !
!  *******************************************************************  !
!  original code description                                            !
!                                                                       !
!  original version:   michael j. iacono; february, 2004                !
!  revision for f90 formatting:  m. j. iacono, july, 2006               !
!                                                                       !
!  this subroutine performs calculations necessary for the initialization
!  of the shortwave model.  lookup tables are computed for use in the sw!
!  radiative transfer, and input absorption coefficient data for each   !
!  spectral band are reduced from 224 g-point intervals to 112.         !
!                                                                       !
!  *******************************************************************  !
!                                                                       !
! definitions:                                                          !
!     arrays for 10000-point look-up tables:                            !
!     tau_tbl  clear-sky optical depth                                  !
!     exp_tbl  exponential lookup table for transmittance               !
!                                                                       !
!  *******************************************************************  !
!                                                                       !
!  ======================  end of description block  =================  !

!  ---  inputs:
      integer, intent(in) :: icwp, me, nlay, iovr, isubc

!  ---  outputs: none

!  ---  locals:
      real (kind=kind_phys), parameter :: expeps = 1.e-20

      integer :: i

      real (kind=kind_phys) :: tfn, tau

!
!===> ... begin here
!

      iovrsw  = iovr     ! assign module variable of overlap flagag

      isubcol = isubc    ! assign module variable sub_col clds flag

      if ( iovrsw<0 .or. iovrsw>2 ) then
        print *,'  *** Error in specification of cloud overlap flag',   &
     &          ' IOVRSW=',iovrsw,' in RSWINIT !!'
        stop
      endif

      if (me == 0) then
        print *,' - Using AER Shortwave Radiation, Version: ',VTAGSW

        if (imodsw == 1) then
          print *,'   --- Delta-eddington 2-stream transfer scheme'
        else if (imodsw == 2) then
          print *,'   --- PIFM 2-stream transfer scheme'
        else if (imodsw == 3) then
          print *,'   --- Discrete ordinates 2-stream transfer scheme'
        endif

        if (iaersw == 0) then
          print *,'   --- Aerosol effect is NOT included in SW, all'    &
     &           ,' internal aerosol parameters are set to zeros'
        else
          print *,'   --- Using input aerosol parameters for SW'
        endif

        if (irgassw == 0) then
          print *,'   --- Rare gases absorption is NOT included in SW'
        else
          print *,'   --- Include rare gases N2O, CH4, O2, absorptions',&
     &            ' in SW'
        endif

        if ( isubcol == 0 ) then
          print *,'   --- Using standard grid average clouds, no ',     &
     &            'sub-column clouds approximation applied'
        elseif ( isubcol == 1 ) then
          print *,'   --- Using MCICA sub-colum clouds approximation ', &
     &            'with a prescribed sequence of permutation seeds'
        elseif ( isubcol == 2 ) then
          print *,'   --- Using MCICA sub-colum clouds approximation ', &
     &            'with provided input array of permutation seeds'
        else
          print *,'  *** Error in specification of sub-column cloud ',  &
     &            ' control flag isubc =',isubcol,' !!'
          stop
        endif
      endif

!  --- ...  set initial permutation seed

      ipsdsw = ipsdsw0

!  --- ...  check cloud flags for consistency

      if ((icwp == 0 .and. iflagliq /= 0) .or.                          &
     &    (icwp == 1 .and. iflagliq == 0)) then
        print *,'  *** Model cloud scheme inconsistent with SW',        &
     &          ' radiation cloud radiative property setup !!'
        stop
      endif

!  --- ...  setup constant factors for heating rate
!           the 1.0e-2 is to convert pressure from mb to N/m**2

      if (iswrate == 1) then
!       heatfac = 8.4391
!       heatfac = con_g * 86400. * 1.0e-2 / con_cp  !   (in k/day)
        heatfac = con_g * 864.0 / con_cp            !   (in k/day)
      else
        heatfac = con_g * 1.0e-2 / con_cp           !   (in k/second)
      endif

!  --- ...  define exponential lookup tables for transmittance. tau is
!           computed as a function of the tau transition function, and
!           transmittance is calculated as a function of tau.  all tables
!           are computed at intervals of 0.0001.  the inverse of the
!           constant used in the Pade approximation to the tau transition
!           function is set to bpade.

      exp_tbl(0) = 1.0
      exp_tbl(NTBMX) = expeps

      do i = 1, NTBMX-1
        tfn = float(i) / float(NTBMX-i)
        tau = bpade * tfn
        exp_tbl(i) = exp( -tau )
      enddo

      return
!...................................
      end subroutine rswinit
!-----------------------------------


!-----------------------------------
      subroutine cldprop                                                &
!...................................
!  ---  inputs:
     &     ( cfrac,cliqp,reliq,cicep,reice,cdat1,cdat2,cdat3,cdat4,     &
     &       cf1, nlay, ipseed,                                         &
!  ---  output:
     &       taucw, ssacw, asycw, cldfrc                                &
     &     )

!  ===================  program usage description  ===================  !
!                                                                       !
! Purpose: Compute the cloud optical properties for each cloudy layer   !
! and g-point interval.                                                 !
!                                                                       !
! subprograms called:  none                                             !
!                                                                       !
!  ====================  defination of variables  ====================  !
!                                                                       !
!  inputs:                                                        size  !
!    cfrac - real, layer cloud fraction                            nlay !
!        .....  for  iflagliq > 0 (prognostic cloud sckeme)  - - -      !
!    cliqp - real, layer in-cloud liq water path (g/m**2)          nlay !
!    reliq - real, mean eff radius for liq cloud (micron)          nlay !
!    cicep - real, layer in-cloud ice water path (g/m**2)          nlay !
!    reice - real, mean eff radius for ice cloud (micron)          nlay !
!    cdat1 - real, layer rain drop water path (g/m**2)             nlay !
!    cdat2 - real, effective radius for rain drop (micron)         nlay !
!    cdat3 - real, layer snow flake water path(g/m**2)             nlay !
!              (if use fu's formula it needs to be normalized by        !
!              snow density (g/m**3/1.0e6) to get unit of micron)       !
!    cdat4 - real, mean eff radius for snow flake(micron)          nlay !
!        .....  for iflagliq = 0  (diagnostic cloud sckeme)  - - -      !
!    cdat1 - real, layer cloud optical depth                       nlay !
!    cdat2 - real, layer cloud single scattering albedo            nlay !
!    cdat3 - real, layer cloud asymmetry factor                    nlay !
!    cdat4 - real, optional use                                    nlay !
!    cliqp - real, not used                                        nlay !
!    cicep - real, not used                                        nlay !
!    reliq - real, not used                                        nlay !
!    reice - real, not used                                        nlay !
!                                                                       !
!    cf1   - real, effective total cloud cover at surface           1   !
!    nlay  - integer, vertical layer number                         1   !
!    ipseed- permutation seed for generating random numbers (isubcol>0) !
!                                                                       !
!  outputs:                                                             !
!    taucw  - real, cloud optical depth, w/o delta scaled    nlay*ngptsw!
!    ssacw  - real, weighted cloud single scattering albedo  nlay*ngptsw!
!                             (ssa = ssacw / taucw)                     !
!    asycw  - real, weighted cloud asymmetry factor          nlay*ngptsw!
!                             (asy = asycw / ssacw)                     !
!    cldfrc - real, cloud fraction for each sub-column       nlay*ngptsw!
!                                                                       !
!                                                                       !
!  explanation of the method for each value of iflagliq, and iflagice.  !
!  set up in module "module_radlw_cntr_para"                            !
!                                                                       !
!     iflagliq=0 : input cloud optical property (tau, ssa, asy).        !
!                  (used for diagnostic cloud method)                   !
!     iflagliq>0 : input cloud liq/ice path and effective radius, also  !
!                  require the user of 'iflagice' to specify the method !
!                  used to compute aborption due to water/ice parts.    !
!  ...................................................................  !
!                                                                       !
!     iflagliq=1:  liquid water cloud optical properties are computed   !
!                  as in hu and stamnes (1993), j. clim., 6, 728-742.   !
!                                                                       !
!     iflagice used only when iglagliq > 0                              !
!                  the cloud ice path (g/m2) and ice effective radius   !
!                  (microns) are inputs.                                !
!     iflagice=1:  ice cloud optical properties are computed as in      !
!                  ebert and curry (1992), jgr, 97, 3831-3836.          !
!     iflagice=2:  ice cloud optical properties are computed as in      !
!                  streamer v3.0 (2001), key, streamer user's guide,    !
!                  cooperative institude for meteorological studies,95pp!
!     iflagice=3:  ice cloud optical properties are computed as in      !
!                  fu (1996), j. clim., 9.                              !
!                                                                       !
!  other cloud control module variables:                                !
!                                                                       !
!     isubcol =0: standard cloud scheme, no sub-col cloud approximation !
!             >0: mcica sub-col cloud scheme using ipseed as permutation!
!                 seed for generating rundom numbers                    !
!                                                                       !
!  ======================  end of description block  =================  !
!
      use module_radsw_cldprtb

!  ---  inputs:
      integer, intent(in) :: nlay, ipseed
      real (kind=kind_phys), intent(in) :: cf1

      real (kind=kind_phys), dimension(:), intent(in) :: cliqp, reliq,  &
     &       cicep, reice, cdat1, cdat2, cdat3, cdat4, cfrac

!  ---  outputs:
      real (kind=kind_phys), dimension(:,:), intent(out) :: cldfrc,     &
     &       taucw, ssacw, asycw

!  ---  locals:
      real (kind=kind_phys), dimension(nlay,ngptsw):: cliqwp, cicewp,   &
     &       crainp, csnowp, taucld, ssacld, asycld

      real (kind=kind_phys), dimension(nlay)       :: cldf

!  need change dge to fsf for v3.61

      real (kind=kind_phys) ::   dgeice, fdelta, factor, fint,          &
     &       tauliq, ssaliq, asyliq, cldliq, cldice, cldran, cldsnw,    &
     &       tauice, ssaice, asyice, refliq, refice, refran, refsnw,    &
     &       tauran, ssaran, asyran, tausnw, ssasnw, asysnw,            &
     &       extcoliq, ssacoliq, asycoliq, forcoliq,                    &
     &       extcoice, ssacoice, asycoice, forcoice

      integer :: ia, ib, ic, ig, k, index

!
!===> ...  begin here
!
!     print *,' IN CLDPROP, ISUBCOL=',isubcol,'  IPSEED=',ipseed

      do ig = 1, ngptsw
        do k = 1, nlay
          cldfrc(k,ig) = f_zero
          taucw (k,ig) = f_zero
          ssacw (k,ig) = f_one
          asycw (k,ig) = f_zero
        enddo
      enddo

      if ( cf1 <= eps ) return     ! if clear-sky colum, return

      if ( isubcol > 0 ) then      ! mcica sub-col clouds approx

        cldf(:) = cfrac(:)
        where (cldf(:) < ftiny)
          cldf(:) = f_zero
        end where

!  --- ...  call sub-column cloud generator

        call mcica_subcol                                               &
!  ---  inputs:
     &     ( cldf, cicep, cliqp, cdat1, cdat2, cdat3,                   &
     &       nlay, ngptsw, ipseed, iflagliq,                            &
!  ---  outputs:
     &       cldfrc, cicewp, cliqwp, crainp, csnowp,                    &
     &       taucld, ssacld, asycld                                     &
     &     )

      else                         ! isubcol = 0, standard approach

        if ( iflagliq == 0 ) then
          do k = 1, nlay
            cldfrc(k,1) = cfrac(k) / cf1    ! nomalize cld fraction
            taucld(k,1) = cdat1(k)
            ssacld(k,1) = cdat2(k)
            asycld(k,1) = cdat3(k)
          enddo
        else
          do k = 1, nlay
            cldfrc(k,1)  = cfrac(k) / cf1    ! normalize cld fraction
            cliqwp(k,1)  = cliqp(k)
            cicewp(k,1)  = cicep(k)
            crainp(k,1)  = cdat1(k)
            csnowp(k,1)  = cdat3(k)
          enddo
        endif   ! end if_iflagliq_block

      endif  ! end if_isubcol_block

!  --- ...  diagnostic cloud scheme

      if ( iflagliq == 0 ) then

!  --- ...  loop over g-points
        do ig = 1, ngptsw
          if ( isubcol > 0 ) then   ! use mcica cloud scheme
            ic = ig
          else                      ! use standard cloud scheme
            ic = 1
          endif

!  --- ...  no delta scaling here, move scaling to subroutine spcvrt
          do k = 1, nlay
            if ( cldfrc(k,ic) >= ftiny ) then
              taucw(k,ig) = taucld(k,ic)
              ssacw(k,ig) = taucld(k,ic)* ssacld(k,ic)
              asycw(k,ig) = ssacw(k,ig) * asycld(k,ic)
            endif   ! end if_cldfrc_block
          enddo   ! end do_k_loop

        enddo   ! end_do_ig_loop

        return
      endif   ! end if_iflagliq_block

!  --- ...  the following are for prognostic cloud scheme (iflagliq>0)

      do ig = 1, ngptsw
        ib = ngb(ig)              ! spectral band index
        ia  = idxebc(ib)          ! eb_&_c band index for ice cloud coeff

        if ( isubcol > 0 ) then   ! use mcica cloud scheme
          ic = ig
        else                      ! use standard cloud scheme
          ic = 1
        endif

        do k = 1, nlay
          cldliq = cliqwp(k,ic)
          cldice = cicewp(k,ic)
          cldran = crainp(k,ic)
          cldsnw = csnowp(k,ic)
          refliq = reliq(k)
          refice = reice(k)
          refran = cdat2(k)
          refsnw = cdat4(k)

          if ( cldfrc(k,ic) >= ftiny ) then

!  --- ...  calculation of absorption coefficients due to ice clouds.
            if ( cldice <= f_zero ) then
              extcoice = f_zero
              ssacoice = f_one
              asycoice = f_zero
              forcoice = f_zero
            else

!  --- ...  ebert and curry approach for all particle sizes though somewhat
!           unjustified for large ice particles

              if ( iflagice == 1 ) then

                refice = max( 13.0, min( 130.0, refice ))

                extcoice = max( f_zero, abari(ia)+bbari(ia)/refice )
                ssacoice = max( f_zero, min( f_one,                     &
     &                          f_one-cbari(ia)-dbari(ia)*refice ))
                asycoice = max( f_zero, min( f_one,                     &
     &                          ebari(ia)+fbari(ia)*refice ))
                forcoice = asycoice * asycoice

!  --- ...  streamer approach for ice effective radius between 5.0 and 131.0 microns

              elseif ( iflagice == 2 ) then

                refice = max( 5.0, min( 131.0, refice ))

                factor = (refice - 2.0) / 3.0
                index  = max( 1, min( 42, int( factor ) ))
                fint   = factor - float(index)

                extcoice = max( f_zero,           extice2(index,ib)     &
     &                + fint*(extice2(index+1,ib)-extice2(index,ib)) )
                ssacoice = max( f_zero, min( f_one, ssaice2(index,ib)   &
     &                + fint*(ssaice2(index+1,ib)-ssaice2(index,ib)) ))
                asycoice = max( f_zero, min( f_one, asyice2(index,ib)   &
     &                + fint*(asyice2(index+1,ib)-asyice2(index,ib)) ))
                forcoice = asycoice * asycoice

!  --- ...  fu's approach for ice effective radius between 4.8 and 135.7 microns
!           (generalized effective size from 5 to 140 microns).

              elseif ( iflagice == 3 ) then

                dgeice = max( 5.0, min( 140.0, 1.0315*refice ))

                factor = (dgeice - 2.0) / 3.0
                index  = max( 1, min( 45, int( factor ) ))
                fint   = factor - float(index)

                extcoice = max( f_zero,           extice3(index,ib)     &
     &                + fint*(extice3(index+1,ib)-extice3(index,ib)) )
                ssacoice = max( f_zero, min( f_one, ssaice3(index,ib)   &
     &                + fint*(ssaice3(index+1,ib)-ssaice3(index,ib)) ))
                asycoice = max( f_zero, min( f_one, asyice3(index,ib)   &
     &                + fint*(asyice3(index+1,ib)-asyice3(index,ib)) ))
                fdelta   = max( f_zero, min( f_one, fdlice3(index,ib)   &
     &                + fint*(fdlice3(index+1,ib)-fdlice3(index,ib)) ))
                forcoice = min( asycoice, fdelta+0.5/ssacoice )           ! see fu 1996 p. 2067

              endif   ! end if_iflagice_block

            endif   ! end if_cldice_block

!  --- ...  calculation of absorption coefficients due to water clouds.

            if ( cldliq <= f_zero ) then
              extcoliq = f_zero
              ssacoliq = f_one
              asycoliq = f_zero
              forcoliq = f_zero
            else
              if ( iflagliq == 1 ) then
                factor = refliq - 1.5
                index  = max( 1, min( 57, int( factor ) ))
                fint   = factor - float(index)

                extcoliq = max( f_zero,           extliq1(index,ib)     &
     &              + fint*(extliq1(index+1,ib)-extliq1(index,ib)) )
                ssacoliq = ssaliq1(index,ib)                            &
     &              + fint*(ssaliq1(index+1,ib)-ssaliq1(index,ib))
                if ( fint < f_zero .and. ssacoliq > f_one )             &
     &              ssacoliq = ssaliq1(index,ib)
                ssacoliq = max( f_zero, min( f_one, ssacoliq ) )
                asycoliq = max( f_zero, min( f_one, asyliq1(index,ib)   &
     &              + fint*(asyliq1(index+1,ib)-asyliq1(index,ib)) ))
                forcoliq = asycoliq * asycoliq
              endif   ! end if_iflagliq_block
            endif   ! end if_cldliq_block

!  --- ...  no delta-scaling here, move the scaling to subroutine swflux

            tauliq = cldliq * extcoliq
            ssaliq = tauliq * ssacoliq
            asyliq = ssaliq * asycoliq

            tauice = cldice * extcoice
            ssaice = tauice * ssacoice
            asyice = ssaice * asycoice

!  --- ...  optical depth for rain and snow

            tauran = cldran * a0r
            if (cldsnw>f_zero .and. refsnw>10.0) then
              tausnw = cldsnw * (a0s + a1s/refsnw)
            else
              tausnw = f_zero
            endif

            ssaran = tauran * (f_one - b0r(ib))
            asyran = ssaran * c0r(ib)

            ssasnw = tausnw * (f_one - (b0s(ib)+b1s(ib)*refsnw))
            asysnw = ssasnw * c0s(ib)

!  --- ...  combine all partical components for output

            taucw(k,ig) = tauliq + tauice + tauran + tausnw
            ssacw(k,ig) = ssaliq + ssaice + ssaran + ssasnw
            asycw(k,ig) = asyliq + asyice + asyran + asysnw

!  --- ...  the following are two different scaling method (mth-moments)
!           presented in the original code.  when choosing the first moment
!           approach (a generally used approach), the two methods will become
!           identical to the one that is widely accepted delta-scaling formula.
!           here, we decide to move the delta-scaling of cloud layer optical
!           properties to the subprogram "swflux", and to treat cloud liq,
!           ice, rain, snow, ... in the same fashion as other atmospheric
!           components.  The overall differences are small. (y-t. hou of ncep)
!
!           if ( iflagice == 3 ) then
!  --- ...  in accordance with the 1996 Fu paper, equation A.3, the moments
!           for ice were calculated depending on whether using spheres or
!           hexagonal ice crystals. set asymetry parameter to first moment (istr=1)
!             istr = 1
!             asycw(k,ig) = ( f_one/(scatliq + scatice))                &
!    &          * (scatliq*(asycoliq**istr-forcoliq)/(f_one-forcoliq)   &
!    &          + scatice*((asycoice-forcoice)/(f_one-forcoice))**istr)
!           else
!  --- ...  this code is the standard method for delta-m scaling.
!           set asymetry parameter to first moment (istr=1)
!             istr = 1
!             asycw(k,ig) = ( f_one/(scatliq + scatice))                &
!    &          * (scatliq*(asycoliq**istr-forcoliq)/(f_one-forcoliq)   &
!    &          + scatice*(asycoice**istr-forcoice)/(f_one-forcoice))
!           endif

          endif   ! end if_cldfrc_block
        enddo   ! end do_k_loop

      enddo   ! end do_ig_loop
 
      return
!...................................
      end subroutine cldprop
!-----------------------------------


! ----------------------------------
      subroutine mcica_subcol                                           &
! ..................................
!  ---  inputs:
     &    ( cldf, cicep, cliqp, cda1, cda2, cda3,                       &
     &      nlay, nsub, ipseed, iflagcld,                               &
!  ---  outputs:
     &      cldfmc, cicemc, cliqmc, cranmc, csnwmc,                     &
     &      taucmc, ssacmc, asycmc                                      &
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
!   ssacmc  - real, cloud single scattering albedo [mcica]     nlay*nsub!
!   asycmc  - real, cloud asymmetry parameter [mcica]          nlay*nsub!
!                                                                       !
!  other control flags from module variables:                           !
!     iovrsw    : control flag for cloud overlapping method             !
!                 =0:random; =1:maximum/random; =2:maximum              !
!                                                                       !
!  =====================    end of definitions    ====================  !

      implicit none

!  ---  inputs:
      integer, intent(in) :: nlay, nsub, ipseed, iflagcld

      real (kind=kind_phys), dimension(:),   intent(in) :: cicep,       &
     &       cliqp, cda1, cda2, cda3, cldf

!  ---  outputs:
      real (kind=kind_phys), dimension(:,:), intent(out):: cldfmc,      &
     &       cicemc, cliqmc, cranmc, csnwmc, taucmc, ssacmc, asycmc

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

      select case ( iovrsw )

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

!  ---  first pick a random number for bottom/top layer.
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

!  ---  then walk down the column: (if use original author's method)
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
              ssacmc(k,n) = cda2(k)
              asycmc(k,n) = cda3(k)
            else
              taucmc(k,n) = f_zero
              ssacmc(k,n) = f_one
              asycmc(k,n) = f_zero
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


!-----------------------------------
      subroutine spcvrt                                                 &
!...................................

!  ---  inputs:
     &     ( colamt, colmol, cosz, sntz, albbm, albdf, cf1,             &
     &       cldfrc, taucw, ssacw, asycw, tauae, ssaae, asyae,          &
     &       forfac, forfrac, indfor, selffac, selffrac, indself,       &
     &       fac00, fac01, fac10, fac11, jp, jt, jt1, laytrop,          &
     &       nlay, nlp1,                                                &
!  ---  outputs:
     &       flxdc, flxuc, flxd0, flxu0                                 &
!! ---  optional outputs:
     &,      sfbmc, sfdfc, sfbm0, sfdf0                                 &
     &,      suvbf0, suvbfc                                             &
     &     )

!  ===================  program usage description  ===================  !
!                                                                       !
!   purpose:  computes the shortwave radiative fluxes using two-stream  !
!             method of h. barker and mcica, the monte-carlo independent!
!             column approximation, for the representation of sub-grid  !
!             cloud variability (i.e. cloud overlap).                   !
!                                                                       !
!   subprograms called:  none                                           !
!                                                                       !
!  ====================  defination of variables  ====================  !
!                                                                       !
!  inputs:                                                        size  !
!     colamt    - real, column amounts of h2o, co2, o3, n2o, ch4,       !
!                   o2, co (mol/cm**2)                       nlay*maxgas!
!     colmol    - real, total column amount (dry air+water vapor)  nlay !
!     cosz      - real, cosine of solar zenith angle                1   !
!     sntz      - real, secant of solar zenith angle                1   !
!     albbm     - real, direct beam sfc albedo for nir and uv+vis   2   !
!     albdf     - real, diffuse surface albedo for nir and uv+vis   2   !
!     cf1       - real, effective total cloud cover at surface      1   !
!     cldfrc    - real, layer cloud fraction                 nlay*ngptsw!
!     taucw     - real, layer cld opt depth w/o delt scaling nlay*ngptsw!
!     ssacw     - real, cld s. s. alb multiplied by tau      nlay*ngptsw!
!     asycw     - real, cld asym fac multip by tau and ssa   nlay*ngptsw!
!     tauae,ssaae,asyae (nlay,nbdsw)                                    !
!     tauae,ssaae,asyae                                      nlay*nbdsw !
!               - real, layer aerosols optical depth, single scatt.     !
!                       albedo, and asymmetry factor                    !
!     forfac    - real, scale factor needed to foreign-continuum.  nlay !
!     forfrac   - real, factor needed for temperature interpolation     !
!                       reference w.v. foreign-continuum data      nlay !
!     indfor    - integer, index of lower reference temperatures for    !
!                       the foreign-continuum interpolation        nlay !
!     selffac   - real, scale factor needed to h2o self-continuum. nlay !
!     selffrac  - real, factor for temperature interpolation of         !
!                       reference h2o self-continuum data          nlay !
!     indself   - integer, index of lower reference temperatures for    !
!                       the self-continuum interpolation           nlay !
!     facij     - real, factors multiply the reference ks, i,j of 0/1   !
!                       for lower/higher of the 2 appropriate temp,     !
!                       and altitudes.                             nlay !
!     jp        - real, index of lower reference pressure          nlay !
!     jt, jt1   - real, indices of lower reference temperatures for     !
!                       pressure levels jp and jp+1, respectively  nlay !
!     laytrop   - integer, layer at which switch is made from one       !
!                       combination of key species to another       1   !
!     nlay, nlp1- integer, number of layers/levels                  1   !
!                                                                       !
!  output variables:                                                    !
!     flxdc     - real, downward flux for cloudy sky          nlp1*nbdsw!
!     flxuc     - real, upward flux for cloudy sky            nlp1*nbdsw!
!     flxd0     - real, downward flux for clear sky           nlp1*nbdsw!
!     flxu0     - real, upward flux for clear sky             nlp1*nbdsw!
!                                                                       !
!! optional output variables:                                           !
!     sfbmc     - real, cloudy sky sfc down beam fluxes (nir,uv+vis)  2 !
!     sfdfc     - real, clousy sky sfc down diff fluxes (nir,uv+vis)  2 !
!     sfbm0     - real, clear sky sfc  down beam fluxes (nir,uv+vis)  2 !
!     sfdf0     - real, clear sky sfc  down diff fluxes (nir,uv+vis)  2 !
!     suvbfc    - real, cloudy sky sfc  down uv-b fluxes              1 !
!     suvbf0    - real, clear sky sfc  down uv-b fluxes               1 !
!                                                                       !
!  internal subroutines called:  taumol, swflux                         !
!  external subroutines called:  none                                   !
!                                                                       !
!  *******************************************************************  !
!  original code description                                            !
!                                                                       !
! purpose: contains spectral loop to compute the shortwave radiative    !
!          fluxes, using the two-stream method of h. barker.            !
!                                                                       !
! interface: *spcvrt_sw* is called from *rrtmg_sw.f90* or               !
!            rrtmg_sw.1col.f90*                                         !
!                                                                       !
! method:                                                               !
!    adapted from two-stream model of h. barker;                        !
!    two-stream model options (selected with kmodts in                  !
!    rrtmg_sw_reftra.f90):                                              !
!        1: eddington, 2: pifm, zdunkowski et al., 3: discret ordinates !
!                                                                       !
! modifications:                                                        !
!                                                                       !
! original: h. barker                                                   !
! revision: merge with rrtmg_sw: j.-j.morcrette, ecmwf, feb 2003        !
! revision: add adjustment for earth/sun distance:mjiacono,aer, oct2003 !
! revision: bug fix for use of palbp and palbd: mjiacono, aer, nov 2003 !
! revision: bug fix to apply delta scaling to clear sky: aer, dec 2004  !
! revision: code modified so that delta scaling is not done in cloudy   !
!           profiles if routine cldprop is used; delta scaling can be   !
!           applied by swithcing code below if cldprop is not used to   !
!           get cloud properties. aer, jan 2005                         !
! revision: uniform formatting for rrtmg: mjiacono, aer, jul 2006       !
! revision: use exponential lookup table for transmittance: mjiacono,   !
!           aer, aug 2007                                               !
!                                                                       !
!  *******************************************************************  !
!  ======================  end of description block  =================  !

!  ---  inputs:
      integer,               intent(in) :: nlay, nlp1, laytrop

      integer, dimension(:), intent(in) :: indfor, indself, jp, jt, jt1

      real (kind=kind_phys), dimension(:),  intent(in) ::               &
     &       colmol, forfac, forfrac, selffac, selffrac, albbm, albdf,  &
     &       fac00, fac01, fac10, fac11

      real (kind=kind_phys), dimension(:,:),intent(in) :: colamt,       &
     &       cldfrc, taucw, ssacw, asycw, tauae, ssaae, asyae

      real (kind=kind_phys), intent(in) :: cosz, sntz, cf1

!  ---  outputs:
      real (kind=kind_phys), dimension(:,:), intent(out) :: flxdc,      &
     &       flxuc, flxd0, flxu0

!! ---  optional outputs:
      real (kind=kind_phys), dimension(:), optional, intent(out) ::     &
     &       sfbmc, sfdfc, sfbm0, sfdf0
      real (kind=kind_phys), optional, intent(out) :: suvbfc, suvbf0

!  ---  locals:
      integer :: ibd, jb, k

!  ---  direct outputs from "taumol"
      real (kind=kind_phys), dimension(nlay,ngptsw) :: taug, taur
      real (kind=kind_phys), dimension(ngptsw)      :: sfluxzen

!  ---  direct outputs from "swflux":
      real (kind=kind_phys), dimension(nlp1,2)     :: fxdn, fxup

!! ---  for optional output from "swflux":
      real (kind=kind_phys) :: sflxbc,sflxdc,sflxb0,sflxd0

!
!===> ...  begin here
!
!  --- ... initialization of output fluxes

      do ibd = 1, nbdsw
        do k = 1, nlp1
          flxdc(k,ibd) = f_zero
          flxuc(k,ibd) = f_zero
          flxd0(k,ibd) = f_zero
          flxu0(k,ibd) = f_zero
        enddo
      enddo

      if ( lfdncmp ) then

!! --- ...  optional uv-b surface downward flux
        suvbfc  = f_zero
        suvbf0  = f_zero

!! --- ...  optional output surface fluxes
        sfbmc(1) = f_zero
        sfbmc(2) = f_zero
        sfdfc(1) = f_zero
        sfdfc(2) = f_zero
        sfbm0(1) = f_zero
        sfbm0(2) = f_zero
        sfdf0(1) = f_zero
        sfdf0(2) = f_zero

      endif

!  --- ...  calculate optical depths for gaseous absorption and Rayleigh
!           scattering

      call taumol                                                       &
!  ---  inputs:
     &     ( nlay, colamt, colmol,                                      &
     &       forfac, forfrac, indfor, selffac, selffrac, indself,       &
     &       fac00, fac01, fac10, fac11, jp, jt, jt1, laytrop,          &
!  ---  outputs:
     &       sfluxzen, taug, taur                                       &
     &     )

!  --- ...  loop over each spectral band

      lab_do_jb : do jb = nblow, nbhgh

!  --- ...  compute radiation fluxes

        call swflux ( jb )

!  ---  ... save fluxes for seach spectral band

        ibd = jb - nblow + 1
        do k = 1, nlp1
          flxuc(k,ibd) = fxup(k,2)
          flxdc(k,ibd) = fxdn(k,2)
          flxu0(k,ibd) = fxup(k,1)
          flxd0(k,ibd) = fxdn(k,1)
        enddo

        if ( lfdncmp ) then

!! --- ...  optional uv-b surface downward flux
          if (jb == nuvb) then
            suvbf0 = suvbf0 + fxdn(1,1)
            suvbfc = suvbfc + fxdn(1,2)
          endif

!! --- ...  optional surface downward flux components
          ibd = idxsfc(jb)
          if (ibd == 0) then
            sfbmc(1) = sfbmc(1) + 0.5*sflxbc
            sfdfc(1) = sfdfc(1) + 0.5*sflxdc
            sfbm0(1) = sfbm0(1) + 0.5*sflxb0
            sfdf0(1) = sfdf0(1) + 0.5*sflxd0
            sfbmc(2) = sfbmc(2) + 0.5*sflxbc
            sfdfc(2) = sfdfc(2) + 0.5*sflxdc
            sfbm0(2) = sfbm0(2) + 0.5*sflxb0
            sfdf0(2) = sfdf0(2) + 0.5*sflxd0
          else
            sfbmc(ibd) = sfbmc(ibd) + sflxbc
            sfdfc(ibd) = sfdfc(ibd) + sflxdc
            sfbm0(ibd) = sfbm0(ibd) + sflxb0
            sfdf0(ibd) = sfdf0(ibd) + sflxd0
          endif

        endif    ! end if_lfdncmp

      enddo  lab_do_jb


! =================
      contains
! =================

!-----------------------------------
      subroutine swflux ( jb )
!...................................

!  ===================  program usage description  ===================  !
!                                                                       !
!   purpose:  computes the upward and downward radiation fluxes         !
!             this program combines the original "reftra" and "vrtqdr"  !
!                                                                       !
!             first (reftra) it computes the reflectivity and           !
!             transmissivity of a clear or cloudy layer using a choice  !
!             of various approximations.                                !
!                                                                       !
!             then (vrtqdr) performs the vertical quadrature            !
!             integration to obtain level fluxes.                       !
!                                                                       !
!   subroutines called : none                                           !
!                                                                       !
!  ====================  defination of variables  ====================  !
!                                                                       !
!  inputs:                                                     -size-   !
!    jb      - integer, spectral band index                       1     !
!                                                                       !
!  variables direct from "spcvrt"):                                     !
!    taug    - real, spectral optical depth for gases        nlay*ngptsw!
!    taur    - real, optical depth for rayleigh scattering   nlay*ngptsw!
!    sfluxzen- real, spectral distribution of incoming solar flux ngptsw!
!    taucw   - real, weighted cloud optical depth       nlay*nblow:nbhgh!
!    ssacw   - real, weighted cloud single scat albedo  nlay*nblow:nbhgh!
!    asycw   - real, weighted cloud asymmetry factor    nlay*nblow:nbhgh!
!    tauae   - real, aerosols optical depth             nlay*nblow:nbhgh!
!    ssaae   - real, aerosols single scattering albedo  nlay*nblow:nbhgh!
!    asyae   - real, aerosols asymmetry factor          nlay*nblow:nbhgh!
!    cf1     - real, >0: cloudy sky, otherwise: clear sky          1    !
!    cldfrc  - real, layer cloud fraction                    nlay*ngptsw!
!    cosz    - real, cosine solar zenith angle                     1    !
!    sntz    - real, secant solar zenith angle                     1    !
!    albbm   - real, surface albedo for direct beam radiation      2    !
!    albdf   - real, surface albedo for diffused radiation         2    !
!    nlay,nlp1 - integer,  number of layers/levels                 1    !
!                                                                       !
!  control parameters in module "module_radsw_cntr_para":               !
!    imodsw  - control flag for 2-stream transfer schemes               !
!              = 1 delta-eddington    (joseph et al., 1976)             !
!              = 2 pifm               (zdunkowski et al., 1980)         !
!              = 3 discrete ordinates (liou, 1973)                      !
!                                                                       !
!  output variables direct to "spcvrt":                                 !
!    fxdn    - real, downward flux, 1: clear sky, 2: cloudy sky  nlp1*2 !
!    fzup    - real, upward flux,   1: clear sky, 2: cloudy sky  nlp1*2 !
!                                                                       !
!! optional output variables (direct to "spcvrt"):                      !
!    sflxbc  - real, cloudy sky sfc downward beam flux             1    !
!    sflxdc  - real, cloudy sky sfc downward diff flux             1    !
!    sflxb0  - real, clear sky sfc downward beam flux              1    !
!    sflxd0  - real, clear sky sfc downward diff flux              1    !
!                                                                       !
!  internal variables:                                                  !
!    zrefb   - real, direct beam reflectivity for clear/cloudy   nlp1*2 !
!    zrefd   - real, diffuse reflectivity for clear/cloudy       nlp1*2 !
!    ztrab   - real, direct beam transmissivity for clear/cloudy nlp1*2 !
!    ztrad   - real, diffuse transmissivity for clear/cloudy     nlp1*2 !
!    zldbt   - real, layer beam transmittance for clear/cloudy   nlp1*2 !
!    ztdbt   - real, lev total beam transmittance for clr/cld    nlp1*2 !
!    jg      - integer, g-point index                              1    !
!                                                                       !
!  *******************************************************************  !
!  original code description                                            !
!                                                                       !
!  method:                                                              !
!  -------                                                              !
!     standard delta-eddington, p.i.f.m., or d.o.m. layer calculations. !
!     kmodts  = 1 eddington (joseph et al., 1976)                       !
!             = 2 pifm (zdunkowski et al., 1980)                        !
!             = 3 discrete ordinates (liou, 1973)                       !
!                                                                       !
!  modifications:                                                       !
!  --------------                                                       !
!  original: j-jmorcrette, ecmwf, feb 2003                              !
!  revised for f90 reformatting: mjiacono, aer, jul 2006                !
!  revised to add exponential lookup table: mjiacono, aer, aug 2007     !
!                                                                       !
!  *******************************************************************  !
!  ======================  end of description block  =================  !

!  ---  constant parameters:
!old  real (kind=kind_phys), parameter :: zcrit = 0.9995   ! thresold for conservative scattering
      real (kind=kind_phys), parameter :: zcrit = 0.9999995 ! thresold for conservative scattering
      real (kind=kind_phys), parameter :: zsr3  = sqrt(3.0)
      real (kind=kind_phys), parameter :: od_lo = 0.06
      real (kind=kind_phys), parameter :: eps1  = 1.0e-8

!  ---  inputs:
      integer, intent(in) :: jb

!  ---  locals:
      real (kind=kind_phys), dimension(nlay,2) :: ztau, zssa, zasy,     &
     &       zssa0, zexpt, ztaus

      real (kind=kind_phys), dimension(nlp1,2) :: zrefb, zrefd, ztrab,  &
     &       ztrad, zldbt, ztdbt

      real (kind=kind_phys), dimension(nlay) :: zssas, zasys

      real (kind=kind_phys), dimension(nlp1) :: zrupb, zrupd, zrdnd,    &
     &       ztdn, zfd, zfu

      real (kind=kind_phys) :: zldbt_nodel, ztdbt_nodel(2)

      real (kind=kind_phys) :: ztau1, zssa1, zasy1, zasy3, zwo,         &
     &       zgam1, zgam2, zgam3, zgam4, zc0, zc1, za1, za2, zrk, zrk2, &
     &       zrp, zrp1, zrm1, zrpp, zrkg1, zrkg3, zrkg4, zexp1, zexm1,  &
     &       zexp2, zexm2, zden1, ze1r45, ftind

      real (kind=kind_phys) :: zr1, zr2, zr3, zr4, zr5, zt1, zt2, zt3

!! ---  for optional surface fluxes
      real (kind=kind_phys), dimension(2) :: sfxbm, sfxdf

      integer :: k, kp, jg, ngt, ipa, iab, ib, ic, iw, itind
!
!===> ... begin here
!
      ib = jb + 1 - nblow
      ngt = NG(jb)             ! number of g-point in each band
      iab = idxalb(jb)         ! surface albedo spectral index

      do k = 1, nlp1
        fxdn(k,1) = f_zero
        fxdn(k,2) = f_zero
        fxup(k,1) = f_zero
        fxup(k,2) = f_zero
      enddo

!! --- ...  optional surface fluxes

      if ( lfdncmp ) then
        sfxbm(1) = f_zero
        sfxbm(2) = f_zero
      endif

!  --- ...  loop over all g-points in each band

      lab_do_jg : do jg = 1, ngt
        iw = NGS(jb) + jg

        if ( isubcol > 0 ) then     ! use mcica cloud scheme
          ic = iw
        else                        ! use standard cloud scheme
          ic = 1
        endif

!  --- ...  compute clear-sky optical parameters

        do k = 1, nlay
!  --- ...  compute clear-sky optical parameters
          ztaus(k,1) = max( ftiny, taur(k,iw)+taug(k,iw)+tauae(k,ib) )
          zssas(k)   = taur(k,iw) + tauae(k,ib)*ssaae(k,ib)
          zasys(k)   = asyae(k,ib)*ssaae(k,ib)*tauae(k,ib)
          zssa1      = min( oneminus, zssas(k) / ztaus(k,1) )
          zasy1      = zasys(k) / max( ftiny, zssas(k) )
          zssa0(k,1) = zssa1

!  --- ...  delta scaling - clear
          za1 = zasy1 * zasy1
          za2 = zssa1 * za1

          ztau(k,1) = (f_one - za2) * ztaus(k,1)
          zssa(k,1) = (zssa1 - za2) / (f_one - za2)
!org      zasy(k,1) = (zasy1 - za1) / (f_one - za1)   ! this line is replaced by the next
          zasy(k,1) = zasy1 / (f_one + zasy1)         ! to reduce truncation error
        enddo

!  --- ...  compute total sky optical parameters

        if ( cf1 > eps ) then

          do k = 1, nlay
            ztaus(k,2) = ztaus(k,1) + taucw(k,iw)
            zc0   = zssas(k) + ssacw(k,iw)
            zc1   = zasys(k) + asycw(k,iw)
            zssa1 = min(oneminus, zc0 / ztaus(k,2))
            zasy1 = zc1 / max(ftiny, zc0)
            zssa0(k,2) = zssa1

!  --- ...  delta scaling - total-sky
            za1 = zasy1 * zasy1
            za2 = zssa1 * za1

            ztau(k,2) = (f_one - za2) * ztaus(k,2)
            zssa(k,2) = (zssa1 - za2) / (f_one - za2)
!org        zasy(k,2) = (zasy1 - za1) / (f_one - za1)
            zasy(k,2) = zasy1 / (f_one + zasy1)
          enddo

        else

          do k = 1, nlay
            ztaus(k,2) = ztaus(k,1)
            ztau (k,2) = ztau (k,1)
            zssa (k,2) = zssa (k,1)
            zasy (k,2) = zasy (k,1)
            zssa0(k,2) = zssa0(k,1)
          enddo

        endif  ! end_if_cf1


!  --- ...  compute layer reflectance and transmittance

        lab_do_ipa1 : do ipa = 1, 2            ! 1: clear-sky,  2, total-sky

          do k = 1, nlay
            kp = k + 1

            lab_if_cldfrc : if (ipa==1 .or. cldfrc(k,ic)>ftiny) then   ! clear-sky or cloudy-layer

!  --- ...  use original ssa to test for conservative solution
              zwo   = zssa0(k,ipa)

              ztau1 = ztau(k,ipa)
              zssa1 = zssa(k,ipa)
              zasy1 = zasy(k,ipa)
              zasy3 = 3.0 * zasy1

!  --- ...  general two-stream expressions
              if ( imodsw == 1 ) then
                zgam1 = (7.0 - zssa1 * (4.0 + zasy3)) * 0.25
                zgam2 =-(1.0 - zssa1 * (4.0 - zasy3)) * 0.25
                zgam3 = (2.0 - zasy3 * cosz ) * 0.25
              elseif ( imodsw == 2 ) then               ! pifm
                zgam1 = (8.0 - zssa1 * (5.0 + zasy3)) * 0.25
                zgam2 = 3.0 * (zssa1 * (1.0 - zasy1)) * 0.25
                zgam3 = (2.0 - zasy3 * cosz ) * 0.25
              elseif ( imodsw == 3 ) then               ! discrete ordinates
                zgam1 = zsr3 * (2.0 - zssa1 * (1.0 + zasy1)) * 0.5
                zgam2 = zsr3 * zssa1 * (1.0 - zasy1) * 0.5
                zgam3 = (1.0 - zsr3 * zasy1 * cosz) * 0.5
              endif
              zgam4 = f_one - zgam3

!  --- ...  for conservative scattering

              lab_if_zwo : if ( zwo >= zcrit ) then
                za1 = zgam1 * cosz - zgam3
                za2 = zgam1 * ztau1

!  --- ...  compute homogeneous reflectance and transmittance, use
!           exponential lookup table for transmittance, or expansion of
!           exponential for low optical depth

                zc0 = min ( ztau1*sntz , 500.0 )
                if ( zc0 <= od_lo ) then
                  zc1 = f_one - zc0 + 0.5*zc0*zc0
                else
                  ftind = zc0 / (bpade + zc0)
                  itind = ftind*NTBMX + 0.5
                  zc1 = exp_tbl(itind)
                endif

!      ...  collimated beam
                zrefb(kp,ipa) = max(f_zero, min(f_one,                  &
     &                     (za2 - za1*(f_one - zc1))/(f_one + za2) ))
                ztrab(kp,ipa) = max(f_zero, min(f_one,                  &
     &                          f_one - zrefb(kp,ipa) ))

!      ...  isotropic incidence
                zrefd(kp,ipa) = max(f_zero, min(f_one,                  &
     &                          za2 / (f_one + za2) ))
                ztrad(kp,ipa) = max(f_zero, min(f_one,                  &
     &                          f_one - zrefd(kp,ipa) ))

!  --- ...  for non-conservative scattering
              else  lab_if_zwo

                za1 = zgam1*zgam4 + zgam2*zgam3
                za2 = zgam1*zgam3 + zgam2*zgam4
                zrk = sqrt ( (zgam1 - zgam2) * (zgam1 + zgam2) )
                zrk2= 2.0 * zrk

                zrp  = zrk * cosz
                zrp1 = f_one + zrp
                zrm1 = f_one - zrp
                zrpp = f_one - zrp*zrp
                zrkg1= zrk + zgam1
                zrkg3= zrk * zgam3
                zrkg4= zrk * zgam4

                zr1  = zrm1 * (za2 + zrkg3)
                zr2  = zrp1 * (za2 - zrkg3)
                zr3  = zrk2 * (zgam3 - za2*cosz)
                zr4  = zrpp * zrkg1
                zr5  = zrpp * (zrk - zgam1)

                zt1  = zrp1 * (za1 + zrkg4)
                zt2  = zrm1 * (za1 - zrkg4)
                zt3  = zrk2 * (zgam4 + za1*cosz)

!  --- ...  compute homogeneous reflectance and transmittance, use
!           exponential lookup table for transmittance, or expansion of
!           exponential for low optical depth

                zc0 = min ( zrk*ztau1, 500.0 )
                if ( zc0 <= od_lo ) then
                  zexm1 = f_one - zc0 + 0.5*zc0*zc0
                else
                  ftind = zc0 / (bpade + zc0)
                  itind = ftind*NTBMX + 0.5
                  zexm1 = exp_tbl(itind)
                endif
                zexp1 = f_one / zexm1

                zc1 = min ( ztau1*sntz, 500.0 )
                if ( zc1 <= od_lo ) then
                  zexm2 = f_one - zc1 + 0.5*zc1*zc1
                else
                  ftind = zc1 / (bpade + zc1)
                  itind = ftind*NTBMX + 0.5
                  zexm2 = exp_tbl(itind)
                endif
                zexp2 = f_one / zexm2
                ze1r45 = zr4*zexp1 + zr5*zexm1

!      ...  collimated beam
                if (ze1r45>=-eps1 .and. ze1r45<=eps1) then
                  zrefb(kp,ipa) = eps1
                  ztrab(kp,ipa) = zexm2
                else
                  zden1 = zssa1 / ze1r45
                  zrefb(kp,ipa) = max(f_zero, min(f_one,                &
     &                         (zr1*zexp1-zr2*zexm1-zr3*zexm2)*zden1 ))
                  ztrab(kp,ipa) = max(f_zero, min(f_one, zexm2*(f_one   &
     &                       - (zt1*zexp1-zt2*zexm1-zt3*zexp2)*zden1) ))
                endif

!      ...  diffuse beam
                zden1 = zr4 / (ze1r45 * zrkg1)
                zrefd(kp,ipa) = max(f_zero, min(f_one,                  &
     &                          zgam2*(zexp1-zexm1)*zden1 ))
                ztrad(kp,ipa) = max(f_zero, min(f_one, zrk2*zden1 ))

              endif  lab_if_zwo

            else   lab_if_cldfrc              ! total-sky but clear-layer

              zrefb(kp,2) = zrefb(kp,1)
              ztrab(kp,2) = ztrab(kp,1)
              zrefd(kp,2) = zrefd(kp,1)
              ztrad(kp,2) = ztrad(kp,1)

            endif  lab_if_cldfrc
          enddo    ! end do_k_loop

          if (ipa==1 .and. cf1<=eps) then
            do k = 2, nlp1
              zrefb(k,2) = zrefb(k,1)
              ztrab(k,2) = ztrab(k,1)
              zrefd(k,2) = zrefd(k,1)
              ztrad(k,2) = ztrad(k,1)
            enddo

            exit lab_do_ipa1
          endif

        enddo  lab_do_ipa1                    ! end do_ipa_loop

!  --- ...  set up toa direct beam for 1:clear, 2:cloudy
        ztdbt(nlp1,1) = f_one
        ztdbt(nlp1,2) = f_one
        ztdbt_nodel(1)= f_one
        ztdbt_nodel(2)= f_one

!  --- ...  set up surface values (beam and diff) for 1:clear, 2:cloudy
        zldbt(1,1) = f_zero
        zldbt(1,2) = f_zero

        zrefb(1,1) = albbm(iab)
        zrefb(1,2) = albbm(iab)
        zrefd(1,1) = albdf(iab)
        zrefd(1,2) = albdf(iab)

        ztrab(1,1) = f_zero
        ztrab(1,2) = f_zero
        ztrad(1,1) = f_zero
        ztrad(1,2) = f_zero

!  --- ...  combine clear and cloudy contributions for total sky
!           and calculate direct beam transmittances

        do k = nlay, 1, -1
          kp = k + 1

          zc0 = f_one - cldfrc(k,ic)
          zc1 = cldfrc(k,ic)

          zrefb(kp,2) = zc0*zrefb(kp,1) + zc1*zrefb(kp,2)
          zrefd(kp,2) = zc0*zrefd(kp,1) + zc1*zrefd(kp,2)
          ztrab(kp,2) = zc0*ztrab(kp,1) + zc1*ztrab(kp,2)
          ztrad(kp,2) = zc0*ztrad(kp,1) + zc1*ztrad(kp,2)

!  --- ...  direct beam transmittance. use exponential lookup table
!           for transmittance, or expansion of exponential for low
!           optical depth

          zr1 = ztau(k,1) * sntz
          if ( zr1 <= od_lo ) then
            zexp1 = f_one - zr1 + 0.5*zr1*zr1
          else
            ftind = zr1 / (bpade + zr1)
            itind = max(0, min(NTBMX, int(0.5+NTBMX*ftind) ))
            zexp1 = exp_tbl(itind)
          endif

          zldbt(kp,1) = zexp1
          ztdbt(k,1) = zldbt(kp,1)*ztdbt(kp,1)

          zr1 = ztau(k,2) * sntz
          if ( zr1 <= od_lo ) then
            zexp2 = f_one - zr1 + 0.5*zr1*zr1
          else
            ftind = zr1 / (bpade + zr1)
            itind = max(0, min(NTBMX, int(0.5+NTBMX*ftind) ))
            zexp2 = exp_tbl(itind)
          endif

          zldbt(kp,2) = zc0*zexp1 + zc1*zexp2
          ztdbt(k,2) = zldbt(kp,2)*ztdbt(kp,2)

!  --- ...  pre-delta-scaling clear and cloudy direct beam transmittance
!           (must use 'orig', unscaled cloud optical depth)

          zr1 = ztaus(k,1) * sntz
          if ( zr1 <= od_lo ) then
            zexp1 = f_one - zr1 + 0.5*zr1*zr1
          else
            ftind = zr1 / (bpade + zr1)
            itind = max(0, min(NTBMX, int(0.5+NTBMX*ftind) ))
            zexp1 = exp_tbl(itind)
          endif

          zldbt_nodel = zexp1
          ztdbt_nodel(1) = zldbt_nodel * ztdbt_nodel(1)

          zr1 = ztaus(k,2) * sntz
          if ( zr1 <= od_lo ) then
            zexp2 = f_one - zr1 + 0.5*zr1*zr1
          else
            ftind = zr1 / (bpade + zr1)
            itind = max(0, min(NTBMX, int(0.5+NTBMX*ftind) ))
            zexp2 = exp_tbl(itind)
          endif

          zldbt_nodel = zc0*zexp1 + zc1*zexp2
          ztdbt_nodel(2) = zldbt_nodel * ztdbt_nodel(2)

        enddo   ! end do_k_loop

!  --- ...  perform vertical quadrature

        lab_do_ipa2 : do ipa = 1, 2            ! 1=clear-sky, 2=cloudy-sky

!  --- ...  link lowest layer with surface
          zrupb(1) = zrefb(1,ipa)        ! direct beam
          zrupd(1) = zrefd(1,ipa)        ! diffused

!  --- ...  pass from bottom to top
          do k = 1, nlay
            kp = k + 1

            zden1 = f_one / ( f_one - zrupd(k)*zrefd(kp,ipa) )
            zrupb(kp) = zrefb(kp,ipa) + ( ztrad(kp,ipa)                 &
     &                * ( (ztrab(kp,ipa) - zldbt(kp,ipa) )*zrupd(k)     &
     &                + zldbt(kp,ipa)*zrupb(k) ) )*zden1
            zrupd(kp) = zrefd(kp,ipa)                                   &
     &                + ztrad(kp,ipa)*ztrad(kp,ipa)*zrupd(k)*zden1
          enddo

!  --- ...  upper boundary conditions
          ztdn (nlp1) = f_one
          zrdnd(nlp1) = f_zero
          ztdn (nlay) = ztrab(nlp1,ipa)
          zrdnd(nlay) = zrefd(nlp1,ipa)

!  --- ...  pass from top to bottom
          do k = nlay, 2, -1
            zden1 = f_one / (f_one - zrefd(k,ipa)*zrdnd(k))
            ztdn (k-1) = ztdbt(k,ipa)*ztrab(k,ipa)                      &
     &                 + ( ztrad(k,ipa)*( ( ztdn(k) - ztdbt(k,ipa) )    &
     &                 + ztdbt(k,ipa)*zrefb(k,ipa)*zrdnd(k) ) )*zden1
            zrdnd(k-1) = zrefd(k,ipa) + ztrad(k,ipa)*ztrad(k,ipa)       &
     &                 * zrdnd(k)*zden1
          enddo

!  --- ...  up and down-welling fluxes at levels
          do k = 1, nlp1
            zden1 = f_one / (f_one - zrdnd(k)*zrupd(k))
            zfu(k) = ( ztdbt(k,ipa)*zrupb(k)                            &
     &             + ( ztdn(k) - ztdbt(k,ipa) )*zrupd(k) )*zden1
            zfd(k) = ztdbt(k,ipa) + (ztdn(k) - ztdbt(k,ipa)             &
     &             + ztdbt(k,ipa)*zrupb(k)*zrdnd(k))*zden1
          enddo

!  --- ...  compute upward and downward fluxes at levels
          do k = 1, nlp1
            fxup(k,ipa) = fxup(k,ipa) + sfluxzen(iw)*zfu(k)
            fxdn(k,ipa) = fxdn(k,ipa) + sfluxzen(iw)*zfd(k)
          enddo

!! --- ...  optional surface downward flux components
          if ( lfdncmp ) then
            sfxbm(ipa) = sfxbm(ipa) + sfluxzen(iw)*ztdbt_nodel(ipa)
          endif

          if (ipa==1 .and. cf1<=eps) then
            exit lab_do_ipa2
          endif
        enddo  lab_do_ipa2       ! end do_ipa_loop

      enddo  lab_do_jg

      if (cf1 <= eps) then
        do k = 1, nlp1
          fxup(k,2) = fxup(k,1)
          fxdn(k,2) = fxdn(k,1)
        enddo
      endif

      if ( lfdncmp ) then

!! --- ...  optional surface downward flux components
        if (cf1 <= eps) then
          sfxbm(2) = sfxbm(1)
        endif

!! --- ...  optional surface downward flux components
        sflxb0 = sfxbm(1)
        sflxd0 = fxdn(1,1) - sflxb0
        sflxbc = sfxbm(2)
        sflxdc = fxdn(1,2) - sflxbc

      endif

      return
!...................................
      end subroutine swflux
!-----------------------------------

!...................................
      end subroutine spcvrt
!-----------------------------------


!-----------------------------------
      subroutine taumol                                                 &
!...................................
!  ---  inputs:
     &     ( nlay, colamt, colmol,                                      &
     &       forfac, forfrac, indfor, selffac, selffrac, indself,       &
     &       fac00, fac01, fac10, fac11, jp, jt, jt1, laytrop,          &
!  ---  outputs:
     &       sfluxzen, taug, taur                                       &
     &     )

!  ==================   program usage description   ==================  !
!                                                                       !
!  description:                                                         !
!    calculate optical depths for gaseous absorption and rayleigh       !
!    scattering.                                                        !
!                                                                       !
!  subroutines called: taugb## (## = 16 - 29)                           !
!                                                                       !
!  ====================  defination of variables  ====================  !
!                                                                       !
!  inputs:                                                         size !
!    nlay    - integer, number of vertical layers                    1  !
!    colamt  - real, column amounts of absorbing gases the index        !
!                    are for h2o, co2, o3, n2o, ch4, and o2,            !
!                    respectively (molecules/cm**2)          nlay*maxgas!
!    colmol  - real, total column amount (dry air+water vapor)     nlay !
!    forfac  - real, scale factor needed to foreign-continuum.     nlay !
!    forfrac - real, factor needed for temperature interpolation   nlay !
!    indfor  - integer, index of the lower of the two appropriate       !
!                    reference temperatures needed for foreign-         !
!                    continuum interpolation                       nlay !
!    selffac - real, scale factor needed to h2o self-continuum.    nlay !
!    selffrac- real, factor needed for temperature interpolation        !
!                    of reference h2o self-continuum data          nlay !
!    indself - integer, index of the lower of the two appropriate       !
!                    reference temperatures needed for the self-        !
!                    continuum interpolation                       nlay !
!    facij   - real, for each layer, these are factors that are         !
!                    needed to compute the interpolation factors        !
!                    that multiply the appropriate reference k-         !
!                    values.  a value of 0/1 for i,j indicates          !
!                    that the corresponding factor multiplies           !
!                    reference k-value for the lower/higher of the      !
!                    two appropriate temperatures, and altitudes,       !
!                    respectively.                                 naly !
!    jp      - real, the index of the lower (in altitude) of the        !
!                    two appropriate ref pressure levels needed         !
!                    for interpolation.                            nlay !
!    jt, jt1 - integer, the indices of the lower of the two approp      !
!                    ref temperatures needed for interpolation (for     !
!                    pressure levels jp and jp+1, respectively)    nlay !
!    laytrop - integer, tropopause layer index                       1  !
!                                                                       !
!  output:                                                              !
!    sfluxzen- real, spectral distribution of incoming solar flux ngptsw!
!    taug    - real, spectral optical depth for gases        nlay*ngptsw!
!    taur    - real, opt depth for rayleigh scattering       nlay*ngptsw!
!                                                                       !
!                                                                       !
!  ===================================================================  !
!  ************     original subprogram description    ***************  !
!                                                                       !
!                  optical depths developed for the                     !
!                                                                       !
!                rapid radiative transfer model (rrtm)                  !
!                                                                       !
!            atmospheric and environmental research, inc.               !
!                        131 hartwell avenue                            !
!                        lexington, ma 02421                            !
!                                                                       !
!                                                                       !
!                           eli j. mlawer                               !
!                         jennifer delamere                             !
!                         steven j. taubman                             !
!                         shepard a. clough                             !
!                                                                       !
!                                                                       !
!                                                                       !
!                       email:  mlawer@aer.com                          !
!                       email:  jdelamer@aer.com                        !
!                                                                       !
!        the authors wish to acknowledge the contributions of the       !
!        following people:  patrick d. brown, michael j. iacono,        !
!        ronald e. farren, luke chen, robert bergstrom.                 !
!                                                                       !
!  *******************************************************************  !
!                                                                       !
!  taumol                                                               !
!                                                                       !
!    this file contains the subroutines taugbn (where n goes from       !
!    16 to 29).  taugbn calculates the optical depths and Planck        !
!    fractions per g-value and layer for band n.                        !
!                                                                       !
!  output:  optical depths (unitless)                                   !
!           fractions needed to compute planck functions at every layer !
!           and g-value                                                 !
!                                                                       !
!  modifications:                                                       !
!                                                                       !
! revised: adapted to f90 coding, j.-j.morcrette, ecmwf, feb 2003       !
! revised: modified for g-point reduction, mjiacono, aer, dec 2003      !
! revised: reformatted for consistency with rrtmg_lw, mjiacono, aer,    !
!          jul 2006                                                     !
!                                                                       !
!  *******************************************************************  !
!  ======================  end of description block  =================  !

!  ---  inputs:
      integer,               intent(in) :: nlay, laytrop

      integer, dimension(:), intent(in) :: indfor, indself, jp, jt, jt1

      real (kind=kind_phys), dimension(:),  intent(in) :: fac00, fac01, &
     &       fac10, fac11, forfac, forfrac, selffac, selffrac, colmol

      real (kind=kind_phys), dimension(:,:),intent(in) :: colamt

!  ---  outputs:
      real (kind=kind_phys), dimension(:),  intent(out) :: sfluxzen

      real (kind=kind_phys), dimension(:,:),intent(out) :: taug, taur

!  ---  locals:
      real (kind=kind_phys) :: fs, speccomb, specmult, colm1, colm2
      real (kind=kind_phys) :: lsfluxzen 

      real (kind=kind_phys), dimension(:,:), pointer :: sflxptr=>null()

      integer, dimension(nlay,nblow:nbhgh) :: id0, id1

      integer :: ibd, j, jb, js, k, klow, khgh, klim, ks, njb, ns
!
!===> ... begin here
!

!  --- ...  loop over each spectral band

      do jb = nblow, nbhgh

!  --- ...  indices for layer optical depth

        do k = 1, laytrop
          id0(k,jb) = ((jp(k)-1)*5 + (jt (k)-1)) * nspa(jb)
          id1(k,jb) = ( jp(k)   *5 + (jt1(k)-1)) * nspa(jb)
        enddo

        do k = laytrop+1, nlay
          id0(k,jb) = ((jp(k)-13)*5 + (jt (k)-1)) * nspb(jb)
          id1(k,jb) = ((jp(k)-12)*5 + (jt1(k)-1)) * nspb(jb)
        enddo

!  --- ...  calculate spectral flux at toa

        ibd = ibx(jb)
        njb = ng (jb)
        ns  = ngs(jb)

        nullify (sflxptr)

        select case (jb)

          case (16, 20, 23, 25, 26, 29)

            sflxptr => sfluxref01(:,:,ibd)

            do j = 1, njb
!              sfluxzen(ns+j) = sflxptr(j,1)
              lsfluxzen = sflxptr(j,1)
              sfluxzen(ns+j) = 0.9956*lsfluxzen
            enddo

          case (27)

            sflxptr => sfluxref01(:,:,ibd)

            do j = 1, njb
!              sfluxzen(ns+j) = scalekur * sflxptr(j,1)
              lsfluxzen = scalekur * sflxptr(j,1)
              sfluxzen(ns+j) = 0.9956*lsfluxzen
            enddo

          case default

            if (jb==17 .or. jb==28) then
              sflxptr => sfluxref02(:,:,ibd)
              klow = laytrop
              khgh = nlay - 1
              klim = nlay
            else
              sflxptr => sfluxref03(:,:,ibd)
              klow = 1
              khgh = laytrop - 1
              klim = laytrop
            endif

            ks = klim
            lab_do_k : do k = klow, khgh
              if (jp(k)<layreffr(jb) .and. jp(k+1) >= layreffr(jb)) then
                ks = k + 1
                exit lab_do_k
              endif
            enddo  lab_do_k

            colm1 = colamt(ks,ix1(jb))
            colm2 = colamt(ks,ix2(jb))
            speccomb = colm1 + strrat(jb)*colm2
            specmult = specwt(jb) * min( oneminus, colm1/speccomb )
            js = 1 + int( specmult )
            fs = mod(specmult, f_one)

            do j = 1, njb
              lsfluxzen = sflxptr(j,js)                                 &
     &                    + fs * (sflxptr(j,js+1) - sflxptr(j,js))
              sfluxzen(ns+j)=0.9956*lsfluxzen
            enddo

        end select

      enddo

!  --- ...  call taumol## to calculate layer optical depth

      call taumol16
      call taumol17
      call taumol18
      call taumol19
      call taumol20
      call taumol21
      call taumol22
      call taumol23
      call taumol24
      call taumol25
      call taumol26
      call taumol27
      call taumol28
      call taumol29


! =================
      contains
! =================

!-----------------------------------
      subroutine taumol16
!...................................

!  ------------------------------------------------------------------  !
!     band 16:  2600-3250 cm-1 (low - h2o,ch4; high - ch4)             !
!  ------------------------------------------------------------------  !
!
      use module_radsw_kgb16

!  ---  locals:

      real (kind=kind_phys) :: speccomb, specmult, tauray, fs, fs1,     &
     &       fac000,fac001,fac010,fac011, fac100,fac101,fac110,fac111

      integer :: ind01, ind02, ind03, ind04, ind11, ind12, ind13, ind14
      integer :: inds, indf, j, js, k

!
!===> ... begin here
!

!  --- ... compute the optical depth by interpolating in ln(pressure),
!          temperature, and appropriate species.  below laytrop, the water
!          vapor self-continuum is interpolated (in temperature) separately.

      do k = 1, nlay
        tauray = colmol(k) * rayl

        do j = 1, NG16
          taur(k,NS16+j) = tauray
        enddo
      enddo

      do k = 1, laytrop
        speccomb = colamt(k,1) + strrat(16)*colamt(k,5)
        specmult = 8.0 * min( oneminus, colamt(k,1)/speccomb )

        js = 1 + int( specmult )
        fs = mod( specmult, f_one )
        fs1= f_one - fs
        fac000 = fs1 * fac00(k)
        fac010 = fs1 * fac10(k)
        fac100 = fs  * fac00(k)
        fac110 = fs  * fac10(k)
        fac001 = fs1 * fac01(k)
        fac011 = fs1 * fac11(k)
        fac101 = fs  * fac01(k)
        fac111 = fs  * fac11(k)

        ind01 = id0(k,16) + js
        ind02 = ind01 + 1
        ind03 = ind01 + 9
        ind04 = ind01 + 10
        ind11 = id1(k,16) + js
        ind12 = ind11 + 1
        ind13 = ind11 + 9
        ind14 = ind11 + 10
        inds = indself(k)
        indf = indfor (k)

        do j = 1, NG16
          taug(k,NS16+j) = speccomb                                     &
     &        *( fac000 * absa(ind01,j) + fac100 * absa(ind02,j)        &
     &        +  fac010 * absa(ind03,j) + fac110 * absa(ind04,j)        &
     &        +  fac001 * absa(ind11,j) + fac101 * absa(ind12,j)        &
     &        +  fac011 * absa(ind13,j) + fac111 * absa(ind14,j) )      &
     &        + colamt(k,1) * (selffac(k) * (selfref(inds,j)            &
     &        + selffrac(k) * (selfref(inds+1,j)-selfref(inds,j)))      &
     &        + forfac(k) * (forref(indf,j) + forfrac(k)                &
     &        * (forref(indf+1,j) - forref(indf,j))))
        enddo
      enddo

      do k = laytrop+1, nlay
        ind01 = id0(k,16) + 1
        ind02 = ind01 + 1
        ind11 = id1(k,16) + 1
        ind12 = ind11 + 1

        do j = 1, NG16
          taug(k,NS16+j) = colamt(k,5)                                  &
     &      * ( fac00(k)*absb(ind01,j) + fac10(k)*absb(ind02,j)         &
     &      +   fac01(k)*absb(ind11,j) + fac11(k)*absb(ind12,j) )
        enddo
      enddo

      return
!...................................
      end subroutine taumol16
!-----------------------------------


!-----------------------------------
      subroutine taumol17
!...................................

!  ------------------------------------------------------------------  !
!     band 17:  3250-4000 cm-1 (low - h2o,co2; high - h2o,co2)         !
!  ------------------------------------------------------------------  !
!
      use module_radsw_kgb17

!  ---  locals:
      real (kind=kind_phys) :: speccomb, specmult, tauray, fs, fs1,     &
     &       fac000,fac001,fac010,fac011, fac100,fac101,fac110,fac111

      integer :: ind01, ind02, ind03, ind04, ind11, ind12, ind13, ind14
      integer :: inds, indf, j, js, k, ks

!
!===> ... begin here
!

!  --- ...  compute the optical depth by interpolating in ln(pressure),
!           temperature, and appropriate species.  below laytrop, the water
!           vapor self-continuum is interpolated (in temperature) separately.

      do k = 1, nlay
        tauray = colmol(k) * rayl

        do j = 1, NG17
          taur(k,NS17+j) = tauray
        enddo
      enddo

      do k = 1, laytrop
        speccomb = colamt(k,1) + strrat(17)*colamt(k,2)
        specmult = 8.0 * min(oneminus, colamt(k,1) / speccomb)

        js = 1 + int(specmult)
        fs = mod(specmult, f_one)
        fs1= f_one - fs
        fac000 = fs1 * fac00(k)
        fac010 = fs1 * fac10(k)
        fac100 = fs  * fac00(k)
        fac110 = fs  * fac10(k)
        fac001 = fs1 * fac01(k)
        fac011 = fs1 * fac11(k)
        fac101 = fs  * fac01(k)
        fac111 = fs  * fac11(k)

        ind01 = id0(k,17) + js
        ind02 = ind01 + 1
        ind03 = ind01 + 9
        ind04 = ind01 + 10
        ind11 = id1(k,17) + js
        ind12 = ind11 + 1
        ind13 = ind11 + 9
        ind14 = ind11 + 10
        inds = indself(k)
        indf = indfor (k)

        do j = 1, NG17
          taug(k,NS17+j) = speccomb                                     &
     &        * ( fac000 * absa(ind01,j) + fac100 * absa(ind02,j)       &
     &        +   fac010 * absa(ind03,j) + fac110 * absa(ind04,j)       &
     &        +   fac001 * absa(ind11,j) + fac101 * absa(ind12,j)       &
     &        +   fac011 * absa(ind13,j) + fac111 * absa(ind14,j) )     &
     &        + colamt(k,1) * (selffac(k) * (selfref(inds,j)            &
     &        + selffrac(k) * (selfref(inds+1,j)-selfref(inds,j)))      &
     &        + forfac(k) * (forref(indf,j) + forfrac(k)                &
     &        * (forref(indf+1,j) - forref(indf,j)))) 
        enddo
      enddo

      do k = laytrop+1, nlay
        speccomb = colamt(k,1) + strrat(17)*colamt(k,2)
        specmult = 4.0 * min(oneminus, colamt(k,1) / speccomb)

        js = 1 + int(specmult)
        fs = mod(specmult, f_one)
        fs1= f_one - fs
        fac000 = fs1 * fac00(k)
        fac010 = fs1 * fac10(k)
        fac100 = fs  * fac00(k)
        fac110 = fs  * fac10(k)
        fac001 = fs1 * fac01(k)
        fac011 = fs1 * fac11(k)
        fac101 = fs  * fac01(k)
        fac111 = fs  * fac11(k)

        ind01 = id0(k,17) + js
        ind02 = ind01 + 1
        ind03 = ind01 + 5
        ind04 = ind01 + 6
        ind11 = id1(k,17) + js
        ind12 = ind11 + 1
        ind13 = ind11 + 5
        ind14 = ind11 + 6
        indf = indfor(k)

        do j = 1, NG17
          taug(k,NS17+j) = speccomb                                     &
     &        * ( fac000 * absb(ind01,j) + fac100 * absb(ind02,j)       &
     &        +   fac010 * absb(ind03,j) + fac110 * absb(ind04,j)       &
     &        +   fac001 * absb(ind11,j) + fac101 * absb(ind12,j)       &
     &        +   fac011 * absb(ind13,j) + fac111 * absb(ind14,j) )     &
     &        + colamt(k,1) * forfac(k) * (forref(indf,j)               &
     &        + forfrac(k) * (forref(indf+1,j) - forref(indf,j))) 
        enddo
      enddo

      return
!...................................
      end subroutine taumol17
!-----------------------------------


!-----------------------------------
      subroutine taumol18
!...................................

!  ------------------------------------------------------------------  !
!     band 18:  4000-4650 cm-1 (low - h2o,ch4; high - ch4)             !
!  ------------------------------------------------------------------  !
!
      use module_radsw_kgb18

!  ---  locals:
      real (kind=kind_phys) :: speccomb, specmult, tauray, fs, fs1,     &
     &       fac000,fac001,fac010,fac011, fac100,fac101,fac110,fac111

      integer :: ind01, ind02, ind03, ind04, ind11, ind12, ind13, ind14
      integer :: inds, indf, j, js, k, ks

!
!===> ... begin here
!

!  --- ...  compute the optical depth by interpolating in ln(pressure),
!           temperature, and appropriate species.  below laytrop, the water
!           vapor self-continuum is interpolated (in temperature) separately.

      do k = 1, nlay
        tauray = colmol(k) * rayl

        do j = 1, NG18
          taur(k,NS18+j) = tauray
        enddo
      enddo

      do k = 1, laytrop
        speccomb = colamt(k,1) + strrat(18)*colamt(k,5)
        specmult = 8.0 * min(oneminus, colamt(k,1) / speccomb)

        js = 1 + int(specmult)
        fs = mod(specmult, f_one)
        fs1= f_one - fs
        fac000 = fs1 * fac00(k)
        fac010 = fs1 * fac10(k)
        fac100 = fs  * fac00(k)
        fac110 = fs  * fac10(k)
        fac001 = fs1 * fac01(k)
        fac011 = fs1 * fac11(k)
        fac101 = fs  * fac01(k)
        fac111 = fs  * fac11(k)

        ind01 = id0(k,18) + js
        ind02 = ind01 + 1
        ind03 = ind01 + 9
        ind04 = ind01 + 10
        ind11 = id1(k,18) + js
        ind12 = ind11 + 1
        ind13 = ind11 + 9
        ind14 = ind11 + 10
        inds = indself(k)
        indf = indfor (k)

        do j = 1, NG18
          taug(k,NS18+j) = speccomb                                     &
     &        * ( fac000 * absa(ind01,j) + fac100 * absa(ind02,j)       &
     &        +   fac010 * absa(ind03,j) + fac110 * absa(ind04,j)       &
     &        +   fac001 * absa(ind11,j) + fac101 * absa(ind12,j)       &
     &        +   fac011 * absa(ind13,j) + fac111 * absa(ind14,j) )     &
     &        + colamt(k,1) * (selffac(k) * (selfref(inds,j)            &
     &        + selffrac(k) * (selfref(inds+1,j)-selfref(inds,j)))      &
     &        + forfac(k) * (forref(indf,j) + forfrac(k)                &
     &        * (forref(indf+1,j) - forref(indf,j)))) 
        enddo
      enddo

      do k = laytrop+1, nlay
        ind01 = id0(k,18) + 1
        ind02 = ind01 + 1
        ind11 = id1(k,18) + 1
        ind12 = ind11 + 1

        do j = 1, NG18
          taug(k,NS18+j) = colamt(k,5)                                  &
     &        * ( fac00(k)*absb(ind01,j) + fac10(k)*absb(ind02,j)       &
     &        +   fac01(k)*absb(ind11,j) + fac11(k)*absb(ind12,j) )
        enddo
      enddo

      return
!...................................
      end subroutine taumol18
!-----------------------------------


!-----------------------------------
      subroutine taumol19
!...................................

!  ------------------------------------------------------------------  !
!     band 19:  4650-5150 cm-1 (low - h2o,co2; high - co2)             !
!  ------------------------------------------------------------------  !
!
      use module_radsw_kgb19

!  ---  locals:
      real (kind=kind_phys) :: speccomb, specmult, tauray, fs, fs1,     &
     &       fac000,fac001,fac010,fac011, fac100,fac101,fac110,fac111

      integer :: ind01, ind02, ind03, ind04, ind11, ind12, ind13, ind14
      integer :: inds, indf, j, js, k, ks

!
!===> ... begin here
!

!  --- ...  compute the optical depth by interpolating in ln(pressure),
!           temperature, and appropriate species.  below laytrop, the water
!           vapor self-continuum is interpolated (in temperature) separately.

      do k = 1, nlay
        tauray = colmol(k) * rayl

        do j = 1, NG19
          taur(k,NS19+j) = tauray
        enddo
      enddo

      do k = 1, laytrop
        speccomb = colamt(k,1) + strrat(19)*colamt(k,2)
        specmult = 8.0 * min(oneminus, colamt(k,1) / speccomb)

        js = 1 + int(specmult)
        fs = mod(specmult, f_one)
        fs1= f_one - fs
        fac000 = fs1 * fac00(k)
        fac010 = fs1 * fac10(k)
        fac100 = fs  * fac00(k)
        fac110 = fs  * fac10(k)
        fac001 = fs1 * fac01(k)
        fac011 = fs1 * fac11(k)
        fac101 = fs  * fac01(k)
        fac111 = fs  * fac11(k)

        ind01 = id0(k,19) + js
        ind02 = ind01 + 1
        ind03 = ind01 + 9
        ind04 = ind01 + 10
        ind11 = id1(k,19) + js
        ind12 = ind11 + 1
        ind13 = ind11 + 9
        ind14 = ind11 + 10
        inds = indself(k)
        indf = indfor (k)

        do j = 1, NG19
          taug(k,NS19+j) = speccomb                                     &
     &        * ( fac000 * absa(ind01,j) + fac100 * absa(ind02,j)       &
     &        +   fac010 * absa(ind03,j) + fac110 * absa(ind04,j)       &
     &        +   fac001 * absa(ind11,j) + fac101 * absa(ind12,j)       &
     &        +   fac011 * absa(ind13,j) + fac111 * absa(ind14,j) )     &
     &        + colamt(k,1) * (selffac(k) * (selfref(inds,j)            &
     &        + selffrac(k) * (selfref(inds+1,j)-selfref(inds,j)))      &
     &        + forfac(k) * (forref(indf,j) + forfrac(k)                &
     &        * (forref(indf+1,j) - forref(indf,j)))) 
        enddo
      enddo

      do k = laytrop+1, nlay
        ind01 = id0(k,19) + 1
        ind02 = ind01 + 1
        ind11 = id1(k,19) + 1
        ind12 = ind11 + 1

        do j = 1, NG19
          taug(k,NS19+j) = colamt(k,2)                                  &
     &        * ( fac00(k)*absb(ind01,j) + fac10(k)*absb(ind02,j)       &
     &        +   fac01(k)*absb(ind11,j) + fac11(k)*absb(ind12,j) ) 
        enddo
      enddo

!...................................
      end subroutine taumol19
!-----------------------------------


!-----------------------------------
      subroutine taumol20
!...................................

!  ------------------------------------------------------------------  !
!     band 20:  5150-6150 cm-1 (low - h2o; high - h2o)                 !
!  ------------------------------------------------------------------  !
!
      use module_radsw_kgb20

!  ---  locals:
      real (kind=kind_phys) :: tauray

      integer :: ind01, ind02, ind11, ind12
      integer :: inds, indf, j, k

!
!===> ... begin here
!

!  --- ...  compute the optical depth by interpolating in ln(pressure),
!           temperature, and appropriate species.  below laytrop, the water
!           vapor self-continuum is interpolated (in temperature) separately.

      do k = 1, nlay
        tauray = colmol(k) * rayl

        do j = 1, NG20
          taur(k,NS20+j) = tauray
        enddo
      enddo

      do k = 1, laytrop
        ind01 = id0(k,20) + 1
        ind02 = ind01 + 1
        ind11 = id1(k,20) + 1
        ind12 = ind11 + 1
        inds = indself(k)
        indf = indfor (k)

        do j = 1, NG20
          taug(k,NS20+j) = colamt(k,1)                                  &
     &        * ( (fac00(k)*absa(ind01,j) + fac10(k)*absa(ind02,j)      &
     &        +    fac01(k)*absa(ind11,j) + fac11(k)*absa(ind12,j))     &
     &        +   selffac(k) * (selfref(inds,j) + selffrac(k)           &
     &        *   (selfref(inds+1,j) - selfref(inds,j)))                &
     &        +   forfac(k) * (forref(indf,j) + forfrac(k)              &
     &        *   (forref(indf+1,j) - forref(indf,j))) )                &
     &        + colamt(k,5) * absch4(j)
        enddo
      enddo

      do k = laytrop+1, nlay
        ind01 = id0(k,20) + 1
        ind02 = ind01 + 1
        ind11 = id1(k,20) + 1
        ind12 = ind11 + 1
        indf = indfor(k)

        do j = 1, NG20
          taug(k,NS20+j) = colamt(k,1)                                  &
     &        * ( fac00(k)*absb(ind01,j) + fac10(k)*absb(ind02,j)       &
     &        +   fac01(k)*absb(ind11,j) + fac11(k)*absb(ind12,j)       &
     &        +   forfac(k) * (forref(indf,j) + forfrac(k)              &
     &        *   (forref(indf+1,j) - forref(indf,j))) )                &
     &        + colamt(k,5) * absch4(j)
        enddo
      enddo

      return
!...................................
      end subroutine taumol20
!-----------------------------------


!-----------------------------------
      subroutine taumol21
!...................................

!  ------------------------------------------------------------------  !
!     band 21:  6150-7700 cm-1 (low - h2o,co2; high - h2o,co2)         !
!  ------------------------------------------------------------------  !
!
      use module_radsw_kgb21

!  ---  locals:
      real (kind=kind_phys) :: speccomb, specmult, tauray, fs, fs1,     &
     &       fac000,fac001,fac010,fac011, fac100,fac101,fac110,fac111

      integer :: ind01, ind02, ind03, ind04, ind11, ind12, ind13, ind14
      integer :: inds, indf, j, js, k, ks

!
!===> ... begin here
!

!  --- ...  compute the optical depth by interpolating in ln(pressure),
!           temperature, and appropriate species.  below laytrop, the water
!           vapor self-continuum is interpolated (in temperature) separately.

      do k = 1, nlay
        tauray = colmol(k) * rayl

        do j = 1, NG21
          taur(k,NS21+j) = tauray
        enddo
      enddo

      do k = 1, laytrop
        speccomb = colamt(k,1) + strrat(21)*colamt(k,2)
        specmult = 8.0 * min(oneminus, colamt(k,1) / speccomb)

        js = 1 + int(specmult)
        fs = mod(specmult, f_one)
        fs1= f_one - fs
        fac000 = fs1 * fac00(k)
        fac010 = fs1 * fac10(k)
        fac100 = fs  * fac00(k)
        fac110 = fs  * fac10(k)
        fac001 = fs1 * fac01(k)
        fac011 = fs1 * fac11(k)
        fac101 = fs  * fac01(k)
        fac111 = fs  * fac11(k)

        ind01 = id0(k,21) + js
        ind02 = ind01 + 1
        ind03 = ind01 + 9
        ind04 = ind01 + 10
        ind11 = id1(k,21) + js
        ind12 = ind11 + 1
        ind13 = ind11 + 9
        ind14 = ind11 + 10
        inds = indself(k)
        indf = indfor (k)

        do j = 1, NG21
          taug(k,NS21+j) = speccomb                                     &
     &        * ( fac000 * absa(ind01,j) + fac100 * absa(ind02,j)       &
     &        +   fac010 * absa(ind03,j) + fac110 * absa(ind04,j)       &
     &        +   fac001 * absa(ind11,j) + fac101 * absa(ind12,j)       &
     &        +   fac011 * absa(ind13,j) + fac111 * absa(ind14,j) )     &
     &        + colamt(k,1) * (selffac(k) * (selfref(inds,j)            &
     &        + selffrac(k) * (selfref(inds+1,j)-selfref(inds,j)))      &
     &        + forfac(k) * (forref(indf,j) + forfrac(k)                &
     &        * (forref(indf+1,j) - forref(indf,j))))
        enddo
      enddo

      do k = laytrop+1, nlay
        speccomb = colamt(k,1) + strrat(21)*colamt(k,2)
        specmult = 4.0 * min(oneminus, colamt(k,1) / speccomb)

        js = 1 + int(specmult)
        fs = mod(specmult, f_one)
        fs1= f_one - fs
        fac000 = fs1 * fac00(k)
        fac010 = fs1 * fac10(k)
        fac100 = fs  * fac00(k)
        fac110 = fs  * fac10(k)
        fac001 = fs1 * fac01(k)
        fac011 = fs1 * fac11(k)
        fac101 = fs  * fac01(k)
        fac111 = fs  * fac11(k)

        ind01 = id0(k,21) + js
        ind02 = ind01 + 1
        ind03 = ind01 + 5
        ind04 = ind01 + 6
        ind11 = id1(k,21) + js
        ind12 = ind11 + 1
        ind13 = ind11 + 5
        ind14 = ind11 + 6
        indf = indfor(k)

        do j = 1, NG21
          taug(k,NS21+j) = speccomb                                     &
     &        * ( fac000 * absb(ind01,j) + fac100 * absb(ind02,j)       &
     &        +   fac010 * absb(ind03,j) + fac110 * absb(ind04,j)       &
     &        +   fac001 * absb(ind11,j) + fac101 * absb(ind12,j)       &
     &        +   fac011 * absb(ind13,j) + fac111 * absb(ind14,j) )     &
     &        + colamt(k,1) * forfac(k) * (forref(indf,j)               &
     &        + forfrac(k) * (forref(indf+1,j) - forref(indf,j)))
        enddo
      enddo

!...................................
      end subroutine taumol21
!-----------------------------------


!-----------------------------------
      subroutine taumol22
!...................................

!  ------------------------------------------------------------------  !
!     band 22:  7700-8050 cm-1 (low - h2o,o2; high - o2)               !
!  ------------------------------------------------------------------  !
!
      use module_radsw_kgb22

!  ---  locals:
      real (kind=kind_phys) :: speccomb, specmult, tauray, fs, fs1,     &
     &       fac000,fac001,fac010,fac011, fac100,fac101,fac110,fac111,  &
     &       o2adj, o2cont, o2tem

      integer :: ind01, ind02, ind03, ind04, ind11, ind12, ind13, ind14
      integer :: inds, indf, j, js, k, ks

!
!===> ... begin here
!
!  --- ...  the following factor is the ratio of total o2 band intensity (lines
!           and mate continuum) to o2 band intensity (line only). it is needed
!           to adjust the optical depths since the k's include only lines.

      o2adj = 1.6
      o2tem = 4.35e-4 / (350.0*2.0)
      
!  --- ...  compute the optical depth by interpolating in ln(pressure),
!           temperature, and appropriate species.  below laytrop, the water
!           vapor self-continuum is interpolated (in temperature) separately.

      do k = 1, nlay
        tauray = colmol(k) * rayl

        do j = 1, NG22
          taur(k,NS22+j) = tauray
        enddo
      enddo

      do k = 1, laytrop
        o2cont   = o2tem * colamt(k,6)
        speccomb = colamt(k,1) + strrat(22)*colamt(k,6)
        specmult = 8.0 * min(oneminus, colamt(k,1) / speccomb)

        js = 1 + int(specmult)
        fs = mod(specmult, f_one)
        fs1= f_one - fs
        fac000 = fs1 * fac00(k)
        fac010 = fs1 * fac10(k)
        fac100 = fs  * fac00(k)
        fac110 = fs  * fac10(k)
        fac001 = fs1 * fac01(k)
        fac011 = fs1 * fac11(k)
        fac101 = fs  * fac01(k)
        fac111 = fs  * fac11(k)

        ind01 = id0(k,22) + js
        ind02 = ind01 + 1
        ind03 = ind01 + 9
        ind04 = ind01 + 10
        ind11 = id1(k,22) + js
        ind12 = ind11 + 1
        ind13 = ind11 + 9
        ind14 = ind11 + 10
        inds = indself(k)
        indf = indfor (k)

        do j = 1, NG22
          taug(k,NS22+j) = speccomb                                     &
     &        * ( fac000 * absa(ind01,j) + fac100 * absa(ind02,j)       &
     &        +   fac010 * absa(ind03,j) + fac110 * absa(ind04,j)       &
     &        +   fac001 * absa(ind11,j) + fac101 * absa(ind12,j)       &
     &        +   fac011 * absa(ind13,j) + fac111 * absa(ind14,j) )     &
     &        + colamt(k,1) * (selffac(k) * (selfref(inds,j)            &
     &        + selffrac(k) * (selfref(inds+1,j)-selfref(inds,j)))      &
     &        + forfac(k) * (forref(indf,j) + forfrac(k)                &
     &        * (forref(indf+1,j) - forref(indf,j)))) + o2cont
        enddo
      enddo

      do k = laytrop+1, nlay
        o2cont = o2tem * colamt(k,6)

        ind01 = id0(k,22) + 1
        ind02 = ind01 + 1
        ind11 = id1(k,22) + 1
        ind12 = ind11 + 1

        do j = 1, NG22
          taug(k,NS22+j) = colamt(k,6) * o2adj                          &
     &        * ( fac00(k)*absb(ind01,j) + fac10(k)*absb(ind02,j)       &
     &        +   fac01(k)*absb(ind11,j) + fac11(k)*absb(ind12,j) )     &
     &        + o2cont
        enddo
      enddo

      return
!...................................
      end subroutine taumol22
!-----------------------------------


!-----------------------------------
      subroutine taumol23
!...................................

!  ------------------------------------------------------------------  !
!     band 23:  8050-12850 cm-1 (low - h2o; high - nothing)            !
!  ------------------------------------------------------------------  !
!
      use module_radsw_kgb23

!  ---  locals:
      integer :: ind01, ind02, ind11, ind12
      integer :: inds, indf, j, k

!
!===> ... begin here
!

!  --- ...  compute the optical depth by interpolating in ln(pressure),
!           temperature, and appropriate species.  below laytrop, the water
!           vapor self-continuum is interpolated (in temperature) separately.

      do k = 1, nlay
        do j = 1, NG23
          taur(k,NS23+j) = colmol(k) * rayl(j)
        enddo
      enddo

      do k = 1, laytrop
        ind01 = id0(k,23) + 1
        ind02 = ind01 + 1
        ind11 = id1(k,23) + 1
        ind12 = ind11 + 1
        inds = indself(k)
        indf = indfor (k)

        do j = 1, NG23
          taug(k,NS23+j) = colamt(k,1) * (givfac                        &
     &        * ( fac00(k)*absa(ind01,j) + fac10(k)*absa(ind02,j)       &
     &        +   fac01(k)*absa(ind11,j) + fac11(k)*absa(ind12,j) )     &
     &        + selffac(k) * (selfref(inds,j) + selffrac(k)             &
     &        * (selfref(inds+1,j) - selfref(inds,j)))                  &
     &        + forfac(k) * (forref(indf,j) + forfrac(k)                &
     &        * (forref(indf+1,j) - forref(indf,j)))) 
        enddo
      enddo

      do k = laytrop+1, nlay
        do j = 1, NG23
          taug(k,NS23+j) = f_zero
        enddo
      enddo

!...................................
      end subroutine taumol23
!-----------------------------------


!-----------------------------------
      subroutine taumol24
!...................................

!  ------------------------------------------------------------------  !
!     band 24:  12850-16000 cm-1 (low - h2o,o2; high - o2)             !
!  ------------------------------------------------------------------  !
!
      use module_radsw_kgb24

!  ---  locals:
      real (kind=kind_phys) :: speccomb, specmult, fs, fs1,             &
     &       fac000,fac001,fac010,fac011, fac100,fac101,fac110,fac111

      integer :: ind01, ind02, ind03, ind04, ind11, ind12, ind13, ind14
      integer :: inds, indf, j, js, k, ks

!
!===> ... begin here
!

!  --- ...  compute the optical depth by interpolating in ln(pressure),
!           temperature, and appropriate species.  below laytrop, the water
!           vapor self-continuum is interpolated (in temperature) separately.

      do k = 1, laytrop
        speccomb = colamt(k,1) + strrat(24)*colamt(k,6)
        specmult = 8.0 * min(oneminus, colamt(k,1) / speccomb)

        js = 1 + int(specmult)
        fs = mod(specmult, f_one)
        fs1= f_one - fs
        fac000 = fs1 * fac00(k)
        fac010 = fs1 * fac10(k)
        fac100 = fs  * fac00(k)
        fac110 = fs  * fac10(k)
        fac001 = fs1 * fac01(k)
        fac011 = fs1 * fac11(k)
        fac101 = fs  * fac01(k)
        fac111 = fs  * fac11(k)

        ind01 = id0(k,24) + js
        ind02 = ind01 + 1
        ind03 = ind01 + 9
        ind04 = ind01 + 10
        ind11 = id1(k,24) + js
        ind12 = ind11 + 1
        ind13 = ind11 + 9
        ind14 = ind11 + 10
        inds = indself(k)
        indf = indfor (k)

        do j = 1, NG24
          taug(k,NS24+j) = speccomb                                     &
     &        * ( fac000 * absa(ind01,j) + fac100 * absa(ind02,j)       &
     &        +   fac010 * absa(ind03,j) + fac110 * absa(ind04,j)       &
     &        +   fac001 * absa(ind11,j) + fac101 * absa(ind12,j)       &
     &        +   fac011 * absa(ind13,j) + fac111 * absa(ind14,j) )     &
     &        + colamt(k,3) * abso3a(j) + colamt(k,1)                   &
     &        * (selffac(k) * (selfref(inds,j) + selffrac(k)            &
     &        * (selfref(inds+1,j) - selfref(inds,j)))                  &
     &        + forfac(k) * (forref(indf,j) + forfrac(k)                &
     &        * (forref(indf+1,j) - forref(indf,j))))

          taur(k,NS24+j) = colmol(k)                                    &
     &           * (rayla(j,js) + fs*(rayla(j,js+1) - rayla(j,js)))
        enddo
      enddo

      do k = laytrop+1, nlay
        ind01 = id0(k,24) + 1
        ind02 = ind01 + 1
        ind11 = id1(k,24) + 1
        ind12 = ind11 + 1

        do j = 1, NG24
          taug(k,NS24+j) = colamt(k,6)                                  &
     &        * ( fac00(k)*absb(ind01,j) + fac10(k)*absb(ind02,j)       &
     &        +   fac01(k)*absb(ind11,j) + fac11(k)*absb(ind12,j) )     &
     &        + colamt(k,3) * abso3b(j)

          taur(k,NS24+j) = colmol(k) * raylb(j)
        enddo
      enddo

      return
!...................................
      end subroutine taumol24
!-----------------------------------


!-----------------------------------
      subroutine taumol25
!...................................

!  ------------------------------------------------------------------  !
!     band 25:  16000-22650 cm-1 (low - h2o; high - nothing)           !
!  ------------------------------------------------------------------  !
!
      use module_radsw_kgb25

!  ---  locals:
      integer :: ind01, ind02, ind11, ind12
      integer :: j, k

!
!===> ... begin here
!

!  --- ...  compute the optical depth by interpolating in ln(pressure),
!           temperature, and appropriate species.  below laytrop, the water
!           vapor self-continuum is interpolated (in temperature) separately.

      do k = 1, nlay
        do j = 1, NG25
          taur(k,NS25+j) = colmol(k) * rayl(j)
        enddo
      enddo

      do k = 1, laytrop
        ind01 = id0(k,25) + 1
        ind02 = ind01 + 1
        ind11 = id1(k,25) + 1
        ind12 = ind11 + 1

        do j = 1, NG25
          taug(k,NS25+j) = colamt(k,1)                                  &
     &        * ( fac00(k)*absa(ind01,j) + fac10(k)*absa(ind02,j)       &
     &        +   fac01(k)*absa(ind11,j) + fac11(k)*absa(ind12,j) )     &
     &        + colamt(k,3) * abso3a(j) 
        enddo
      enddo

      do k = laytrop+1, nlay
        do j = 1, NG25
          taug(k,NS25+j) = colamt(k,3) * abso3b(j) 
        enddo
      enddo

      return
!...................................
      end subroutine taumol25
!-----------------------------------


!-----------------------------------
      subroutine taumol26
!...................................

!  ------------------------------------------------------------------  !
!     band 26:  22650-29000 cm-1 (low - nothing; high - nothing)       !
!  ------------------------------------------------------------------  !
!
      use module_radsw_kgb26

!  ---  locals:
      integer :: j, k

!
!===> ... begin here
!

!  --- ...  compute the optical depth by interpolating in ln(pressure),
!           temperature, and appropriate species.  below laytrop, the water
!           vapor self-continuum is interpolated (in temperature) separately.

      do k = 1, nlay
        do j = 1, NG26
          taug(k,NS26+j) = f_zero
          taur(k,NS26+j) = colmol(k) * rayl(j) 
        enddo
      enddo

      return
!...................................
      end subroutine taumol26
!-----------------------------------


!-----------------------------------
      subroutine taumol27
!...................................

!  ------------------------------------------------------------------  !
!     band 27:  29000-38000 cm-1 (low - o3; high - o3)                 !
!  ------------------------------------------------------------------  !
!
      use module_radsw_kgb27
!
!  ---  locals:
      integer :: ind01, ind02, ind11, ind12
      integer :: j, k

!
!===> ... begin here
!

!  --- ...  compute the optical depth by interpolating in ln(pressure),
!           temperature, and appropriate species.  below laytrop, the water
!           vapor self-continuum is interpolated (in temperature) separately.

      do k = 1, nlay
        do j = 1, NG27
          taur(k,NS27+j) = colmol(k) * rayl(j)
        enddo
      enddo

      do k = 1, laytrop
        ind01 = id0(k,27) + 1
        ind02 = ind01 + 1
        ind11 = id1(k,27) + 1
        ind12 = ind11 + 1

        do j = 1, NG27
          taug(k,NS27+j) = colamt(k,3)                                  &
     &        * ( fac00(k)*absa(ind01,j) + fac10(k)*absa(ind02,j)       &
     &        +   fac01(k)*absa(ind11,j) + fac11(k)*absa(ind12,j) )
        enddo
      enddo

      do k = laytrop+1, nlay
        ind01 = id0(k,27) + 1
        ind02 = ind01 + 1
        ind11 = id1(k,27) + 1
        ind12 = ind11 + 1

        do j = 1, NG27
          taug(k,NS27+j) = colamt(k,3)                                  &
     &        * ( fac00(k)*absb(ind01,j) + fac10(k)*absb(ind02,j)       &
     &        +   fac01(k)*absb(ind11,j) + fac11(k)*absb(ind12,j) )
        enddo
      enddo

      return
!...................................
      end subroutine taumol27
!-----------------------------------


!-----------------------------------
      subroutine taumol28
!...................................

!  ------------------------------------------------------------------  !
!     band 28:  38000-50000 cm-1 (low - o3,o2; high - o3,o2)           !
!  ------------------------------------------------------------------  !
!
      use module_radsw_kgb28

!  ---  locals:
      real (kind=kind_phys) :: speccomb, specmult, tauray, fs, fs1,     &
     &       fac000,fac001,fac010,fac011, fac100,fac101,fac110,fac111

      integer :: ind01, ind02, ind03, ind04, ind11, ind12, ind13, ind14
      integer :: inds, indf, j, js, k, ks

!
!===> ... begin here
!

!  --- ...  compute the optical depth by interpolating in ln(pressure),
!           temperature, and appropriate species.  below laytrop, the water
!           vapor self-continuum is interpolated (in temperature) separately.

      do k = 1, nlay
        tauray = colmol(k) * rayl

        do j = 1, NG28
          taur(k,NS28+j) = tauray
        enddo
      enddo

      do k = 1, laytrop
        speccomb = colamt(k,3) + strrat(28)*colamt(k,6)
        specmult = 8.0 * min(oneminus, colamt(k,3) / speccomb)

        js = 1 + int(specmult)
        fs = mod(specmult, f_one)
        fs1= f_one - fs
        fac000 = fs1 * fac00(k)
        fac010 = fs1 * fac10(k)
        fac100 = fs  * fac00(k)
        fac110 = fs  * fac10(k)
        fac001 = fs1 * fac01(k)
        fac011 = fs1 * fac11(k)
        fac101 = fs  * fac01(k)
        fac111 = fs  * fac11(k)

        ind01 = id0(k,28) + js
        ind02 = ind01 + 1
        ind03 = ind01 + 9
        ind04 = ind01 + 10
        ind11 = id1(k,28) + js
        ind12 = ind11 + 1
        ind13 = ind11 + 9
        ind14 = ind11 + 10

        do j = 1, NG28
          taug(k,NS28+j) = speccomb                                     &
     &        * ( fac000 * absa(ind01,j) + fac100 * absa(ind02,j)       &
     &        +   fac010 * absa(ind03,j) + fac110 * absa(ind04,j)       &
     &        +   fac001 * absa(ind11,j) + fac101 * absa(ind12,j)       &
     &        +   fac011 * absa(ind13,j) + fac111 * absa(ind14,j) )
        enddo
      enddo

      do k = laytrop+1, nlay
        speccomb = colamt(k,3) + strrat(28)*colamt(k,6)
        specmult = 4.0 * min(oneminus, colamt(k,3) / speccomb)

        js = 1 + int(specmult)
        fs = mod(specmult, f_one)
        fs1= f_one - fs
        fac000 = fs1 * fac00(k)
        fac010 = fs1 * fac10(k)
        fac100 = fs  * fac00(k)
        fac110 = fs  * fac10(k)
        fac001 = fs1 * fac01(k)
        fac011 = fs1 * fac11(k)
        fac101 = fs  * fac01(k)
        fac111 = fs  * fac11(k)

        ind01 = id0(k,28) + js
        ind02 = ind01 + 1
        ind03 = ind01 + 5
        ind04 = ind01 + 6
        ind11 = id1(k,28) + js
        ind12 = ind11 + 1
        ind13 = ind11 + 5
        ind14 = ind11 + 6

        do j = 1, NG28
          taug(k,NS28+j) = speccomb                                     &
     &        * ( fac000 * absb(ind01,j) + fac100 * absb(ind02,j)       &
     &        +   fac010 * absb(ind03,j) + fac110 * absb(ind04,j)       &
     &        +   fac001 * absb(ind11,j) + fac101 * absb(ind12,j)       &
     &        +   fac011 * absb(ind13,j) + fac111 * absb(ind14,j) )
        enddo
      enddo

      return
!...................................
      end subroutine taumol28
!-----------------------------------


!-----------------------------------
      subroutine taumol29
!...................................

!  ------------------------------------------------------------------  !
!     band 29:  820-2600 cm-1 (low - h2o; high - co2)                  !
!  ------------------------------------------------------------------  !
!
      use module_radsw_kgb29

!  ---  locals:
      real (kind=kind_phys) :: tauray

      integer :: ind01, ind02, ind11, ind12
      integer :: inds, indf, j, k

!
!===> ... begin here
!

!  --- ...  compute the optical depth by interpolating in ln(pressure),
!           temperature, and appropriate species.  below laytrop, the water
!           vapor self-continuum is interpolated (in temperature) separately.

      do k = 1, nlay
        tauray = colmol(k) * rayl

        do j = 1, NG29
          taur(k,NS29+j) = tauray
        enddo
      enddo

      do k = 1, laytrop
        ind01 = id0(k,29) + 1
        ind02 = ind01 + 1
        ind11 = id1(k,29) + 1
        ind12 = ind11 + 1
        inds = indself(k)
        indf = indfor (k)

        do j = 1, NG29
          taug(k,NS29+j) = colamt(k,1)                                  &
     &        * ( (fac00(k)*absa(ind01,j) + fac10(k)*absa(ind02,j)      &
     &        +    fac01(k)*absa(ind11,j) + fac11(k)*absa(ind12,j) )    &
     &        +  selffac(k) * (selfref(inds,j) + selffrac(k)            &
     &        *  (selfref(inds+1,j) - selfref(inds,j)))                 &
     &        +  forfac(k) * (forref(indf,j) + forfrac(k)               &
     &        *  (forref(indf+1,j) - forref(indf,j))))                  &
     &        +  colamt(k,2) * absco2(j) 
        enddo
      enddo

      do k = laytrop+1, nlay
        ind01 = id0(k,29) + 1
        ind02 = ind01 + 1
        ind11 = id1(k,29) + 1
        ind12 = ind11 + 1

        do j = 1, NG29
          taug(k,NS29+j) = colamt(k,2)                                  &
     &        * ( fac00(k)*absb(ind01,j) + fac10(k)*absb(ind02,j)       &
     &        +   fac01(k)*absb(ind11,j) + fac11(k)*absb(ind12,j) )     &
     &        + colamt(k,1) * absh2o(j) 
        enddo
      enddo

      return
!...................................
      end subroutine taumol29
!-----------------------------------

!...................................
      end subroutine taumol
!-----------------------------------

!
!........................................!
      end module module_radsw_main       !
!========================================!

