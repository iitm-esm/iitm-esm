module land_model_mod
  use netcdf
  use resol_def, only : nx=>lonr, latr, km=>lsoil
  use layout1, only : ipt_lats_node_r, me, ny=>lats_node_r, ioproc=>nodes_comp
  use nc_io_mod, only : nc_open_read, nc_get_info, nc_io_read, nc_close
  use error_mod, only: handle_error, FATAL, WARNING
  use interpred_mod, only : interp2reduced_discrete, interp2reduced
  use mpi_def, only : icolor
  use machine ,   only : kind_phys
  use funcphys,   only : fpvs
  use physcons,   only : con_g, con_hvap, con_cp, con_jcal,         &
                         con_eps, con_epsm1, con_fvirt, con_rd
  use ocean_mod, only: ocn
  use time_manager_mod, only: time_type, get_date

  implicit none
  private
  logical :: land_model_initialised=.false., regular=.false.
  integer, allocatable :: ilat(:)
  integer, parameter :: nsoil=4 ! no: of soil levels
  
  real, public :: zsoil_noah(nsoil) = (/ -0.1, -0.4, -1.0, -2.0 /)
  type land_type
    logical, allocatable :: mask(:,:) ! Land Mask, fixed
    real, allocatable :: frac(:,:) ! Fractional Area of Land (From grid_spec), fixed
    real, allocatable :: ofrac(:,:) ! Fractional Area of Ocean, (1.0-frac)
    real, allocatable :: cellarea(:,:) ! Area of Cells in m^2 (From grid_spec), fixed
    integer, allocatable :: soiltype(:,:) ! Soil type, Discrete values, fixed
    integer, allocatable :: vegtype(:,:) ! Vegetation Type, Discrete values, fixed
    integer, allocatable :: slopetype(:,:) ! Slope Type, Discrete values, fixed
    real, allocatable :: vegfrac(:,:) ! Vegetation Fraction, climatology
    real, allocatable :: rvegtype(:,:) ! Vegetation Fraction, climatology
    real, allocatable :: tg3(:,:)    ! Deep Soil Temperature, fixed
    real, allocatable :: sheleg(:,:) ! Snow Depth (water equiv) over land, restart
    real, allocatable :: snwdph(:,:) ! Snow Depth (water equiv) over land, restart
    real, allocatable :: tskin(:,:)  ! ground surface skin temperature ( k ), restart
    real, allocatable :: tskinr(:,:) ! ground surface skin temperature ( k ), for radiation calc
    real, allocatable :: smc(:,:,:)  ! total soil moisture content (fractional), restart
    real, allocatable :: stc(:,:,:)  ! soil temp (k), restart
    real, allocatable :: slc(:,:,:)  ! liquid soil moisture, restart
    real, allocatable :: canopy(:,:) ! canopy moisture content (m), restart
    real, allocatable :: trans(:,:)  ! total plant transpiration (m/s), restart
    real, allocatable :: sncovr(:,:) ! Snow cover fraction, restart
    real, allocatable :: tprcp(:,:) ! restart
    real, allocatable :: srflag(:,:) ! restart
    real, allocatable :: alvsf(:,:)  ! Climatology
    real, allocatable :: alvwf(:,:)  ! Climatology
    real, allocatable :: alnsf(:,:)  ! Climatology
    real, allocatable :: alnwf(:,:)  ! Climatology
    real, allocatable :: facsf(:,:)  ! Fixed
    real, allocatable :: facwf(:,:)  ! Fixed
    real, allocatable :: zorl(:,:)  ! Surface Roughness, Climatology
    real, allocatable :: nsw(:,:)  ! Surface Roughness, Climatology
    real, allocatable :: nlw(:,:)  ! Surface Roughness, Climatology
  end type

  public :: land_type, init_land_model, surface_land, write_surface_restart, read_surface_restart

  type(land_type), public :: lnd
  integer, allocatable :: op_global_lats_r(:), op_lonsperlar(:)

  real, allocatable, public :: lndmask(:,:)
  interface write_restart_var
    module procedure write_restart_var2d
    module procedure write_restart_var3d
  end interface write_restart_var
   
  contains

  subroutine init_land_model(global_lats_r, lonsperlar)
    integer, intent(in) :: global_lats_r(latr), lonsperlar(latr)
    integer :: unit, varid, nx1, ny1, i
    logical :: n2s
    real, allocatable :: tmp(:,:), tmp1(:,:)
    integer, allocatable :: kmsk0(:,:)
    integer :: values(13)=(/1,2,3,4,5,6,7,8,9,10,11,12,13/)
    integer :: nlon, j, lat

    if(land_model_initialised) return

    allocate(op_global_lats_r(latr), op_lonsperlar(latr))
    op_global_lats_r(:)=global_lats_r(:)
    op_lonsperlar(:)=lonsperlar(:)

    allocate(lndmask(nx,ny))
    allocate(lnd%mask(nx,ny))
    allocate(lnd%frac(nx,ny)) 
    allocate(lnd%ofrac(nx,ny)) 
    allocate(lnd%cellarea(nx,ny)) 
    allocate(lnd%soiltype(nx,ny))
    allocate(lnd%vegtype(nx,ny)) 
    allocate(lnd%slopetype(nx,ny)) 
    allocate(lnd%vegfrac(nx,ny)) 
    allocate(lnd%rvegtype(nx,ny)) 
    allocate(lnd%tg3(nx,ny))    
    allocate(lnd%sheleg(nx,ny)) 
    allocate(lnd%snwdph(nx,ny)) 
    allocate(lnd%tskin(nx,ny))  
    allocate(lnd%tskinr(nx,ny))  
    allocate(lnd%smc(nx,ny,km))
    allocate(lnd%stc(nx,ny,km)) 
    allocate(lnd%slc(nx,ny,km)) 
    allocate(lnd%canopy(nx,ny)) 
    allocate(lnd%trans(nx,ny))  
    allocate(lnd%sncovr(nx,ny))
    allocate(lnd%tprcp(nx,ny))
    allocate(lnd%srflag(nx,ny))
    allocate(lnd%alvsf(nx,ny))
    allocate(lnd%alvwf(nx,ny))
    allocate(lnd%alnsf(nx,ny))
    allocate(lnd%alnwf(nx,ny))
    allocate(lnd%facsf(nx,ny))
    allocate(lnd%facwf(nx,ny))
    allocate(lnd%zorl(nx,ny))
    allocate(lnd%nsw(nx,ny))
    allocate(lnd%nlw(nx,ny))

    lnd%vegfrac=0.0 
    lnd%rvegtype=0.0 
    lnd%tg3=0.0    
    lnd%sheleg=0.0 
    lnd%snwdph=0.0 
    lnd%tskin=0.0  
    lnd%tskinr=0.0  
    lnd%smc=0.0
    lnd%stc=0.0
    lnd%slc=0.0
    lnd%canopy=0.0 
    lnd%trans=0.0  
    lnd%sncovr=0.0  
    lnd%tprcp=0.0  
    lnd%srflag=0.0  
    lnd%alvsf=0.0
    lnd%alvwf=0.0
    lnd%alnsf=0.0
    lnd%alnwf=0.0
    lnd%facsf=0.0
    lnd%facwf=0.0
    lnd%zorl=0.0  
    lnd%nsw=0.0  
    lnd%nlw=0.0  

    if(icolor==2) then
      land_model_initialised=.true.
      return
    endif

    allocate(ilat(ny))
    do i=0,ny-1
      ilat(i+1)=global_lats_r(ipt_lats_node_r+i)
    end do
    
    allocate(tmp(nx,ny))
    allocate(tmp1(nx,ny))
    allocate(kmsk0(nx,ny))
    
    call nc_open_read(unit,'INPUT/grid_spec.nc')
    call nc_get_info(unit,'AREA_LND',varid=varid, nx=nx1, ny=ny1, n2s=n2s)
    if(nx1/=nx) call handle_error(FATAL, 'nx for AREA_LND .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for AREA_LND .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, lnd%frac(:,:), flip_y=.not.n2s, nlat=latr)
 
    call nc_get_info(unit,'AREA_LND_CELL',varid=varid, nx=nx1, ny=ny1, n2s=n2s)
    if(nx1/=nx) call handle_error(FATAL, 'nx for AREA_LND_CELL .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for AREA_LND_CELL .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, lnd%cellarea(:,:), flip_y=.not.n2s, nlat=latr)
    call nc_close(unit)

    lnd%frac(:,:)=lnd%frac(:,:)/lnd%cellarea(:,:)
   
    kmsk0(:,:)=0

    tmp(:,:)=lnd%frac(:,:)
    lnd%frac(:,:)=0.0    
    call interp2reduced(tmp,lnd%frac) 

    lnd%ofrac(:,:)=0.0
    do j=1,ny
      lat=op_global_lats_r(ipt_lats_node_r-1+j)
      nlon=op_lonsperlar(lat)    
      lnd%ofrac(1:nlon,j)=1.0-lnd%frac(1:nlon,j)
    enddo
    where(lnd%ofrac<0.0) lnd%ofrac=0.0
    
    tmp(:,:)=lnd%cellarea(:,:)
    lnd%cellarea(:,:)=0.0
    call interp2reduced(tmp,lnd%cellarea) 

    lnd%mask(:,:)=.false.
    where(lnd%frac(:,:)>0) lnd%mask(:,:)=.true.
    lndmask(:,:)=lnd%frac(:,:)

    call nc_open_read(unit,'INPUT/soiltype.nc')
    call nc_get_info(unit,'soiltype',varid=varid,nx=nx1,ny=ny1,n2s=n2s)
    if(nx1/=nx) call handle_error(FATAL, 'nx for soiltype .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for soiltype .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.not.n2s, nlat=latr)
    call nc_close(unit)
    call interp2reduced_discrete(int(tmp),lnd%soiltype,values(1:9))
    tmp=0.0; tmp1=0.0
    where(lnd%mask)tmp=1.0
    where(lnd%soiltype>0.0)tmp1=1.0
    if(.not.all(tmp-tmp1==0.0)) &
      call handle_error(FATAL, 'Land_model:Problem with interp of soiltype')

!    call nc_open_read(unit,'INPUT/vegtype.nc')
!    call nc_get_info(unit,'vegtype',varid=varid,nx=nx1,ny=ny1,n2s=n2s)
!    if(nx1/=nx) call handle_error(FATAL, 'nx for vegtype .ne. lonr') 
!    if(ny1/=latr) call handle_error(FATAL, 'ny for vegtype .ne. latr') 
!    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.not.n2s, nlat=latr)
!    call nc_close(unit)
!    call interp2reduced_discrete(int(tmp),lnd%vegtype,values(1:13))
!    tmp=0.0; tmp1=0.0
!    where(lnd%mask)tmp=1.0
!    where(lnd%vegtype>0.0)tmp1=1.0
!    if(.not.all(tmp-tmp1==0.0)) &
!      call handle_error(FATAL, 'Land_model:Problem with interp of vegtype')

    call nc_open_read(unit,'INPUT/slopetype.nc')
    call nc_get_info(unit,'slopetype',varid=varid,nx=nx1,ny=ny1,n2s=n2s)
    if(nx1/=nx) call handle_error(FATAL, 'nx for slopetype .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for slopetype .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.not.n2s, nlat=latr)
    call nc_close(unit)
    call interp2reduced_discrete(int(tmp),lnd%slopetype,values(1:13))
    tmp=0.0; tmp1=0.0
    where(lnd%mask)tmp=1.0
    where(lnd%slopetype>0.0)tmp1=1.0
    if(.not.all(tmp-tmp1==0.0)) &
      call handle_error(FATAL, 'Land_model:Problem with interp of slopetype')

    call nc_open_read(unit,'INPUT/tg3.nc')
    call nc_get_info(unit,'tg3',varid=varid,nx=nx1,ny=ny1,n2s=n2s)
    if(nx1/=nx) call handle_error(FATAL, 'nx for tg3 .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for tg3 .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.not.n2s, nlat=latr)
    call nc_close(unit)
    call interp2reduced(tmp,lnd%tg3)

    call nc_open_read(unit,'INPUT/albedo.nc')
    call nc_get_info(unit,'facsf',varid=varid,nx=nx1,ny=ny1,n2s=n2s)
    if(nx1/=nx) call handle_error(FATAL, 'nx for facsf .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for facsf .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.not.n2s, nlat=latr)
    call nc_close(unit)
    call interp2reduced(tmp,lnd%facsf)
    lnd%facwf(:,:)=1.0-lnd%facsf(:,:)

    deallocate(tmp)
    deallocate(tmp1)
    deallocate(kmsk0)

    land_model_initialised=.true.
  end subroutine init_land_model

  subroutine read_surface_restart
    real, allocatable :: tmp(:,:), tmp1(:,:,:)
    integer :: unit, i, varid, nx1, ny1
    logical :: n2s
   
    if(icolor==2) return 
    
    allocate(tmp(nx,ny),tmp1(nx,ny,km)) 
    call nc_open_read(unit,'INPUT/surface_restart.nc')

    ! Snow Depth (water equiv) over land
    call nc_get_info(unit,'sheleg',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for sheleg .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for sheleg .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    lnd%sheleg(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,lnd%sheleg)

    ! Snow Depth (water equiv) over land
    call nc_get_info(unit,'snwdph',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for snwdph .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for snwdph .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    lnd%snwdph(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,lnd%snwdph)

    ! ground surface skin temperature ( k )
    call nc_get_info(unit,'tskin',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for tskin .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for tskin .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    lnd%tskin(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,lnd%tskin)
    
    ! ground surface skin temperature ( k ) for radiation calc
!    call nc_get_info(unit,'tskinr',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
!    if(nx1/=nx) call handle_error(FATAL, 'nx for tskinr .ne. lonr') 
!    if(ny1/=latr) call handle_error(FATAL, 'ny for tskinr .ne. latr') 
!    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
!    lnd%tskinr(:,:)=tmp(:,:)
!    if(regular) call interp2reduced(tmp,lnd%tskinr)
    
    ! total soil moisture content (fractional)
    call nc_get_info(unit,'smc',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for smc .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for smc .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, km, tmp1(:,:,:), flip_y=.false., nlat=latr)
    lnd%smc(:,:,:)=tmp1(:,:,:)
    if(regular) then
      do i=1,km
        call interp2reduced(tmp1(:,:,i),lnd%smc(:,:,i))
      enddo
    endif

    ! soil temp (k)
    call nc_get_info(unit,'stc',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for stc .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for stc .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, km, tmp1(:,:,:), flip_y=.false., nlat=latr)
    lnd%stc(:,:,:)=tmp1(:,:,:)
    if(regular) then
      do i=1,km
        call interp2reduced(tmp1(:,:,i),lnd%stc(:,:,i))
      enddo
    endif

    ! liquid soil moisture
    call nc_get_info(unit,'slc',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for slc .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for slc .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, km, tmp1(:,:,:), flip_y=.false., nlat=latr)
    lnd%slc(:,:,:)=tmp1(:,:,:)
    if(regular) then
      do i=1,km
        call interp2reduced(tmp1(:,:,i),lnd%slc(:,:,i))
      enddo
    endif

    ! canopy moisture content (m)
    call nc_get_info(unit,'canopy',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for canopy .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for canopy .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    lnd%canopy(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,lnd%canopy)

    ! total plant transpiration (m/s)
    call nc_get_info(unit,'trans',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for trans .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for trans .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    lnd%trans(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,lnd%trans)

    call nc_get_info(unit,'sncovr',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for sncovr .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for sncovr .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    lnd%sncovr(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,lnd%sncovr)

    call nc_get_info(unit,'tprcp',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for tprcp .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for tprcp .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    lnd%tprcp(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,lnd%tprcp)

    call nc_get_info(unit,'srflag',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for srflag .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for srflag .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    lnd%srflag(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,lnd%srflag)

    call nc_get_info(unit,'zorl_o',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for zorl_o .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for zorl_o .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    ocn%zorl(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,ocn%zorl)
   
    call nc_get_info(unit,'hice',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for hice .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for hice .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    ocn%hice(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,ocn%hice)

    call nc_get_info(unit,'hsnow',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for hsnow .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for hsnow .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    ocn%hsnow(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,ocn%hsnow)

    call nc_get_info(unit,'fwater',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for fwater .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for fwater .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    ocn%fwater(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,ocn%fwater)

    call nc_get_info(unit,'fice',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for fice .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for fice .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    ocn%fice(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,ocn%fice)

    call nc_get_info(unit,'tice_r',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for tice_r .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for tice_r .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    ocn%tice_r(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,ocn%tice_r)

    call nc_get_info(unit,'tice',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for tice .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for tice .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    ocn%tice(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,ocn%tice)

    call nc_get_info(unit,'twater_r',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for twater_r .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for twater_r .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    ocn%twater_r(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,ocn%twater_r)

    call nc_get_info(unit,'twater',varid=varid,nx=nx1,ny=ny1,n2s=n2s) 
    if(nx1/=nx) call handle_error(FATAL, 'nx for twater .ne. lonr') 
    if(ny1/=latr) call handle_error(FATAL, 'ny for twater .ne. latr') 
    call nc_io_read(unit, varid, nx, ilat(:), 1, tmp(:,:), flip_y=.false., nlat=latr)
    ocn%twater(:,:)=tmp(:,:)
    if(regular) call interp2reduced(tmp,ocn%twater)

    call nc_close(unit)
  end subroutine read_surface_restart

  subroutine write_surface_restart(time)
    implicit none
    type(time_type), intent(in), optional :: time
    integer :: file_id, lat_id, lon_id, lev_id
    integer :: sheleg_id, tskin_id, smc_id, stc_id, slc_id, canopy_id, &
               trans_id, sncovr_id, snwdph_id, zorl_o_id, hice_id, hsnow_id, &
               fwater_id, fice_id, tice_r_id, tice_id, twater_r_id, twater_id, &
               tskinr_id, tprcp_id, srflag_id
    integer :: stat, yy, mm, dd, hh, mns, secs
    character(len=50) :: fname
    character(len=16) :: datestamp

    if(present(time)) then
      call get_date(time,yy,mm,dd,hh,mns,secs)
      write(datestamp,'(I4.4,I2.2,I2.2,".",I2.2,I2.2,I2.2,".")') &
                    yy, mm, dd, hh, mns, secs
      fname='RESTART/'//datestamp//'surface_restart.nc'
    else
      fname='RESTART/surface_restart.nc'
    endif

    if(icolor==2) then 
      !Create netcdf file
      stat = nf90_create(trim(fname), nf90_clobber, file_id)
      call handle_err(stat)

      !Define Dimensions
      stat = nf90_def_dim(file_id, "lat", latr, lat_id)
      call handle_err(stat)
      stat = nf90_def_dim(file_id, "lon", nx, lon_id)
      call handle_err(stat)
      stat = nf90_def_dim(file_id, "lev", km, lev_id)
      call handle_err(stat)
      
    ! Snow Depth (water equiv) over land
      stat = nf90_def_var(file_id, "sheleg", nf90_double, (/lon_id,lat_id/),sheleg_id)
      call handle_err(stat)

    ! Snow Depth (water equiv) over land
      stat = nf90_def_var(file_id, "snwdph", nf90_double, (/lon_id,lat_id/),snwdph_id)
      call handle_err(stat)

    ! ground surface skin temperature ( k )
      stat = nf90_def_var(file_id, "tskin", nf90_double, (/lon_id,lat_id/),tskin_id)
      call handle_err(stat)

    ! ground surface skin temperature ( k )
!      stat = nf90_def_var(file_id, "tskinr", nf90_double, (/lon_id,lat_id/),tskinr_id)
!      call handle_err(stat)
    
    ! total soil moisture content (fractional)
      stat = nf90_def_var(file_id, "smc", nf90_double, (/lon_id,lat_id,lev_id/),smc_id)
      call handle_err(stat)

    ! soil temp (k)
      stat = nf90_def_var(file_id, "stc", nf90_double, (/lon_id,lat_id,lev_id/),stc_id)
      call handle_err(stat)

    ! liquid soil moisture
      stat = nf90_def_var(file_id, "slc", nf90_double, (/lon_id,lat_id,lev_id/),slc_id)
      call handle_err(stat)

    ! canopy moisture content (m)
      stat = nf90_def_var(file_id, "canopy", nf90_double, (/lon_id,lat_id/),canopy_id)
      call handle_err(stat)

    ! total plant transpiration (m/s)
      stat = nf90_def_var(file_id, "trans", nf90_double, (/lon_id,lat_id/),trans_id)
      call handle_err(stat)
    
    ! Snow Cover
      stat = nf90_def_var(file_id, "sncovr", nf90_double, (/lon_id,lat_id/),sncovr_id)
      call handle_err(stat)

    ! tprcp
      stat = nf90_def_var(file_id, "tprcp", nf90_double, (/lon_id,lat_id/),tprcp_id)
      call handle_err(stat)
      
    ! srflag
      stat = nf90_def_var(file_id, "srflag", nf90_double, (/lon_id,lat_id/),srflag_id)
      call handle_err(stat)

    !---> OCEAN Data
    ! Roughness Length
      stat = nf90_def_var(file_id, "zorl_o", nf90_double, (/lon_id,lat_id/),zorl_o_id)
      call handle_err(stat)

    ! Roughness Length
      stat = nf90_def_var(file_id, "hice", nf90_double, (/lon_id,lat_id/),hice_id)
      call handle_err(stat)

    ! Roughness Length
      stat = nf90_def_var(file_id, "hsnow", nf90_double, (/lon_id,lat_id/),hsnow_id)
      call handle_err(stat)

    ! Roughness Length
      stat = nf90_def_var(file_id, "fwater", nf90_double, (/lon_id,lat_id/),fwater_id)
      call handle_err(stat)

    ! Roughness Length
      stat = nf90_def_var(file_id, "fice", nf90_double, (/lon_id,lat_id/),fice_id)
      call handle_err(stat)

    ! Roughness Length
      stat = nf90_def_var(file_id, "tice_r", nf90_double, (/lon_id,lat_id/),tice_r_id)
      call handle_err(stat)

    ! Roughness Length
      stat = nf90_def_var(file_id, "tice", nf90_double, (/lon_id,lat_id/),tice_id)
      call handle_err(stat)

    ! Roughness Length
      stat = nf90_def_var(file_id, "twater_r", nf90_double, (/lon_id,lat_id/),twater_r_id)
      call handle_err(stat)

    ! Roughness Length
      stat = nf90_def_var(file_id, "twater", nf90_double, (/lon_id,lat_id/),twater_id)
      call handle_err(stat)
    
    !-------------------------------------------------------------------------------------

      stat = nf90_enddef(file_id)
      call handle_err(stat)
    endif

    call write_restart_var(file_id, sheleg_id, lnd%sheleg)
    call write_restart_var(file_id, snwdph_id, lnd%snwdph)
    call write_restart_var(file_id, tskin_id, lnd%tskin)
!    call write_restart_var(file_id, tskinr_id, lnd%tskinr)
    call write_restart_var(file_id, smc_id, lnd%smc)
    call write_restart_var(file_id, stc_id, lnd%stc)
    call write_restart_var(file_id, slc_id, lnd%slc)
    call write_restart_var(file_id, canopy_id, lnd%canopy)
    call write_restart_var(file_id, trans_id, lnd%trans)
    call write_restart_var(file_id, sncovr_id, lnd%sncovr)
    call write_restart_var(file_id, tprcp_id, lnd%tprcp)
    call write_restart_var(file_id, srflag_id, lnd%srflag)
    call write_restart_var(file_id, zorl_o_id, ocn%zorl)
    call write_restart_var(file_id, hice_id, ocn%hice)
    call write_restart_var(file_id, hsnow_id, ocn%hsnow)
    call write_restart_var(file_id, fwater_id, ocn%fwater)
    call write_restart_var(file_id, fice_id, ocn%fice)
    call write_restart_var(file_id, tice_r_id, ocn%tice_r)
    call write_restart_var(file_id, tice_id, ocn%tice)
    call write_restart_var(file_id, twater_r_id, ocn%twater_r)
    call write_restart_var(file_id, twater_id, ocn%twater)

    if (icolor==2) then
      stat = nf90_close(file_id)
      call handle_err(stat)
    endif
  end subroutine write_surface_restart
      
  subroutine write_restart_var2d(file_id, var_id, vardata)
    integer, intent(in) :: file_id, var_id
    real, intent(in) :: vardata(nx,ny)
    real :: tmp2(nx,latr)
    integer :: stat

    call unsplit2d_r(ioproc,tmp2(:,:),vardata(:,:),op_global_lats_r)
    if(icolor==2) then
      stat = nf90_put_var(file_id,var_id,tmp2)
      call handle_err(stat)
    endif
  end subroutine write_restart_var2d

  subroutine write_restart_var3d(file_id, var_id, vardata)
    integer, intent(in) :: file_id, var_id
    real, intent(in) :: vardata(:,:,:)
    real :: tmp2(nx,latr,size(vardata,3))
    integer :: i, stat

    do i=1,size(vardata,3)
      call unsplit2d_r(ioproc,tmp2(:,:,i),vardata(:,:,i),op_global_lats_r)
    enddo

    if(icolor==2) then
      stat = nf90_put_var(file_id,var_id,tmp2)
      call handle_err(stat)
    endif
  end subroutine write_restart_var3d

  subroutine end_land_model(lnd)
    type(land_type) :: lnd
    
    deallocate(lndmask)
    deallocate(lnd%mask)
    deallocate(lnd%frac) 
    deallocate(lnd%ofrac) 
    deallocate(lnd%cellarea) 
    deallocate(lnd%soiltype)
    deallocate(lnd%vegtype) 
    deallocate(lnd%slopetype) 
    deallocate(lnd%vegfrac) 
    deallocate(lnd%rvegtype) 
    deallocate(lnd%tg3)    
    deallocate(lnd%sheleg) 
    deallocate(lnd%snwdph) 
    deallocate(lnd%tskin)  
    deallocate(lnd%tskinr)  
    deallocate(lnd%smc)
    deallocate(lnd%stc) 
    deallocate(lnd%slc) 
    deallocate(lnd%canopy) 
    deallocate(lnd%trans)  
    deallocate(lnd%sncovr)  
    deallocate(lnd%tprcp)  
    deallocate(lnd%srflag)  
    deallocate(lnd%alvsf)
    deallocate(lnd%alvwf)
    deallocate(lnd%alnsf)
    deallocate(lnd%alnwf)
    deallocate(lnd%facsf)
    deallocate(lnd%facwf)
    deallocate(lnd%zorl)
    deallocate(lnd%nsw)
    deallocate(lnd%nlw)
    deallocate(lnd%tprcp)
    deallocate(lnd%srflag)
  end subroutine end_land_model

  subroutine handle_err(stat)
    integer, intent ( in) :: stat
    if(stat /= nf90_noerr) then
      print *, trim(nf90_strerror(stat))
      call handle_error(FATAL, trim(nf90_strerror(stat)))
    end if
  end subroutine handle_err
  ! ===================================================================== !
  !  description:                                                         !
  !                                                                       !
  !  usage:                                                               !
  !                                                                       !
  !      call surface_land                                                     !
  !  ---  inputs:                                                         !
  !          ( im, km, ps, wind, t1, q1, soiltyp, vegtype, sigmaf,      !
  !            sfcemis, dlwflx, dswsfc, snet, delt, tg3, cm, ch,          !
  !            prsl1, prslki, slimsk, slopetyp,               !
  !            flag_guess,                     !
  !  ---  in/outs:                                                        !
  !            sheleg, snwdph, tskin, tprcp, tsnwp, smc, stc, slc,!
  !            canopy, trans, tsurf,                                      !
  !  ---  outputs:                                                        !
  !            sncovr1, qsurf, gflux, drain, evap, hflx, ep, runoff,      !
  !            cmm, chh, zf, evbs, evcw, sbsno, snowc, stm, snohf )       !
  !                                                                       !
  !                                                                       !
  !  subprogram called:  sflx                                             !
  !                                                                       !
  !  program history log:                                                 !
  !         xxxx  --             created                                  !
  !         200x  -- sarah lu    modified                                 !
  !    oct  2006  -- h. wei      modified                                 !
  !    apr  2009  -- y.-t. hou   modified to include surface emissivity   !
  !                     effect on lw radiation. replaced the comfussing   !
  !                     slrad (net sw + dlw) with sfc net sw snet=dsw-usw !
  !                                                                       !
  !  ====================  defination of variables  ====================  !
  !                                                                       !
  !  inputs:                                                       size   !
  !     im       - integer, horiz dimention and num of used pts      1    !
  !     km       - integer, vertical soil layer dimension            1    !
  !     ps       - real, surface pressure (cb)                       im   !
  !     wind   - real, u/v component of surface layer wind         im   !
  !     t1       - real, surface layer mean temperature (k)          im   !
  !     q1       - real, surface layer mean specific humidity        im   !
  !     soiltyp  - integer, soil type (integer index)                im   !
  !     vegtype  - integer, vegetation type (integer index)          im   !
  !     sigmaf   - real, areal fractional cover of green vegetation  im   !
  !     sfcemis  - real, sfc lw emissivity ( fraction )              im   !
  !     dlwflx   - real, total sky sfc downward lw flux ( w/m**2 )   im   !
  !     dswflx   - real, total sky sfc downward sw flux ( w/m**2 )   im   !
  !     snet     - real, total sky sfc netsw flx into ground(w/m**2) im   !
  !     delt     - real, time interval (second)                      1    !
  !     tg3      - real, deep soil temperature (k)                   im   !
  !     cm       - real, surface exchange coeff for momentum (m/s)   im   !
  !     ch       - real, surface exchange coeff heat & moisture(m/s) im   !
  !     prsl1    - real, sfc layer 1 mean pressure (cb)              im   !
  !     prslki   - real,                                             im   !
  !     slimsk   - real, sea/land/ice mask (=0/1/2)                  im   !
  !     slopetyp - integer, class of sfc slope (integer index)       im   !
  !     flag_guess-logical,                                          im   !
  !                                                                       !
  !  input/outputs:                                                       !
  !     sheleg   - real, snow depth (water equiv)                    im   !
  !     snwdph   - real, snow depth (water equiv) over land          im   !
  !     tskin    - real, ground surface skin temperature ( k )       im   !
  !     tprcp    - real, total precipitation                         im   !
  !     smc      - real, total soil moisture content (fractional)   im,km !
  !     stc      - real, soil temp (k)                              im,km !
  !     slc      - real, liquid soil moisture                       im,km !
  !     canopy   - real, canopy moisture content (m)                 im   !
  !     trans    - real, total plant transpiration (m/s)             im   !
  !     tsurf    - real, surface skin temperature (after iteration)  im   !
  !                                                                       !
  !  outputs:                                                             !
  !     sncovr1  - real, snow cover over land (fractional)           im   !
  !     qsurf    - real, specific humidity at sfc                    im   !
  !     gflux    - real, soil heat flux (w/m**2)                     im   !
  !     drain    - real, subsurface runoff (mm/s)                    im   !
  !     evap     - real, evaperation from latent heat flux           im   !
  !     hflx     - real, sensible heat flux                          im   !
  !     ep       - real, potential evaporation                       im   !
  !     runoff   - real, surface runoff (m/s)                        im   !
  !     cmm      - real,                                             im   !
  !     chh      - real,                                             im   !
  !     zf       - real,                                             im   !
  !     evbs     - real, direct soil evaporation (m/s)               im   !
  !     evcw     - real, canopy water evaporation (m/s)              im   !
  !     sbsno    - real, sublimation/deposit from snopack (m/s)      im   !
  !     snowc    - real, fractional snow cover                       im   !
  !     stm      - real, total soil column moisture content (m)      im   !
  !     snohf    - real, snow/freezing-rain latent heat flux (w/m**2)im   !
  !                                                                       !
  !  ====================    end of description    =====================  !
  
  subroutine surface_land                                                &
    !  ---  inputs:
            ( im, km, ps, wind, t1, q1, soiltyp, vegtype, sigmaf, &
              sfcemis, dlwflx, dswsfc, snet, delt, tg3, cm, ch,   &
              prsl1, prslki, mask, slopetyp, &
              flag_guess, &
    !  --  in/outs:
              sheleg, snwdph, tskin, tprcp, tsnwp, smc, stc, slc, &
              canopy, trans, tsurf,                                      &
    !  --  outputs:
              sncovr1, qsurf, gflux, drain, evap, hflx, ep, runoff,      &
              cmm, chh, zf, evbs, evcw, sbsno, snowc, stm, snohf)
  
    implicit none
  
    !  ---  constant parameters:
    real(kind=kind_phys), parameter :: cpinv   = 1.0/con_cp
    real(kind=kind_phys), parameter :: hvapi   = 1.0/con_hvap
    real(kind=kind_phys), parameter :: elocp   = con_hvap/con_cp
    real(kind=kind_phys), parameter :: rhoh2o  = 1000.0
    real(kind=kind_phys), parameter :: convrad = con_jcal*1.e4/60.0
    real(kind=kind_phys), parameter :: a2      = 17.2693882
    real(kind=kind_phys), parameter :: a3      = 273.16
    real(kind=kind_phys), parameter :: a4      = 35.86
    real(kind=kind_phys), parameter :: a23m4   = a2*(a3-a4)
  
    real(kind=kind_phys)            :: zsoil_noah(4)
    data zsoil_noah / -0.1, -0.4, -1.0, -2.0 /
  
    !  ---  input:
    integer, intent(in) :: im, km
  
    integer, dimension(im), intent(in) :: soiltyp, vegtype, slopetyp
  
    real (kind=kind_phys), dimension(im), intent(in) :: ps, wind,   &
              t1, q1, sigmaf, sfcemis, dlwflx, dswsfc, snet, tg3, cm,    &
              ch, prsl1, prslki
    logical, dimension(im), intent(in) :: mask
  
    real (kind=kind_phys),  intent(in) :: delt
  
    logical, dimension(im), intent(in) :: flag_guess
  
    !  ---  in/out:
    real (kind=kind_phys), dimension(im), intent(inout) :: sheleg,    &
                snwdph, tskin, tprcp, tsnwp, canopy, trans, tsurf
  
    real (kind=kind_phys), dimension(im,km), intent(inout) :: smc, stc, slc
  
    !  ---  output:
    real (kind=kind_phys), dimension(im), intent(out) :: sncovr1,     &
           qsurf, gflux, drain, evap, hflx, ep, runoff, cmm, chh,     &
           zf, evbs, evcw, sbsno, snowc, stm, snohf
      
    !  ---  locals:
    real (kind=kind_phys), dimension(im) :: psurf, ps1, rch, rho,     &
           q0, qs1, theta1, tv1, sheleg_old, snwdph_old,  &
           tprcp_old, tskin_old, canopy_old
  
    real (kind=kind_phys), dimension(km) :: et, sldpth, stsoil,       &
           smsoil, slsoil
  
    real (kind=kind_phys), dimension(im,km) :: zsoil, smc_old,        &
           stc_old, slc_old
  
    real (kind=kind_phys) ::  beta, chx, cmx, cmc,                    &
           dew, drip, dqsdt2, ec, edir, ett, eta, esnow, etp,         &
           flx1, flx2, flx3, lwdn, pc, prcp, snwp, ptu, q2,   &
           q2sat, solnet, rc, rcs, rct, rcq, rcsoil, rsmin,           &
           runoff1, runoff2, runoff3, sfcspd, sfcprs, sfctmp,         &
           sfcems, sheat, shdfac, smcwlt,                             &
           smcdry, smcref, smcmax, sneqv, snowh,                      &
           snomlt, sncovr, soilw, soilm, ssoil, tsea, th2, tbot,      &
           xlai, zlvl, swdn, tem
  
    integer :: couple, ice, nsoil, nroot, slope, stype, vtype 
    integer :: i, k
  
    !===> ...  begin here
  
    !  --- ...  save land-related prognostic fields for guess run
  
    do i = 1, im
      if (mask(i) .and. flag_guess(i)) then
        sheleg_old(i) = sheleg(i)
        snwdph_old(i) = snwdph(i)
        tskin_old(i)  = tskin(i)
        canopy_old(i) = canopy(i)
  
        do k = 1, km
         smc_old(i,k) = smc(i,k)
         stc_old(i,k) = stc(i,k)
         slc_old(i,k) = slc(i,k)
        enddo
      endif
    enddo
  
    !  --- ...  initialization block
  
    do i = 1, im
      if (mask(i)) then
        ep(i) = 0.0
        evap (i) = 0.0
        hflx (i) = 0.0
        gflux(i) = 0.0
        drain(i) = 0.0
        canopy(i)= max(canopy(i), 0.0)
  
        evbs (i) = 0.0
        evcw (i) = 0.0
        trans(i) = 0.0
        sbsno(i) = 0.0
        snowc(i) = 0.0
        snohf(i) = 0.0
      endif
    enddo
  
    !  --- ...  initialize variables 
  
    do i = 1, im
      if (mask(i)) then
        psurf(i)= 1000.0 * ps(i)      !* convert sfc pressure from cb to pa
        ps1(i)  = 1000.0 * prsl1(i)
        q0(i)   = max(q1(i), 1.e-8)   !* q1=specific humidity at level 1 (kg/kg)
        theta1(i) = t1(i) * prslki(i) !* adiabatic temp at level 1 (k)
  
        tv1(i) = t1(i) * (1.0 + con_fvirt*q0(i))
        rho(i) = ps1(i) / (con_rd * tv1(i))
        qs1(i) = fpvs( t1(i) )        !* qs1=sat. humidity at level 1 (kg/kg)
        qs1(i) = con_eps*qs1(i) / (ps1(i) + con_epsm1*qs1(i))
        qs1(i) = max(qs1(i), 1.e-8)
        q0 (i) = min(qs1(i), q0(i))
      endif
    enddo
  
    do i = 1, im
      if (mask(i)) then
        do k = 1, km
          zsoil(i,k) = zsoil_noah(k)
        enddo
      endif
    enddo
  
    do i = 1, im
      if (mask(i)) then
      !  --- ...  noah: prepare variables to run noah lsm
      !   1. configuration information (c):
      !    couple  - couple-uncouple flag (=1: coupled, =0: uncoupled) 
      !    ice     - sea-ice flag (=1: sea-ice, =0: land)
      !    dt      - timestep (sec) (dt should not exceed 3600 secs) = delt
      !    zlvl    - height (m) above ground of atmospheric forcing variables
      !    nsoil   - number of soil layers (at least 2)
      !    sldpth  - the thickness of each soil layer (m)
        couple = 1                      ! run noah lsm in 'couple' mode
        ice = 0
  
        zlvl = -con_rd*tv1(i)*log(ps1(i)/psurf(i)) / con_g    !! z1 for osu
        zf(i)= zlvl
  
        nsoil = km
        sldpth(1) = - zsoil(i,1)
        do k = 2, km
          sldpth(k) = zsoil(i,k-1) - zsoil(i,k)
        enddo
  
        !   2. forcing data (f):
        !    lwdn    - lw dw radiation flux (w/m2)
        !    solnet  - net sw radiation flux (dn-up) (w/m2)
        !    sfcprs  - pressure at height zlvl above ground (pascals)
        !    prcp    - precip rate (kg m-2 s-1)
        !    snwp    - snow fall rate (kg m-2 s-1)
        !    sfctmp  - air temperature (k) at height zlvl above ground
        !    th2     - air potential temperature (k) at height zlvl above ground
        !    q2      - mixing ratio at height zlvl above ground (kg kg-1)
  
        lwdn = dlwflx(i)           !..downward lw flux at sfc in w/m2
        swdn = dswsfc(i)           !..downward sw flux at sfc in w/m2
        solnet = snet(i)           !..net sw rad flx (dn-up) at sfc in w/m2
        sfcems = sfcemis(i)
  
        sfcprs = ps1(i) 
        prcp   = rhoh2o * tprcp(i) / delt
        snwp   = rhoh2o * tsnwp(i) / delt
        sfctmp = t1(i)  
        th2 = theta1(i)
        q2  = q0(i)
  
        !   3. other forcing (input) data (i):
        !    sfcspd  - wind speed (m s-1) at height zlvl above ground
        !    q2sat   - sat mixing ratio at height zlvl above ground (kg kg-1)
        !    dqsdt2  - slope of sat specific humidity curve at t=sfctmp (kg kg-1 k-1)
  
        sfcspd = wind(i)
        q2sat =  qs1(i)
        dqsdt2 = q2sat * a23m4/(sfctmp-a4)**2
  
        !   4. canopy/soil characteristics (s):
        !    vegtyp  - vegetation type (integer index)                       -> vtype
        !    soiltyp - soil type (integer index)                             -> stype
        !    slopetyp- class of sfc slope (integer index)                    -> slope
        !    shdfac  - areal fractional coverage of green vegetation (0.0-1.0)
        !    ptu     - photo thermal unit (plant phenology for annuals/crops)
        !    tbot    - bottom soil temperature (local yearly-mean sfc air temp)
  
        vtype = vegtype(i)
        stype = soiltyp(i)
        slope = slopetyp(i)
        shdfac= sigmaf(i)
  
        ptu  = 0.0
        tbot = tg3(i)
        
        !   5. history (state) variables (h):
        !    cmc     - canopy moisture content (m)
        !    t1      - ground/canopy/snowpack) effective skin temperature (k)   -> tsea
        !    stc(nsoil) - soil temp (k)                                         -> stsoil
        !    smc(nsoil) - total soil moisture content (volumetric fraction)     -> smsoil
        !    sh2o(nsoil)- unfrozen soil moisture content (volumetric fraction)  -> slsoil
        !    snowh   - actual snow depth (m)
        !    sneqv   - liquid water-equivalent snow depth (m)
        !    ch      - surface exchange coefficient for heat and moisture (m s-1) -> chx
        !    cm      - surface exchange coefficient for momentum (m s-1)          -> cmx
  
        cmc = canopy(i)/1000.              ! convert from mm to m
        tsea = tsurf(i)                    ! clu_q2m_iter
  
        do k = 1, km
          stsoil(k) = stc(i,k)
          smsoil(k) = smc(i,k)
          slsoil(k) = slc(i,k)
        enddo
  
        snowh = snwdph(i) / 1000.0         ! convert from mm to m
        sneqv = sheleg(i) / 1000.0         ! convert from mm to m
        if (sneqv /= 0.0 .and. snowh == 0.0) then
          snowh = 10.0 * sneqv
        endif
  
        chx = ch(i) * wind(i)              ! compute conductance
        cmx = cm(i) * wind(i)
        chh(i) = rho(i)* ch(i) * wind(i)
        cmm(i) = cm(i) * wind(i)
  
        !  --- ...  call noah lsm
  
        call sflx                                                     &
          !  ---  inputs:
            ( nsoil, couple, ice, delt, zlvl, sldpth,            &
              swdn, solnet, lwdn, sfcems, sfcprs, sfctmp,                &
              sfcspd, prcp, snwp, q2, q2sat, dqsdt2, th2,                &
              vtype, stype, slope,                                       &
          !  --  input/outputs:
              tbot, cmc, tsea, stsoil, smsoil, slsoil, sneqv, chx, cmx,  &
          !  --  outputs:
              nroot, shdfac, snowh, eta, sheat, ec,                      &
              edir, et, ett, esnow, drip, dew, beta, etp, ssoil,         &
              flx1, flx2, flx3, runoff1, runoff2, runoff3,               &
              snomlt, sncovr, rc, pc, rsmin, xlai, rcs, rct, rcq,        &
              rcsoil, soilw, soilm, smcwlt, smcdry, smcref, smcmax)
  
        !  --- ...  noah: prepare variables for return to parent mode
        !   6. output (o):
        !    eta     - actual latent heat flux (w m-2: positive, if upward from sfc)
        !    sheat   - sensible heat flux (w m-2: positive, if upward from sfc)
        !    beta    - ratio of actual/potential evap (dimensionless)
        !    etp     - potential evaporation (w m-2)
        !    ssoil   - soil heat flux (w m-2: negative if downward from surface)
        !    runoff1 - surface runoff (m s-1), not infiltrating the surface
        !    runoff2 - subsurface runoff (m s-1), drainage out bottom
  
        evap(i) = eta
        hflx(i) = sheat
        gflux(i)= ssoil
  
        evbs(i) = edir
        evcw(i) = ec
        trans(i)= ett
        sbsno(i)= esnow
        snowc(i)= sncovr
        stm(i)  = soilm
        snohf(i)= flx1 + flx2 + flx3
  
        ep(i) = etp
        tsurf(i) = tsea
  
        do k = 1, km
          stc(i,k) = stsoil(k) 
          smc(i,k) = smsoil(k)
          slc(i,k) = slsoil(k)
        enddo
  
        !  --- ...  unit conversion (from m s-1 to mm s-1)
        runoff(i) = runoff1 * 1000.0
        drain (i) = runoff2 * 1000.0
  
        !  --- ...  unit conversion (from m to mm)
        canopy(i) = cmc * 1000.0
        snwdph(i) = snowh * 1000.0
        sheleg(i) = sneqv * 1000.0
        sncovr1(i)= sncovr
  
        !  --- ...  do not return the following output fields to parent model
        !    ec      - canopy water evaporation (m s-1)
        !    edir    - direct soil evaporation (m s-1)
        !    et(nsoil)-plant transpiration from a particular root layer (m s-1)
        !    ett     - total plant transpiration (m s-1)
        !    esnow   - sublimation from (or deposition to if <0) snowpack (m s-1)
        !    drip    - through-fall of precip and/or dew in excess of canopy
        !              water-holding capacity (m)
        !    dew     - dewfall (or frostfall for t<273.15) (m)
        !    beta    - ratio of actual/potential evap (dimensionless)
        !    flx1    - precip-snow sfc (w m-2)
        !    flx2    - freezing rain latent heat flux (w m-2)
        !    flx3    - phase-change heat flux from snowmelt (w m-2)
        !    snomlt  - snow melt (m) (water equivalent)
        !    sncovr  - fractional snow cover (unitless fraction, 0-1)
        !    runoff3 - numerical trunctation in excess of porosity (smcmax)
        !              for a given soil layer at the end of a time step
        !    rc      - canopy resistance (s m-1)
        !    pc      - plant coefficient (unitless fraction, 0-1) where pc*etp
        !              = actual transp
        !    xlai    - leaf area index (dimensionless)
        !    rsmin   - minimum canopy resistance (s m-1)
        !    rcs     - incoming solar rc factor (dimensionless)
        !    rct     - air temperature rc factor (dimensionless)
        !    rcq     - atmos vapor pressure deficit rc factor (dimensionless)
        !    rcsoil  - soil moisture rc factor (dimensionless)
        !    soilw   - available soil moisture in root zone (unitless fraction
        !              between smcwlt and smcmax)
        !    soilm   - total soil column moisture content (frozen+unfrozen) (m)
        !    smcwlt  - wilting point (volumetric)
        !    smcdry  - dry soil moisture threshold where direct evap frm top
        !              layer ends (volumetric)
        !    smcref  - soil moisture threshold where transpiration begins to
        !              stress (volumetric)
        !    smcmax  - porosity, i.e. saturated value of soil moisture
        !              (volumetric)
        !    nroot   - number of root layers, a function of veg type, determined
        !              in subroutine redprm.
  
      endif   ! end if_mask_block
    enddo   ! end do_i_loop
  
    !   --- ...  compute qsurf (specific humidity at sfc)
  
    do i = 1, im
      if (mask(i)) then
        rch(i) = rho(i) * con_cp * ch(i) * wind(i)
        qsurf(i) = q1(i) + evap(i) / (elocp * rch(i))
      endif
    enddo
  
    do i = 1, im
      if (mask(i)) then
        tem     = 1.0 / rho(i)
        hflx(i) = hflx(i) * tem * cpinv
        evap(i) = evap(i) * tem * hvapi
      endif
    enddo
  
    !  --- ...  restore land-related prognostic fields for guess run
  
    do i = 1, im
      if (mask(i)) then
        if (flag_guess(i)) then
          sheleg(i) = sheleg_old(i)
          snwdph(i) = snwdph_old(i)
          tskin(i)  = tskin_old(i)
          canopy(i) = canopy_old(i)
  
          do k = 1, km
            smc(i,k) = smc_old(i,k)
            stc(i,k) = stc_old(i,k)
            slc(i,k) = slc_old(i,k)
          enddo
        else
          tskin(i) = tsurf(i)    
        endif
      endif
    enddo
    return
  end subroutine surface_land
end module land_model_mod
