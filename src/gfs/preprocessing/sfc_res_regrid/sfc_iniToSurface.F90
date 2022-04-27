program sfc_ini

  use iso_c_binding

  use netcdf
  use mpp_mod, only : mpp_init, mpp_error, FATAL, NOTE, mpp_pe, mpp_root_pe, mpp_exit, mpp_npes, mpp_broadcast
  use mpp_mod, only : mpp_set_current_pelist, mpp_declare_pelist, WARNING
  use mpp_io_mod, only : MPP_RDONLY, MPP_NETCDF, MPP_MULTI, MPP_SINGLE, mpp_io_init, mpp_get_axes
  use mpp_io_mod, only : mpp_open, mpp_get_info, mpp_get_fields, mpp_get_atts, fieldtype, axistype
  use mpp_io_mod, only : mpp_read, atttype, MPP_OVERWR, mpp_modify_meta, mpp_copy_meta, mpp_write
  use mpp_io_mod, only : mpp_close, mpp_write_meta, mpp_get_times, mpp_get_axis_data
  use fms_io_mod, only : field_size, read_data, fms_io_init, fms_io_exit, fms_io_init
  use fms_io_mod, only : open_namelist_file, close_file, write_data
  use mkxgrid_mod, only : vtx, clipin, poly_area
  use gauss_and_legendre_mod, only : compute_gaussian
  use constants_mod, only : PI

  use sfcio_module, only: sfcio_sclose,sfcio_swohdc,sfcio_head,sfcio_srhead,&
      sfcio_srohdc,sfcio_aldata,sfcio_data,sfcio_sropen,sfcio_srdata,sfcio_axdata
  
  implicit none

  character(len=128), parameter :: gridf1="grid_spec.nc"
  character(len=13), dimension(6) :: lat_units=['degrees_north',& 
                                                'degree_north ',& 
                                                'degree_N     ',& 
                                                'degrees_N    ',& 
                                                'degreeN      ',& 
                                                'degreesN     ']

  character(len=13), dimension(6) :: lon_units=['degrees_east ',& 
                                                'degree_east  ',& 
                                                'degree_E     ',& 
                                                'degrees_E    ',& 
                                                'degreeE      ',& 
                                                'degreesE     ']

  character(len=10), dimension(2) :: lat_names=['latitude  ', &
                                                'lat       ']

  character(len=10), dimension(2) :: lon_names=['longitude ', &
                                                'lon       ']
  integer, dimension(nf90_max_var_dims) :: vardimids
  integer, dimension(:), allocatable :: dimsize
  integer, parameter :: n_str1 = 72
  integer, parameter :: n_str2 = 8
  integer, parameter :: n2d = 32
  integer, parameter :: n3d = 3

  integer, allocatable :: pxi(:), pxj(:)
  integer, allocatable :: rxi(:), rxj(:)
  real, allocatable :: rxf(:)
  real, allocatable :: pxf(:)
  real, allocatable :: xxf(:)
  real, allocatable :: lat(:), lon(:)
  real, allocatable :: latb(:), lonb(:)
  integer, allocatable :: ilat(:)
  integer, allocatable :: lonsperlat(:)
  real, allocatable :: olatb(:), olonb(:,:)
  integer :: onlat=94, onlon=192
  real, allocatable :: frac(:,:) 


  integer :: nlat, nlon, ntime, nvar, natt, ndim
  integer :: ounit, iunit, yid, xid, lsoil, idate(4)
  real :: fhour
  type(axistype), allocatable :: oaxes(:)
  type(fieldtype), allocatable :: ofields(:)
  type(fieldtype), allocatable :: fields(:)

  type(axistype) :: time_axis
  real, allocatable :: times(:)
  character(len=32) :: time_axis_name="NOTIME"
  character(len=128) :: lon_nm='NONAME', lat_nm='NONAME'
  
  integer :: stat, xn, i, k, np=10
  real, parameter :: eps1 = 1e-10
  logical, allocatable, dimension(:,:) :: lmask
  integer, allocatable, dimension(:,:) :: max_area_loc
  
  character(len=512) :: in_file="sfc_ini"
  character(len=512) :: out_file="sfc_ini.nc"
  character(len=512) :: out_file_red="sfc_ini_red.nc"

  character(len=128) :: var_nm(50)
  integer, target :: kk, jj, ii
  integer, pointer :: kp, jp, ip

  integer :: ocnx, ocny, search_frac=4
  integer, allocatable :: pes(:)

  logical :: debug=.false., typedata=.false., landdata=.false., valid_pe=.true.

  real, dimension(:,:,:), allocatable :: grids2d
  real, dimension(:,:), allocatable :: out2d, area_lnd, area_lnd_cell, lfrac, snowc, trans, tskin
  real, dimension(:,:,:), allocatable :: out3d
  character(len=n_str1), dimension(n2d) :: grids2d_desc
  character(len=n_str2), dimension(n2d) :: grids2d_name

  real, dimension(:,:,:,:), allocatable :: grids3d
  character(len=n_str1), dimension(n3d) :: grids3d_desc
  character(len=n_str2), dimension(n3d) :: grids3d_name

  ! New variables
  integer :: unit, varid, nx1, ny1, nx, ny, lonr, latr
  logical :: n2s, octahedral=.false.
  integer :: ncid, ndims, nvars, nglobalatts, unlimdimid,siz(4)

  namelist /sfc_res_regrid_nml/ octahedral

  call mpp_init()
  call mpp_io_init()
  call fms_io_init()


  open(10,file='gfs_namelist',status='old')
  read(10,nml=sfc_res_regrid_nml)
  close(10)

  print *,"input, output, output_red", in_file, out_file, out_file_red
