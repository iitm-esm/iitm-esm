!!!!!  ==========================================================  !!!!!
!!!!!             'module_radiation_driver' descriptions           !!!!!
!!!!!  ==========================================================  !!!!!
!                                                                      !
!   this is the radiation driver module.  it prepares atmospheric      !
!   profiles and invokes main radiation calculations.                  !
!                                                                      !
!   in module 'module_radiation_driver' there are twe externally       !
!   callable subroutine:                                               !
!                                                                      !
!      'radinit'    -- initialization routine                          !
!         input:                                                       !
!           ( si, NLAY, iflip, idate, jdate, ICTM, ISOL, ICO2,         !
!             IAER, IALB, IEMS, ICWP, NP3D, isubcsw, isubclw,          !
!             iovrsw, iovrlw, me )                                     !
!         output:                                                      !
!           ( none )                                                   !
!                                                                      !
!      'grrad'      -- setup and invoke main radiation calls           !
!         input:                                                       !
!          ( prsi,prsl,prslk,tgrs,qgrs,oz,vvl,lfrac,                   !
!            xlon,xlat,tsea,snowd,zorl,hprim,            !
!            alvsf,alnsf,alvwf,alnwf,facsf,facwf,fice,           !
!            solcon,coszen,coszdg,k1oz,k2oz,facoz,                     !
!            cv,cvt,cvb,iovrsw,fcice,frain,rrime,flgmin,        !
!            icsdsw,icsdlw, np3d,ntcw,ncld,ntoz, NTRAC,NFXR,           !
!            dtlw,dtsw, lsswr,lslwr,lssav,sashal,norad_precip,         !
!            crick_proof, ccnorm,                                      !
!            IX, IM, LM, iflip, me, lprnt,                             !
!         output:                                                      !
!            htrsw,sfcnsw,sfcdsw,sfalb,                                !
!            htrlw,sfcdlw,tsflw,semis,                                 !
!         input/output:                                                !
!            fluxr,                                                    !
!         optional output:                                             !
!            HTRSWB,HTRLWB)                                            !
!                                                                      !
!                                                                      !
!   external modules referenced:                                       !
!       'module machine'                    in 'machine.f'             !
!       'module funcphys'                   in 'funcphys.f'            !
!       'module physcons'                   in 'physcons.f             !
!                                                                      !
!       'module module_radiation_gases'     in 'radiation_gases.f'     !
!       'module module_radiation_aerosols'  in 'radiation_aerosols.f'  !
!       'module module_radiation_surface'   in 'radiation_surface.f'   !
!       'module module_radiation_clouds'    in 'radiation_clouds.f'    !
!                                                                      !
!       'module module_radsw_cntr_para'     in 'radsw_xxxx_param.f'    !
!       'module module_radsw_parameters'    in 'radsw_xxxx_param.f'    !
!       'module module_radsw_main'          in 'radsw_xxxx_main.f'     !
!                                                                      !
!       'module module_radlw_cntr_para'     in 'radlw_xxxx_param.f'    !
!       'module module_radlw_parameters'    in 'radlw_xxxx_param.f'    !
!       'module module_radlw_main'          in 'radlw_xxxx_main.f'     !
!                                                                      !
!    where xxxx may vary according to different scheme selection       !
!                                                                      !
!                                                                      !
!   program history log:                                               !
!     mm-dd-yy    ncep         - created program grrad                 !
!     08-12-03    yu-tai hou   - re-written for modulized radiations   !
!     11-06-03    yu-tai hou   - modified                              !
!     01-18-05    s. moorthi   - NOAH/ICE model changes added          !
!     05-10-05    yu-tai hou   - modified module structure             !
!     12-xx-05    s. moorthi   - sfc lw flux adj by mean temperature   !
!     02-20-06    yu-tai hou   - add time variation for co2 data, and  !
!                                solar const. add sfc emiss change     !
!     03-21-06    s. Moorthi   - added surface temp over ice           !
!     07-28-06    yu-tai hou   - add stratospheric vocanic aerosols    !
!     03-14-07    yu-tai hou   - add generalized spectral band interp  !
!                                for aerosol optical prop. (sw and lw) !
!     04-10-07    yu-tai hou   - spectral band sw/lw heating rates     !
!     05-04-07    yu-tai hou   - make options for clim based and modis !
!                                based (h. wei and c. marshall) albedo !
!     09-05-08    yu-tai hou   - add the initial date and time 'idate' !
!                    and control param 'ICTM' to the passing param list!
!                    to handel different time/date requirements for    !
!                    external data (co2, aeros, solcon, ...)           !
!     10-10-08    yu-tai hou   - add the ICTM=-2 option for combining  !
!                    initial condition data with seasonal cycle from   !
!                    climatology.                                      !
!     03-12-09    yu-tai hou   - use two time stamps to keep tracking  !
!                    dates for init cond and fcst time. remove volcanic!
!                    aerosols data in climate hindcast (ICTM=-2).      !
!     03-16-09    yu-tai hou   - included sub-column clouds approx.    !
!                    control flags isubcsw/isubclw in initialization   !
!                    subroutine. passed auxiliary cloud control arrays !
!                    icsdsw/icsdlw (if isubcsw/isubclw =2, it will be  !
!                    the user provided permutation seeds) to the sw/lw !
!                    radiation calculation programs. also moved cloud  !
!                    overlapping control flags iovrsw/iovrlw from main !
!                    radiation routines to the initialization routines.!
!     04-02-09    yu-tai hou   - modified surface control flag iems to !
!                    have additional function of if the surface-air    !
!                    interface have the same or different temperature  !
!                    for radiation calculations.                       !
!     04-03-09    yu-tai hou   - modified to add lw surface emissivity !
!                    as output variable. changed the sign of sfcnsw to !
!                    be positive value denote solar flux goes into the !
!                    ground (this is needed to reduce sign confusion   !
!                    in other part of model)                           !
!     03-02-10    yu-tai hou   - modified to add 4 compontents of sw   !
!                    surface downward fluxes to the output. (vis-nir;  !
!                    direct -diffused)                                 !
!                                                                      !
!!!!!  ==========================================================  !!!!!
!!!!!                       end descriptions                       !!!!!
!!!!!  ==========================================================  !!!!!


      module module_radiation_driver

      use machine ,                 only : kind_phys
      use physcons,                 only : con_eps,  con_epsm1, con_pi,
     &                                     con_amd, con_amw, con_amo3
      use funcphys,                 only : fpvs

      use module_radiation_astronomy,only : solinit
      use module_radiation_gases,   only : NF_VGAS, getgases,           &
     &                                     gasinit
      use module_radiation_aerosols,only : NF_AESW, aerinit, setaer,    &
     &                                     NF_AELW
      use module_radiation_surface, only : NF_ALBD, sfcinit, setalb,    &
     &                                     setemis
      use module_radiation_clouds,  only : NF_CLDS, cldinit,            &
     &                                     progcld1, progcld2, diagcld1

      use module_radsw_cntr_para,   only : iaersw
      use module_radsw_parameters,  only : topfsw_type, sfcfsw_type,    &
     &                                     profsw_type,cmpfsw_type,NBDSW
      use module_radsw_main,        only : rswinit,  swrad

      use module_radlw_cntr_para,   only : iaerlw
      use module_radlw_parameters,  only : topflw_type, sfcflw_type,    &
     &                                     proflw_type, NBDLW
      use module_radlw_main,        only : rlwinit,  lwrad
      use output_manager_fms, only : send_data=>update_opdata, 
     &                               register_var
      use albedo_mod, only: setalbedo
      use error_mod, only: handle_error, fatal, warning, note
      use layout1, only: me
      use time_manager_mod, only: time_type

      use radiation_aerosol_mod, only: set_aerosols,
     &                              use_new_aerosol=>use_this_aerosol
      implicit none

      private

!  ---  constant values
      real (kind=kind_phys) :: QMIN, QME5, QME6, EPSQ
      real (kind=kind_phys), parameter :: amdo3   = con_amd/con_amo3
      parameter ( QMIN=1.0e-10, QME5=1.0e-20,QME6=1.0e-20,EPSQ=1.0e-12 )

!  ---  data input control variables
      integer :: irad1st=1,   month0=0,   iyear0=0,   monthd=0
      integer ::j,k
