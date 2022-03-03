!
! !module: gfs_internalstate_mod --- internal state definition of the GFS system.
!
 module gfs_internalstate_mod

 use namelist_mod
 use machine, only: kind_rad, kind_phys, kind_io4, kind_evod
 use layout1
 use gg_def
 use vert_def
 use sig_io
 use date_def, only: idate
 use namelist_def
 use namelist_soilveg
 use mpi_def
 use semi_lag_def
 use coordinate_def                                      ! hmhj
 use tracer_const                                        ! hmhj
 use matrix_sig_def
 use module_ras , only : nrcmax
 use ozne_def
 use sfc_flx_mod

 implicit none

 type gfs_internalstate

      type(nam_gfs_namelist)    :: nam_gfs

      type(sfc_var_data)        :: sfc_fld
      type(flx_var_data)        :: flx_fld

      integer                   :: me, nodes
      integer                   :: lonr_s, latr_s, lnt2_s
      integer                   :: lnt2, grid4_i1(2)
      integer                   :: grib_inp

      real(kind = kind_io4), dimension(:, :), pointer ::            &
        z_im, ps_im, vor_im, div_im, temp_im, q_im, oz_im, scld_im, &
        z_ex, ps_ex, vor_ex, div_ex, temp_ex, q_ex, oz_ex, scld_ex
!
! idate1_im and idate1_ex:  (1) --- bfhour (integer), (2) - (5) --- idate.
!-------------------------------------------------------------------------
!
      integer,               dimension(:, :),    pointer :: idate1_im, idate1_ex

      real(kind = kind_io4), dimension(:, :),    pointer ::                               &
        orography_im,             t_skin_im,                  snow_depth_im,              &
        deep_soil_t_im,           roughness_im,               conv_cloud_cover_im,        &
        conv_cloud_base_im,       conv_cloud_top_im,          albedo_visible_scattered_im,&
        albedo_visible_beam_im,   albedo_nearir_scattered_im, albedo_nearir_beam_im,      &
        sea_level_ice_mask_im,    vegetation_cover_im,        canopy_water_im,            &
        m10_wind_fraction_im,     vegetation_type_im,         soil_type_im,               &
        zeneith_angle_facsf_im,   zeneith_angle_facwf_im,     uustar_im,                  &
        ffmm_im,                  ffhh_im,                    sea_ice_thickness_im,       &
        sea_ice_concentration_im, tprcp_im,                   srflag_im,                  &
        actual_snow_depth_im,     vegetation_cover_min_im,    vegetation_cover_max_im,    &
        slope_type_im,            snow_albedo_max_im,                                     &  
 
