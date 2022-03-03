module write_debug_nc
  use netcdf
  implicit none
  private
  integer :: lonid=0, latid=0, timeid=0, nvar=0, fileid=0
  integer :: nloni=0, nlati=0, stat
  logical :: initialized=.false.
  type field_type
    integer :: varid
    character (len=128) :: name
    integer :: tstep
  end type field_type

  type(field_type) :: field(100)

  public :: init_write_debug, write_debug, end_write_debug
  contains

  subroutine init_write_debug(nlon,nlat)
    integer, intent(in) :: nlon, nlat
    if(initialized) return
    field(:)%varid=0
    field(:)%name=""
    field(:)%tstep=0
    nloni=nlon
    nlati=nlat
    stat=nf90_create('coupler_debug.nc',nf90_clobber,fileid)
    call handle_err(stat)
    stat = nf90_def_dim(fileid, "lat", nlat, latid)
    call handle_err(stat)
    stat = nf90_def_dim(fileid, "lon", nlon, lonid)
    call handle_err(stat)
    stat = nf90_def_dim(fileid, "time", nf90_unlimited, timeid)
    call handle_err(stat)
    stat = nf90_enddef(fileid)
    call handle_err(stat)
    initialized=.true.
  end subroutine init_write_debug
  
  subroutine end_write_debug
    stat=nf90_close(fileid)
    call handle_err(stat)
  end subroutine end_write_debug
  
  subroutine write_debug(varname, var)
    character (len=*) :: varname
    real (kind=8) :: var(:,:)
    integer :: i, ii

    if(.not.initialized) then
      print *, 'write_debug: module not initialized'
      stop 'write_debug: module not initialized'
    endif
  
    ii=0 
    do i=1, nvar
      if(field(i)%name==varname) then
        ii=i 
        exit
      endif
    enddo

    if (ii<=0) then
      nvar=nvar+1

      stat = nf90_redef(fileid)
      call handle_err(stat)
      stat = nf90_def_var(fileid,trim(varname),nf90_double,(/lonid,latid,timeid/), field(nvar)%varid)
      call handle_err(stat)
      stat = nf90_enddef(fileid)
      call handle_err(stat)

      field(nvar)%name=trim(varname)
      ii=nvar
    endif
    
    field(ii)%tstep=field(ii)%tstep+1
    stat = nf90_put_var(fileid,field(ii)%varid,var,start=(/1,1,field(ii)%tstep/),count=(/nloni,nlati,1/))
    call handle_err(stat)
    stat = nf90_sync(fileid)
    call handle_err(stat)
  end subroutine write_debug

  subroutine handle_err(stat)
    integer, intent ( in) :: stat
    if(stat /= nf90_noerr) then
      print *, trim(nf90_strerror(stat))
      stop 'coupler: netcdf error'
    end if
  end subroutine handle_err
end module write_debug_nc