!  ---  lw surface air/ground interface temperature setting variable

      logical :: prnco2 = .false.
      logical :: initialized=.false.
    
      logical :: initialized_aer=.false.

      integer :: id_lwuptoatsky=0,id_lwdnsfctsky=0,id_lwupsfctsky=0, 
     &  id_lwuptoacsky=0,id_lwdnsfccsky=0,id_lwupsfccsky=0, 
     &  id_swuptoatsky=0,id_swdntoatsky=0,id_swdnsfctsky=0, 
     &  id_swupsfctsky=0, id_nirdiralb=0, id_nirdifalb=0, 
     &  id_visdiralb=0, id_visdifalb=0, id_alb=0, id_coszen=0, 
     &  id_visbmdn=0, id_visdfdn=0, id_nirbmdn=0, id_nirdfdn=0,
     &  id_totcld=0, id_blcld=0, id_lowcld=0, id_lowcldtop=0, 
     &  id_lowcldbot=0, id_lowcldtoptemp=0, id_midcld=0, 
     &  id_midcldtop=0, id_midcldbot=0, id_midcldtoptemp=0, 
     &  id_highcld=0, id_highcldtop=0, id_highcldbot=0, 
     &  id_highcldtoptemp=0, id_cldlyr=0, id_liqwaterpath=0, 
     &  id_radliqcld=0, id_clivi=0, id_radicecld=0, 
     &  id_raindroppath=0, id_radraindrop=0, id_snowpath=0, 
     &  id_radsnow=0, id_o3=0, id_co2=0, id_n2o=0, id_ch4=0, id_o2=0,
     &  id_co=0, id_cf11=0, id_cf12=0, id_cf22=0, id_ccl4=0,
     &  id_swdnsfccsky=0, id_swupsfccsky=0, id_swdfdnsfc=0,
     &  id_cl=0, id_clwvi=0, id_rsutcs=0, id_aod=0, id_ssa=0, id_asy=0,
     &  id_zh_fromsetaer=0
  

      public :: radinit, grrad, init_grrad

      contains
      
      subroutine init_grrad(time, levs)
        type(time_type), intent(in) :: time 
        integer, intent(in) :: levs
        
        if (initialized) return

        id_lwuptoatsky=register_var('rlut', time,
     &       'TOA Outgoing Longwave Radiation','W m-2') !cmor
        
        id_lwdnsfctsky=register_var('rlds', time,
     &       'Surface Downwelling longwave radiation','W m-2') !cmor
        
        id_lwupsfctsky=register_var('rlus', time,
     &       'Surface Upwelling longwave radiation','W m-2') !cmor
        
        id_lwuptoacsky=register_var('rlutcs', time,
     &       'TOA Outgoing Clear-sky Longwave Radiation','W m-2')

        id_rsutcs=register_var('rsutcs', time,
     &       'TOA Outgoing Clear-sky Shortwave Radiation','W m-2')

        id_lwdnsfccsky=register_var('rldscs', time,
     &  'Surface Downwelling clear-Sky Longwave radiation','W m-2') !cmor
        
        id_lwupsfccsky=register_var('lwupsfccsky', time,
     &  'Clear Sky Upward Longwave (SFC)','W m-2')

        id_swuptoatsky=register_var('rsut', time, 
     &       'Total Sky Upward Shortwave (TOA)','W m-2')
        
        id_swdntoatsky=register_var('rsdt', time, 
     &       'TOA Incident Shortwave Radiation','W m-2')
        
        id_swdnsfctsky=register_var('rsds', time, 
     &       'Surface Downwelling Shortwave Radiation','W m-2') !cmor
        
        id_swupsfctsky=register_var('rsus', time, 
     &       'Surface Upwelling Shortwave Radiation','W m-2') !cmor

        id_swdnsfccsky=register_var('rsdscs', time,
     &  'Surface Downwelling Clear-Sky Shortwave Radiation', 'W m-2') !cmor

        id_swupsfccsky=register_var('rsuscs', time,
     &  'Surface Upwelling Clear-Sky Shortwave Radiation', 'W m-2') !cmor
        
        id_swdfdnsfc=register_var('rsdsdiff', time,
     &  'Surface Diffuse Downwelling Shortwave Radiation', 'W m-2') !cmor

        id_nirdiralb=register_var('nirdiralb', time, 
     &       'Near-IR Direct Albedo','1')
        
        id_nirdifalb=register_var('nirdifalb', time, 
     &       'Near-IR Diffused Albedo','1')
        
        id_visdiralb=register_var('visdiralb', time, 
     &       'Visible Direct Albedo','1')
        
        id_visdifalb=register_var('visdifalb', time, 
     &       'Visible Diffused Albedo','1')
        
        id_alb=register_var('alb', time, 
     &       'Surface Albedo','1',wgt=.true.)
        
        id_coszen=register_var('coszen', time, 
     &       'Cosine of Zenith Angle','')
        
        id_visbmdn=register_var('visbmdn', time, 
     &       'Visible Direct (SFC)','W m-2')
        
        id_visdfdn=register_var('visdfdn', time, 
     &       'Visible Diffused (SFC)','W m-2')
        
        id_nirbmdn=register_var('nirbmdn', time, 
     &       'Near-IR Direct (SFC)','W m-2')
        
        id_nirdfdn=register_var('nirdfdn', time, 
     &       'Near-IR Diffused (SFC)','W m-2')
        
        id_totcld=register_var('clt', time, 
     &       'Total Cloud Fraction', '1.0') !cmor
        
        id_blcld=register_var('blcld', time, 
     &       'Boundary Layer Cloud Cover', '1')
        
        id_lowcld=register_var('lowcld', time, 
     &   'Low-Cloud Cover', '1')
        id_midcld=register_var('midcld', time, 
     &   'Mid-Cloud Cover', '1')
        id_highcld=register_var('highcld', time, 
     &   'High-Cloud Cover', '1')
        id_lowcldtop=register_var('lowcldtop', time, 
     &   'Low-Cloud Top', 'Pascal')
        id_midcldtop=register_var('midcldtop', time, 
     &   'Mid-Cloud Top', 'Pascal')
        id_highcldtop=register_var('highcldtop', time, 
     &   'High-Cloud Top', 'Pascal')
        id_lowcldbot=register_var('lowcldbot', time, 
     &   'Low-Cloud Bot', 'Pascal')
        id_midcldbot=register_var('midcldbot', time, 
     &   'Mid-Cloud Bot', 'Pascal')
        id_highcldbot=register_var('highcldbot', time, 
     &   'High-Cloud Bot', 'Pascal')
        id_lowcldtoptemp=register_var('lowcldtoptemp', time, 
     &   'Low-Cloud Top temperature', 'K')
        id_midcldtoptemp=register_var('midcldtoptemp', time, 
     &   'Mid-Cloud Top temperature', 'K')
        id_highcldtoptemp=register_var('highcldtoptemp', time, 
     &   'High-Cloud Top temperature', 'K')

        id_cldlyr=register_var('cldlyr', time, 
     &  'layer total cloud fraction', '1', levs=levs)                
        id_cl=register_var('cl', time, 
     &  'Percentage cloud cover', '%', levs=levs)                
        id_liqwaterpath=register_var('liqwaterpath', time, 
     &   'cld liq water path', 'kg m-2',levs=levs)
        id_radliqcld=register_var('radliqcld', time, 
     &   'mean eff rad for liquid cld', 'micron', levs=levs)
        id_clivi=register_var('clivi', time, 
     &   'Ice Water Path', 'kg m-2')
        id_clwvi=register_var('clwvi',time,
     &   'Condensed Water Path', 'kg m-2')
        id_radicecld=register_var('radicecld', time, 
     &   'mean eff rad for ice cld', 'micron', levs=levs)     
        id_raindroppath=register_var('raindroppath', time, 
     &   'lyr rain drop water path', 'kg m-2', levs=levs)
        id_radraindrop=register_var('radraindrop', time, 
     &   'mean eff radius for rain drop', 'micron', levs=levs)
        id_snowpath=register_var('snowpath', time, 
     &   'lyr snow flake water path', 'kg m-2', levs=levs)
        id_radsnow=register_var('radsnow', time, 
     &   'mean eff rad for snow flake', 'micron', levs=levs)
        
        id_o3=register_var('tro3', time, 
     &   'Ozone vol Mixing Ratio', '1', levs=levs)
        id_co2=register_var('co2', time, 
     &   'co2 vol mixing ratio', 'mol/mol', levs=levs)
        id_n2o=register_var('n2o', time, 
     &   'n2o vol mixing ratio', 'mol/mol', levs=levs)
        id_ch4=register_var('ch4', time, 
     &   'ch4 vol mixing ratio', 'mol/mol', levs=levs)
        id_o2=register_var('o2', time, 
     &   'o2 vol mixing ratio', 'mol/mol', levs=levs)
        id_co=register_var('co', time, 
     &   'co vol mixing ratio', 'mol/mol', levs=levs)
        id_cf11=register_var('cf11', time, 
     &   'cf11 vol mixing ratio', 'mol/mol', levs=levs)
        id_cf12=register_var('cf12', time, 
     &   'cf12 vol mixing ratio', 'mol/mol', levs=levs)
        id_cf22=register_var('cf22', time, 
     &   'cf22 vol mixing ratio', 'mol/mol', levs=levs)
        id_ccl4=register_var('ccl4', time, 
     &   'ccl4 vol mixing ratio', 'mol/mol', levs=levs)
        id_aod=register_var('aod', time, 
     &   'Aerosol Optical Depth at 550 nm', ' ', levs=levs)
        id_ssa=register_var('ssa', time, 
     &   'Single Scattering Albedo', ' ', levs=levs)
        id_asy=register_var('asy', time, 
     &   'Assymetry Parameter', ' ', levs=levs)
        id_zh_fromsetaer=register_var('zh_fromsetaer', time, 
     &   'Model Height from aerosol routine', ' ', levs=levs)
        initialized=.true.
      end subroutine init_grrad

      subroutine radinit                                                &
!  ---  inputs:
     &     ( si, NLAY, iflip, idate, jdate, ICTM, ISOL, ICO2,           &
     &       IAER, IALB, IEMS, ICWP, NP3D, isubcsw, isubclw,            &
     &       iovrsw, iovrlw, me )

