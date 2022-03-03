module nc_io_mod
  use netcdf
  use time_manager_mod, only : time_type, set_date, print_date
  use time_manager_mod, only : days_in_month
  use error_mod, only : handle_error, FATAL, WARNING
  implicit none
  private
  interface nc_get_info
    module procedure nc_get_info_2
    module procedure nc_get_info_3
  end interface nc_get_info

  interface nc_io_read
    module procedure nc_io_read_2d
    module procedure nc_io_read_3d
  end interface nc_io_read

  public :: nc_get_info, nc_open_read, nc_io_read, nc_close
  contains

  subroutine nc_open_read(unit, file)
    character (len=*), intent(in) :: file
    integer, intent(out) :: unit
    integer :: stat

    stat = nf90_open(file,NF90_NOWRITE,unit)
    call handle_ncerr(stat,file)
  end subroutine nc_open_read

  subroutine nc_close(unit)
    integer, intent(in) :: unit
    integer :: stat
    stat = nf90_close(unit)
    call handle_ncerr(stat)
  end subroutine nc_close

  subroutine nc_get_info_2(unit, varname, varid, ndim, nx, ny, nz, ntime, n2s)
    integer, intent(in) :: unit
    character (len=*), intent(in) :: varname
    integer, intent(out), optional :: varid, nx, ny, nz, ndim, ntime
    logical, intent(out), optional :: n2s
    integer :: varid1, ndim1
    integer, allocatable :: dimid(:)
    real :: y_val(2)
    character (len=NF90_MAX_NAME) :: name
    integer :: stat
    
    stat=nf90_inq_varid(unit, varname, varid1)
    call handle_ncerr(stat,varname)

    if(present(varid))varid=varid1

    stat=nf90_inquire_variable(unit, varid1, ndims=ndim1)
    call handle_ncerr(stat,varname)

    if(present(ndim)) ndim=ndim1

    allocate(dimid(ndim1))
    
    stat=nf90_inquire_variable(unit, varid1, dimids=dimid)
    call handle_ncerr(stat,varname)

    if(present(nx)) then
      nx=-1
      stat=nf90_inquire_dimension(unit, dimid(1), len=nx)
      call handle_ncerr(stat,varname)
    endif

    if(present(ny)) then
      ny=-1
      stat=nf90_inquire_dimension(unit, dimid(2), len=ny)
      call handle_ncerr(stat,varname)
    endif

    if(present(nz)) then
      nz=-1
      stat=nf90_inquire_dimension(unit, dimid(3), len=nz)
      call handle_ncerr(stat,varname)
    endif

    if(present(n2s)) then
      n2s=.false.
      
      stat=nf90_inquire_dimension(unit, dimid(2), name=name)
      call handle_error(stat, trim(varname)//':'//trim(name))
      
      stat=nf90_inq_varid(unit, name, varid1)
      call handle_error(stat, trim(varname)//':'//trim(name))
      
      stat=nf90_get_var(unit,varid1,y_val(:),start=(/1/),count=(/2/))
      call handle_error(stat, trim(varname)//':'//trim(name))
      
      if(y_val(1)>y_val(2)) n2s=.true.
    endif

    if(present(ntime)) then
      ntime=-1
      stat=nf90_inquire_dimension(unit, dimid(ndim1), name=name)
      call handle_error(stat, trim(varname)//':'//trim(name))
      if(trim(name)/='time') &
        call handle_error(FATAL, 'time coord not found for Variable: '//trim(varname))

      stat=nf90_inq_varid(unit, name, varid1)
      call handle_error(stat, trim(varname)//':'//trim(name))

      stat=nf90_inquire_dimension(unit, dimid(ndim1), len=ntime)
      call handle_ncerr(stat,trim(varname)//':time')
    endif
    
    deallocate(dimid)
  end subroutine nc_get_info_2

  subroutine nc_get_info_3(unit, time, modulo_time)
    integer, intent(in) :: unit
    type (time_type), intent(out) :: time(:)
    logical, intent(out) :: modulo_time
    real (kind=8), dimension(size(time,1)) :: rdate 
    character (len=128) :: att
    integer :: stat, varid
    integer :: i
    logical :: isday=.true.

    modulo_time=.false. 

    stat=nf90_inq_varid(unit,'time', varid)
    call handle_ncerr(stat,'time')
 
    stat=nf90_get_att(unit, varid, 'units', att)
    call handle_ncerr(stat,'time:units')

    if(trim(att)=='day as %Y%m%d.%f') then
      isday=.true.
    elseif (trim(att)=='month as %Y%m.%f') then
      isday=.false.
    else
      call handle_error(WARNING,'time encoding should be absolute')
      call handle_error(FATAL,'time unit must be "day as %Y%m%d.%f" or "month as%Y%m.%f"')
    endif

    stat=nf90_get_var(unit, varid, rdate, start=(/1/),count=(/(size(time,1))/))
    call handle_ncerr(stat)
    do i=1,size(time,1)
      call set_r_date(rdate(i),time(i),isday)
    enddo
   
    stat=nf90_get_att(unit, varid, 'modulo', att)
    if(stat==nf90_noerr) modulo_time=.true.
    
  end subroutine nc_get_info_3

  subroutine nc_io_read_2d( unit, varid, nlon, ilat, rec, data2d, flip_y, nlat)
    integer, intent(in) :: unit, varid, nlon, ilat(:), rec
    logical, intent(in), optional :: flip_y
    integer, intent(in), optional :: nlat
    real (kind=8), intent(out) :: data2d(:,:)
    integer :: stat, i, iilat
    logical :: flip_y1

    flip_y1=.false.
    if(present(flip_y).and.present(nlat)) flip_y1=flip_y
    if(present(flip_y).and.(.not.present(nlat))) &
     call handle_error(FATAL,"nc_io_read: Present flip_y but not nlat")

    do i=1,size(ilat,1)
      iilat=ilat(i)
      if(flip_y1) iilat=nlat-iilat+1
      stat=nf90_get_var(unit, varid, data2d(:,i), start=(/1,iilat,rec/),count=(/nlon,1,1/))
      call handle_ncerr(stat)
    enddo
  end subroutine nc_io_read_2d

  subroutine nc_io_read_3d( unit, varid, nlon, ilat, rec, nlev, data3d, flip_y, nlat)
    integer, intent(in) :: unit, varid, nlon, ilat(:), rec, nlev
    logical, intent(in), optional :: flip_y
    integer, intent(in), optional :: nlat
    real (kind=8), intent(out) :: data3d(:,:,:)
    integer :: stat, i, iilat
    logical :: flip_y1

    flip_y1=.false.
    if(present(flip_y).and.present(nlat)) flip_y1=flip_y
    if(present(flip_y).and.(.not.present(nlat))) &
     call handle_error(FATAL,"nc_io_read: Present flip_y but not nlat")

    do i=1,size(ilat,1)
      iilat=ilat(i)
      if(flip_y1) iilat=nlat-iilat+1
      stat=nf90_get_var(unit, varid, data3d(:,i,:), start=(/1,iilat,1,rec/),count=(/nlon,1,nlev,1/))
      call handle_ncerr(stat)
    enddo
  end subroutine nc_io_read_3d

  subroutine set_r_date(rdate,time,isday)
    real(kind=8), intent(in) :: rdate
    type(time_type),intent(out) :: time
    logical, intent(in) :: isday
    character (len=16) :: cdate
    integer :: yy,mm,dd,secs
    real :: rsecs,rdd,ndays
    if(isday) then
      write(cdate,'(f16.7)') rdate
      read(cdate,'(I4,I2,I2,f8.7)')yy,mm,dd,rsecs
      secs=int(rsecs*24*3600)
      time=set_date(yy,mm,dd,second=secs)
    else
      write(cdate,'(f16.9)')rdate
      read(cdate,'(I4,I2,f10.9)')yy,mm,rdd
      time=set_date(yy,mm,1)
      ndays=days_in_month(time)
      dd=int(ndays*rdd)
      time=set_date(yy,mm,dd)
    endif
  end subroutine set_r_date

  subroutine handle_ncerr(stat,msg)
    integer, intent (in) :: stat
    character(len=*), intent (in), optional :: msg

    if(stat /= nf90_noerr) then
      if(present(msg)) then
        print *, trim(nf90_strerror(stat))//':'//trim(msg)
      else
        print *, trim(nf90_strerror(stat))
      endif
      call handle_error(FATAL,trim(nf90_strerror(stat)))
    end if
  end subroutine handle_ncerr

end module nc_io_mod