!!!!!!!!!!!!! READ SFC FILE HEADER  !!!!!!!!!!!!!!!!!!  
  call read_header(trim(in_file), nlon, nlat, lsoil, idate, fhour)
  call field_size('grid_spec.nc','AREA_LND',siz)
  onlon = siz(1); onlat=siz(2)
  print *, "nlon, nlat, lsoil, onlon, onlat ", nlon, nlat, lsoil, onlon, onlat 
  allocate(grids2d(nlon,nlat,n2d))
  allocate(out2d(onlon,onlat))
  allocate(out3d(onlon,onlat, lsoil))
  allocate(grids3d(nlon,nlat,lsoil,n3d))

  allocate(area_lnd(onlon,onlat))
  allocate(area_lnd_cell(onlon,onlat))
  allocate(lfrac(onlon,onlat))
  allocate(snowc(onlon,onlat))
  allocate(trans(onlon,onlat))
  allocate(tskin(onlon,onlat))

  call initialize_input_grid()
  print *, 'initialize input grid done..'
  call initialize_output_grid()
  print *, 'initialize output grid done..'
  call make_xgrid_oc2rg()
  print *, 'initialize xgrid done..'

  !read grid_spec variables
  call read_data('grid_spec.nc','AREA_LND', area_lnd(:,:))
  call read_data('grid_spec.nc','AREA_LND_CELL', area_lnd_cell(:,:))
  lfrac = area_lnd/area_lnd_cell


  !  'sheleg'
  !  'snwdph'
  !  'tskin'
  !  'smc'
  !  'stc'
  !  'slc'
  !  'canopy'
  !  'trans'
  !  'sncovr'
  !  'tprcp'
  !  'srflag'
  !  'zorl_o'

!!!!!!!!!!!!! READ GRIDDED DATA IN GAUSSIAN GRID FROM SFC_INI !!!!!

  call read_griddata(trim(in_file), nlon, nlat, lsoil,&
                    grids2d,grids2d_desc,grids2d_name,&
                    grids3d,grids3d_desc,grids3d_name)