! =================   subprogram documentation block   ================ !
!                                                                       !
! subprogram:   radinit     initialization of radiation calculations    !
!                                                                       !
!                                                                       !
! program history log:                                                  !
!   08-14-2003   yu-tai hou   created                                   !
!                                                                       !
! usage:        call radinit                                            !
!                                                                       !
! attributes:                                                           !
!   language:  fortran 90                                               !
!   machine:   ibm sp                                                   !
!                                                                       !
!  ====================  defination of variables  ====================  !
!                                                                       !
! input parameters:                                                     !
!   si               : model vertical sigma interface                   !
!   NLAY             : number of model vertical layers                  !
!   iflip            : control flag for direction of vertical index     !
!                     =0: index from toa to surface                     !
!                     =1: index from surface to toa                     !
!   idate(8)         : ncep absolute date and time of initial condition !
!                      (yr, mon, day, t-zone, hr, min, sec, mil-sec)    !
!   jdate(8)         : ncep absolute date and time at fcst time         !
!                      (yr, mon, day, t-zone, hr, min, sec, mil-sec)    !
!   ICTM             :=yyyy#, external data time/date control flag      !
!                     =   -2: same as 0, but superimpose seasonal cycle !
!                             from climatology data set.                !
!                     =   -1: use user provided external data for the   !
!                             forecast time, no extrapolation.          !
!                     =    0: use data at initial cond time, if not     !
!                             available, use latest, no extrapolation.  !
!                     =    1: use data at the forecast time, if not     !
!                             available, use latest and extrapolation.  !
!                     =yyyy0: use yyyy data for the forecast time,      !
!                             no further data extrapolation.            !
!                     =yyyy1: use yyyy data for the fcst. if needed, do !
!                             extrapolation to match the fcst time.     !
!   ISOL             :=0: use a fixed solar constant value              !
!                     =1: use 11-year cycle solar constant table        !
!   ICO2             :=0: use prescribed global mean co2 (old  oper)    !
!                     =1: use observed co2 annual mean value only       !
!                     =2: use obs co2 monthly data with 2-d variation   !
!   IAER             : 3-digit aerosol flag (for volc, lw, sw)          !
!                     =  0: turn all aeros effects off (sw,lw,volc)     !
!                     =  1: use clim tropspheric aerosol for sw only    !
!                     = 10: use clim tropspheric aerosol for lw only    !
!                     = 11: use clim tropspheric aerosol for both sw/lw !
!                     =100: volc aerosol only for both sw and lw        !
!                     =101: volc and clim trops aerosol for sw only     !
!                     =110: volc and clim trops aerosol for lw only     !
!                     =111: volc and clim trops aerosol for both sw/lw  !
!   IALB             : control flag for surface albedo schemes          !
!                     =0: climatology, based on surface veg types       !
!                     =1: modis retrieval based surface albedo scheme   !
!   IEMS             : ab 2-digit control flag                          !
!                      a =0 set sfc air/ground t same for lw radiation  !
!                        =1 set sfc air/ground t diff for lw radiation  !
!                      b =0 use fixed sfc emissivity=1.0 (black-body)   !
!                        =1 use varying climtology sfc emiss (veg based)!
!                        =2 future development (not yet)                !
!   ICWP             : control flag for cloud generation schemes        !
!                     =0: use diagnostic cloud scheme                   !
!                     =1: use prognostic cloud scheme (default)         !
!   NP3D             :=3: ferrier's microphysics cloud scheme           !
!                     =4: zhao/carr/sundqvist microphysics cloud        !
!   isubcsw/isubclw  : sub-column cloud approx control flag (sw/lw rad) !
!                     =0: with out sub-column cloud approximation       !
!                     =1: mcica sub-col approx. prescribed random seed  !
!                     =2: mcica sub-col approx. provided random seed    !
!   iovrsw/iovrlw    : control flag for cloud overlap (sw/lw rad)       !
!                     =0: random overlapping clouds                     !
!                     =1: max/ran overlapping clouds                    !
!   me               : print control flag                               !
!                                                                       !
!  outputs: (none)                                                      !
!                                                                       !
!  usage:       call radinit                                            !
!                                                                       !
!  subroutines called:    cldinit, aerinit, rlwinit, rswinit, gasinit   !
!                                                                       !
!  ===================================================================  !
!
      implicit none

      integer, intent(in) :: NLAY, iflip, NP3D, ICTM, ISOL, ICO2, ICWP, &
     &                       IALB, IEMS, IAER, me, isubcsw, isubclw,    &
     &                       iovrsw, iovrlw
      integer, intent(in) :: idate(:), jdate(:)

      real (kind=kind_phys), intent(in) :: si(:)


!  ---  locals:
      integer :: iyear, month, iydat, imdat, iaeros, iemslw

!===> ...  begin here

      iaeros = IAER                     ! aerosols control flag
      iemslw = mod(IEMS, 10)            ! emissivity control

!  --- ...  time stamp at fcst time

      iyear = jdate(1)
      month = jdate(2)

!  --- ...  set up time stamp used for green house gases (** currently co2 only)

      if ( ICTM==0 .or. ICTM==-2 ) then ! get external data at initial condition time
        iydat = idate(1)
        imdat = idate(2)
        iaeros = mod(IAER, 100)   ! no volcanic aerosols for clim hindcast
      else                              ! get external data at fcst or specified time
        iydat = iyear
        imdat = month
      endif   ! end if_ICTM_block

      if ( irad1st == 1 ) then
        if (me == 0) then
          print *,' NEW RADIATION PROGRAM STRUCTURES BECAME OPER. ',    &
     &            '  May 01 2007'
          print *,' - Selected Control Flag settings: ICTM=',ictm,      &
     &            ' ISOL=',isol,' ICO2=',ico2,' NP3D=',np3d,' ICWP=',   &
     &            icwp,' IALB=',ialb,' IEMS=',iems,' IAER=',iaer,       &
     &            ' ISUBC_LW=',isubclw,' ISUBC_SW=',isubcsw

          if ( ICTM==0 .or. ICTM==-2 ) then
            print *,'   Data usage is limited by initial condition ',   &
     &              'time:',idate
          endif

          if ( isubclw == 0 ) then
            print *,' - ISUBC_LW=',isubclw,' No McICA, use grid ',      &
     &              'averaged cloud in LW radiation'
          elseif ( isubclw == 1 ) then
            print *,' - ISUBC_LW=',isubclw,' Use McICA with fixed',     &
     &              'permutation seeds for LW random number generator'
          elseif ( isubclw == 2 ) then
            print *,' - ISUBC_LW=',isubclw,' Use McICA with random ',   &
     &              'permutation seeds for LW random number generator'
          else
            print *,' - ERROR!!! ISUBC_LW=',isubclw,' is not a ',       &
     &              'valid option '
            stop
          endif

          if ( isubcsw == 0 ) then
            print *,' - ISUBC_SW=',isubcsw,' No McICA, use grid ',      &
     &              'averaged cloud in SW radiation'
          elseif ( isubcsw == 1 ) then
            print *,' - ISUBC_SW=',isubcsw,' Use McICA with fixed',     &
     &              'permutation seeds for SW random number generator'
          elseif ( isubcsw == 2 ) then
            print *,' - ISUBC_SW=',isubcsw,' Use McICA with random ',   &
     &              'permutation seeds for SW random number generator'
          else
            print *,' - ERROR!!! ISUBC_SW=',isubcsw,' is not a ',       &
     &              'valid option '
            stop
          endif

          if ( isubcsw /= isubclw ) then
            print *,' - *** Notice *** ISUBC_SW /= ISUBC_LW !!!',       &
     &              isubcsw, isubclw
          endif
        endif
      endif

!  --- ...  call aerosols initialization routine

      if ( month0 /= month ) then
        month0 = month

        if ( iaersw==1 .or. iaerlw==1 ) then

          call aerinit ( iyear, month, iaeros, me )

        endif
      endif

!  --- ...  call co2 and other gases initialization routine

      if ( monthd /= imdat ) then
        monthd = imdat

        call gasinit ( iydat, imdat, ICTM, ICO2, me )

        prnco2 = .true.
      else
        prnco2 = .false.
      endif

!  --- ...  call astronomy initialization routine

      if ( ISOL == 0 ) then

        if ( irad1st == 1) then
          call solinit ( ISOL, iyear, iydat, me )
        endif

      else

        if ( iyear0 /= iyear ) then
          iyear0 = iyear
          call solinit ( ISOL, iyear, iydat, me )
        endif

      endif

!  --- ...  followings only need to be called once

      if ( irad1st == 1 ) then

        irad1st = 0

!  --- ...  call surface initialization routine

        call sfcinit ( NLAY, iflip, IALB, iemslw, me )

!  --- ...  call cloud initialization routine

        call cldinit ( si, NLAY, iflip, NP3D, ICWP, me )

!  --- ...  call lw radiation initialization routine

        call rlwinit ( ICWP, me, NLAY, iovrlw, isubclw )

!  --- ...  call sw radiation initialization routine

        call rswinit ( ICWP, me, NLAY, iovrsw, isubcsw )

      endif      ! end of if_irad1st_block

      return

      end subroutine radinit

!-----------------------------------
      subroutine grrad                                                  &