! modified by weiyu (dhou, 04/04/2008).
!-------------------
        soil_t_im1, soil_t_im2, soil_t_im3, soil_mois_im1, soil_mois_im2, soil_mois_im3,  &
        liquid_soil_moisture_im1, liquid_soil_moisture_im2, liquid_soil_moisture_im3,     &

        orography_ex,             t_skin_ex,                  snow_depth_ex,              &
        deep_soil_t_ex,           roughness_ex,               conv_cloud_cover_ex,        &
        conv_cloud_base_ex,       conv_cloud_top_ex,          albedo_visible_scattered_ex,&
        albedo_visible_beam_ex,   albedo_nearir_scattered_ex, albedo_nearir_beam_ex,      &
        sea_level_ice_mask_ex,    vegetation_cover_ex,        canopy_water_ex,            &
        m10_wind_fraction_ex,     vegetation_type_ex,         soil_type_ex,               &
        zeneith_angle_facsf_ex,   zeneith_angle_facwf_ex,     uustar_ex,                  &
        ffmm_ex,                  ffhh_ex,                    sea_ice_thickness_ex,       &
        sea_ice_concentration_ex, tprcp_ex,                   srflag_ex,                  &
        actual_snow_depth_ex,     vegetation_cover_min_ex,    vegetation_cover_max_ex,    &
        slope_type_ex,            snow_albedo_max_ex

      real(kind = kind_io4), dimension(:, :, :), pointer ::                               &
        soil_mois_ex, soil_t_ex, liquid_soil_moisture_ex

      integer ntrac,nxpt,nypt,jintmx,jcap,levs,lonf,lonr,latg,latr
      integer ntoz, ntcw, ncld, lsoil, nmtvr, num_p3d, num_p2d,levr

      character(16)                     ::  cfhour1

      integer                           ::  nblck,kdt
      real                              ::  deltim

      integer              ,allocatable ::      lonsperlat (:)
      integer              ,allocatable ::      lonsperlar (:)
      integer              ,allocatable ::      ls_node    (:)
      integer              ,allocatable ::      ls_nodes   (:, :)
      integer              ,allocatable ::  max_ls_nodes   (:)

      integer              ,allocatable ::  lats_nodes_a   (:)
      integer              ,allocatable ::  global_lats_a  (:)
      integer              ,allocatable ::  lats_nodes_ext (:)
      integer              ,allocatable ::  global_lats_ext(:)

      integer              ,allocatable ::  lats_nodes_r   (:)
      integer              ,allocatable ::  global_lats_r  (:)

      real(kind=kind_evod) ,allocatable ::        epse  (:)
      real(kind=kind_evod) ,allocatable ::        epso  (:)
      real(kind=kind_evod) ,allocatable ::        epsedn(:)
      real(kind=kind_evod) ,allocatable ::        epsodn(:)

      real(kind=kind_evod) ,allocatable ::       snnp1ev(:)
      real(kind=kind_evod) ,allocatable ::       snnp1od(:)

      integer              ,allocatable ::        ndexev(:)
      integer              ,allocatable ::        ndexod(:)

      real(kind=kind_evod) ,allocatable ::       plnev_a(:,:)
      real(kind=kind_evod) ,allocatable ::       plnod_a(:,:)
      real(kind=kind_evod) ,allocatable ::       pddev_a(:,:)
      real(kind=kind_evod) ,allocatable ::       pddod_a(:,:)
      real(kind=kind_evod) ,allocatable ::       plnew_a(:,:)
      real(kind=kind_evod) ,allocatable ::       plnow_a(:,:)

      real(kind=kind_evod) ,allocatable ::       plnev_r(:,:)
      real(kind=kind_evod) ,allocatable ::       plnod_r(:,:)
      real(kind=kind_evod) ,allocatable ::       pddev_r(:,:)
      real(kind=kind_evod) ,allocatable ::       pddod_r(:,:)
      real(kind=kind_evod) ,allocatable ::       plnew_r(:,:)
      real(kind=kind_evod) ,allocatable ::       plnow_r(:,:)

      real(kind=kind_evod) ,allocatable ::       trie_ls(:,:,:)
      real(kind=kind_evod) ,allocatable ::       trio_ls(:,:,:)

      real(kind=kind_evod) ,allocatable ::      syn_ls_a(:,:,:)
      real(kind=kind_evod) ,allocatable ::      dyn_ls_a(:,:,:)

      real(kind=kind_evod) ,allocatable ::    syn_gr_a_1(:,:)
      real(kind=kind_evod) ,allocatable ::    syn_gr_a_2(:,:)
      real(kind=kind_evod) ,allocatable ::    dyn_gr_a_1(:,:)
      real(kind=kind_evod) ,allocatable ::    dyn_gr_a_2(:,:)
      real(kind=kind_evod) ,allocatable ::    anl_gr_a_1(:,:)
      real(kind=kind_evod) ,allocatable ::    anl_gr_a_2(:,:)

      real(kind=kind_rad) ,allocatable :: xlon(:,:),xlat(:,:)
      real(kind=kind_rad) ,allocatable :: xlonf(:,:)
      real(kind=kind_rad) ,allocatable :: coszdg(:,:)
      real(kind=kind_rad) ,allocatable :: sfalb(:,:)
      real(kind=kind_rad) ,allocatable :: hprime(:,:,:)
      real(kind=kind_rad) ,allocatable :: swh(:,:,:,:),hlw(:,:,:,:)
      real(kind=kind_rad) ,allocatable :: fluxr(:,:,:)
!!

      real(kind=kind_rad) ,allocatable :: phy_f3d(:,:,:,:,:)
      real(kind=kind_rad) ,allocatable :: phy_f2d(:,:,:)

      integer lev,levmax
      real phour
      integer :: kfhour
      real, allocatable  :: poz(:),ozplin(:,:,:,:)
!     for ozon interpolation:
      integer,allocatable:: jindx1(:),jindx2(:)

      real (kind=kind_phys) pdryini
      real,allocatable:: ddy(:)
      real(kind=kind_evod) slag,sdec,cdec

      integer              init,jcount,jpt,node
      integer              ibmsign
      integer              lon_dim,ilat

      real(kind=kind_evod) colat1
!!
      real(kind=kind_evod) rone
      real(kind=kind_evod) rlons_lat
      real(kind=kind_evod) scale_ibm

      integer   p_gz,p_zem,p_dim,p_tem,p_rm,p_qm
      integer   p_ze,p_di,p_te,p_rq,p_q,p_dlam,p_dphi,p_uln,p_vln
      integer   p_w,p_x,p_y,p_rt,p_zq
      integer                lots,lotd,lota

      integer              ibrad,ifges,ihour,ini,j,jdt,ksout,maxstp
      integer              mdt,idt,timetot,timer,time0
      integer              mods,n1,n2,n3,n4,ndgf,ndgi,nfiles,nflps
      integer              n1hyb, n2hyb
      integer              nges,ngpken,niter,nnmod,nradf,nradr
      integer              nsfcf,nsfci,nsfcs,nsigi,nsigs,nstep
      integer              nznlf,nznli,nznls,id,iret,nsout

      integer              ierr,iprint,k,l,locl,n
      integer              lan,lat

      real(kind=kind_evod) chour
      real(kind=kind_evod) zhour
      logical lsout

      real(kind=kind_evod),allocatable :: tee1(:)

      integer ikey,nrank_all,kcolor

      real(kind=kind_evod) cons0p5,cons1200,cons3600    !constant
      real(kind=kind_evod) cons0                        !constant

      logical lslag

 end type gfs_internalstate

 end module gfs_internalstate_mod