!!!!!!!!!!!!  WRITE REDUCED GAUSSIAN GRID 2D DATA 
  do i = 1, n2d
    out2d=-999.
    print *, trim(grids2d_name(i))
    call interpolate2d(real(grids2d(:,:,i)),out2d,0.)
    call write_data(out_file,trim(grids2d_name(i)),grids2d(:,:,i))
    call write_data(out_file_red,trim(grids2d_name(i)),out2d(:,:))
  end do

  do i = 1, n3d
    out3d=-999.
    print *, trim(grids3d_name(i))
    call write_data(out_file,trim(grids3d_name(i)),real(grids3d(:,:,:,i)))
    do k = 1,lsoil
        call interpolate2d(real(grids3d(:,:,k,i)), out3d(:,:,k), 0.)
    end do

    call write_data(out_file_red,trim(grids3d_name(i)),out3d(:,:,:))
    ! Need to write the 3d data to reduced gaussian grid
  end do

  call fms_io_exit()
  call mpp_exit()
  
  contains

    subroutine initialize_input_grid()
      real, allocatable :: wts_hem(:), wts_lat(:), sin_hem(:)
      integer :: siz(4), i, j
      real :: dlon, sumwts=0., dlat
      type(axistype), allocatable :: axes(:)
      integer :: ntime1

      allocate(latb(nlat+1))
      allocate(lonb(nlon+1))

      call mpp_error(NOTE,"Input data is in gaussian latitudes.")
      if (mod(nlat,2)/=0) call mpp_error(FATAL,"Input nlat is not an even number")
      allocate(sin_hem(nlat/2),wts_hem(nlat/2))
      allocate(wts_lat(nlat))
      call compute_gaussian(sin_hem, wts_hem, nlat/2)
      wts_lat(1:nlat/2) = wts_hem
      wts_lat(nlat:nlat/2+1:-1) = wts_hem
      latb(1) = -0.5*PI
      sumwts = 0.
      do j = 1, nlat-1
          sumwts = sumwts + wts_lat(j)
          latb(j+1) = asin(sumwts-1.)
      end do
      latb(nlat+1) = 0.5*PI
      latb = latb*180./PI
      deallocate(sin_hem, wts_lat, wts_hem)

      if (ifs2n(latb)) latb=latb*-1.

      dlon = 360./nlon
      lonb(1) = -dlon*0.5
      do j = 1, nlon
        lonb(j+1) = lonb(j) + dlon
      end do

    end subroutine initialize_input_grid


    subroutine initialize_output_grid()
      real, allocatable :: wts_hem(:), wts_lat(:), sin_hem(:)
      integer :: siz(4), i, j
      real :: dlon, sumwts=0., dlat
      type(axistype), allocatable :: axes(:)
      integer :: ntime1, nnlon

      allocate(olatb(onlat+1))
      allocate(olonb(onlon+1,onlat))
      call set_lonsperlat(onlat,octahedral=octahedral)

      if (mod(onlat,2)/=0) call mpp_error(FATAL,"Output nlat is not an even number")

      allocate(sin_hem(onlat/2),wts_hem(onlat/2))
      allocate(wts_lat(onlat))

      call compute_gaussian(sin_hem, wts_hem, onlat/2)

      wts_lat(1:onlat/2) = wts_hem
      wts_lat(onlat:onlat/2+1:-1) = wts_hem

      olatb(1) = -0.5*PI
      sumwts = 0.
      do j = 1, onlat-1
          sumwts = sumwts + wts_lat(j)
          olatb(j+1) = asin(sumwts-1.)
      end do

      olatb(onlat+1) = 0.5*PI
      olatb = olatb*180./PI

      deallocate(sin_hem, wts_lat, wts_hem)

      if (ifs2n(olatb)) olatb=olatb*-1.

      !!!!!!!
      olonb=-999.

      do j = 1, onlat
        nnlon=lonsperlat(j)
        dlon = 360./nnlon
        olonb(1,j) = -dlon*0.5
        do i = 1, nnlon
          olonb(i+1,j) = olonb(i,j) + dlon
        end do
      end do

    end subroutine initialize_output_grid


    subroutine interpolate2d(idata,odata,missing)
      real, intent(in), dimension(:,:) :: idata
      real, intent(out), dimension(:,:) :: odata
      real, intent(in) :: missing

      real, dimension(size(odata,1),size(odata,2)) :: denom
      integer :: n, j, i, j1, i1, swipe
      real :: rval
     
      odata = 0.
      denom = 0.
      print *,"from inside interpolate2d, xn =", pxj(xn), pxi(xn)
      do n = 1, xn
        if (idata(pxj(n),pxi(n))/=missing) then
          odata(rxj(n),rxi(n)) = odata(rxj(n),rxi(n)) + &
            idata(pxj(n),pxi(n)) * rxf(n)
          denom(rxj(n),rxi(n)) = denom(rxj(n),rxi(n)) + rxf(n)
        endif
      end do

      where(denom>0.) 
        odata=odata/denom
      elsewhere
        odata=missing
      endwhere

    end subroutine interpolate2d

    function find_nn_val(i_in,j_in,idat,missing,swipe)
      integer, intent(in) :: i_in, j_in
      real, intent(in) :: idat(:,:), missing
      integer, intent(out), optional :: swipe
      real :: find_nn_val
      integer :: is, js, ie, je
      integer :: ni, nj, nt
      integer :: e, w, s, n, t

      ni=size(idat,1)
      nj=size(idat,2)
      nt = 0

      find_nn_val=missing

      do nt = 1, max(nj,ni)/search_frac
        if(present(swipe)) swipe = nt
        is = i_in - nt; ie = i_in + nt
        js = j_in - nt; je = j_in + nt
        if ( js < 1 )  js = 1
        if ( je > nj ) je = nj
        if ( is < 1 )  is = ni + is
        if ( ie > ni ) ie = ie - ni

        do t = 0, nt
          e = i_in - t; w = i_in + t
          s = j_in - t; n = j_in + t
          if (e < 1) e = ni + e
          if (w > ni) w = w - ni
          if (n > nj) n = nj
          if (s < 1) s = 1

          ! bottom left
          if (idat(e,js)/=missing) then
            find_nn_val=idat(e,js)
            return
          endif

          !bottom right
          if (idat(w,js)/=missing) then
            find_nn_val=idat(w,js)
            return
          endif

          !top left
          if (idat(e,je)/=missing) then
            find_nn_val=idat(e,je)
            return
          endif

          !top right
          if (idat(w,je)/=missing) then
            find_nn_val=idat(w,je)
            return
          endif

          !left top
          if (idat(is,n)/=missing) then
            find_nn_val=idat(is,n)
            return
          endif

          !left bottom
          if (idat(is,s)/=missing) then
            find_nn_val=idat(is,s)
            return
          endif

          !right top
          if (idat(ie,n)/=missing) then
            find_nn_val=idat(ie,n)
            return
          endif

          !right bottom
          if (idat(ie,s)/=missing) then
            find_nn_val=idat(ie,s)
            return
          endif
        end do
      end do

    end function find_nn_val

    function ifs2n(x)
      real, intent(in) :: x(:)
      logical :: ifs2n

      ifs2n = .true.

      ifs2n=(x(2)-x(1))>0.
      return

    end function ifs2n

    subroutine make_xgrid_oc2rg()
      integer(C_INT) :: num_in = 4, n_out
      type(vtx) :: v1(2), v2(2), v_out(4)
      type(vtx), allocatable :: vtxoc(:,:,:), vtxrg(:,:,:)
      real, allocatable :: lonbw(:,:), lonbe(:,:), latbn(:,:), latbs(:,:)
      integer, allocatable :: xi(:,:), xj(:,:)
      real, allocatable :: xf(:,:)
    
      real :: area, area1, chkarea
      integer :: is, ie, i, j, k, n, g, i1, i2, xnsize, siz(4), siz1(4)
    
      xnsize=size(lonb,1)*size(latb,1)*np
      xnsize = max(xnsize,onlat*onlon*np)
   
      allocate(max_area_loc(onlon,onlat))
      allocate(vtxoc(2,nlon,nlat))
    
      allocate(vtxrg(2,onlon,onlat))
    
      allocate(xi(2,xnsize))
      allocate(xj(2,xnsize))
      allocate(xf(3,xnsize))

      allocate(lmask(onlon,onlat))

      do i = 1, size(lonb,1)-1
        do j = 1, size(latb,1)-1
          vtxoc(1,i,j)%y = latb(j+1)
          vtxoc(2,i,j)%y = latb(j)
          vtxoc(1,i,j)%x = lonb(i)
          vtxoc(2,i,j)%x = lonb(i+1) 
        end do
      end do

      do i = 1, size(olonb,1)-1
        do j = 1, size(olatb,1)-1
          vtxrg(1,i,j)%y = olatb(j+1)
          vtxrg(2,i,j)%y = olatb(j)
          vtxrg(1,i,j)%x = olonb(i,j)
          vtxrg(2,i,j)%x = olonb(i+1,j) 
        end do
      end do
      
      
      xn = 0        

      !print  *,"size(vtox,2)",size(vtox,2)
      !print  *,"size(vtox,3)",size(vtox,3)
      do j = 1, size(vtxoc,2)
        do i2 = 1, size(vtxoc,3)
          chkarea=0.
          inner: do i1 = 1, size(vtxrg,3)
          !inner: do i1 = 47, 48 
          !inner: do i1 = 42, 53 
            do g = 1, size(vtxrg,2)
              !print *,"j, i2, i1, g ", j, i2, i1, g
              !print *,"vtxrg(2,g,i1)%x ", vtxrg(2,g,i1)%x
              if (vtxrg(2,g,i1)%x==-999.) exit
              n_out = clipin(vtxrg(:,g,i1),vtxoc(:,j,i2),v_out)
              !if sum(abs(vtxrg(:,g,i1)%x-vtxoc(:,j,i2)%x))+sum(abs(vtxrg(:,g,i1)%y-vtxoc(:,j,i2)%y)) ==0.0 then

              !end if
              !print *,"clipin arguments vtxrg-vtxog",vtxrg(:,g,i1)%y-vtxoc(:,j,i2)%y
              !print *,""
              !print *,"n_out ", n_out
              if (n_out<1) cycle
              area=poly_area(v_out, n_out)

              !if (sum(abs(vtxrg(:,g,i1)%x-vtxoc(:,j,i2)%x))+sum(abs(vtxrg(:,g,i1)%y-vtxoc(:,j,i2)%y)) ==0.0) then
              !  print *, "n_out, area ", n_out, area 
              !end if
              if (area<eps1) cycle
              xn = xn + 1
              if (xn > xnsize) then
                print *, xn, xnsize
                call mpp_error(FATAL,"xn > xnsize")
              endif
              xj(1,xn) = j
              xi(1,xn) = i2
              xj(2,xn) = g
              xi(2,xn) = i1
               
              v_out(1) = vtxoc(1,j,i2)
              v_out(3) = vtxoc(2,j,i2)
              v_out(2)%y = v_out(1)%y
              v_out(2)%x = v_out(3)%x
              v_out(4)%y = v_out(3)%y
              v_out(4)%x = v_out(1)%x
              area1 = poly_area(v_out, 4)
              xf(1,xn) = area/area1
              chkarea=chkarea+area/area1
              !if (chkarea>1.) exit inner
    
              v_out(1) = vtxrg(1,g,i1)
              v_out(3) = vtxrg(2,g,i1)
              v_out(2)%y = v_out(1)%y
              v_out(2)%x = v_out(3)%x
              v_out(4)%y = v_out(3)%y
              v_out(4)%x = v_out(1)%x
              area1 = poly_area(v_out, 4)
              xf(2,xn) = area/area1
              xf(3,xn) = area
              !print *,"xi(:,xn)= ",xi(:,xn)
              !print *,"xj(:,xn)= ",xj(:,xn)
              !print *,"xf(:,xn)= ",xf(:,xn)
            end do
          end do inner
        end do
      end do
      
      deallocate(vtxoc)
      deallocate(vtxrg)
      
      print *,"from inside make_xgrid, xn  = ", xn 
      allocate(pxi(xn))
      allocate(pxj(xn))
      allocate(pxf(xn))
      allocate(rxi(xn))
      allocate(rxj(xn))
      allocate(rxf(xn))
      allocate(xxf(xn))
    
      pxi=xi(1,1:xn)
      pxj=xj(1,1:xn)
      pxf=xf(1,1:xn)
      rxi=xi(2,1:xn)
      rxj=xj(2,1:xn)
      rxf=xf(2,1:xn)
      xxf=xf(3,1:xn)

      print *, maxval(pxi), maxval(pxj), maxval(rxi), maxval(rxj)
      max_area_loc = 0
      do n = 1, xn
        if (max_area_loc(rxj(n),rxi(n)) == 0) max_area_loc(rxj(n),rxi(n)) = n
        if ( rxf(n) > rxf(max_area_loc(rxj(n),rxi(n))) ) max_area_loc(rxj(n),rxi(n)) = n
      end do

      !if (any(max_area_loc==0)) call mpp_error(FATAL,"max_area_loc == 0")

    
      deallocate(xi)
      deallocate(xj)
      deallocate(xf)

      call write_data('out.nc','max_area_loc',max_area_loc)
    
    end subroutine make_xgrid_oc2rg

    subroutine read_header(filename, nlons, nlats, lsoil, idate, fhour)
      implicit none
      integer, intent(out) :: nlons,nlats,idate(4),lsoil
      real, intent(out) :: fhour
      character(len=*), intent(in) :: filename
      type(sfcio_head) sfchead
      integer lu,iret
      lu = 7
      call sfcio_sropen(lu,trim(filename),iret)
      if (iret .ne. 0) then
         print *,'error opening ',trim(filename),iret
         stop
      endif
      call sfcio_srhead(lu,sfchead,iret)
      if (iret .ne. 0) then
         print *,'error reading header from ',trim(filename),iret
         stop
      else
         nlons = sfchead%lonb
         nlats = sfchead%latb
         idate = sfchead%idate
         lsoil = sfchead%lsoil
         fhour = sfchead%fhour
      endif 
      call sfcio_sclose(lu,iret)
    end subroutine read_header
    
    subroutine read_griddata(filename, nlons, nlats, lsoil,&
                    grids2d,grids2d_desc,grids2d_name,&
                    grids3d,grids3d_desc,grids3d_name)
      implicit none
      character(len=n_str1) :: desc
      character(len=n_str2) :: name
      real, intent(out), dimension(nlons,nlats,n2d) :: grids2d
      character(len=n_str1), intent(out), dimension(n2d) :: grids2d_desc
      character(len=n_str2), intent(out), dimension(n2d) :: grids2d_name
      real, intent(out), dimension(nlons,nlats,lsoil,n3d) :: grids3d
      character(len=n_str1), intent(out), dimension(n3d) :: grids3d_desc
      character(len=n_str2), intent(out), dimension(n3d) :: grids3d_name
      integer, intent(in) :: nlons,nlats,lsoil
      character(len=*), intent(in) :: filename
      integer lu,iret
      type(sfcio_head) :: sfchead
      type(sfcio_data) :: sfcdata
      lu = 7

      call sfcio_srohdc(lu,trim(filename),sfchead,sfcdata,iret)
      if (iret .ne. 0) then
        print *,'error reading ',trim(filename),iret
        stop
      endif
      desc = 'sea-land-ice mask (0-sea, 1-land, 2-ice)'
      call strtoarr(desc, grids2d_desc(1), n_str1)
      name = 'slmsk'
      call strtoarr(name, grids2d_name(1), n_str2)
      grids2d(:,:,1) = sfcdata%slmsk
      desc = 'surface orography in m'
      call strtoarr(desc, grids2d_desc(2), n_str1)
      name = 'orog'
      call strtoarr(name, grids2d_name(2), n_str2)
      grids2d(:,:,2) = sfcdata%orog
      desc = 'sst in K'
      call strtoarr(desc, grids2d_desc(3), n_str1)
      name = 'tsea'
      call strtoarr(name, grids2d_name(3), n_str2)
      grids2d(:,:,3) = sfcdata%tsea
      desc = 'snow depth in m'
      call strtoarr(desc, grids2d_desc(4), n_str1)
      name = 'sheleg'
      call strtoarr(name, grids2d_name(4), n_str2)
      grids2d(:,:,4) = sfcdata%sheleg
      desc = 'deep soil temp in K'
      call strtoarr(desc, grids2d_desc(5), n_str1)
      name = 'tg3'
      call strtoarr(name, grids2d_name(5), n_str2)
      grids2d(:,:,5) = sfcdata%tg3
      desc = 'roughness length in cm'
      call strtoarr(desc, grids2d_desc(6), n_str1)
      name = 'zorl'
      call strtoarr(name, grids2d_name(6), n_str2)
      grids2d(:,:,6) = sfcdata%zorl
      desc = 'albedo for visible scattered (fraction)'
      call strtoarr(desc, grids2d_desc(7), n_str1)
      name = 'alvsf'
      call strtoarr(name, grids2d_name(7), n_str2)
      grids2d(:,:,7) = sfcdata%alvsf
      desc = 'albedo for visible beam (fraction)'
      call strtoarr(desc, grids2d_desc(8), n_str1)
      name = 'alvwf'
      call strtoarr(name, grids2d_name(8), n_str2)
      grids2d(:,:,8) = sfcdata%alvwf
      desc = 'albedo for near-IR scattered (fraction)'
      call strtoarr(desc, grids2d_desc(9), n_str1)
      name = 'alnsf'
      call strtoarr(name, grids2d_name(9), n_str2)
      grids2d(:,:,9) = sfcdata%alnsf
      desc = 'albedo for near-IR beam (fraction)'
      call strtoarr(desc, grids2d_desc(10), n_str1)
      name = 'alnwf'
      call strtoarr(name, grids2d_name(10), n_str2)
      grids2d(:,:,10) = sfcdata%alnwf
      desc = 'vegetation fraction (fraction)'
      call strtoarr(desc, grids2d_desc(11), n_str1)
      name = 'vfrac'
      call strtoarr(name, grids2d_name(11), n_str2)
      grids2d(:,:,11) = sfcdata%vfrac
      desc = 'canopy water in m'
      call strtoarr(desc, grids2d_desc(12), n_str1)
      name = 'canopy'
      call strtoarr(name, grids2d_name(12), n_str2)
      grids2d(:,:,12) = sfcdata%canopy
      desc = '10-meter wind speed over lowest model wind speed'
      call strtoarr(desc, grids2d_desc(13), n_str1)
      name = 'f10m'
      call strtoarr(name, grids2d_name(13), n_str2)
      grids2d(:,:,13) = sfcdata%f10m
      desc = '2-meter temp in K'
      call strtoarr(desc, grids2d_desc(14), n_str1)
      name = 't2m'
      call strtoarr(name, grids2d_name(14), n_str2)
      grids2d(:,:,14) = sfcdata%t2m
      desc = '2-meter specific humidity (kg/kg)'
      call strtoarr(desc, grids2d_desc(15), n_str1)
      name = 'q2m'
      call strtoarr(name, grids2d_name(15), n_str2)
      grids2d(:,:,15) = sfcdata%q2m
      desc = 'vegetation type in integer 1-13'
      call strtoarr(desc, grids2d_desc(16), n_str1)
      name = 'vtype'
      call strtoarr(name, grids2d_name(16), n_str2)
      grids2d(:,:,16) = sfcdata%vtype
      desc = 'soil type in integer 1-9'
      call strtoarr(desc, grids2d_desc(17), n_str1)
      name = 'stype'
      call strtoarr(name, grids2d_name(17), n_str2)
      grids2d(:,:,17) = sfcdata%stype
      desc = 'fractional coverage with strong cosz dependency'
      call strtoarr(desc, grids2d_desc(18), n_str1)
      name = 'facsf'
      call strtoarr(name, grids2d_name(18), n_str2)
      grids2d(:,:,18) = sfcdata%facsf
      desc = 'fractional coverage with weak cosz dependency'  
      call strtoarr(desc, grids2d_desc(19), n_str1)
      name = 'facwf'
      call strtoarr(name, grids2d_name(19), n_str2)
      grids2d(:,:,19) = sfcdata%facwf
      desc = 'surface layer friction velocity (m/s)'
      call strtoarr(desc, grids2d_desc(20), n_str1)
      name = 'uustar'
      call strtoarr(name, grids2d_name(20), n_str2)
      grids2d(:,:,20) = sfcdata%uustar
      desc = 'F_m parameter from PBL scheme = LOG((Z0MAX(I)+Z1(I)) / Z0MAX(I))'
      call strtoarr(desc, grids2d_desc(21), n_str1)
      name = 'ffmm'
      call strtoarr(name, grids2d_name(21), n_str2)
      grids2d(:,:,21) = sfcdata%ffmm
      desc = 'F_h parameter from PBL scheme = LOG((ZTMAX(I)+Z1(I)) / ZTMAX(I))'
      call strtoarr(desc, grids2d_desc(22), n_str1)
      name = 'ffhh'
      call strtoarr(name, grids2d_name(22), n_str2)
      grids2d(:,:,22) = sfcdata%ffhh
      desc = 'sea-ice thickness'
      call strtoarr(desc, grids2d_desc(23), n_str1)
      name = 'hice'
      call strtoarr(name, grids2d_name(23), n_str2)
      grids2d(:,:,23) = sfcdata%hice
      desc = 'sea-ice concentration'
      call strtoarr(desc, grids2d_desc(24), n_str1)
      name = 'fice'
      call strtoarr(name, grids2d_name(24), n_str2)
      grids2d(:,:,24) = sfcdata%fice
      desc = 'sea-ice temperature'
      call strtoarr(desc, grids2d_desc(25), n_str1)
      name = 'tisfc'
      call strtoarr(name, grids2d_name(25), n_str2)
      grids2d(:,:,25) = sfcdata%tisfc
      desc = 'accumulated total precipitation (kg/m2) '
      call strtoarr(desc, grids2d_desc(26), n_str1)
      name = 'tprcp'
      call strtoarr(name, grids2d_name(26), n_str2)
      grids2d(:,:,26) = sfcdata%tprcp
      desc = 'snow/rain flag for precipitation (0 rain, 1 snow)'
      call strtoarr(desc, grids2d_desc(27), n_str1)
      name = 'srflag'
      call strtoarr(name, grids2d_name(27), n_str2)
      grids2d(:,:,27) = sfcdata%srflag
      desc = 'actual snow depth (mm) over land/sea ice'
      call strtoarr(desc, grids2d_desc(28), n_str1)
      name = 'snwdph'
      call strtoarr(name, grids2d_name(28), n_str2)
      grids2d(:,:,28) = sfcdata%snwdph
      desc = 'minimum areal coverage of green veg'
      call strtoarr(desc, grids2d_desc(29), n_str1)
      name = 'shdmin'
      call strtoarr(name, grids2d_name(29), n_str2)
      grids2d(:,:,29) = sfcdata%shdmin
      desc = 'maximum areal coverage of green veg'
      call strtoarr(desc, grids2d_desc(30), n_str1)
      name = 'shdmax'
      call strtoarr(name, grids2d_name(30), n_str2)
      grids2d(:,:,30) = sfcdata%shdmax
      desc = 'integer class of sfc slope '
      call strtoarr(desc, grids2d_desc(31), n_str1)
      name = 'slope'
      call strtoarr(name, grids2d_name(31), n_str2)
      grids2d(:,:,31) = sfcdata%slope
      desc = 'maximum (deep) snow albedo'
      call strtoarr(desc, grids2d_desc(32), n_str1)
      name = 'snoalb'
      call strtoarr(name, grids2d_name(32), n_str2)
      grids2d(:,:,32) = sfcdata%snoalb
      desc = 'soil temperature in K'
      call strtoarr(desc, grids3d_desc(1), n_str1)
      name = 'stc'
      call strtoarr(name, grids3d_name(1), n_str2)
      grids3d(:,:,:,1) = sfcdata%stc
      desc = 'soil volumetric water content (fraction)'
      call strtoarr(desc, grids3d_desc(2), n_str1)
      name = 'smc'
      call strtoarr(name, grids3d_name(2), n_str2)
      grids3d(:,:,:,2) = sfcdata%smc
      desc = 'liquid soil moisture content (fraction)'
      call strtoarr(desc, grids3d_desc(3), n_str1)
      name = 'slc'
      call strtoarr(name, grids3d_name(3), n_str2)
      grids3d(:,:,:,3) = sfcdata%slc
    end subroutine read_griddata

    subroutine strtoarr(strin, chararr, n_str)
      integer, intent(in) :: n_str
      character(len=n_str), intent(in) :: strin
      character(len=n_str), intent(out) ::  chararr
      integer :: j
      do j=1,len_trim(trim(adjustl(strin)))
         chararr(j:j) = strin(j:j)
      enddo
    end subroutine strtoarr

    subroutine set_lonsperlat(nlat, octahedral)
      integer, intent(in) :: nlat
      logical, optional :: octahedral
      integer :: i

      logical :: octahedral_local=.false.

      if (present(octahedral)) octahedral_local = octahedral

      allocate(lonsperlat(nlat))

        if (.not. octahedral_local) then
            select case(nlat)
               case(94)
                 lonsperlat(1:nlat/2) =                                     &
                 [30,  30,  30,  40,  48,  56,  60,  72,  72,  80,  90,  90,  &
                  96, 110, 110, 120, 120, 128, 144, 144, 144, 144, 154, 160,  &
                  160, 168, 168, 180, 180, 180, 180, 180, 180, 192, 192, 192, &
                  192, 192, 192, 192, 192, 192, 192, 192, 192, 192, 192]

                case(190)
                   lonsperlat(1:nlat/2) =                                     &
                   [ 30,   30,   36,   48,   56,   60,   72,   72,   80,   90,      &
                    96,  110,  110,  120,  120,  128,  144,  144,  154,  160,      &
                   160,  180,  180,  180,  192,  192,  210,  210,  220,  220,      &
                   240,  240,  240,  240,  240,  252,  256,  280,  280,  280,      &
                   280,  288,  288,  288,  288,  308,  308,  308,  320,  320,      &
                   320,  320,  330,  330,  360,  360,  360,  360,  360,  360,      &
                   360,  360,  360,  360,  360,  360,  384,  384,  384,  384,      &
                   384,  384,  384,  384,  384,  384,  384,  384,  384,  384,      &
                   384,  384,  384,  384,  384,  384,  384,  384,  384,  384,      &
                   384,  384,  384,  384,  384]
 
 
                case(256)
                   lonsperlat(1:nlat/2) =                                     &
                   [48,  48,  48,  48,  48,  56,  60,  72,  72,  80,  90,  96,      &
                  110, 110, 120, 120, 128, 144, 144, 144, 154, 160, 168, 180,      &
                  180, 180, 192, 210, 210, 220, 220, 240, 240, 240, 240, 240,      &
                  252, 256, 280, 280, 280, 288, 288, 288, 308, 308, 320, 320,      &
                  320, 320, 330, 360, 360, 360, 360, 360, 360, 360, 384, 384,      &
                  384, 384, 384, 384, 420, 420, 420, 440, 440, 440, 440, 440,      &
                  440, 440, 440, 440, 462, 462, 462, 462, 462, 480, 480, 480,      &
                  480, 480, 480, 480, 480, 480, 480, 480, 504, 504, 504, 504,      &
                  504, 504, 504, 504, 504, 512, 512, 512, 512, 512, 512, 512,      &
                  512, 512, 512, 512, 512, 512, 512, 512, 512, 512, 512, 512,      &
                  512, 512, 512, 512, 512, 512, 512, 512]
 
                case(288)
                   lonsperlat(1:nlat/2) =                                     &
                  [64,  64,  64,  64,  64,  64,  64,  70,  80,  84,                 &
                  88, 110, 110, 110, 120, 126, 132, 140, 144, 154,                 &
                 160, 168, 176, 176, 192, 192, 198, 210, 210, 220,                 &
                 220, 240, 240, 240, 252, 252, 256, 264, 280, 280,                 &
                 280, 288, 308, 308, 308, 320, 320, 320, 330, 336,                 &
                 352, 352, 352, 352, 360, 384, 384, 384, 384, 384,                 &
                 396, 396, 420, 420, 420, 420, 420, 440, 440, 440,                 &
                 440, 440, 448, 448, 462, 462, 462, 480, 480, 480,                 &
                 480, 480, 504, 504, 504, 504, 504, 504, 504, 512,                 &
                 512, 528, 528, 528, 528, 528, 528, 560, 560, 560,                 &
                 560, 560, 560, 560, 560, 560, 560, 560, 560, 560,                 &
                 560, 576, 576, 576, 576, 576, 576, 576, 576, 576,                 &
                 576, 576, 576, 576, 576, 576, 576, 576, 576, 576,                 &
                 576, 576, 576, 576, 576, 576, 576, 576, 576, 576,                 &
                 576, 576, 576, 576]
 
                case(384)
                   lonsperlat(1:nlat/2) =                                     &
                    [64,   64,   64,   64,   64,   64,   72,   72,   80,   90,      &
                    96,  110,  110,  120,  120,  128,  144,  144,  154,  160,      &
                   168,  180,  180,  180,  192,  192,  210,  220,  220,  240,      &
                   240,  240,  240,  252,  256,  280,  280,  280,  288,  288,      &
                   288,  308,  308,  320,  320,  320,  330,  360,  360,  360,      &
                   360,  360,  360,  384,  384,  384,  384,  420,  420,  420,      &
                   440,  440,  440,  440,  440,  440,  462,  462,  462,  480,      &
                   480,  480,  480,  480,  480,  504,  504,  504,  504,  512,      &
                   512,  560,  560,  560,  560,  560,  560,  576,  576,  576,      &
                   576,  576,  576,  576,  576,  616,  616,  616,  616,  616,      &
                   616,  640,  640,  640,  640,  640,  640,  640,  640,  640,      &
                   640,  660,  660,  660,  720,  720,  720,  720,  720,  720,      &
                   720,  720,  720,  720,  720,  720,  720,  720,  720,  720,      &
                   720,  720,  720,  720,  720,  720,  720,  720,  768,  768,      &
                   768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
                   768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
                   768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
                   768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
                   768,  768,  768,  768,  768,  768,  768,  768,  768,  768,      &
                   768,  768]
 
                case(576)
                   lonsperlat(1:nlat/2) =                                     &
                  [ 64,  64,  64,  64,  64,  64,  64,  70,  80,  84,                &
                   88,  96, 110, 110, 120, 126, 132, 140, 144, 154,                &
                  160, 168, 176, 180, 192, 192, 198, 210, 220, 220,                &
                  224, 240, 240, 252, 252, 256, 264, 280, 280, 280,                &
                  288, 308, 308, 308, 320, 320, 330, 336, 352, 352,                &
                  352, 360, 384, 384, 384, 384, 396, 396, 420, 420,                &
                  420, 420, 440, 440, 440, 448, 448, 462, 462, 480,                &
                  480, 480, 504, 504, 504, 504, 512, 528, 528, 528,                &
                  560, 560, 560, 560, 560, 560, 576, 576, 616, 616,                &
                  616, 616, 616, 616, 616, 616, 630, 630, 640, 640,                &
                  660, 660, 660, 660, 672, 672, 704, 704, 704, 704,                &
                  704, 704, 720, 720, 720, 768, 768, 768, 768, 768,                &
                  768, 768, 768, 768, 768, 792, 792, 792, 792, 792,                &
                  840, 840, 840, 840, 840, 840, 840, 840, 840, 840,                &
                  880, 880, 880, 880, 880, 880, 880, 880, 880, 880,                &
                  896, 896, 896, 896, 924, 924, 924, 924, 924, 924,                &
                  960, 960, 960, 960, 960, 960, 960, 960, 960, 960,                &
                  990, 990, 990, 990, 990, 990, 990, 990,1008,1008,                &
                 1008,1008,1008,1008,1024,1024,1024,1024,1024,1024,                &
                 1056,1056,1056,1056,1056,1056,1056,1056,1056,1056,                &
                 1120,1120,1120,1120,1120,1120,1120,1120,1120,1120,                &
                 1120,1120,1120,1120,1120,1120,1120,1120,1120,1120,                &
                 1120,1120,1120,1120,1120,1120,1120,1120,1120,1120,                &
                 1120,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
                 1152,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
                 1152,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
                 1152,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
                 1152,1152,1152,1152,1152,1152,1152,1152,1152,1152,                &
                 1152,1152,1152,1152,1152,1152,1152,1152]
 
                case(766)
                   lonsperlat(1:nlat/2) =                                     &
                   [ 64,   64,   64,   64,   64,   64,   72,   72,   80,   90,      &
                    96,  110,  110,  120,  120,  128,  144,  144,  154,  160,      &
                   168,  180,  180,  180,  192,  210,  210,  220,  220,  240,      &
                   240,  240,  240,  252,  256,  280,  280,  288,  288,  288,      &
                   308,  308,  320,  320,  320,  330,  360,  360,  360,  360,      &
                   360,  384,  384,  384,  384,  420,  420,  440,  440,  440,      &
                   440,  440,  440,  462,  462,  462,  480,  480,  480,  480,      &
                   504,  504,  504,  504,  512,  512,  560,  560,  560,  560,      &
                   576,  576,  576,  576,  576,  576,  616,  616,  616,  616,      &
                   640,  640,  640,  640,  640,  640,  640,  660,  720,  720,      &
                   720,  720,  720,  720,  720,  720,  720,  720,  720,  720,      &
                   720,  768,  768,  768,  768,  768,  768,  768,  768,  840,      &
                   840,  840,  840,  840,  840,  840,  840,  880,  880,  880,      &
                   880,  880,  880,  880,  880,  880,  880,  924,  924,  924,      &
                   924,  924,  924,  924,  960,  960,  960,  960,  960,  960,      &
                   960,  960,  960,  960,  960,  990,  990,  990, 1008, 1008,      &
                  1008, 1008, 1008, 1024, 1024, 1024, 1024, 1024, 1120, 1120,      &
                  1120, 1120, 1120, 1120, 1120, 1120, 1120, 1120, 1120, 1120,      &
                  1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152, 1152,      &
                  1152, 1152, 1152, 1152, 1152, 1152, 1232, 1232, 1232, 1232,      &
                  1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232, 1260, 1260,      &
                  1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260,      &
                  1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1320,      &
                  1320, 1320, 1320, 1386, 1386, 1386, 1386, 1386, 1386, 1386,      &
                  1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386,      &
                  1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440,      &
                  1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440,      &
                  1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440, 1440,      &
                  1440, 1440, 1440, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
                  1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
                  1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
                  1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
                  1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
                  1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
                  1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
                  1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
                  1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
                  1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
                  1536, 1536, 1536]
 

                case(880)
                  lonsperlat(1:nlat/2) =                                     &
                  [ 18,   28,   32,   42,   48,   56,   64,   72,   80,   84,      &
                    90,  110,  110,  110,  120,  126,  132,  140,  144,  154,      &
                   160,  168,  176,  176,  192,  192,  198,  210,  210,  220,      &
                   224,  240,  240,  252,  252,  256,  264,  280,  280,  288,      &
                   288,  308,  308,  308,  320,  320,  330,  330,  352,  352,      &
                   352,  360,  384,  384,  384,  384,  396,  396,  420,  420,      &
                   420,  420,  440,  440,  440,  448,  462,  462,  462,  480,      &
                   480,  480,  504,  504,  504,  504,  512,  528,  528,  528,      &
                   560,  560,  560,  560,  560,  576,  576,  576,  616,  616,      &
                   616,  616,  616,  616,  630,  630,  630,  640,  660,  660,      &
                   660,  660,  672,  672,  704,  704,  704,  704,  704,  720,      &
                   720,  720,  768,  768,  768,  768,  768,  768,  768,  768,      &
                   770,  792,  792,  792,  792,  840,  840,  840,  840,  840,      &
                   840,  840,  840,  880,  880,  880,  880,  880,  880,  880,      &
                   896,  896,  896,  896,  924,  924,  924,  924,  924,  960,      &
                   960,  960,  960,  960,  960,  960,  990,  990,  990,  990,      &
                   990, 1008, 1008, 1008, 1008, 1024, 1024, 1024, 1056, 1056,      &
                  1056, 1056, 1056, 1056, 1120, 1120, 1120, 1120, 1120, 1120,      &
                  1120, 1120, 1120, 1120, 1120, 1120, 1120, 1152, 1152, 1152,      &
                  1152, 1152, 1152, 1152, 1232, 1232, 1232, 1232, 1232, 1232,      &
                  1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232,      &
                  1232, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1280, 1280,      &
                  1280, 1280, 1280, 1320, 1320, 1320, 1320, 1320, 1320, 1320,      &
                  1320, 1320, 1344, 1344, 1344, 1344, 1344, 1344, 1386, 1386,      &
                  1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386, 1386, 1408,      &
                  1408, 1408, 1408, 1408, 1440, 1440, 1440, 1440, 1440, 1440,      &
                  1440, 1440, 1440, 1440, 1536, 1536, 1536, 1536, 1536, 1536,      &
                  1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
                  1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536, 1536,      &
                  1536, 1536, 1536, 1536, 1584, 1584, 1584, 1584, 1584, 1584,      &
                  1584, 1584, 1584, 1584, 1584, 1584, 1584, 1584, 1584, 1584,      &
                  1584, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680,      &
                  1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680,      &
                  1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680,      &
                  1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680,      &
                  1680, 1680, 1680, 1680, 1680, 1680, 1680, 1680, 1760, 1760,      &
                  1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
                  1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
                  1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
                  1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
                  1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
                  1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
                  1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760,      &
                  1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760, 1760]
                case default
                    call mpp_error(FATAL,"unsupported nlat")
            end select 
        else
            ! Octahedral reduced grid (ECMWF)
            lonsperlat(1) = 20
            do i = 2, nlat/2
                lonsperlat(i) = lonsperlat(i-1) + 4
            enddo
        endif

        do i = 1, nlat/2
            lonsperlat(nlat-i+1) = lonsperlat(i)
        end do

    end subroutine 

end program sfc_ini