!  ---  inputs:
     &     ( prsi,prsl,prslk,tgrs,qgrs,oz,vvl,lfrac,                    &
     &       xlon,xlat,tsea,tice,hice,snowd,isnowd,zorl,hprim,  
     &       alvsf,alnsf,alvwf,alnwf,facsf,facwf,fice,o3, 
     &       solcon,coszen,coszdg,k1oz,k2oz,facoz,                      &
     &       cv,cvt,cvb,iovrsw,fcice,frain,rrime,flgmin,                &
     &       icsdsw,icsdlw, np3d,ntcw,ncld,ntoz, NTRAC,NFXR,            &
     &       dtlw,dtsw, lsswr,lslwr,lssav,sashal,norad_precip,          &
     &       crick_proof, ccnorm,                                       &
     &       IX, IM, LM, iflip, me, lprnt, istrt, lan,                  &
             !passing oro for aero data interp
     &        prsik,oro,                                                &
!  ---  outputs:
     &       htrsw,sfcnsw,sfcdsw,sfalb,                                 &
     &       htrlw,sfcdlw,tsflw,semis,                                  &
     &       nsw_l,nsw_i,nsw_o,                                         &
!  ---  input/output:
     &       fluxr                                                      &
!! ---  optional outputs:
     &,      HTRSWB,HTRLWB                                              &
     &     )

! =================   subprogram documentation block   ================ !
!                                                                       !
!    this program is the driver of radiation calculation subroutines. * !
!    It sets up profile variables for radiation input, including      * !
!    clouds, surface albedos, atmospheric aerosols, ozone, etc.       * !
!                                                                     * !
!    usage:        call grrad                                         * !
!                                                                     * !
!    subprograms called:                                              * !
!                  setalb, setemis, setaer, getozn, getgases,         * !
!                  progcld1, progcld2, diagcds,                       * !
!                  swrad, lwrad, fpvs                                 * !
!                                                                     * !
!    attributes:                                                      * !
!      language:   fortran 90                                         * !
!      machine:    ibm-sp, sgi                                        * !
!                                                                     * !
!                                                                     * !
!  ====================  defination of variables  ====================  !
!                                                                       !
!    input variables:                                                   !
!      prsi  (IX,LM+1) : model level pressure in cb (kPa)               !
!      prsl  (IX,LM)   : model layer mean pressure in cb (kPa)          !
!      prslk (IX,LM)   : pressure in cb (kPa)                           !
!      tgrs  (IX,LM)   : model layer mean temperature in k              !
!      qgrs  (IX,LM)   : layer specific humidity in gm/gm               !
!      oz  (IX,LM,NTRAC):layer ozone mass mixing ratio                  !
!      vvl   (IX,LM)   : layer mean vertical velocity in cb/sec         !
!      lfrac (IM)      : fraction of land  !
!      xlon,xlat (IM)  : grid longitude/latitude in radians             !
!      tsea  (IM)      : surface temperature in k                       !
!      tice  (IM)      : surface temperature over sea ice (K)           !
!      hice  (IM)      : thickness of sea ice (m)                       !
!      snowd (IM)      : snow depth water equivalent in mm over land    !
!      isnowd (IM)     : snow depth m over sea-ice!
!      zorl  (IM)      : surface roughness in cm                        !
!      hprim (IM)      : topographic standard deviation in m            !
!      alvsf (IM)      : mean vis albedo with strong cosz dependency    !
!      alnsf (IM)      : mean nir albedo with strong cosz dependency    !
!      alvwf (IM)      : mean vis albedo with weak cosz dependency      !
!      alnwf (IM)      : mean nir albedo with weak cosz dependency      !
!      facsf (IM)      : fractional coverage with strong cosz dependen  !
!      facwf (IM)      : fractional coverage with weak cosz dependency  !
!      fice  (IM)      : ice fraction over open water grid              !
!      solcon          : solar constant (sun-earth distant adjusted)    !
!      coszen(IM)      : mean cos of zenith angle over rad call period  !
!      coszdg(IM)      : daytime mean cosz over rad call period         !
!      k1oz,k2oz,facoz : parameters for climatological ozone            !
!      cv    (IM)      : fraction of convective cloud                   !
!      cvt, cvb (IM)   : convective cloud top/bottom pressure in cb     !
!      iovrsw/iovrlw   : control flag for cloud overlap (sw/lw rad)     !
!                        =0 random overlapping clouds                   !
!                        =1 max/ran overlapping clouds                  !
!      fcice           : fraction of cloud ice  (in ferrier scheme)     !
!      frain           : fraction of rain water (in ferrier scheme)     !
!      rrime           : mass ratio of total to unrimed ice ( >= 1 )    !
!      flgmin          : minimim large ice fraction                     !
!      icsdsw/icsdlw   : auxiliary cloud control arrays passed to main  !
!           (IM)         radiations. if isubcsw/isubclw (input to init) !
!                        are set to 2, the arrays contains provided     !
!                        random seeds for sub-column clouds generators  !
!      np3d            : =3 brad ferrier microphysics scheme            !
!                        =4 zhao/carr/sundqvist microphysics scheme     !
!      ntcw            : =0 no cloud condensate calculated              !
!                        >0 array index location for cloud condensate   !
!      ncld            : only used when ntcw .gt. 0                     !
!      ntoz            : =0 climatological ozone profile                !
!                        >0 interactive ozone profile                   !
!      NTRAC           : dimension veriable for array oz                !
!      NFXR            : second dimension of input/output array fluxr   !
!      dtlw, dtsw      : time duration for lw/sw radiation call in sec  !
!      lsswr, lslwr    : logical flags for sw/lw radiation calls        !
!      lssav           : logical flag for store 3-d cloud field         !
!      sashal          : logical flag for Jongil's shallow convection   !
!      norad_precip    : logical flag for not using precip in radiation !
!      crick_proof     : logical flag for eliminating CRICK             !
!      ccnorm          : logical flag for incloud condensate mixing ratio!
!      IX,IM           : horizontal dimention and num of used points    !
!      LM              : vertical layer dimension                       !
!      iflip           : control flag for in/out vertical indexing      !
!                        =0 index from toa to surface                   !
!                        =1 index from surface to toa                   !
!      me              : control flag for parallel process              !
!      lprnt           : control flag for diagnostic print out          !
!                                                                       !
!    output variables:                                                  !
!      htrsw (IX,LM)   : total sky sw heating rate in k/sec             !
!      sfcnsw(IM)      : total sky sfc net sw flux into ground in w/m**2!
!      sfcdsw(IM)      : total sky surface downward sw flux in w/m**2   !
!      sfalb (IM)      : mean surface diffused albedo                   !
!      htrlw (IX,LM)   : total sky lw heating rate in k/sec             !
!      sfcdlw(IM)      : total sky surface downward lw flux in w/m**2   !
!      tsflw (IM)      : surface air temp during lw calculation in k    !
!      semis (IM)      : surface lw emissivity in fraction              !
!                                                                       !
!    input and output variables:                                        !
!      fluxr (IX,NFXR) : to save 2-d fields                             !
!                                                                       !
!    optional output variables:                                         !
!      htrswb(IX,LM,NBDSW) : spectral band total sky sw heating rate    !
!      htrlwb(IX,LM,NBDLW) : spectral band total sky lw heating rate    !
!                                                                       !
!                                                                       !
!    definitions of internal variable arrays:                           !
!                                                                       !
!     1. fixed gases:         (defined in 'module_radiation_gases')     !
!          gasvmr(:,:,1)  -  co2 volume mixing ratio                    !
!          gasvmr(:,:,2)  -  n2o volume mixing ratio                    !
!          gasvmr(:,:,3)  -  ch4 volume mixing ratio                    !
!          gasvmr(:,:,4)  -  o2  volume mixing ratio                    !
!          gasvmr(:,:,5)  -  co  volume mixing ratio                    !
!          gasvmr(:,:,6)  -  cf11 volume mixing ratio                   !
!          gasvmr(:,:,7)  -  cf12 volume mixing ratio                   !
!          gasvmr(:,:,8)  -  cf22 volume mixing ratio                   !
!          gasvmr(:,:,9)  -  ccl4 volume mixing ratio                   !
!                                                                       !
!     2. cloud profiles:      (defined in 'module_radiation_clouds')    !
!                ---  for  prognostic cloud  ---                        !
!          clouds(:,:,1)  -  layer total cloud fraction                 !
!          clouds(:,:,2)  -  layer cloud liq water path                 !
!          clouds(:,:,3)  -  mean effective radius for liquid cloud     !
!          clouds(:,:,4)  -  layer cloud ice water path                 !
!          clouds(:,:,5)  -  mean effective radius for ice cloud        !
!          clouds(:,:,6)  -  layer rain drop water path                 !
!          clouds(:,:,7)  -  mean effective radius for rain drop        !
!          clouds(:,:,8)  -  layer snow flake water path                !
!          clouds(:,:,9)  -  mean effective radius for snow flake       !
!                ---  for  diagnostic cloud  ---                        !
!          clouds(:,:,1)  -  layer total cloud fraction                 !
!          clouds(:,:,2)  -  layer cloud optical depth                  !
!          clouds(:,:,3)  -  layer cloud single scattering albedo       !
!          clouds(:,:,4)  -  layer cloud asymmetry factor               !
!                                                                       !
!     3. surface albedo:      (defined in 'module_radiation_surface')   !
!          sfcalb( :,1 )  -  near ir direct beam albedo                 !
!          sfcalb( :,2 )  -  near ir diffused albedo                    !
!          sfcalb( :,3 )  -  uv+vis direct beam albedo                  !
!          sfcalb( :,4 )  -  uv+vis diffused albedo                     !
!                                                                       !
!     4. sw aerosol profiles: (defined in 'module_radiation_aerosols')  !
!          faersw(:,:,:,1)-  sw aerosols optical depth                  !
!          faersw(:,:,:,2)-  sw aerosols single scattering albedo       !
!          faersw(:,:,:,3)-  sw aerosols asymmetry parameter            !
!                                                                       !
!     5. lw aerosol profiles: (defined in 'module_radiation_aerosols')  !
!          faerlw(:,:,:,1)-  lw aerosols optical depth                  !
!          faerlw(:,:,:,2)-  lw aerosols single scattering albedo       !
!          faerlw(:,:,:,3)-  lw aerosols asymmetry parameter            !
!                                                                       !
!     6. sw fluxes at toa:    (defined in 'module_radsw_main')          !
!        (topfsw_type -- derived data type for toa rad fluxes)          !
!          topfsw(:)%upfxc  -  total sky upward flux at toa             !
!          topfsw(:)%dnfxc  -  total sky downward flux at toa           !
!          topfsw(:)%upfx0  -  clear sky upward flux at toa             !
!                                                                       !
!     7. lw fluxes at toa:    (defined in 'module_radlw_main')          !
!        (topflw_type -- derived data type for toa rad fluxes)          !
!          topflw(:)%upfxc  -  total sky upward flux at toa             !
!          topflw(:)%upfx0  -  clear sky upward flux at toa             !
!                                                                       !
!     8. sw fluxes at sfc:    (defined in 'module_radsw_main')          !
!        (sfcfsw_type -- derived data type for sfc rad fluxes)          !
!          sfcfsw(:)%upfxc  -  total sky upward flux at sfc             !
!          sfcfsw(:)%dnfxc  -  total sky downward flux at sfc           !
!          sfcfsw(:)%upfx0  -  clear sky upward flux at sfc             !
!          sfcfsw(:)%dnfx0  -  clear sky downward flux at sfc           !
!                                                                       !
!     9. lw fluxes at sfc:    (defined in 'module_radlw_main')          !
!        (sfcflw_type -- derived data type for sfc rad fluxes)          !
!          sfcflw(:)%upfxc  -  total sky upward flux at sfc             !
!          sfcflw(:)%dnfxc  -  total sky downward flux at sfc           !
!          sfcflw(:)%dnfx0  -  clear sky downward flux at sfc           !
!                                                                       !
!! optional radiation outputs:                                          !
!!   10. sw flux profiles:    (defined in 'module_radsw_main')          !
!!       (profsw_type -- derived data type for rad vertical profiles)   !
!!         fswprf(:,:)%upfxc - total sky upward flux                    !
!!         fswprf(:,:)%dnfxc - total sky downward flux                  !
!!         fswprf(:,:)%upfx0 - clear sky upward flux                    !
!!         fswprf(:,:)%dnfx0 - clear sky downward flux                  !
!!                                                                      !
!!   11. lw flux profiles:    (defined in 'module_radlw_main')          !
!!       (proflw_type -- derived data type for rad vertical profiles)   !
!!         flwprf(:,:)%upfxc - total sky upward flux                    !
!!         flwprf(:,:)%dnfxc - total sky downward flux                  !
!!         flwprf(:,:)%upfx0 - clear sky upward flux                    !
!!         flwprf(:,:)%dnfx0 - clear sky downward flux                  !
!!                                                                      !
!!   12. sw sfc components:   (defined in 'module_radsw_main')          !
!!       (cmpfsw_type -- derived data type for component sfc fluxes)    !
!!         scmpsw(:)%uvbfc  -  total sky downward uv-b flux at sfc      !
!!         scmpsw(:)%uvbf0  -  clear sky downward uv-b flux at sfc      !
!!         scmpsw(:)%nirbm  -  total sky sfc downward nir direct flux   !
!!         scmpsw(:)%nirdf  -  total sky sfc downward nir diffused flux !
!!         scmpsw(:)%visbm  -  total sky sfc downward uv+vis direct flx !
!!         scmpsw(:)%visdf  -  total sky sfc downward uv+vis diff flux  !
!                                                                       !
!  ======================  end of definations  =======================  !
!
      implicit none
 
