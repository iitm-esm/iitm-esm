module gbphys_mod
  use output_manager_fms, only : update_opdata, register_var
  use surface_mod, only : sfc_diff_coe
  use ocean_mod, only : surface_ocean
  use land_model_mod, only: surface_land
  use error_mod, only: handle_error, FATAL, WARNING
  use time_manager_mod, only: time_type
  use resol_def, only : levs, lsoil
  use land_model_mod, only: lndmask, zsoil_noah
  use funcphys, only : fpvs
  use physcons, only : eps => con_eps
  
  implicit none
  private
  integer :: id_rdtdt=0, id_dspdtdt=0, id_shflx=0, id_lhflx=0, &
             id_vdifdtdt=0, id_vdifdqdt=0, id_heatc=0, id_moistc=0, &
             id_dke=0, id_tsurf=0, id_precip_c=0, id_precip_l=0, &
             id_precip=0, id_lprecip_c=0, id_lprecip_l=0, id_lprecip=0, &
             id_fprecip_c=0, id_fprecip_l=0,id_fprecip=0, id_sheleg=0, id_sncovr=0, &
             id_gflx=0, id_canopy=0, id_tskin=0, id_trans=0,id_zorl_l=0, &
             id_cd=0, id_snlhflx=0, id_wind=0, id_ta=0, id_ua=0, id_va=0, &
             id_hus=0, id_uas=0, id_vas=0, id_tas=0, id_prw=0, id_ps=0, id_tauu=0, &
             id_tauv=0, id_zg=0, id_runoff=0, id_drain=0, id_smsoil=0, id_slsoil=0, id_zgi=0, &
             id_soilm=0, id_chh=0, id_cmm=0, id_zlvl=0, id_t1=0, id_q1=0, id_u1=0, id_v1=0, &
             id_qas=0, id_evbs=0, id_evcw=0, id_sbsno=0, id_snohf=0, id_pevap=0, id_tmpmax=0, &
             id_tmpmin=0, id_sphumin=0, id_sphumax=0, id_hpbl=0, id_dugwd=0, id_dvgwd=0, &
             id_dugwdc=0, id_dvgwdc=0, id_cldwrk=0, id_snwdph=0, id_fh2=0, id_tsurf1=0, &
             id_mrro=0, id_sfcwind=0, id_evap=0, id_wap=0, id_hur=0, id_hurs=0, &
             id_mc=0, id_cct=0, id_ccb=0, id_ci=0,id_mrsos=0,id_gt0=0,id_gt0_strati=0, &
             id_swh=0,id_hlw=0,id_cuhr=0,id_qmax=0,id_vegtype1=0,id_soiltype1=0
  integer :: id_tskin11=0, id_twater11=0, id_tslsi=0, id_tso=0, id_ofrac=0, id_fwater=0
  logical :: initialized=.false.
  real, parameter :: kg=1000.0
  real, parameter :: rhoh2o=1000.0
      
  public :: gbphys, initialize_gbphys
 
  contains
  ! ===================================================================== !
  !  description:                                                         !
  !                                                                       !
  !     gbphys is main program to invoke model physics (except radiation) !
  !     at model time steps                                               !
  !                                                                       !
  !  usage:                                                               !
  !                                                                       !
  !    call gbphys                                                        !
  !       inputs:                                                         !
  !         ( im, ix, levs, lsoil, lsm, ntrac, ncld, ntoz, ntcw,          !
  !           nmtvr, nrcm, ko3, lonf, latg, jcap, num_p3d, num_p2d,       !
  !           kdt, lat, me, pl_coeff, nlons, ncw, flgmin, crtrh,          !
  !           ccwf, ctei_rm, clstp, dtp, dtf, fhour, solhr,               !
  !           slag, sdec, cdec, sinlat, coslat, pgr, ugrs, vgrs,          !
  !           tgrs, qgrs, vvel, prsi, prsl, prslk, prsik, phii, phil,     !
  !           xkt2, prdout, poz, rcs2, dpshc, hprime, xlon, xlat,         !
  !           slope, tg3, vfrac,           !
  !           vtype, stype, uustar, coszen, sfcdsw, sfcnsw,          !
  !           sfcdlw, tsflw, sfcemis, swh, hlw, ras, pre_rad,      !
  !           trans_trac, lssav, xkzm, flipv,          !
  !           old_monin, cnvgwd, sashal, newsas, mstrat,         !
  !       input/outputs:                                                  !
  !           hice, fice, tisfc, tsea, tprcp, cv, cvb, cvt,               !
  !           acv, acvb, acvt, cldwrk, phy_f3d, phy_f2d, ep,              !
  !           slc, smc, stc,                                              !
  !           tsnwp, snwdph, sheleg, sncovr, zorl, canopy,               !
  !           ffmm, ffhh, f10m, srunoff, evbsa, evcwa, snohfa,            !
  !           transa, sbsnoa, snowca, soilm, tmpmin, tmpmax,              !
  !           dugwd, dvgwd, psmean, bengsh, spfhmin, spfhmax,             !
  !           dusfc, dvsfc, dtsfc, dqsfc, geshem, gflux,                  !
  !           dlwsfc, ulwsfc, dlwsfc_cc, ulwsfc_cc, swsfc_cc,             !
  !           dusfc_cc, dvsfc_cc, dtsfc_cc, dqsfc_cc, precr_cc,           !
  !       outputs:                                                        !
  !           gt0, gq0, gu0, gv0, t2m, q2m, u10m, v10m,                   !
  !           zlvl, psurf, hpbl, pwat, t1, q1, u1, v1,                    !
  !           chh, cmm, dlwsfci, ulwsfci, dswsfci, uswsfci,               !
  !           dtsfci, dqsfci, gfluxi, epi,                                !
  !           xmu_cc, dlw_cc, dsw_cc, snw_cc, lprec_cc )                  !
  !                                                                       !
  !  subprograms called:                                                  !
  !                                                                       !
  !     get_prs,  dcyc2t2_pre_rad (testing),    dcyc2t3,  sfc_diff,       !
  !     sfc_ocean,sfc_drv,  sfc_land, sfc_sice, sfc_diag, moninp1,        !
  !     moninp,   moninq1,  moninq,   gwdps,    ozphys,   get_phi,        !
  !     sascnv,   sascnvn,  rascnv,   gwdc,     shalcvt3, shalcv,         !
  !     shalcnv,  cnvc90,   lrgscl,   gsmdrive, gscond,   precpd,         !
  !     progt2                                                            !
  !                                                                       !
  !                                                                       !
  !  program history log:                                                 !
  !           19xx  - ncep mrf/gfs                                        !
  !      nov  2002  - s. moorthi  modify and restructure                  !
  !           200x  - h. juang    modify (need description)               !
  !      nov  2004  - x. wu       modify sea-ice model                    !
  !      may  2005  - s. moorthi  modify and restructure                  !
  !           2005  - s. lu       modify (need description)               !
  !      oct  2006  - h. wei      modify land sfc mdl including options   !
  !                     for noah land sfc mdl and osu land sfc mdl.       !
  !           2008  - jun wang    added spfhmax/spfhmin as input/output.  !
  !      apr  2008  - y.-t. hou   added lw sfc emissivity var (sfcemis),  !
  !                     define the lw sfc dn/up fluxes in two forms: atmos!
  !                     and ground. also changed sw sfc net flux direction!
  !                     (positive) from ground -> atmos to the direction  !
  !                     of atmos -> ground. recode the program and add    !
  !                     program documentation block.                      !
  !                                                                       !
  !                                                                       !
  !  ====================  defination of variables  ====================  !
  !                                                                       !
  !  inputs:                                                       size   !
  !     ix, im   - integer, horiz dimention and num of used pts      1    !
  !     levs     - integer, vertical layer dimension                 1    !
  !     lsoil    - integer, number of soil layers                    1    !
  !     lsm      - integer, flag for land surface model scheme       1    !
  !                =0: use osu scheme; =1: use noah scheme                !
  !     ntrac    - integer, number of tracers                        1    !
  !     ncld     - integer, indicate cloud types                     1    !
  !     ntoz     - integer, flag for ozone generation schemes        1    !
  !     ntcw     - integer, flag for cloud condensate computations   1    !
  !     nmtvr    - integer, number of montain variables              1    !
  !     nrcm     - integer, number of random clouds                  1    !
  !     ko3      - integer, number of layers for ozone data          1    !
  !     lonf,latg- integer, number of lon/lat points                 1    !
  !     jcap     - integer, number of spectral wave trancation       1    !
  !     num_p3d  - integer,                                          1    !
  !     num_p2d  - integer,                                          1    !
  !     kdt,lat,me-integer, for check print debug control purpose    1    !
  !     pl_coeff - integer,                                          1    !
  !     nlons    - integer,                                          im   !
  !     ncw      - integer,                                          2    !
  !     flgmin   - real, min large ice fraction                      2    !
  !     crtrh    - real,                                             3    !
  !     ccwf     - real,                                             1    !
  !     ctei_rm  - real,                                             1    !
  !     clstp    - real,                                             1    !
  !     dtp,dtf  - real, time interval (second)                      1    !
  !     fhour    - real, forecast hour                               1    !
  !     solhr    - real, fcst hour at the end of prev time step      1    !
  !     slag     - real, equation of time ( radian )                 1    !
  !     sdec,cdec- real, sin and cos of the solar declination angle  1    !
  !     sinlat   - real, sin of latitude                             im   !
  !     coslat   - real, cos of latitude                             im   !
  !     pgr      - real, surface pressure                            im   !
  !     ugrs,vgrs- real, u/v component of layer wind              ix,levs !
  !     tgrs     - real, layer mean temperature ( k )             ix,levs !
  !     qgrs     - real, layer mean tracer concentration     ix,levs,ntrac!
  !     vvel     - real, layer mean vertical velocity             ix,levs !
  !     prsi     - real, pressure at layer interfaces             ix,levs+1
  !     prsl     - real, mean layer presure                       ix,levs !
  !     prsik    - real, prsi**(R/Cp)                             ix,levs+1
  !     prslk    - real, prsl**(R/Cp)                             ix,levs !
  !     phii     - real,                                          ix,levs+1
  !     phil     - real,                                          ix,levs !
  !     xkt2     - real,                                          ix,nrcm !
  !     prdout   - real,                                   ix,ko3,pl_coeff!
  !     poz      - real,                                             ko3  !
  !     rcs2     - real,                                             im   !
  !     dpshc    - real,                                             im   !
  !     hprime   - real, orographic std dev                       ix,nmtvr!
  !     xlon,xlat- real, longitude and latitude ( radian )           im   !
  !     slope    - real, sfc slope type for lsm                      im   !
  !     tg3      - real, deep soil temperature                       im   !
  !     vfrac    - real,                                             im   !
  !     vtype    - real, vegetation type                             im   !
  !     stype    - real, soil type                                   im   !
  !     uustar   - real,                                             im   !
  !     coszen   - real, avg cosz over daytime sw radiation interval im   !
  !     sfcdsw   - real, total sky sfc downward sw flux ( w/m**2 )   im   !
  !     sfcnsw   - real, total sky sfc netsw flx into ground(w/m**2) im   !
  !     sfcdlw   - real, total sky sfc downward lw flux ( w/m**2 )   im   !
  !     tsflw    - real, sfc air (layer 1) temp over lw interval (k) im   !
  !     sfcemis  - real, sfc lw emissivity ( fraction )              im   !
  !     swh      - real, total sky sw heating rates ( k/s )       ix,levs !
  !     hlw      - real, total sky lw heating rates ( k/s )       ix,levs !
  !     ras      - logical, flag for ras convection scheme           1    !
  !     pre_rad  - logical, flag for testing purpose                 1    !
  !     trans_trac-logical,                                          1    !
  !     lssav    - logical, flag controls data store and output      1    !
  !     xkzm     - logical,                                          1    !
  !     flipv    - logical, flag for vertical direction              1    !
  !     old_monin- logical, flag for diff monin schemes              1    !
  !     cnvgwd   - logical, flag for conv gravity wave drag          1    !
  !     sashal   - logical, flag for shallow conv schemes            1    !
  !     newsas   - logical, flag for sas conv schemes                1    !
  !     mstrat   - logical,                                          1    !
  !                                                                       !
  !  input/outputs:                                                       !
  !     hice     - real, sea-ice thickness                           im   !
  !     fice     - real, sea-ice concentration                       im   !
  !     tsea     - real, ground surface temperature ( k )            im   !
  !     tprcp    - real, liquid precipitation                         im   !
  !     tsnwp    - real, frozen precipitation                         im   !
  !     cv,cvb,cvt-real, convective clouds amt, base and top         im   !
  !     acv,acvb,acvt                                                     !
  !              - real,                                             im   !
  !     cldwrk   - real,                                             im   !
  !     phy_f3d  - real,                                   ix,levs,num_p3d!
  !     phy_f2d  - real,                                        ix,num_p2d!
  !     ep       - real,                                             im   !
  !     slc      - real, liquid soil moisture                     ix,lsoil!
  !     smc      - real, total soil moisture content (fractional) ix,lsoil!
  !     stc      - real,                                          ix,lsoil!
  !     snwdph   - real, snow depth (water equiv) over land          im   !
  !     sheleg   - real, snow depth (water equiv)                    im   !
  !     sncovr   - real, snow cover over land                        im   !
  !     zorl     - real, surface roughness                           im   !
  !     canopy   - real, canopy water                                im   !
  !     ffmm     - real,                                             im   !
  !     ffhh     - real,                                             im   !
  !     f10m     - real,                                             im   !
  !     srunoff  - real,                                             im   !
  !     evbsa    - real, accumulated direct soil evaporation         im   !
  !     evcwa    - real, accumulated canopy water evaporation        im   !
  !     snohfa   - real, accumulated snow/freezing_rain latent flux  im   !
  !     transa   - real, accumulated total plant transpiration (m/s) im   !
  !     sbsnoa   - real, accumulated sublimation from snowpack       im   !
  !     snowca   - real, accumulated fractional snow cover           im   !
  !     soilm    - real, total soil column moisture content (m)      im   !
  !     tmpmin   - real, min temperature at 2m height (k)            im   !
  !     tmpmax   - real, max temperature at 2m height (k)            im   !
  !     dugwd    - real,                                             im   !
  !     dvgwd    - real,                                             im   !
  !     psmean   - real,                                             im   !
  !     bengsh   - real,                                             im   !
  !     spfhmin  - real,                                             im   !
  !     spfhmax  - real,                                             im   !
  !     dusfc    - real,                                             im   !
  !     dvsfc    - real,                                             im   !
  !     dtsfc    - real,                                             im   !
  !     dqsfc    - real,                                             im   !
  !     geshem   - real,                                             im   !
  !     gflux    - real, groudn conductive heat flux                 im   !
  !     runoff   - real, total water runoff                          im   !
  !     dlwsfc   - real, time accumulated sfc dn lw flux ( w/m**2 )  im   !
  !     ulwsfc   - real, time accumulated sfc up lw flux ( w/m**2 )  im   !
  !     dlwsfc_cc- real, sfc dnwd lw flux (w/m**2) for ocn coupling  im   !
  !     ulwsfc_cc- real, sfc upwd lw flux (w/m**2) for ocn coupling  im   !
  !     swsfc_cc - real, sfc net sw  flux (w/m**2) for ocn coupling  im   !
  !     dusfc_cc - real, sfc u-wind                for ocn coupling  im   !
  !     dvsfc_cc - real, sfc v-wind                for ocn coupling  im   !
  !     dtsfc_cc - real, sfc temperature  (k)      for ocn coupling  im   !
  !     dqsfc_cc - real, sfc pressure              for ocn coupling  im   !
  !     precr_cc - real, total precipitation       for ocn coupling  im   !
  !                                                                       !
  !  outputs:                                                             !
  !     gt0      - real,                                          ix,levs !
  !     gq0      - real,                                    ix,levs,ntrac !
  !     gu0,gv0  - real,                                          ix,levs !
  !     t2m,q2m  - real, 2 meter temperature and humidity            im   !
  !     u10m,v10m- real, 10 meater u/v wind speed                    im   !
  !     zlvl     - real,                                             im   !
  !     psurf    - real, surface pressure                            im   !
  !     hpbl     - real,                                             im   !
  !     pwat     - real, precipitable water                          im   !
  !     t1, q1   - real,                                             im   !
  !     u1, v1   - real,                                             im   !
  !     chh,cmm  - real,                                             im   !
  !     dlwsfci  - real, instantaneous sfc dnwd lw flux ( w/m**2 )   im   !
  !     ulwsfci  - real, instantaneous sfc upwd lw flux ( w/m**2 )   im   !
  !     dswsfci  - real, instantaneous sfc dnwd sw flux ( w/m**2 )   im   !
  !     uswsfci  - real, instantaneous sfc upwd sw flux ( w/m**2 )   im   !
  !     dtsfci   - real,                                             im   !
  !     dqsfci   - real,                                             im   !
  !     gfluxi   - real,                                             im   !
  !     epi      - real,                                             im   !
  !     xmu_cc   - real, cosine of zenith angle at time step         im   !
  !     dlw_cc   - real, sfc dnwd lw flux at time step for ocn cpl   im   !
  !     dsw_cc   - real, sfc dnwd sw flux at time step for ocn cpl   im   !
  !     snw_cc   - real, lower atms snow fall rate for ocn cpl       im   !
  !     lprec_cc - real, lower atms rain fall rate for ocn cpl       im   !
  !                                                                       !
  !  ====================    end of description    =====================  !

  subroutine gbphys                                                 &
    !  ---  inputs:
     (istrt, lan, im, ix, lsm, ntrac, ncld, ntoz, ntcw,  &
      nmtvr, nrcm, ko3, lonf, latg, jcap, num_p3d, num_p2d,       &
      kdt, lat, me, pl_coeff, nlons, ncw, flgmin, crtrh,          &
      ccwf, ctei_rm, clstp, dtp, dtf, fhour, solhr,               &
      slag, sdec, cdec, sinlat, coslat, pgr, ugrs, vgrs,          &
      tgrs, qgrs, vvel, prsi, prsl, prslk, prsik, phii, phil,     &
      xkt2, prdout, poz, rcs2, dpshc, hprime, xlon,               &
      lfrac, ofrac, slopetyp, tg3, vfrac, vegtype, soiltyp, &
      uustar, coszen, sfcdsw, sfcnsw, nsw_l,                      &
      sfcdlw, tsflw, sfcemis, swh, hlw, ras, pre_rad,             &
      trans_trac, lssav, xkzm, flipv,                   &
      old_monin, cnvgwd, sashal, newsas, mstrat,         &
      !  --  input
      hice, fice, fwater, tice, twater, tprcp, cv, cvb, cvt,      &
      acv, acvb, acvt, cldwrk, phy_f3d, phy_f2d, ep,              &
      slc, smc, stc, tskin, tsnwp,                                &
      snwdph, sheleg, sncovr, zorl_l, zorl_o, canopy,             &
      ffmm, ffhh, f10m, srunoff, evbsa, evcwa, snohfa,            &
      transa, sbsnoa, snowca, soilm, tmpmin, tmpmax,              &
      dugwd, dvgwd, psmean, bengsh, spfhmin, spfhmax,             &
      dusfc, dvsfc, dtsfc, dqsfc, geshem, gflux,                  &
      runoff,dlwsfc, ulwsfc,                                      &
      !  --  outputs:
      gt0, gq0, gu0, gv0, t2m, q2m, u10m, v10m,                   &
      zlvl, psurf, hpbl, pwat, t1, q1, u1, v1,                    &
      chh, cmm, dlwsfci, ulwsfci, dswsfci, uswsfci,               &
      dtsfci, dqsfci, gfluxi, epi,                                &
      lhflx_i, lhflx_o, shflx_i, shflx_o, dlw_o, lprec_o, fprec_o,&
      drdt, dedt, dhdt, uflux, vflux,totrunoff)

    use machine ,   only : kind_phys
    use physcons,   only : con_cp, con_fvirt, con_g, con_rd, con_rv,  &
                           con_hvap, con_hfus, con_rerth, con_pi
    implicit none
    !  ---  constant parameters:
    real (kind=kind_phys), parameter :: hocp    = con_hvap/con_cp
    real (kind=kind_phys), parameter :: fhourpr = 0.0
    real (kind=kind_phys), parameter :: rhc_max = 0.9999      ! 20060512
    real (kind=kind_phys), parameter :: qmin    = 1.0e-10
    real (kind=kind_phys), parameter :: p850    = 85.0
    real (kind=kind_phys), parameter :: epsq    = 1.e-20
    real (kind=kind_phys), parameter :: hsub    = con_hvap+con_hfus
    real (kind=kind_phys), parameter :: cb2mb   = 10.0
    real (kind=kind_phys), parameter :: czmin   = 0.0001      ! cos(89.994)
    real (kind=kind_phys), parameter :: cont = 1000.*con_cp/con_g, &
                                        conq = 1000.*con_hvap/con_g, &
                                        con_ke = 0.5*1000.0/con_g
    real (kind=kind_phys), parameter :: dxmax=-16.118095651, &
                                        dxmin=-9.800790154, &
                                        dxinv=1.0/(dxmax-dxmin)
    !  ---  inputs:
    !type(time_type), intent(in) :: time
    integer,intent(in):: istrt, lan, ix, im, lsm, ntrac, &
          ncld, ntoz, ntcw, nmtvr, nrcm, ko3, lonf, latg, jcap,       &
          num_p3d, num_p2d, kdt, lat, me, pl_coeff
    integer, intent(in) :: nlons(im), ncw(2)
    logical, intent(in) :: ras, pre_rad, flipv, old_monin,            &
                           cnvgwd, sashal, newsas, lssav, &
                           mstrat, trans_trac         
    real (kind=kind_phys), dimension(im), intent(in) ::     &
            sinlat, coslat, pgr, rcs2, dpshc, xlon,  &
            lfrac, ofrac, tg3, vfrac, &
            coszen, sfcnsw, nsw_l, sfcdsw, &
            sfcdlw, tsflw, sfcemis
    integer, dimension(im), intent(in) :: soiltyp,vegtype,slopetyp

    real (kind=kind_phys), dimension(ix,levs), intent(in) ::     &
            ugrs, vgrs, tgrs, vvel, prsl, prslk, phil, swh, hlw

    real (kind=kind_phys), dimension(ix,levs+1), intent(in) ::     &
            prsi, prsik, phii
    real (kind=kind_phys), intent(in) :: hprime(ix,nmtvr), qgrs(ix,levs,ntrac), &
                                         prdout(ix,ko3,pl_coeff), crtrh(3), &
                                         flgmin(2), xkt2(ix,nrcm), poz(ko3)
    real (kind=kind_phys), intent(in) :: ccwf, ctei_rm, clstp, dtp, dtf, fhour, &
                                          solhr, slag, sdec, cdec, xkzm
    real (kind=kind_phys), dimension(im), intent(in) ::  tice, twater, fice, hice, fwater
    !  ---  input/output:
    real (kind=kind_phys), dimension(im), intent(inout) ::  &
            tprcp, tsnwp, cv, cvb, cvt,       &
            snwdph, sheleg, sncovr, zorl_l, zorl_o, canopy, ffmm, ffhh, f10m,    &
            srunoff, evbsa, evcwa, snohfa, transa, sbsnoa, snowca,     &
            soilm, tmpmin, tmpmax, dusfc, dvsfc, dtsfc, dqsfc,         &
            geshem, gflux, dlwsfc, ulwsfc, runoff, ep, cldwrk,         &
            dugwd, dvgwd, psmean, bengsh, spfhmin, spfhmax,            &
            acv, acvb, acvt, uustar, tskin

    real (kind=kind_phys), dimension(ix,lsoil), intent(inout) ::  &
                                                    smc, stc, slc
    real (kind=kind_phys), intent(inout) :: phy_f3d(ix,levs,num_p3d), &
                                            phy_f2d(ix,num_p2d)
    !  ---  output:
    real (kind=kind_phys), dimension(im), intent(out) ::    &
            t2m, q2m, u10m, v10m, zlvl, psurf, hpbl, pwat, t1, q1,     &
            u1, v1, chh, cmm, dlwsfci, ulwsfci, dswsfci, uswsfci,      &
            dtsfci, dqsfci, gfluxi, epi

    real (kind=kind_phys), dimension(im), intent(inout) :: &
            lhflx_i, lhflx_o, shflx_i, shflx_o, dlw_o, lprec_o, fprec_o, &
            drdt, dedt, dhdt, uflux, vflux,totrunoff

    real (kind=kind_phys), dimension(ix,levs),intent(out) :: gt0, gu0,gv0
    real (kind=kind_phys), dimension(ix,levs) :: gt0_strati
    real (kind=kind_phys), intent(out) :: gq0(ix,levs,ntrac)
    !  ---  local:
    real (kind=kind_phys), dimension(im,levs) :: tmp3d
    real (kind=kind_phys), dimension(im) :: ccwfac, garea,    &
            dlength, xncw, cumabs, qmax, cice, zice, gflx,       &
            rain, rainc, rainl, raincs, cd, cdq,               &
            qss, dusfcg, dvsfcg, dusfc1, dvsfc1, dtsfc1, dqsfc1, rb,   &
            drain, cld1d, evap, hflx, stress, t850, ep1d,     &
            gamt, gamq, sigmaf, rcl, rcs, oc, theta, gamma, sigma,     &
            elvmax, wind, work1, work2, runof, xmu, fm10,    &
            fh2, tx1, ctei_r, flgmin_l, evbs, evcw, trans, &
            sbsno, snowc, adjsfcdsw, adjsfcnsw, adjsfcdlw, adjsfculw,  &
            asfcdlw, asfculw, gsfcdlw, gsfculw, xcosz, snohf,          &
            sfcdspheati, tmp, tmpt1, tmpq1, ke_strt, ke_end, &
            snwc, snwl, snw, precip, precipc, precipl, slmsk, &  !Prajeesh: Added for Snowfall
            qss_i,cmm_i,chh_i,evap_i,hflx_i, &
            qss_o,cmm_o,chh_o,evap_o,hflx_o, &
            qss_l,cmm_l,chh_l,evap_l,hflx_l, &
            tsurf_temp, oifrac, owfrac, snlhflx
    logical, dimension(im) :: mask

    real (kind=kind_phys), dimension(ix,levs) :: ud_mf, dd_mf, dt_mf, del

    real (kind=kind_phys), dimension(im,levs)    :: rhc, sr, dtdt,    &
            dudt, dvdt, gwdcu, gwdcv, diagn1, diagn2, cuhr, cumchr,    &
            qr_col, tmpt, gwddvdt, gwddudt

    real (kind=kind_phys), dimension(im,lsoil)   :: smsoil, stsoil,   &
           slsoil

    real (kind=kind_phys) :: rhbbot, rhbtop, rhpbl, frain, f_rain,    &
           f_ice, qi, qw, qr, wc, tem, tem1, tem2,rdtp,tmpv1,tmpu1,   &
           dqdt(im,levs,ntrac), oa4(im,4), clx(im,4)

    real (kind=kind_phys), dimension(im) :: cd_l,cdq_l,rb_l,stress_l,ffmm_l,ffhh_l, &
           uustar_l,wind_l,fm10_l,fh2_l, &
           cd_o,cdq_o,rb_o,stress_o,ffmm_o,ffhh_o,uustar_o,wind_o,fm10_o,fh2_o,tsea, &
           cd_i,cdq_i,rb_i,stress_i,ffmm_i,ffhh_i,uustar_i,wind_i,fm10_i,fh2_i

    !  --- ...  in clw, the first two varaibles are cloud water and ice.
    !           from third to ntrac are convective transportable tracers,
    !           third being the ozone, when ntrac=3 (valid only with ras)

    real (kind=kind_phys), allocatable :: clw(:,:,:)
    integer, dimension(im) :: kbot, ktop, kcnv,   &
                              kpbl, kinver, lmh, levshc
    integer :: i, nvdiff, ic, k, n, ipr, k1, iter, levshcm,           &
               tracers, trc_shft, tottracer
    logical, dimension(im) :: flag_iter, flag_guess, invrsn
    real :: wgts(im), tslsi(im)
    logical :: lprnt
    !===> ...  begin here
    if(.not.initialized) then
      call handle_error(fatal, 'Call initialize_gbphys before calling gbphys')
    endif

    slmsk(:) = 0.0
    where(lfrac(:)>0.4) slmsk(:)=1.0
    tsea(:)=tskin(:)*lfrac(:) + &
            twater(:)*ofrac(:)*fwater(:) + &
            tice(:)*ofrac(:)*fice(:)


    call update_opdata(id_tsurf,tsea(:),istrt, im,lan)
    
    if (id_tslsi>0) then
       tslsi=0.0; tslsi=tskin(:)*lfrac(:)+tice(:)*(1.0-lfrac(:));
       wgts=0.0; where(fice>0.4.or.lfrac>0.4) wgts=1.0
       call update_opdata(id_tslsi,tslsi(:),istrt, im,lan,wgts)
    endif
    
    call update_opdata(id_tskin,tskin(:),istrt, im,lan)
    
    if (id_tso>0) then
       wgts=0.0
       where(fwater>0.4) wgts=1.0
       call update_opdata(id_tso,twater(:),istrt, im,lan,wgts)
    endif
    
    call update_opdata(id_ofrac,ofrac(:),istrt, im,lan)
    call update_opdata(id_fwater,fwater(:),istrt, im,lan)

    rdtp=1.0/dtp
    lprnt = .false.
    lmh(:) = levs
    nvdiff = ntrac
    snw=0.
    snwc=0.
    snwl=0.
    precip=0.
    precipl=0.
    precipc=0.
    !  --- ...  figure out how many extra tracers are there

    if ( trans_trac ) then
      if ( ntcw > 0 ) then
        if ( ntoz < ntcw ) then
          trc_shft = ntcw + ncld
        else
          trc_shft = ntoz
        endif
      elseif ( ntoz > 0 ) then
        trc_shft = ntoz
      else
        trc_shft = 1
      endif
      tracers   = ntrac - trc_shft
      if ( ntoz > 0 ) tottracer = tracers + 1  ! ozone is added separately
    else
      tottracer = 0 ! no convective transport of tracers
    endif
    allocate ( clw(ix,levs,tottracer+2) )
    if ( ras ) then
      if ( ccwf >= 0.0 ) then
        ccwfac = ccwf
      else
        ccwfac = -999.0
      endif
    endif
    call get_prs( im,ix,levs,ntrac,tgrs,qgrs,prsi, &
                  prsik,prsl,prslk,phii,phil,del)
    rhbbot = crtrh(1)
    rhpbl  = crtrh(2)
    rhbtop = crtrh(3)
    !  --- ...  for pry version
    do i = 1, im
      levshc(i) = 0
    enddo
    do k = 2, levs
      do i = 1, im
        if ( prsi(i,1)-prsi(i,k) <= dpshc(i) ) levshc(i) = k
      enddo
    enddo
    levshcm = 1
    do i = 1, im
      levshcm = max( levshcm, levshc(i) )
    enddo
    if ( mstrat ) then
      levshcm = max( levshcm, levs/2 )
    else
      levshcm = min( levshcm, levs/2 )
    endif
    !frain=factor for centered difference scheme correction of rain amount.
    frain = dtf / dtp
    do i = 1, im
      sigmaf(i)  = max( vfrac(i), 0.01 )
      if ( lsm == 0 ) sigmaf(i) = 0.5 + vfrac(i)*0.5
    enddo
    !transfer soil moisture and temperature from global to local variables
    do k = 1, lsoil
      do i = 1, im
        smsoil(i,k) = smc(i,k)
        stsoil(i,k) = stc(i,k)
        slsoil(i,k) = slc(i,k)          !! clu: slc -> slsoil
      enddo
    enddo
    !xw: transfer ice thickness & concentration from global to local variables
    do i = 1, im
      zice(i) = hice(i)
      cice(i) = fice(i)
    enddo
    do k = 1, levs
      do i = 1, im
        dudt(i,k) = 0.0
        dvdt(i,k) = 0.0
        dtdt(i,k) = 0.0
      enddo
    enddo
    do n = 1, ntrac
      do k = 1, levs
        do i = 1, im
          dqdt(i,k,n) = 0.0      ! dqdt may be dimensioned (levs,ntrac)
        enddo
      enddo
    enddo
    do i = 1, im
      rcl(i)   = rcs2(i)
      rcs(i)   = sqrt(rcl(i))
      psurf(i) = pgr(i)
      work1(i) = prsik(i,1) / prslk(i,1)
      tem1       = con_rerth * (con_pi + con_pi)*coslat(i) / nlons(i)
      tem2       = con_rerth * con_pi/latg
      garea(i)   = tem1 * tem2
      dlength(i) = sqrt( tem1*tem1 + tem2*tem2 )
    enddo

    call update_opdata(id_ps,pgr(1:im)*1000.0,istrt, im,lan)
    

    if(id_heatc>0) then
      tmpt1=0.0
      do k = 1, levs
        tmpt1(1:im) = tmpt1(1:im)+cont*del(1:im,k)*tgrs(1:im,k)
      enddo
    endif
    if(id_moistc>0) then
      tmpq1=0.0
      do k = 1, levs
        tmpq1(1:im) = tmpq1(1:im)+conq*del(1:im,k)*qgrs(1:im,k,1)
      enddo
    endif

    if(id_dke>0) then
      ke_strt(:)=0.0
      do k = 1, levs
        ke_strt(1:im) = ke_strt(1:im)+con_ke*del(1:im,k)* &
                        (ugrs(1:im,k)**2+vgrs(1:im,k)*2)
      enddo
    endif
    !initialize dtdt with heating rate from dcyc2
    !adjust radiation fluxes and heating rates (longer calling period
    !of time to fit for shorter model time steps.
    !      sw:  using cos of zenith angle as scaling factor
    !      lw:  using surface air temperature as scaling factor
    tmpt(:,:)=0.0
    if ( pre_rad ) then
      call dcyc2t3_pre_rad                                            &
        !inputs:
        ( solhr,slag,sdec,cdec,sinlat,coslat,                        &
        xlon,coszen,tsea,tgrs(1,1),tgrs(1,1),                      &
        sfcdsw,sfcnsw,sfcdlw,swh,hlw,                              &
        ix, im, levs,                                              &
        !input/output:
        tmpt,                                                      &
        !outputs:
        adjsfcdsw,adjsfcnsw,adjsfcdlw,adjsfculw,xmu,xcosz)
    else
        call dcyc2t3                                                    &
          !inputs:
          ( solhr,slag,sdec,cdec,sinlat,coslat,                        &
            xlon,coszen,tsea,tgrs(1,1),tsflw,                          &
            sfcdsw,sfcnsw,sfcdlw,swh,hlw,                              &
            ix, im, levs,                                              &
          !input/output:
            tmpt,                                                      &
          !outputs:
            adjsfcdsw,adjsfcnsw,adjsfcdlw,adjsfculw,xmu,xcosz)
    endif
    dtdt(1:im,1:levs)=dtdt(1:im,1:levs)+tmpt(1:im,1:levs)
    !  ---  convert lw fluxes for land/ocean/sea-ice models
    !  note: adjsfcdlw and adjsfculw are time-step adjusted lw sfc dn/up fluxes.
    !        those fluxes from dcyc2t3 subprogram are not applied with emissivity
    !        effect.  one needs to be cautious that, when emis<1, sfc dn/up lw
    !        fluxes will expressed differently when looking from atmospheric
    !        (as the output from radiation) to those applied for land/ocean/sea-ice
    !        model processes. however, the net effects are the same.
    !
    !- flux to/from lnd/oc/ice:  gsfcdlw=emis*adjsfcdlw; gsfculw=emis*adjsfculw
    !- flux to/from atmos mdl: asfcdlw=adjsfcdlw; asfculw=emis*adjsfculw+(1-emis)*adjsfcdlw

    do i = 1, im
      gsfcdlw(i) = sfcemis(i) * adjsfcdlw(i)                  ! for lnd/ocn/sice
      gsfculw(i) = sfcemis(i) * adjsfculw(i)                  ! for lnd/ocn/sice
      asfcdlw(i) = adjsfcdlw(i)                               ! for atmos output
      asfculw(i) = gsfculw(i) + adjsfcdlw(i) - gsfcdlw(i)     ! for atmos output
      dlw_o(i) = gsfcdlw(i)
      drdt(i) = sfcemis(i)
    enddo
    !  --- ...  coupling insertion
    !  note: all radiation fluxes are possitive values.
    !        sfc net sw is defined as sfcnsw = sfcdsw - sfcusw (*** positive downward
    !        see subr grrad for def)

    if(id_rdtdt>0) then
      tmp=0.0
      do k = 1, levs
         tmp(1:im) = tmp(1:im)+cont*del(1:im,k)*tmpt(1:im,k)
      enddo
      call update_opdata(id_rdtdt,tmp(1:im),istrt, im,lan)
    endif
    do i = 1, im
      kcnv(i)   = 0
      kinver(i) = levs
      invrsn(i) = .false.
      tx1(i)    = 0.0
      ctei_r(i) = 10.0
    enddo

    do k = 1, levs/2
      do i = 1, im
        if ( prsi(i,1)-prsi(i,k+1) < 0.35*prsi(i,1) &
             .and. (.not. invrsn(i)) ) then
          tem = (tgrs(i,k+1) - tgrs(i,k)) / (prsl(i,k) - prsl(i,k+1))
          if ( tem > 0.025 .and. tx1(i) < 0.0 ) then
            invrsn(i) = .true.
            if ( qgrs(i,k,1)/=qgrs(i,k+1,1) .and. .not.sashal ) then
              tem1 = (1.0 + hocp*max(qgrs(i,k+1,1),qmin)/tgrs(i,k+1))
              tem2 = (1.0 + hocp*max(qgrs(i,k,1),qmin)/tgrs(i,k))
              tem1 = tem1 * tgrs(i,k+1) / prslk(i,k+1)  &
                    - tem2 * tgrs(i,k)   / prslk(i,k)
              !(cp/l)(delthetae)/(deltotwater) < 0.7
              ctei_r(i) = (1.0/hocp)*tem1/(qgrs(i,k+1,1)-qgrs(i,k,1)  &
                         + qgrs(i,k+1,ntcw)-qgrs(i,k,ntcw))
            else
              ctei_r(i) = 10
            endif
            kinver(i) = k
          endif
          tx1(i) = tem
        endif
      enddo
    enddo

    do i = 1, im
      flag_guess(i) = .false.
      flag_iter(i)  = .true.
      drain(i)      = 0.0
      ep1d(i)       = 0.0
      runof(i)      = 0.0
      hflx(i)       = 0.0
      gflx(i)       = 0.0
      evap(i)       = 0.0
      evbs(i)       = 0.0
      evcw(i)       = 0.0
      trans(i)      = 0.0
      sbsno(i)      = 0.0
      snowc(i)      = 0.0
      snohf(i)      = 0.0
    enddo
    
    !->Sea_Water
    cd_o=0.0;cdq_o=0.0;rb_o=0.0;stress_o=0.0;ffmm_o=0.0;ffhh_o=0.0;
    uustar_o=0.0;wind_o=0.0;fm10_o=0.0;fh2_o=0.0;
    mask(:)=.false.
    where(ofrac(:)>1.0e-10.and.fwater(:)>1.0e-10) mask(:)=.true.
    call sfc_diff_coe(im,pgr,ugrs,vgrs,tgrs,qgrs, &
                  twater,rcl,prsl(1,1), &
                  work1,mask,phy_f2d(1,num_p2d), &
                  zorl_o,cd_o,cdq_o,rb_o,stress_o,ffmm_o,ffhh_o, &
                  uustar_o,wind_o,fm10_o,fh2_o,.true.)
    
    call surface_ocean(im,pgr,wind_o,tgrs,qgrs,twater, &
        cd_o,cdq_o,prsl(1,1),work1,mask,  &
      !outputs:
        qss_o,cmm_o,chh_o,evap_o,hflx_o,shflx_o,lhflx_o, dhdt, dedt)
    !<-Sea_Water
    
    !->Sea_Ice
    cd_i=0.0;cdq_i=0.0;rb_i=0.0;stress_i=0.0;ffmm_i=0.0;ffhh_i=0.0;
    uustar_i=0.0;wind_i=0.0;fm10_i=0.0;fh2_i=0.0;
    mask(:)=.false.
    where(fice(:)>1.0e-10) mask(:)=.true.
    call sfc_diff_coe(im,pgr,ugrs,vgrs,tgrs,qgrs, &
                  tice,rcl,prsl(1,1), &
                  work1,mask,phy_f2d(1,num_p2d), &
                  zorl_o,cd_i,cdq_i,rb_i,stress_i,ffmm_i,ffhh_i, &
                  uustar_i,wind_i,fm10_i,fh2_i,.true.)

    call surface_ocean(im,pgr,wind_i,tgrs,qgrs,tice, &
        cd_i,cdq_i,prsl(1,1),work1,mask,  &
      !outputs:
        qss_i,cmm_i,chh_i,evap_i,hflx_i,shflx_i,lhflx_i, dhdt, dedt)
    !<-Sea_Ice

    !-> Land
    cd_l=0.0;cdq_l=0.0;rb_l=0.0;stress_l=0.0;ffmm_l=0.0;ffhh_l=0.0;
    uustar_l=0.0;wind_l=0.0;fm10_l=0.0;fh2_l=0.0;
    mask(:)=.false.
    where(lfrac(:)>1.0e-10) mask(:)=.true.
    flag_guess(:)=.false.
    tsurf_temp(:)=tskin(:)

    do iter = 1, 2
      call sfc_diff_coe(im,pgr,ugrs,vgrs,tgrs,qgrs, &
                  tskin,rcl,prsl(1,1), &
                  work1,mask,phy_f2d(1,num_p2d), &
                  zorl_l,cd_l,cdq_l,rb_l,stress_l,ffmm_l,ffhh_l, &
                  uustar_l,wind_l,fm10_l,fh2_l)
      do i = 1, im
        if ( iter==1 .and. wind_l(i)<2.0 ) then
          flag_guess(i) = .true.
        endif
      enddo
      call surface_land &
        !  inputs:
        ( im,lsoil,pgr,wind_l,tgrs,qgrs,soiltyp,vegtype,sigmaf, &
        sfcemis,gsfcdlw,adjsfcdsw,nsw_l,dtf,tg3,cd_l,cdq_l, &
        prsl(1,1),work1,mask,slopetyp,flag_guess, &
        ! in/outs:
        sheleg,snwdph,tskin,tprcp,tsnwp,smsoil,stsoil,slsoil, &
        canopy,trans,tsurf_temp,  &
        ! outputs:
        sncovr,qss_l,gflx,drain,evap_l,hflx_l,ep1d,runof, &
        cmm_l,chh_l,zlvl,evbs,evcw,sbsno,snowc,soilm,snohf)
      mask(:)=.false.
      flag_guess(:)=.false.
      do i = 1, im
        if (iter==1.and.lfrac(i)>1.0e-10) then
          if (wind_l(i) < 2.0) mask(i) = .true.
        endif
      enddo
    enddo   ! end iter_loop


    owfrac(:)=ofrac(:)*fwater(:)
    oifrac(:)=ofrac(:)*fice(:)

    cd(:)=cd_l*lfrac+cd_o*owfrac+cd_i*oifrac
    cdq(:)=cdq_l*lfrac+cdq_o*owfrac+cdq_i*oifrac
    rb(:)=rb_l*lfrac+rb_o*owfrac+rb_i*oifrac
    stress(:)=stress_l*lfrac+stress_o*owfrac+stress_i*oifrac
    ffmm(:)=ffmm_l*lfrac+ffmm_o*owfrac+ffmm_i*oifrac
    ffhh(:)=ffhh_l*lfrac+ffhh_o*owfrac+ffhh_i*oifrac
    uustar(:)=uustar_l*lfrac+uustar_o*owfrac+uustar_i*oifrac
    wind(:)=wind_l*lfrac+wind_o*owfrac+wind_i*oifrac
    fm10(:)=fm10_l*lfrac+fm10_o*owfrac+fm10_i*oifrac
    fh2(:)=fh2_l*lfrac+fh2_o*owfrac+fh2_i*oifrac

    qss(:)=qss_l*lfrac+qss_o*owfrac+qss_i*oifrac
    cmm(:)=cmm_l*lfrac+cmm_o*owfrac+cmm_i*oifrac
    chh(:)=chh_l*lfrac+chh_o*owfrac+chh_i*oifrac
    evap(:)=evap_l*lfrac+evap_o*owfrac+evap_i*oifrac
    hflx(:)=hflx_l*lfrac+hflx_o*owfrac+hflx_i*oifrac

    call update_opdata(id_cd,cd(:),istrt, im,lan)
    call update_opdata(id_sheleg,sheleg,istrt, im,lan)
    call update_opdata(id_sncovr,sncovr,istrt, im,lan)
    call update_opdata(id_snwdph,snwdph,istrt, im,lan)
    call update_opdata(id_gflx,gflx,istrt, im,lan)
    call update_opdata(id_canopy,canopy,istrt, im,lan)
    call update_opdata(id_tskin,tskin,istrt, im,lan)
    call update_opdata(id_trans,trans,istrt, im,lan)
 !   print *,"sum(vegtype)",sum(vegtype)
    call update_opdata(id_vegtype1,real(vegtype),istrt, im,lan)
    call update_opdata(id_soiltype1,real(soiltyp),istrt, im,lan)
    call update_opdata(id_wind,wind,istrt, im,lan)
    call update_opdata(id_smsoil,smsoil,istrt, im,lan)
    if(id_mrsos>0) &
         call update_opdata(id_mrsos,-1.0 * smsoil(1:im,1) * zsoil_noah(1), &
         istrt, im, lan)
    call update_opdata(id_slsoil,slsoil,istrt, im,lan)
    call update_opdata(id_zlvl,zlvl,istrt, im,lan)
    call update_opdata(id_evap,evap,istrt, im,lan)
    call update_opdata(id_zorl_l,zorl_l,istrt,im,lan)

    !update near surface fields
    call sfc_diag(im,lsoil,pgr,ugrs,vgrs,tgrs,qgrs, &
                  tsea,qss,f10m,u10m,v10m,t2m,q2m,rcl,work1, &
                  evap,ffmm,ffhh,fm10,fh2)

    do i = 1, im
      phy_f2d(i,num_p2d) = 0.0
    enddo

    call update_opdata(id_uas,u10m(1:im),istrt, im,lan)
    call update_opdata(id_vas,v10m(1:im),istrt, im,lan)
    if (id_sfcwind>0) then
       call update_opdata(id_sfcwind,sqrt(u10m*u10m+v10m*v10m),istrt, im,lan)
    endif
    call update_opdata(id_tas,t2m(1:im),istrt, im,lan)
    call update_opdata(id_qas,q2m(1:im),istrt, im,lan)

    
    if (id_hurs>0) then
       do i=1,im
          tmp(i)=fpvs(t2m(i))
          tmp(i)=tmp(i)*eps/(pgr(i)*1000.0-tmp(i))
          tmp(i)=(q2m(i)/tmp(i))*100.0
       enddo
       call update_opdata(id_hurs,tmp(1:im),istrt, im,lan)
    endif
    
    call update_opdata(id_evbs,evbs(1:im),istrt, im,lan)
    call update_opdata(id_evcw,evcw(1:im),istrt, im,lan)
    call update_opdata(id_sbsno,sbsno(1:im),istrt, im,lan)
    call update_opdata(id_snohf,snohf(1:im),istrt, im,lan)
    call update_opdata(id_pevap,ep1d(1:im),istrt, im,lan)
    tmpt=0.0 
    if ( old_monin ) then
        call moninp(ix,im,ntcw,levs,nvdiff,dvdt,dudt,tmpt,dqdt, &
                    ugrs,vgrs,tgrs,qgrs, &
                    prsik(1,1),rb,ffmm,ffhh,tsea,qss,hflx,evap,stress,wind,kpbl, &
                    prsi,del,prsl,prslk,phii,phil,rcl,dtp, &
                    dusfc1,dvsfc1,dtsfc1,dqsfc1,hpbl,gamt,gamq,xkzm, &
                    sfcdspheati)
    else
      call moninq(ix,im,levs,nvdiff,ntcw,dvdt,dudt,tmpt,dqdt, &
                  ugrs,vgrs,tgrs,qgrs,swh,hlw,xmu, &
                  prsik(1,1),rb,ffmm,ffhh,tsea,qss,hflx,evap,stress,wind,kpbl, &
                  prsi,del,prsl,prslk,phii,phil,rcs,dtp, &
                  dusfc1,dvsfc1,dtsfc1,dqsfc1,hpbl,gamt,gamq)
    endif
    uflux(:)=dusfc1(:) ! sign change for MoM4
    vflux(:)=dvsfc1(:) ! sign change for MoM4

    call update_opdata(id_tauu,dusfc1(1:im),istrt, im,lan)
    call update_opdata(id_tauv,dvsfc1(1:im),istrt, im,lan)
    call update_opdata(id_swh,swh,istrt, im,lan)
    call update_opdata(id_hlw,hlw,istrt, im,lan)

    dtdt(1:im,1:levs)=dtdt(1:im,1:levs)+tmpt(1:im,1:levs)

    gt0(1:im,1:levs) = tgrs(1:im,1:levs)+dtdt(1:im,1:levs)*dtp
    gu0(1:im,1:levs) = ugrs(1:im,1:levs)+dudt(1:im,1:levs)*dtp
    gv0(1:im,1:levs) = vgrs(1:im,1:levs)+dvdt(1:im,1:levs)*dtp

    call update_opdata(id_dspdtdt,sfcdspheati(1:im),istrt, im,lan)
    call update_opdata(id_shflx,dtsfc1(1:im),istrt, im,lan)
    call update_opdata(id_lhflx,dqsfc1(1:im),istrt, im,lan)
    call update_opdata(id_hpbl,hpbl(1:im),istrt, im,lan)

    if(id_vdifdtdt>0) then
      tmp=0.0
      do k = 1, levs
         tmp(1:im) = tmp(1:im)+cont*del(1:im,k)*tmpt(1:im,k)
      enddo
      call update_opdata(id_vdifdtdt,tmp(1:im),istrt, im,lan)
    endif
    if(id_vdifdqdt>0) then
      tmp=0.0
      do k = 1, levs
         tmp(1:im) = tmp(1:im)+ conq*del(1:im,k)*dqdt(1:im,k,1)
      enddo
      call update_opdata(id_vdifdqdt,tmp(1:im),istrt, im,lan)
    endif

    if ( nmtvr == 6 ) then
        do i = 1, im
          oc(i) = hprime(i,2)
        enddo
        do k = 1, 4
          do i = 1, im
            oa4(i,k) = hprime(i,k+2)
            clx(i,k) = 0.0
          enddo
        enddo
    elseif ( nmtvr == 10 ) then
      do i = 1, im
        oc(i) = hprime(i,2)
      enddo
      do k = 1, 4
        do i = 1, im
          oa4(i,k) = hprime(i,k+2)
          clx(i,k) = hprime(i,k+6)
        enddo
      enddo
    elseif ( nmtvr == 14 ) then
      !get the kim fields (until this is changed)
      do i = 1, im
        oc(i) = hprime(i,2)
      enddo

      do k = 1, 4
        do i = 1, im
          oa4(i,k) = hprime(i,k+2)
          clx(i,k) = hprime(i,k+6)
        enddo
      enddo

      do i = 1, im
        theta(i)  = hprime(i,11)
        gamma(i)  = hprime(i,12)
        sigma(i)  = hprime(i,13)
        elvmax(i) = hprime(i,14)
      enddo
    else
      oc    = 0.0
      oa4   = 0.0
      clx   = 0.0
      theta = 0.0
      gamma = 0.0
      sigma = 0.0
      elvmax= 0.0
    endif

    gwddvdt(:,:)=0.0; gwddudt(:,:)=0.0
    call gwdps(im, ix, im,   levs,  gwddvdt, gwddudt, &
                ugrs,   vgrs, tgrs,  qgrs, &
                kpbl,   prsi, del,   prsl, prslk, &
                phii,   phil, rcl, dtp, &
                kdt,    hprime(1,1), oc, oa4, clx, &
                theta,sigma,gamma,elvmax,dusfcg, dvsfcg, &
                con_g,con_cp,con_rd,con_rv, lonf, nmtvr, me, lprnt,ipr)

    call update_opdata(id_dugwd,dusfcg,istrt, im,lan)
    call update_opdata(id_dvgwd,dvsfcg,istrt, im,lan)

    do k = 1, levs
      do i = 1, im
        tmpu1=gu0(i,k); tmpv1=gv0(i,k)
        gu0(i,k) = gu0(i,k) + gwddudt(i,k)*dtp
        gv0(i,k) = gv0(i,k) + gwddvdt(i,k)*dtp
        gt0(i,k) = gt0(i,k) - &
        0.5*(gu0(i,k)**2-tmpu1**2+gv0(i,k)**2-tmpv1**2)/con_cp
      enddo
    enddo

    do n = 1, ntrac
      do k = 1, levs
        do i = 1, im
          gq0(i,k,n) = qgrs(i,k,n) + dqdt(i,k,n)*dtp
        enddo
      enddo
    enddo
    if ( ntoz>0 .and. ntrac>=ntoz ) then
      call ozphys(ix,im,levs,ko3,dtp,gq0(1,1,ntoz),gq0(1,1,ntoz), &
                  gt0, poz, prsl, prdout, pl_coeff, del, me)
    endif
    !to side-step the ozone physics
    if ( cnvgwd ) then
      do k = 1, levs
        do i = 1, im
          dtdt(i,k) = gt0(i,k)
        enddo
      enddo
    endif

    call get_phi(im,ix,levs,ntrac,gt0,gq0, &
                 prsi,prsik,prsl,prslk,phii,phil)
    do k = 1, levs
      do i = 1, im
        clw(i,k,1) = 0.0
        clw(i,k,2) = -999.9
      enddo
    enddo
    !for convective tracer transport (while using ras)
    if ( ras ) then
      if ( tottracer > 0 ) then
        if ( ntoz > 0 ) then
          clw(:,:,3) = gq0(:,:,ntoz)
          if ( tracers > 0 ) then
            do n = 1, tracers
              clw(:,:,3+n) = gq0(:,:,n+trc_shft)
            enddo
          endif
        else
          do n = 1, tracers
            clw(:,:,2+n) = gq0(:,:,n+trc_shft)
          enddo
        endif
      endif
    endif   ! end if_ras
    do i = 1, im
      ktop(i)  = 1
      kbot(i)  = levs
    enddo
    ! calling precipitation processes
    do i = 1, im
      work1(i) = (log(coslat(i) / (nlons(i)*latg)) - dxmin) * dxinv
      work1(i) = max( 0.0, min( 1.0, work1(i) ) )
      work2(i) = 1.0 - work1(i)
    enddo

    !calling convective parameterization
    if ( ntcw > 0 ) then
      do k = 1, levs
        do i = 1, im
          rhc(i,k) = rhbbot - (rhbbot - rhbtop) * (1.0 - prslk(i,k))
          rhc(i,k) = rhc_max*work1(i) + rhc(i,k)*work2(i)
          rhc(i,k) = max( 0.0, min( 1.0, rhc(i,k) ) )
        enddo
      enddo
      if ( num_p3d == 3 ) then    ! call brad ferrier's microphysics
        do i = 1, im
          flgmin_l(i) = flgmin(1)*work1(i) + flgmin(2)*work2(i)
        enddo
        !algorithm to separate different hydrometeor species
        do k = 1, levs
          do i = 1, im
            wc     = gq0(i,k,ntcw)
            qi     = 0.0
            qr     = 0.0
            qw     = 0.0
            f_ice  = max( 0.0, min( 1.0, phy_f3d(i,k,1) ) )
            f_rain = max( 0.0, min( 1.0, phy_f3d(i,k,2) ) )
            qi = f_ice * wc
            qw = wc - qi
            if ( qw > 0.0 ) then
              qr = f_rain * qw
              qw = qw - qr
            endif
            qr_col(i,k) = qr
            clw(i,k,1)  = qi
            clw(i,k,2)  = qw
            !array to track fraction of "cloud" in the form of ice
          enddo
        enddo
      else   ! if_num_p3d
        do k = 1, levs
          do i = 1, im
            clw(i,k,1) = gq0(i,k,ntcw)
          enddo
        enddo
      endif  ! end if_num_p3d
    else    ! if_ntcw
      rhc(:,:) = 1.0
    endif   ! end if_ntcw


    if ( .not. ras ) then
      if ( .not. newsas ) then
        call sascnv(im,ix,levs,jcap,dtp,del,prsl,pgr,phil, &
                     clw,gq0,gt0,gu0,gv0,rcs,cld1d, &
                     rainc,snwc,kbot,ktop,kcnv,slmsk, &
                     vvel,xkt2,ncld)
      else
        call sascnvn(im,ix,levs,jcap,dtp,del,prsl,pgr,phil, &
                     clw,gq0,gt0,gu0,gv0,rcs,cld1d, &
                     rainc,snwc,kbot,ktop,kcnv,slmsk, &
                     vvel,ncld,ud_mf,dd_mf,dt_mf)
      endif
    else    ! if_not_newsas
      call rascnv(im,     ix,    levs,   dtp, dtf, xkt2, &
                  gt0,    gq0,   gu0,    gv0, clw, tottracer, &
                  prsi,   prsl,   prsik,  prslk, phil,  phii, &
                  kpbl,   cd,     rainc,  kbot,  ktop,  kcnv, &
                  phy_f2d(1,num_p2d), flipv, cb2mb, &
                  me, garea, lmh, ccwfac, nrcm, rhc, &
                  ud_mf, dd_mf, dt_mf, lprnt, ipr)

      cld1d = 0
      !update the tracers due to convective transport
      if ( tottracer > 0 ) then
        if ( ntoz > 0 ) then                       ! for ozone
          gq0(:,:,ntoz) = clw(:,:,3)
          if ( tracers > 0 ) then                  ! for other tracers
            do n = 1, tracers
              gq0(:,:,n+trc_shft) = clw(:,:,3+n)
            enddo
          endif
        else
          do n = 1, tracers
            gq0(:,:,n+trc_shft) = clw(:,:,2+n)
          enddo
        endif
      endif
    endif   ! end if_not_ras

    call update_opdata(id_cldwrk,cld1d,istrt, im,lan)
    if (id_mc>0) call update_opdata(id_mc, ud_mf(1:im,:)-dd_mf(1:im,:),istrt, im,lan)

    call update_opdata(id_lprecip_c,rainc*rhoh2o/dtp,istrt, im,lan)
    call update_opdata(id_fprecip_c,snwc*rhoh2o/dtp,istrt, im,lan)
    if (id_cct>0) then
       do i = 1, im
          tmp(i) = prsl(i,ktop(i))*1000.0
       enddo
       call update_opdata(id_cct, tmp(1:im), istrt, im, lan, wgt=real(kcnv))
    endif

    if (id_ccb>0) then
       do i=1,im
          tmp(i) = prsl(i,kbot(i))*1000.0
       enddo
       call update_opdata(id_ccb, tmp(1:im), istrt, im, lan, wgt=real(kcnv))
    endif

    call update_opdata(id_ci, real(kcnv(1:im)), istrt, im, lan) 
    
    do i = 1, im
      rainc(i) = frain * rainc(i) 
      snwc(i) = frain * snwc(i)
      precipc(i) = rainc(i) + snwc(i)
    enddo
    call update_opdata(id_precip_c,precipc*rhoh2o/dtf,istrt, im,lan)

    if ( cnvgwd ) then       !        call convective gravity wave drag
      !  --- ...  calculate maximum convective heating rate            qmax [k/s]
      !           cuhr = temperature change due to deep convection
      do i = 1, im
        qmax(i)   = 0.0
        cumabs(i) = 0.0
      enddo
      do k = 1, levs
        do i = 1, im
          cuhr(i,k) = (gt0(i,k) - dtdt(i,k)) / dtp    ! moorthi
          cumchr(i,k) = 0.0
          gwdcu(i,k)  = 0.0
          gwdcv(i,k)  = 0.0
          diagn1(i,k) = 0.0
          diagn2(i,k) = 0.0
          if ( k>=kbot(i) .and. k<=ktop(i) ) then
            qmax(i)     = max( qmax(i), cuhr(i,k) )
            cumabs(i)   = cuhr(i,k) + cumabs(i)
          endif
        enddo
      enddo
      do i = 1, im
        do k = kbot(i), ktop(i)
          do k1 = kbot(i), k
            cumchr(i,k) = cuhr(i,k1) + cumchr(i,k)
          enddo
          cumchr(i,k) = cumchr(i,k) / cumabs(i)
        enddo
      enddo
      call update_opdata(id_qmax,qmax,istrt, im,lan)
      call update_opdata(id_cuhr,cuhr,istrt, im,lan)

       call gwdc(im, ix, im, levs, lat, ugrs, vgrs, tgrs, qgrs,        &
               rcs, prsl, prsi, del, qmax, cumchr, ktop, kbot, kcnv,   &
               gwdcu, gwdcv,con_g,con_cp,con_rd,con_fvirt, dlength,    &
               lprnt, ipr, fhour,                                      &
               dusfcg,dvsfcg,diagn1,diagn2)

      !write out cloud top stress and wind tendencies

      call update_opdata(id_dugwdc,dusfcg,istrt, im,lan)
      call update_opdata(id_dvgwdc,dvsfcg,istrt, im,lan)
      !update the wind components with  gwdc tendencies
      do k = 1, levs
        do i = 1, im
          tmpu1=gu0(i,k); tmpv1=gv0(i,k)
          gu0(i,k) = gu0(i,k) + gwdcu(i,k)*dtp
          gv0(i,k) = gv0(i,k) + gwdcv(i,k)*dtp
          gt0(i,k) = gt0(i,k) - &
          0.5*(gu0(i,k)**2-tmpu1**2+gv0(i,k)**2-tmpv1**2)/con_cp
        enddo
      enddo
    endif   ! end if_cnvgwd (convective gravity wave drag)

      call update_opdata(id_gt0,gt0,istrt,im,lan)

    if ( .not. sashal ) then
      if ( .not. mstrat ) then
        call shalcvt3(im,ix,levshcm,dtp,del,prsi,prsl,prslk,          &
                      kcnv,gq0,gt0)                             ! for pry
      else
        call shalcv(im,ix,levshcm,dtp,del,prsi,prsl,prslk,kcnv,       &
                    gq0,gt0,levshc,phil,kinver,ctei_r,ctei_rm)
      endif
    else
      call shalcnv(im,ix,levs,jcap,dtp,del,prsl,pgr,phil,             &
                   clw,gq0,gt0,gu0,gv0,rcs,                           &
                   raincs,kbot,ktop,kcnv,slmsk,                        &
                   vvel,ncld,hpbl,hflx,evap,ud_mf,dt_mf)
      do i = 1, im
        raincs(i) = frain * raincs(i)
      enddo
      do i = 1, im
        rainc(i) = rainc(i) + raincs(i)
        precipc(i) = precipc(i) + raincs(i)
      enddo
    endif   ! end if_not_sashal
    do k = 1, levs
      do i = 1, im
        if ( clw(i,k,2) <= -999.0 ) clw(i,k,2) = 0.0
      enddo
    enddo
   
    do k = 1, levs
      do i = 1, im
        gt0_strati(i,k)=gt0(i,k) 
      enddo
     enddo

    call update_opdata(id_gt0_strati,gt0_strati,istrt,im,lan)
    
    
      if ( ntcw > 0 ) then
      if ( num_p3d == 3 ) then    ! call brad ferrier's microphysics
        do k = 1, levs
          do i = 1, im
            qi = clw(i,k,1)
            qw = clw(i,k,2)
            !  - ...  algorithm to combine different hydrometeor species
            gq0(i,k,ntcw) = qi + qw + qr_col(i,k)
            if ( qi <= epsq ) then
              phy_f3d(i,k,1) = 0.0
            else
              phy_f3d(i,k,1) = qi / gq0(i,k,ntcw)
            endif
            if ( qr_col(i,k) <= epsq ) then
              phy_f3d(i,k,2) = 0.0
            else
              phy_f3d(i,k,2) = qr_col(i,k) / (qw+qr_col(i,k))
            endif
          enddo
        enddo
      else    ! if_num_p3d
        do k = 1, levs
          do i = 1, im
            gq0(i,k,ntcw) = clw(i,k,1) + clw(i,k,2)
          enddo
        enddo
      endif   ! end if_num_p3d
    else    ! if_ntcw
      do k = 1, levs
        do i = 1, im
          clw(i,k,1) = clw(i,k,1) + clw(i,k,2)
        enddo
      enddo
    endif   ! end if_ntcw

    call cnvc90(clstp, im,   ix,   precipc, kbot, ktop, levs, prsi,     &
                 acv,   acvb, acvt, cv,    cvb,  cvt)

    if ( ncld == 0 ) then
      call lrgscl(ix,im,levs,dtp,gt0,gq0,prsl,del,prslk,rainl,clw)
    elseif ( ncld == 1 ) then
      if ( num_p3d == 3 ) then    ! call brad ferrier's microphysics
        do i = 1, im
          xncw(i) = ncw(2) * work1(i) + ncw(1) * work2(i)
        enddo
        call gsmdrive(im, ix, levs, dtp, prsl, del, &
                      gt0, gq0(1,1,1), gq0(1,1,ntcw), slmsk, &
                      phy_f3d(1,1,1),  phy_f3d(1,1,2), &
                      phy_f3d(1,1,3), rainl, sr, con_g, &
                      con_hvap, hsub,con_cp, rhc, xncw, flgmin_l, &
                      me, lprnt, ipr)
      elseif ( num_p3d == 4 ) then ! call zhao/carr/sundqvist microphysics
        call gscond(im, ix, levs, dtp, prsl, pgr,                     &
                     gq0(1,1,1), gq0(1,1,ntcw), gt0,                   &
                     phy_f3d(1,1,1), phy_f3d(1,1,2), phy_f2d(1,1),     &
                     phy_f3d(1,1,3), phy_f3d(1,1,4), phy_f2d(1,2),     &
                     rhc,lprnt, ipr)
        call precpd(im, ix, levs, dtp, del, prsl, pgr,                &
                     gq0(1,1,1), gq0(1,1,ntcw), gt0, rainl,snwl,      &
                     rhc, lprnt, ipr)
      endif   ! end if_num_p3d
    endif   ! end if_ncld
     
    
    call update_opdata(id_lprecip_l,rainl*rhoh2o/dtp,istrt, im,lan)
    call update_opdata(id_fprecip_l,snwl*rhoh2o/dtp,istrt, im,lan)

    do i = 1, im
      rainl(i) = frain * rainl(i)
      snwl(i) = frain * snwl(i)
      rain(i) = rainc(i) + rainl(i)
      snw(i) = snwc(i) + snwl(i)
      precipl(i) = rainl(i) + snwl(i)
      precip(i) = precipc(i) + precipl(i)
    enddo

    snlhflx(:)=(snw(:)*con_hfus*kg)/dtf ! Latent heat release due to snow formation (W/m2)

    call update_opdata(id_snlhflx,snlhflx,istrt, im,lan)

    call update_opdata(id_precip_l,precipl*rhoh2o/dtf,istrt, im,lan)
    call update_opdata(id_precip,precip*rhoh2o/dtf,istrt, im,lan)
    call update_opdata(id_fprecip,snw*rhoh2o/dtf,istrt, im,lan)
    call update_opdata(id_lprecip,rain*rhoh2o/dtf,istrt, im,lan)

    ! coupling insertion

    !estimate t850 for rain-snow decision
    do i = 1, im
      t850(i) = gt0(i,1)
    enddo

    do k = 1, levs - 1
      do i = 1, im
        if ( prsl(i,k)>p850 .and. prsl(i,k+1)<=p850 ) then
            t850(i) = gt0(i,k) - (prsl(i,k) - p850)                     &
                   / (prsl(i,k)-prsl(i,k+1)) * (gt0(i,k)-gt0(i,k+1))
        endif
      enddo
    enddo
    !  --- ...  lu: snow-rain detection is performed in land/sice module
    !           factor=weighted mean tep.
    do i = 1, im
      tprcp(i) = rain(i)               ! clu: rain -> tprcp
      tsnwp(i) = snw(i)               ! clu: snow
    enddo

    !cpl insertion
    fprec_o(:) = snw(:)*kg/dtf
    lprec_o(:) = rain(:)*kg/dtf
    
    !total runoff is composed of drainage into water table and
    !runoff at the surface and is accumulated in unit of meters


    totrunoff(:) = drain(:) + runof(:)

    call update_opdata(id_mrro,totrunoff,istrt, im,lan)
  
    !return updated smsoil and stsoil to global arrays
    do k = 1, lsoil
      do i = 1, im
        smc(i,k) = smsoil(i,k)
        stc(i,k) = stsoil(i,k)
        slc(i,k) = slsoil(i,k)
      enddo
    enddo

    ! calc. integral of moistue in pwat
    pwat(:) = 0.0

    do k = 1, levs
      do i = 1, im
        work1(i) = 0.0
      enddo
      if ( ncld > 0 ) then
        do ic = ntcw, ntcw+ncld-1
          do i = 1, im
            work1(i) = work1(i) + gq0(i,k,ic)
          enddo
        enddo
      endif
      do i = 1, im
        !inside this routine, let t as dry temperature only   ! hmhj
        pwat(i)  = pwat(i)  + del(i,k)*(gq0(i,k,1) + work1(i))
      enddo
    enddo
    do i = 1, im
      pwat(i)  = pwat(i) * (1.0e3/con_g)
    enddo

    call update_opdata(id_prw,pwat(1:im),istrt, im,lan)
    if(id_heatc>0) then
      do k = 1, levs
        tmpt1(1:im) = tmpt1(1:im)- cont*del(1:im,k)*gt0(1:im,k)
      enddo
      call update_opdata(id_heatc,tmpt1(1:im)*rdtp,istrt, im,lan)
    endif
 
    if(id_moistc>0) then
      do k = 1, levs
        tmpq1(1:im) = tmpq1(1:im)-conq*del(1:im,k)*gq0(1:im,k,1)
      enddo
      call update_opdata(id_moistc,tmpq1(1:im)*rdtp,istrt, im,lan)
    endif
    
    if(id_dke>0) then
      ke_end(:)=0.0
      do k = 1, levs
        ke_end(1:im) = ke_end(1:im)+con_ke*del(1:im,k)* &
                        (gu0(1:im,k)**2+gv0(1:im,k)*2)
      enddo
      call update_opdata(id_dke,(ke_strt(1:im)-ke_end(1:im))*rdtp,istrt, im,lan)
    endif
    
    call update_opdata(id_ta,gt0(1:im,1:levs),istrt, im,lan)

    call update_opdata(id_hus,gq0(1:im,1:levs,1),istrt, im,lan)

    if (id_ua>0) then
      forall(k=1:levs) tmp3d(1:im,k)=gu0(1:im,k)*rcs(1:im)
      call update_opdata(id_ua,tmp3d(1:im,1:levs),istrt, im,lan)
    endif

    if (id_va>0) then
       forall(k=1:levs) tmp3d(1:im,k)=gv0(1:im,k)*rcs(1:im)
       call update_opdata(id_va,tmp3d(1:im,1:levs),istrt, im,lan)
    endif

    if (id_hur>0) then
       do k=1,levs
          do i=1,im
             tmp3d(i,k)=fpvs(gt0(i,k))
             tmp3d(i,k)=tmp3d(i,k)*eps/(prsl(i,k)*1000.0-tmp3d(i,k))
             tmp3d(i,k)=(gq0(i,k,1)/tmp3d(i,k))*100.0
          enddo
       enddo
       call update_opdata(id_hur,tmp3d,istrt, im,lan)
    endif

    call update_opdata(id_wap,vvel(1:im,1:levs),istrt, im,lan)
    
    deallocate (clw)
    return
  end subroutine gbphys

  subroutine initialize_gbphys(time)
    type(time_type), intent(in) :: time

    if (initialized) return

    id_rdtdt=register_var('rdtdt',time, 'Vert integrated heating rate (radition)','W m-2')
    id_dspdtdt=register_var('dspdtdt',time, 'Vert integrated dissipative heating','W m-2')
    id_shflx=register_var('hfss',time, 'Surface Upward Sensible Heat Flux','W m-2') !cmor 
    id_lhflx=register_var('hfls',time, 'Surface Upward Latent Heat Flux','W m-2') !cmor
    id_sfcwind=register_var('sfcWind', time, 'Near-Surface Wind Speed', 'm s-1')
    id_vdifdtdt=register_var('vdifdtdt',time)
    id_vdifdqdt=register_var('vdifdqdt',time)
    id_heatc=register_var('heatc',time)
    id_moistc=register_var('moistc',time)
    id_dke=register_var('dke',time)
    id_cd=register_var('cd',time)
    id_tsurf=register_var('ts',time,'Surface Temperature','K')
    id_precip_c=register_var('prc',time,'Convective Precipitation','kg m-2 s-1') 
    id_precip=register_var('pr',time,'Precipitation','kg m-2 s-1') !cmor 
    id_lprecip_c=register_var('lprecip_c',time,'Convective Liquid Precip','kg m-2 s-1') !cmor
    id_lprecip=register_var('lprecip',time,'Liquid Precip', 'Kg/m-2 sec-1')
    id_fprecip_c=register_var('fprecip_c',time,'Convective Frozen Precip', 'kg m-2 s-1')
    id_fprecip=register_var('prsn',time, 'Snowfall Flux', 'kg m-2 s-1') !cmor
    id_lprecip_l=register_var('lprecip_l',time,'Large scale Liquid Precip','kgm-2 s-1') !cmor
    id_fprecip_l=register_var('fprecip_l',time,'Large scale frozen Precip','kgm-2 s-1') !cmor
    id_snlhflx=register_var('snlhflx',time, 'Latent Heat Flux from snow formation','W m-2')
    id_wind=register_var('wind',time, 'Wind Speed','m s-1')
    id_zorl_l=register_var('zorl_l',time,'Roughness Length Over Land','cm')
    id_ta=register_var('ta',time, 'Air Temperature','K',levs=levs) !cmor
    id_ua=register_var('ua',time, 'Eastward Wind','m s-1',levs=levs) !cmor
    id_va=register_var('va',time, 'Northward Wind','m s-1',levs=levs) !cmor
    id_hus=register_var('hus',time, 'Specific Humidity','1.0',levs=levs) !cmor
    id_vas=register_var('vas',time, 'Northward Near-Surface Wind Speed','m s-1') !cmor
    id_uas=register_var('uas',time, 'Eastward Near-Surface Wind Speed','m s-1') !cmor
    id_tas=register_var('tas',time, 'Near-Surface Air Temperature','K') !cmor
    id_qas=register_var('huss',time, 'Near-Surface Specific Humidity','1.0') !cmor
    id_prw=register_var('prw',time, 'Precipitable Water','g/kg')
    id_ps=register_var('ps',time, 'Surface Air Pressure','Pa') !cmor
    id_tauu=register_var('tauu',time, 'Surface Zonal Wind Stress','Pascal')
    id_tauv=register_var('tauv',time, 'Surface Meridional Wind Stress','Pascal')
    id_zg=register_var('zg',time, 'Geopotential Height (at layer center)','m',levs=levs)
    id_zgi=register_var('zgi',time, 'Geopotential Height (at layer interface)','m',levs=levs+1)
    id_dugwdc=register_var('dugwdc',time, 'Zonal Convective Gravity Wave Stress','N m-2')
    id_dvgwdc=register_var('dvgwdc',time, 'Meridional Convective Gravity Wave Stress','N m-2')
    id_dugwd=register_var('dugwd',time, 'Zonal Gravity Wave Stress','N m-2')
    id_dvgwd=register_var('dvgwd',time, 'Meridional Gravity Wave Stress','N m-2')
    id_cldwrk=register_var('cldwrk',time, 'Cloud work function (total atmospheric column)','J kg-1')
    id_hpbl=register_var('hpbl',time, 'Height of Planetary Boundary Layer','m')
    id_t1=register_var('t1',time, 'Lowest Model Level Temperature','K')
    id_q1=register_var('q1',time, 'Lowest Model Level Humidity','kg/kg')
    id_u1=register_var('u1',time, 'Lowest Model Level Zonal Wind','m s-1')
    id_v1=register_var('v1',time, 'Lowest Model Level Meridional Wind','m s-1')
    id_chh=register_var('chh',time, 'Exchange coefficient CH','m s-1')
    id_cmm=register_var('cmm',time, 'Exchange coefficient CM','m s-1')
    id_zlvl=register_var('zlvl',time, 'Lowest model level height (land surface)','m')
    id_evap=register_var('evspsbl',time,'Evaporation','kg m-2 s-1')
    id_hur=register_var('hur',time,'Relative Humidity','%',levs=levs)
    id_hurs=register_var('hurs',time,'Near-Surface Relative Humidity','%')
    id_wap=register_var('wap',time,'omega (=dp/dt)','Pa s-1',levs=levs)
    id_cct=register_var('cct',time,'Air Pressure at Convective Cloud Top','Pa')
    id_ccb=register_var('ccb',time,'Air Pressure at Convective Cloud Base','Pa')
    id_cct=register_var('ci',time,'Fraction of Time Convection Occurs in Cell','1.0')
    id_mc=register_var('mc',time,'Convective Mass Flux','kg m-2 s-1',levs=levs)
    id_gt0=register_var('gt0',time,'Stratiform temp','K s-1',levs=levs)
    id_gt0_strati=register_var('gt0_strati',time,'Stratiform temp after','K s-1',levs=levs)
    id_qmax=register_var('qmax',time,'Max Deep Conv heating rate','Ks-1',levs=levs)
    id_cuhr=register_var('cuhr',time,'Conv heating rate','Ks-1',levs=levs)
    id_swh=register_var('swh',time,'Shortwave heating rate','Ks-1',levs=levs)
    id_hlw=register_var('hlw',time,'Longwave heating rate','Ks-1',levs=levs)
    id_fh2=register_var('fh2', time)

    !Land Model Outputs
    id_drain=register_var('drain',time, 'Subsurface runoff','kg m-2 s-1',mask=lndmask)
    id_runoff=register_var('mrros',time, 'Surface runoff','kg m-2 s-1',mask=lndmask)
    id_mrro=register_var('mrro',time, 'Total Runoff', 'kg m-2 s-1', mask=lndmask)
    id_slsoil=register_var('slsoil',time, 'Soil liquid water content','1',levs=lsoil,mask=lndmask)
    id_smsoil=register_var('smsoil',time, 'Soil moisture content','1',levs=lsoil,mask=lndmask)
    id_sheleg=register_var('sheleg',time, 'Snow Depth (Water equivalent)','kg m-2',mask=lndmask)
    id_sncovr=register_var('snc',time, 'Snow Cover','1.0',mask=lndmask)
    id_gflx=register_var('gflx',time, 'Ground Heat Flux','W m-2',mask=lndmask)
    id_canopy=register_var('canopy',time, 'Canopy water content','kg m-2',mask=lndmask)
    id_tskin=register_var('tskin',time, 'Land Surface Skin Temp','K',mask=lndmask)
    id_trans=register_var('tran',time, 'Transpiration', 'kg m-2 s-1',mask=lndmask)
    id_vegtype1=register_var('vegtype',time, 'vegetation type','1',red2reg=.true.)
    id_soiltype1=register_var('soiltype',time, 'Soil type','1',red2reg=.true.)
    id_evbs=register_var('evbs',time, 'Evaporation from bare soil', 'W m-2',mask=lndmask)
    id_evcw=register_var('evcw',time, 'Evaporation from canopy', 'W m-2',mask=lndmask)
    id_sbsno=register_var('sbsno',time, 'Snow Sublimation','W m-2',mask=lndmask)
    id_snohf=register_var('snohf',time, 'Snow phase-change heat flux','W m-2',mask=lndmask)
    id_pevap=register_var('pevap',time, 'Potential evaporation rate','W m-2',mask=lndmask)
    id_soilm=register_var('mrso',time, 'Total column soil moisture', 'kg m-2',mask=lndmask)
    id_snwdph=register_var('snwdph',time, 'Snow Depth', 'mm',mask=lndmask)
    id_mrsos=register_var('mrsos', time, 'Moisture in Upper Portion of Soil Column', 'kg m-2', mask=lndmask)
    id_ofrac=register_var('ofrac',time, 'fraction of ocean on a grid','1')
    id_fwater=register_var('fwater',time, 'fraction of sea water on ocean portion of a grid','1')
  !  id_tso = register_var('tso',time,'Sea Surface Temperature','K',wgt=.true.)
    id_tso = register_var('tso',time,'Sea Surface Temperature','K',wgt=.true.)
    id_tslsi = register_var('tslsi',time,'Surface Temperature Where Land or Sea Ice','K',wgt=.true.)
    
    initialized=.true.
  end subroutine initialize_gbphys
  
end module gbphys_mod