!  ---  constant parameter

!  ---  inputs: (for rank>1 arrays, horizontal dimensioned by IX)
      integer,  intent(in) :: IX,IM, LM, NTRAC,NFXR, iflip, me,         &
     &       k1oz, k2oz, iovrsw, np3d, ntoz, ntcw, ncld,
     &                        istrt, lan 
      integer,  intent(in) :: icsdsw(IM), icsdlw(IM)

      logical,  intent(in) :: lsswr,  lslwr, lssav, lprnt,              &
     &                        sashal, norad_precip, crick_proof, ccnorm

      real (kind=kind_phys), dimension(IX,LM+1),intent(in)::prsi,prsik

      real (kind=kind_phys), dimension(IX,LM),   intent(in) ::  prsl,   &
     &       prslk, tgrs, qgrs, vvl, fcice, frain, rrime
      real (kind=kind_phys), dimension(IM), intent(in) :: flgmin

      real (kind=kind_phys), dimension(IM),      intent(in) ::  lfrac,  &
     &       xlon, xlat, tsea, snowd, zorl, hprim, alvsf, alnsf, alvwf, &
     &       alnwf, facsf, facwf, coszen, coszdg, cv, cvt, cvb, fice,
     &       isnowd, tice, hice,oro
      real (kind=kind_phys), dimension(IM,LM),    intent(in) ::  o3
      real (kind=kind_phys),  intent(in) ::  solcon, facoz, dtlw, dtsw, &
     &       oz(IX,LM,NTRAC)

!  ---  outputs: (horizontal dimensioned by IX)
      real (kind=kind_phys), dimension(IX,LM),intent(out):: htrsw,htrlw
      real (kind=kind_phys), dimension(ix,LM)::del 


      real (kind=kind_phys), dimension(IM),   intent(out):: sfcnsw,     &
     &       sfcdlw, tsflw, sfcdsw, sfalb, nsw_i, nsw_o, nsw_l

      real (kind=kind_phys), dimension(IM),   intent(inout):: semis

!  ---  variables are for both input and output:
      real (kind=kind_phys), intent(inout) :: fluxr(IX,NFXR)                

!! ---  optional outputs:
      real (kind=kind_phys), dimension(IX,LM,NBDSW), optional,          &
     &                       intent(out) :: htrswb
      real (kind=kind_phys), dimension(IX,LM):: temp
 

      real (kind=kind_phys), dimension(IX,LM,NBDLW), optional,          &
     &                       intent(out) :: htrlwb

!  ---  local variables: (horizontal dimensioned by IM)
      real (kind=kind_phys), dimension(IM,LM+1) :: plvl, tlvl
      real (kind=kind_phys), dimension(IM,LM+1) :: plvl_Pcl

      real (kind=kind_phys), dimension(IM,LM)   :: plyr, tlyr, qlyr,    &
     &       olyr, rhly, qstl, vvel, clw, tem2da, tem2db
      real (kind=kind_phys), dimension(IX,LM)   :: geopl               
      real (kind=kind_phys), dimension(IX,LM+1)   :: geopi            
      real (kind=kind_phys), dimension(IM,LM)   :: plyr_Pcl             

      real (kind=kind_phys), dimension(IM) :: tsfa, cvt1, cvb1, tem1d,  &
     &       tsfg, tskn, tmp, slmsk, tmp1, tmp2, alb, albwgt

      logical, dimension(IM) :: mask

      real (kind=kind_phys), dimension(IM,LM,NF_CLDS) :: clouds
      real (kind=kind_phys), dimension(IM,LM,NF_VGAS) :: gasvmr
      real (kind=kind_phys), dimension(IM,   NF_ALBD) :: sfcalb
      real (kind=kind_phys), dimension(IM,   NF_ALBD) :: sfcalb_l
      real (kind=kind_phys), dimension(IM,   NF_ALBD) :: sfcalb_o
      real (kind=kind_phys), dimension(IM,   NF_ALBD) :: sfcalb_i

      real (kind=kind_phys), dimension(IM,LM,NBDSW,NF_AESW) :: faersw
      real (kind=kind_phys), dimension(IM,LM,NBDLW,NF_AELW) :: faerlw

      real (kind=kind_phys), dimension(IM,LM) :: htswc
      real (kind=kind_phys), dimension(IM,LM) :: htlwc
      real (kind=kind_phys), dimension(IM,LM) :: zh_fromsetaer

      type (topfsw_type),    dimension(IM) :: topfsw
      type (topflw_type),    dimension(IM) :: topflw

      type (sfcfsw_type),    dimension(IM) :: sfcfsw
      type (sfcflw_type),    dimension(IM) :: sfcflw

!! ---  may be used for optional sw/lw outputs:
!!      take out "!!" as needed
!!    real (kind=kind_phys), dimension(IM,LM)   :: htsw0
!!    type (profsw_type),    dimension(IM,LM+1) :: fswprf
      type (cmpfsw_type),    dimension(IM)      :: scmpsw
      real (kind=kind_phys), dimension(IM,LM,NBDSW) :: htswb

!!    real (kind=kind_phys), dimension(IM,LM)   :: htlw0
!!    type (proflw_type),    dimension(IM,LM+1) :: flwprf
      real (kind=kind_phys), dimension(IM,LM,NBDLW) :: htlwb

      real (kind=kind_phys) :: raddt, es, qs, tem0d, cldsa(IM,5)
      real (kind=kind_phys) :: usw_l

      integer :: i, j, k, lv, itop, ibtc, nday, idxday(IM),
     &       mbota(IM,3), mtopa(IM,3), LP1

!===> ...  begin here

      if (.not.initialized) call handle_error(fatal,
     & 'grrad: no initialized, call init_grrad from gfs_initialize')

      geopi=0.0
      geopl=0.0
      
      slmsk=0.0
      where(lfrac>0.4)slmsk(:)=1.0
      nsw_i(:)=0.0
      nsw_o(:)=0.0
      nsw_l(:)=0.0
      
      LP1 = LM + 1

      raddt = min(dtsw, dtlw)
!      print *, "xlon = ",xlon," xlat = ",xlat
!  --- ...  compute relative humidity

      do k = 1, LM
        do i = 1, IM
          es  = min( prsl(i,k), 0.001 * fpvs( tgrs(i,k) ) )   ! fpvs in pa
          qs  = max( QMIN, con_eps * es / (prsl(i,k) + con_epsm1*es) )
          rhly(i,k) = max( 0.0, min( 1.0, max(QMIN, qgrs(i,k))/qs ) )
          qstl(i,k) = qs
        enddo
      enddo

!  --- ...  get layer ozone mass mixing ratio

      if (ntoz > 0) then            ! interactive ozone generation

        do k = 1, LM
          do i = 1, IM
!            olyr(i,k) = oz(i,k,ntoz)
            olyr(i,k) = o3(i,k)
          enddo
        enddo

      else                          ! climatological ozone

        do k = 1, LM
          do i = 1, IM
            olyr(i,k) = o3(i,k)
          enddo
        enddo


      endif                            ! end_if_ntoz
      call send_data(id_o3,olyr(:,:)*amdo3,istrt, im,lan)

!  --- ...  setup surface ground temp and ground/air skin temp if required

        tskn(:) = tsea(:)
        tsfg(:) = tsea(:)

!  --- ...  prepare atmospheric profiles for radiation input
!           convert pressure unit from cb to mb

      do k = 1, LM
        do i = 1, IM
          plvl(i,k) = 10.0 * prsi(i,k)
          plyr(i,k) = 10.0 * prsl(i,k)
          vvel(i,k) = 10.0 * vvl (i,k)
          tlyr(i,k) = tgrs(i,k)
          olyr(i,k) = max( QMIN, olyr(i,k) )
        enddo
      enddo

      do i = 1, IM
        plvl(i,LP1) = 10.0 * prsi(i,LP1)
      enddo

!  --- ...  set up non-prognostic gas volume mixing ratioes

      call getgases                                                     &
!  ---  inputs:
     &    ( plvl, xlon, xlat,                                           &
     &      IM, LM, iflip,                                              &
!  ---  outputs:
     &      gasvmr                                                      &
     &     )


!  --- ...  get temperature at layer interface, and layer moisture

      do k = 2, LM
        do i = 1, IM
          tem2da(i,k) = log( plyr(i,k) )
          tem2db(i,k) = log( plvl(i,k) )
        enddo
      enddo

      if (iflip == 0) then               ! input data from toa to sfc

        do i = 1, IM
          tem1d (i)   = QME6
          tem2da(i,1) = log( plyr(i,1) )
          tem2db(i,1) = 1.0
          tsfa  (i)   = tlyr(i,LM)                   ! sfc layer air temp
          tlvl(i,1)   = tlyr(i,1)
          tlvl(i,LP1) = tskn(i)
        enddo

        do k = 1, LM
          do i = 1, IM
            qlyr(i,k) = max( tem1d(i), qgrs(i,k) )
            tem1d(i)  = min( QME5, qlyr(i,k) )
          enddo
        enddo

        do k = 2, LM
          do i = 1, IM
            tlvl(i,k) = tlyr(i,k) + (tlyr(i,k-1) - tlyr(i,k))           &
     &                * (tem2db(i,k)   - tem2da(i,k))                   &
     &                / (tem2da(i,k-1) - tem2da(i,k))
          enddo
        enddo

      else                               ! input data from sfc to toa

        do i = 1, IM
          tem1d (i)   = QME6
          tem2da(i,1) = log( plyr(i,1) )
          tem2db(i,1) = log( plvl(i,1) )
          tsfa  (i)   = tlyr(i,1)                    ! sfc layer air temp
          tlvl(i,1)   = tskn(i)
          tlvl(i,LP1) = tlyr(i,LM)
        enddo

        do k = LM, 1, -1
          do i = 1, IM
            qlyr(i,k) = max( tem1d(i), qgrs(i,k) )
            tem1d(i)  = min( QME5, qlyr(i,k) )
          enddo
        enddo

        do k = 1, LM-1
          do i = 1, IM
            tlvl(i,k+1) = tlyr(i,k) + (tlyr(i,k+1) - tlyr(i,k))         &
     &                  * (tem2db(i,k+1) - tem2da(i,k))                 &
     &                  / (tem2da(i,k+1) - tem2da(i,k))
          enddo
        enddo

      endif                              ! end_if_iflip

!  ---  check for daytime points

      nday = 0
      do i = 1, IM
        if (coszen(i) >= 0.0) then
          nday = nday + 1
          idxday(nday) = i
        endif
      enddo

!  --- ...  setup aerosols property profile for radiation

      faersw(:,:,:,:) = 0.0
      faerlw(:,:,:,:) = 0.0

      if (iaersw==1 .or. iaerlw==1) then

!check  print *,' in grrad : calling setaer '




      if (.not.use_new_aerosol) then
        call setaer                                                     &
!  ---  inputs:
     &     ( xlon,xlat,plvl,plyr,tlyr,qlyr,rhly,                        &
     &       IM,LM,LP1, iflip, lsswr,lslwr,                             &
!  ---  outputs:
     &       faersw,faerlw                                              &
     &     )
      endif


      endif           ! end_if_iaersw_iaerlw

      
      if (use_new_aerosol) then

      call get_prs( im,im,LM,ntrac,tlyr(1:im,:),qlyr(1:im,:),
     &      prsi(1:im,:),prsik(1:im,:),prsl(1:im,:),prslk(1:im,:),
     &      geopi(1:im,:),geopl(1:im,:),del(1:im,:))

      
      call set_aerosols (istrt, im, lan, LM, prsi(1:im,:), prsl(1:im,:), 
     & tlyr(1:im,:), geopl(1:im,:), oro(1:im), faersw, faerlw,
     & zh_fromsetaer)
      endif

      call send_data(id_aod,faersw(1:im,:,10,1),istrt, im,lan)
      call send_data(id_ssa,faersw(1:im,:,10,2),istrt, im,lan)
      call send_data(id_asy,faersw(1:im,:,10,3),istrt, im,lan)
      call send_data(id_zh_fromsetaer,zh_fromsetaer,istrt, im,lan)
!  --- ...  obtain cloud information for radiation calculations

      if (ntcw > 0) then                   ! prognostic cloud scheme

        do k = 1, LM
          do i = 1, IM
            clw(i,k) = 0.0
          enddo

          do j = 1, ncld
            lv = ntcw + j - 1
            do i = 1, IM
              clw(i,k) = clw(i,k) + oz(i,k,lv)    ! cloud condensate amount
            enddo
          enddo
        enddo

        where (clw < EPSQ)
          clw = 0.0
        endwhere

        if (np3d == 4) then              ! zhao/moorthi's prognostic cloud scheme

          call progcld1                                                 &
!  ---  inputs:
     &     ( plyr,plvl,tlyr,qlyr,qstl,rhly,clw,                         &
     &       xlat,xlon,slmsk,                                           &
     &       IM, LM, LP1, iflip, iovrsw, sashal, crick_proof, ccnorm,   &
!    &       IM, LM, LP1, iflip, iovrsw,                                &
!  ---  outputs:
     &       clouds,cldsa,mtopa,mbota                                   &
     &      )


        elseif (np3d == 3) then          ! ferrier's microphysics

!     print *,' in grrad : calling progcld2'
          call progcld2                                                 &
!  ---  inputs:
     &     ( plyr,plvl,tlyr,qlyr,qstl,rhly,clw,                         &
     &       xlat,xlon,slmsk, fcice,frain,rrime,flgmin,                 &
     &       IM, LM, LP1, iflip, iovrsw, sashal, norad_precip,          &
     &       crick_proof, ccnorm,                                       &
!    &       IM, LM, LP1, iflip, iovrsw,                                &
!  ---  outputs:
     &       clouds,cldsa,mtopa,mbota                                   &
     &      )

        endif                            ! end if_np3d

      else                                 ! diagnostic cloud scheme

        do i = 1, IM
          cvt1(i) = 10.0 * cvt(i)
          cvb1(i) = 10.0 * cvb(i)
        enddo

!  ---  compute diagnostic cloud related quantities

        call diagcld1                                                   &
!  ---  inputs:
     &     ( plyr,plvl,tlyr,rhly,vvel,cv,cvt1,cvb1,                     &
     &       xlat,xlon,slmsk,                                           &
     &       IM, LM, LP1, iflip, iovrsw,                                &
!  ---  outputs:
     &       clouds,cldsa,mtopa,mbota                                   &
     &      )

      endif                                ! end_if_ntcw
      call send_data(id_co2,gasvmr(:,:,1),istrt, im,lan)
      call send_data(id_n2o,gasvmr(:,:,2),istrt, im,lan)
      call send_data(id_ch4,gasvmr(:,:,3),istrt, im,lan)
      call send_data(id_o2,gasvmr(:,:,4),istrt, im,lan)
      call send_data(id_co,gasvmr(:,:,5),istrt, im,lan)
      call send_data(id_cf11,gasvmr(:,:,6),istrt, im,lan)
      call send_data(id_cf12,gasvmr(:,:,7),istrt, im,lan)
      call send_data(id_cf22,gasvmr(:,:,8),istrt, im,lan)
      call send_data(id_ccl4,gasvmr(:,:,9),istrt, im,lan)

!  --- ...  start radiation calculations 
!           remember to set heating rate unit to k/sec!

      if (lsswr) then

!  ---  setup surface albedo for sw radiation, incl xw (nov04) sea-ice

!        call setalb                                                     &
!!  ---  inputs:
!     &     ( slmsk,snowd,sncovr,snoalb,zorl,coszen,tsfg,tsfa,hprim,     &
!     &       alvsf,alnsf,alvwf,alnwf,facsf,facwf,fice,tisfc,            &
!     &       IM,                                                        &
!!  ---  outputs:
!     &       sfcalb                                                     &
!     &     )
         mask(:)=.false.
         where(lfrac>1.0e-10) mask(:)=.true.
         call setalbedo(mask,snowd,zorl,coszen,hprim,
     &               alvsf,alnsf,alvwf,alnwf,facsf,facwf,IM,
     &               sfcalb_l)
         mask(:)=.false.
         where(fice>1.0e-10) mask(:)=.true.
         call setalbedo(mask, isnowd, hice, tice, IM, sfcalb_i)

         mask(:)=.false.
         where((1-lfrac)>1.0e-10.and.(1-fice)>1.0e-10) mask(:)=.true.
         call setalbedo(mask, coszen, IM, sfcalb_o)
         
         do i=1, NF_ALBD
         sfcalb(:,i)=sfcalb_l(:,i)*lfrac +
     &          sfcalb_i(:,i)*(1-lfrac)*fice +
     &          sfcalb_o(:,i)*(1-lfrac)*(1-fice)
         enddo

         call send_data(id_nirdiralb,sfcalb(:,1),istrt,im,lan)
         call send_data(id_nirdifalb,sfcalb(:,2),istrt,im,lan)
         call send_data(id_visdiralb,sfcalb(:,3),istrt,im,lan)
         call send_data(id_visdifalb,sfcalb(:,4),istrt,im,lan)


!  --- lu [+4L]: derive SFALB from vis- and nir- diffuse surface albedo
        do i = 1, IM
          sfalb(i) = max(0.01, 0.5 * (sfcalb(i,2) + sfcalb(i,4)))
        enddo

        if (nday > 0) then

!     print *,' in grrad : calling swrad'

          if ( present(htrswb) ) then

            call swrad                                                  &
!  ---  inputs:
     &     ( plyr,plvl,tlyr,tlvl,qlyr,olyr,gasvmr,                      &
     &       clouds,icsdsw,faersw,sfcalb,                               &
     &       coszen,solcon, nday,idxday,                                &
     &       IM, LM, LP1, iflip, lprnt,                                 &
!  ---  outputs:
     &       htswc,topfsw,sfcfsw                                        &
!! ---  optional:
!!   &,      HSW0=htsw0,FLXPRF=fswprf                                   &
     &,      HSWB=htswb,FDNCMP=scmpsw                                   &
     &     )

            do j = 1, NBDSW
              do k = 1, LM
              do i = 1, IM
                htrswb(i,k,j) = htswb(i,k,j)
              enddo
              enddo
            enddo

          else

            call swrad                                                  &
!  ---  inputs:
     &     ( plyr,plvl,tlyr,tlvl,qlyr,olyr,gasvmr,                      &
     &       clouds,icsdsw,faersw,sfcalb,                               &
     &       coszen,solcon, nday,idxday,                                &
     &       IM, LM, LP1, iflip, lprnt,                                 &
!  ---  outputs:
     &       htswc,topfsw,sfcfsw                                        &
!! ---  optional:
!!   &,      HSW0=htsw0,FLXPRF=fswprf,HSWB=htswb                        &
     &,      FDNCMP=scmpsw                                              &
     &     )

          endif

          do i = 1, IM
            if(coszen(i)>0.0) then
              sfcnsw(i) = (sfcfsw(i)%dnfxc-sfcfsw(i)%upfxc)* 
     &                                   coszdg(i)/coszen(i)
              sfcdsw(i) = sfcfsw(i)%dnfxc * coszdg(i)/coszen(i)
              alb(i) = sfcfsw(i)%upfxc/sfcfsw(i)%dnfxc
              albwgt(i) = 1.0
            else
              sfcnsw(i) = 0.0
              sfcdsw(i) = 0.0
              alb(i) = 0.0
              albwgt(i) = 0.0
            endif
          enddo
         
          do i=1,im
            if(coszen(i)>0.0) then
              if(fice(i)>1.0e-10) 
     &         nsw_i(i)=scmpsw(i)%nirbm-sfcalb_i(i,1)*scmpsw(i)%nirbm +
     &                  scmpsw(i)%nirdf-sfcalb_i(i,2)*scmpsw(i)%nirdf +
     &                  scmpsw(i)%visbm-sfcalb_i(i,3)*scmpsw(i)%visbm +
     &                  scmpsw(i)%visdf-sfcalb_i(i,4)*scmpsw(i)%visdf
              if((1-lfrac(i)>1.0e-10).and.(1-fice(i)>1.0e-10)) 
     &         nsw_o(i)=scmpsw(i)%nirbm-sfcalb_o(i,1)*scmpsw(i)%nirbm +
     &                  scmpsw(i)%nirdf-sfcalb_o(i,2)*scmpsw(i)%nirdf +
     &                  scmpsw(i)%visbm-sfcalb_o(i,3)*scmpsw(i)%visbm +
     &                  scmpsw(i)%visdf-sfcalb_o(i,4)*scmpsw(i)%visdf
              if(lfrac(i)>1.0e-10) then
               nsw_l(i)=scmpsw(i)%nirbm-sfcalb_l(i,1)*scmpsw(i)%nirbm +
     &                  scmpsw(i)%nirdf-sfcalb_l(i,2)*scmpsw(i)%nirdf +
     &                  scmpsw(i)%visbm-sfcalb_l(i,3)*scmpsw(i)%visbm +
     &                  scmpsw(i)%visdf-sfcalb_l(i,4)*scmpsw(i)%visdf
              endif
              nsw_i(i)=nsw_i(i)*coszdg(i)/coszen(i)
              nsw_o(i)=nsw_o(i)*coszdg(i)/coszen(i)
              nsw_l(i)=nsw_l(i)*coszdg(i)/coszen(i)
            endif 
          enddo

          do k = 1, LM
            do i = 1, IM
              if(coszen(i)>0.0) then
                htrsw(i,k) = htswc(i,k)*coszdg(i)/coszen(i)
              else
                htrsw(i,k) = 0.0
              endif
            enddo
          enddo

        else                   ! if_nday_block

          do k = 1, LM
            do i = 1, IM
              htrsw(i,k) = 0.0
            enddo
          enddo

          do i = 1, IM
            sfcnsw (i) = 0.0
            sfcdsw (i) = 0.0
          enddo

          sfcfsw= sfcfsw_type( 0.0, 0.0, 0.0, 0.0 )
          topfsw= topfsw_type( 0.0, 0.0, 0.0 )
          scmpsw= cmpfsw_type( 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 )

!! ---  optional:
!!        fswprf= profsw_type( 0.0, 0.0, 0.0, 0.0 )

          if ( present(htrswb) ) then
            do j = 1, NBDSW
              do k = 1, LM
              do i = 1, IM
                htrswb(i,k,j) = 0.0
              enddo
              enddo
            enddo
          endif

        endif                  ! end_if_nday
      endif                                ! end_if_lsswr

      if (lslwr) then

!  ---  setup surface emissivity for lw radiation

!        call setemis                                                    &
!!  ---  inputs:
!     &     ( xlon,xlat,slmsk,snowd,sncovr,zorl,tsfg,tsfa,hprim,         &
!     &       IM,                                                        &
!!  ---  outputs:
!     &       semis                                                    &
!     &     )
!      semis(:)=0.91

!     print *,' in grrad : calling lwrad'

        if ( present(htrlwb) ) then

          call lwrad                                                    &
!  ---  inputs:
     &     ( plyr,plvl,tlyr,tlvl,qlyr,olyr,gasvmr,                      &
     &       clouds,icsdlw,faerlw,semis,tsfg,                           &
     &       IM, LM, LP1, iflip, lprnt, me,                             &
!  ---  outputs:
     &       htlwc,topflw,sfcflw                                        &
!! ---  optional:
!!   &,      HLW0=htlw0,FLXPRF=flwprf                                   &
     &,      HLWB=htlwb                                                 &
     &     )

          do j = 1, NBDLW
            do k = 1, LM
            do i = 1, IM
              htrlwb(i,k,j) = htlwb(i,k,j)
            enddo
            enddo
          enddo

        else

          call lwrad                                                    &
!  ---  inputs:
     &     ( plyr,plvl,tlyr,tlvl,qlyr,olyr,gasvmr,                      &
     &       clouds,icsdlw,faerlw,semis,tsfg,                           &
     &       IM, LM, LP1, iflip, lprnt,me,                              &
!  ---  outputs:
     &       htlwc,topflw,sfcflw                                        &
!! ---  optional:
!!   &,      HLW0=htlw0,FLXPRF=flwprf,HLWB=htlwb                        &
     &     )

        endif

        do i = 1, IM
          sfcdlw(i) = sfcflw(i)%dnfxc
!  ---  save surface air temp for diurnal adjustment at model t-steps
          tsflw (i) = tsfa(i)
        enddo

        do k = 1, LM
          do i = 1, IM
            htrlw(i,k) = htlwc(i,k)
          enddo
        enddo

      endif                                ! end_if_lslwr

      call send_data(id_alb,alb(1:im),istrt, im,lan,albwgt(1:im))
      call send_data(id_coszen,coszen(1:im),istrt, im,lan)

      call send_data(id_lwuptoatsky,topflw(1:im)%upfxc,istrt, im,lan)   ! total sky top lw up
      call send_data(id_lwdnsfctsky,sfcflw(1:im)%dnfxc,istrt, im,lan)   ! total sky sfc lw dn
      call send_data(id_lwupsfctsky,sfcflw(1:im)%upfxc,istrt, im,lan)   ! total sky sfc lw up

      call send_data(id_lwuptoacsky,topflw(1:im)%upfx0,istrt, im,lan)   ! clear sky top lw up
      call send_data(id_lwdnsfccsky,sfcflw(1:im)%dnfx0,istrt, im,lan)   ! clear sky sfc lw dn
      call send_data(id_lwupsfccsky,sfcflw(1:im)%upfx0,istrt, im,lan)   ! clear sky sfc lw up


!  ---  proper diurnal sw wgt..coszro=mean cosz over daylight, while
!       coszdg= mean cosz over entire interval

        if (id_swuptoatsky>0) then
        tmp=0.0
          where(coszen(1:im)>0.0) tmp(1:im)= 
     &         topfsw(1:im)%upfxc*coszdg(1:im)/coszen(1:im)
        call send_data(id_swuptoatsky,tmp(1:im),istrt, im,lan)
        endif

      if (id_rsutcs>0) then
        tmp=0.0
        where(coszen(1:im)>0.0) tmp(1:im)= 
     &       topfsw(1:im)%upfx0*coszdg(1:im)/coszen(1:im)
        call send_data(id_rsutcs,tmp(1:im),istrt, im,lan)
      endif


      if (id_swupsfctsky>0) then
        tmp=0.0
        where(coszen(1:im)>0.0) tmp(1:im)= 
     &       sfcfsw(1:im)%upfxc*coszdg(1:im)/coszen(1:im)
        call send_data(id_swupsfctsky,tmp(1:im),istrt, im,lan)
      endif


      if (id_swdnsfctsky>0) then
        tmp=0.0
        where(coszen(1:im)>0.0) tmp(1:im)= 
     &       sfcfsw(1:im)%dnfxc*coszdg(1:im)/coszen(1:im)
        call send_data(id_swdnsfctsky,tmp(1:im),istrt, im,lan)
      endif
        
      if (id_swdnsfccsky>0) then
        tmp=0.0
        where(coszen(1:im)>0.0) tmp(1:im)= 
     &       sfcfsw(1:im)%dnfx0*coszdg(1:im)/coszen(1:im)
        call send_data(id_swdnsfccsky,tmp(1:im),istrt, im,lan)
      endif
        
      if (id_swupsfccsky>0) then
        tmp=0.0
        where(coszen(1:im)>0.0) tmp(1:im)= 
     &       sfcfsw(1:im)%upfx0*coszdg(1:im)/coszen(1:im)
        call send_data(id_swupsfccsky,tmp(1:im),istrt, im,lan)
      endif
        
      if (id_swdntoatsky>0) then
        tmp=0.0
        where(coszen(1:im)>0.0) tmp(1:im)= 
     &       topfsw(1:im)%dnfxc*coszdg(1:im)/coszen(1:im)
        call send_data(id_swdntoatsky,tmp(1:im),istrt, im,lan)
      endif
        
      if (id_visbmdn>0) then
        tmp=0.0
        where(coszen(1:im)>0.0) tmp(1:im)= 
     &       scmpsw(1:im)%visbm*coszdg(1:im)/coszen(1:im)
        call send_data(id_visbmdn,tmp(1:im),istrt, im,lan)
      endif

      if (id_visdfdn>0) then
        tmp=0.0
        where(coszen(1:im)>0.0) tmp(1:im)= 
     &       scmpsw(1:im)%visdf*coszdg(1:im)/coszen(1:im)
        call send_data(id_visdfdn,tmp(1:im),istrt, im,lan)
      endif

      if (id_swdfdnsfc>0) then
        tmp=0.0
        where(coszen(1:im)>0.0) tmp(1:im)= 
     &       (scmpsw(1:im)%visdf + scmpsw(1:im)%nirdf) *
     &       coszdg(1:im)/coszen(1:im)
        call send_data(id_swdfdnsfc,tmp(1:im),istrt, im,lan)
      endif
        
      if (id_nirbmdn>0) then
        tmp=0.0
        where(coszen(1:im)>0.0) tmp(1:im)= 
     &       scmpsw(1:im)%nirbm*coszdg(1:im)/coszen(1:im)
        call send_data(id_nirbmdn,tmp(1:im),istrt, im,lan)
      endif

      if (id_nirdfdn>0) then
        tmp=0.0
        where(coszen(1:im)>0.0) tmp(1:im)= 
     &       scmpsw(1:im)%nirdf*coszdg(1:im)/coszen(1:im)
        call send_data(id_nirdfdn,tmp(1:im),istrt, im,lan)
      endif

        call send_data(id_lowcld,cldsa(1:im,1),istrt, im,lan)
        call send_data(id_midcld,cldsa(1:im,2),istrt, im,lan)
        call send_data(id_highcld,cldsa(1:im,3),istrt, im,lan)
        call send_data(id_totcld,cldsa(1:im,4),istrt, im,lan)
        call send_data(id_blcld,cldsa(1:im,5),istrt, im,lan)
         
        if(id_lowcldtop+id_lowcldbot+id_lowcldtoptemp/=0) then
          do i=1,im
            itop  = mtopa(i,1); ibtc  = mbota(i,1)
            tmp(i)=prsi(i,itop+1)*1000.0
            tmp1(i)=prsi(i,ibtc)*1000.0
            tmp2(i)=tgrs(i,itop)
          enddo
          call send_data(id_lowcldtop,tmp(1:im),istrt, im,lan, 
     &         cldsa(1:im,1))
          call send_data(id_lowcldbot,tmp1(1:im),istrt, im,lan,
     &         cldsa(1:im,1))
          call send_data(id_lowcldtoptemp,tmp2(1:im),istrt, im,lan,
     &         cldsa(1:im,1))
        endif

        if(id_midcldtop+id_midcldbot+id_midcldtoptemp/=0) then
          do i=1,im
            itop  = mtopa(i,2); ibtc  = mbota(i,2)
            tmp(i)=prsi(i,itop+1)*1000.0
            tmp1(i)=prsi(i,ibtc)*1000.0
            tmp2(i)=tgrs(i,itop)
          enddo

          call send_data(id_midcldtop,tmp(1:im),istrt, im,lan,
     &         cldsa(1:im,2))
          call send_data(id_midcldbot,tmp1(1:im),istrt, im,lan,
     &         cldsa(1:im,2))
          call send_data(id_midcldtoptemp,tmp2(1:im),istrt, im,lan,
     &         cldsa(1:im,2))
        endif
        
        if(id_highcldtop+id_highcldbot+id_highcldtoptemp/=0) then
          do i=1,im
            itop  = mtopa(i,3); ibtc  = mbota(i,3)
            tmp(i)=prsi(i,itop+1)*1000.0
            tmp1(i)=prsi(i,ibtc)*1000.0
            tmp2(i)=tgrs(i,itop)
          enddo
          call send_data(id_highcldtop,tmp(1:im),istrt, im,lan,
     &         cldsa(1:im,3))
          call send_data(id_highcldbot,tmp1(1:im),istrt, im,lan,
     &         cldsa(1:im,3))
          call send_data(id_highcldtoptemp,tmp2(1:im),istrt, im,lan,
     &         cldsa(1:im,3))
        endif

        call send_data(id_cldlyr,clouds(1:im,:,1),istrt, im,lan)
        call send_data(id_cl,clouds(1:im,:,1)*100.0,istrt, im,lan)
        call send_data(id_liqwaterpath,clouds(:,:,2),istrt, im,lan)
        call send_data(id_radliqcld,clouds(1:im,:,3),istrt, im,lan)
        call send_data(id_clivi,sum(clouds(1:im,:,4),2),istrt, im,lan)
        call send_data(id_clwvi,sum(clouds(1:im,:,4),2) + 
     &       sum(clouds(:,:,2),2), istrt, im, lan)
        if (ntcw>0) then
        call send_data(id_radicecld,clouds(1:im,:,5),istrt, im,lan)
        call send_data(id_raindroppath,clouds(:,:,6),istrt, im,lan)
        call send_data(id_radraindrop,clouds(:,:,7),istrt, im,lan)
        call send_data(id_snowpath,clouds(1:im,:,8),istrt, im,lan)
        call send_data(id_radsnow,clouds(1:im,:,9),istrt, im,lan)
        endif


      return

      end subroutine grrad

      end module module_radiation_driver
