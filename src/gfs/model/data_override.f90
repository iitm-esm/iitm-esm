module data_override_mod
  use resol_def, only : lonr, latr, levs
  use layout1, only : ipt_lats_node_r, me, lats_node_r
  use time_manager_mod, only: time_type, operator(>=), get_date
  use nc_io_mod, only: nc_open_read, nc_get_info, nc_io_read
  use time_interp_mod, only: time_interp
  use error_mod, only: handle_error, FATAL, WARNING
  use interpred_mod, only: interp2reduced,interp2reduced_discrete
  use stringfunc, only : to_lower

  implicit none
  private
  integer :: max_table=100
  character (len=4) :: lon_name='lon', lat_name='lat', time_name='time'
  integer, allocatable :: lat_index_node(:)
  integer :: table_size=0, num_files=0, num_fields=0
  integer :: num_io_buffers=-1
  logical :: debug_data_override=.false., module_is_initialized=.false.
  integer, allocatable :: ov_global_lats_r(:), ov_lonsperlar(:)
  character(len=512) :: msg

  namelist/data_override_nml/debug_data_override, num_io_buffers, max_table

  type, private :: ext_fieldtype
    integer :: unit ! keep unit open when not reading all records
    character(len=128) :: name
    type(time_type), allocatable :: time(:)
    logical :: modulo_time ! denote climatological time axis
    logical :: flip_y
    real, allocatable :: data (:,:,:,:)
    real, allocatable :: buf2d (:,:,:)
    integer :: ntime, nlon, nlat, nbuf, varid, nlev
    integer, allocatable :: ibuf(:), ilat(:)
  end type ext_fieldtype

  type :: file_type
    character (len=512) :: filename
    integer :: unit
  end type file_type

  type data_table_type
   character(len=128) :: fieldname_code !fieldname used in user's code (model)
   character(len=128) :: fieldname_file ! fieldname used in the netcdf data file
   character(len=512) :: file_name   ! name of netCDF data file
   real               :: factor ! For unit conversion, default=1
   integer            :: field_id
  end type data_table_type

  type(ext_fieldtype),allocatable :: field(:)
  type(file_type), allocatable :: opened_files(:)
  type(data_table_type), allocatable :: data_table(:)

  interface data_override
    module procedure data_override_2d
    module procedure data_override_3d
  end interface data_override
 
  public :: init_data_override, data_override
    
  contains
  
  subroutine init_data_override (global_lats_r, lonsperlar)
    integer, intent(in) :: global_lats_r(latr), lonsperlar(latr)
    integer :: i
    
    allocate(ov_global_lats_r(latr), &
             ov_lonsperlar(latr))
    ov_global_lats_r(:) = global_lats_r(:)
    ov_lonsperlar(:) = lonsperlar(:)

    allocate(lat_index_node(lats_node_r))
    do i=0,lats_node_r-1
      lat_index_node(i+1)=global_lats_r(ipt_lats_node_r+i)
    end do

    open(10,file='gfs_namelist')
    read(10,nml=data_override_nml)    
    if(me==0) write(*,nml=data_override_nml)       
    allocate(field(max_table), opened_files(max_table), data_table(max_table))
    call read_atm_data_table
    module_is_initialized=.true.

  end subroutine init_data_override

  subroutine read_atm_data_table
    type table_entry_type
     character(len=128) :: fieldname_code !fieldname used in user's code (model)
     character(len=128) :: fieldname_file ! fieldname used in the netcdf data file
     character(len=512) :: file_name   ! name of netCDF data file
     real               :: factor ! For unit conversion, default=1
    end type table_entry_type
    type (table_entry_type) :: entry1
    integer :: ntable, iunit, iostats, i
    character(len=256) :: record
    iunit=10
    open(iunit, file='atm_data_table')
    ntable = 0
    do while (.true.)
      read(iunit,'(a)',iostat=iostats) record
      if(iostats<0) exit
      if(iostats>0) call handle_error(FATAL, 'Error while reading atm_data_table')
      if (record(1:1) == '#') cycle
      if (record(1:10) == '          ') cycle
      ntable=ntable+1 
      if (ntable > max_table) call handle_error(FATAL, 'No: of entries in atm_data_table is more than the max_table. '//&
                                                       'Increase the max_table value in namelist')
      read(record,*,iostat=iostats) entry1
      if(iostats/=0) call handle_error(FATAL, 'Error while reading atm_data_table')
      data_table(ntable)%fieldname_code=trim(adjustl(entry1%fieldname_code))
      data_table(ntable)%fieldname_file=trim(adjustl(entry1%fieldname_file))
      data_table(ntable)%file_name=trim(adjustl(entry1%file_name))
      data_table(ntable)%factor=entry1%factor
      data_table(ntable)%field_id=0
    enddo
    table_size = ntable
    close(iunit)
    if(debug_data_override) then
      if(me==0) then
        print *, "atm_data_table :"
        do i=1,table_size
          print *, data_table(i) 
        enddo
      endif
    endif
  end subroutine read_atm_data_table

  subroutine data_override_3d(fieldname_code,data1,time,data_index,override)
    character(len=*), intent(in) :: fieldname_code ! field name as used in the model
    logical, intent(out), optional :: override ! true if the field has been overriden succesfully
    type(time_type), intent(in) :: time !(target) model time
    integer, intent(inout), optional :: data_index
    real, dimension(:,:,:), intent(out) :: data1 !data returned by this call

    real, dimension (size(data1,1),size(data1,2),size(data1,3)) :: data
    character(len=512) :: filename !file containing source data
    character(len=128) :: fieldname ! fieldname used in the data file
    integer :: i
    integer :: index1 ! field index in data_table
    integer :: id_time !index for time interp in override array
    real :: factor
    
    if(.not.module_is_initialized) &
      call handle_error(FATAL, 'Error: need to call data_override_init first')
  
    !1  Look  for the data file in data_table 
    if(present(override)) override = .false.

    if (present(data_index).and.(data_index>0)) then
      index1 = data_index
    elseif (present(data_index).and.(data_index==-1)) then
      if(debug_data_override) &
          call handle_error(WARNING, 'this field is NOT found in data_table:'//trim(fieldname_code))
         return  ! NO override was performed
    else
      index1 = -1
      do i = 1, table_size
         if( trim(fieldname_code) /= trim(data_table(i)%fieldname_code)) cycle
         index1 = i                               ! field found        
         exit
      enddo
      if(present(data_index)) data_index=index1
      if(index1 .eq. -1) then
         if(debug_data_override) &
          call handle_error(WARNING, 'this field is NOT found in data_table: '//trim(fieldname_code))
         return  ! NO override was performed
      endif
    endif
     
    fieldname = data_table(index1)%fieldname_file ! fieldname in netCDF data file
    factor = data_table(index1)%factor
  
    if(fieldname == "") then
       data1 = factor
       if(PRESENT(override)) override = .true.
       if(debug_data_override) call handle_error (WARNING,'Overridden '// trim(fieldname_code) // &
         ' with constant value')
       return
    else
       filename = data_table(index1)%file_name
       if (filename == "") call handle_error(FATAL,'data_override: filename not given in data_table')
    endif  
  
    if(data_table(index1)%field_id<=0) then ! the field has not been processed previously
      !4 get index for time interp   
      id_time = init_external_field(filename,fieldname,nlev=size(data1,3),verbose=.false.)
      data_table(index1)%field_id=id_time
    endif
  
    !10 do time interp to get data in compute_domain
    call time_interp_external_3d(data_table(index1)%field_id,time,data,verbose=.false.)

    data1 = data*factor
    
    if(PRESENT(override)) override = .true.
  end subroutine data_override_3d

  subroutine data_override_2d(fieldname_code,data1,time,data_index,override,discrete_type)
    character(len=*), intent(in) :: fieldname_code ! field name as used in the model
    logical, intent(out), optional :: override ! true if the field has been overriden succesfully
    type(time_type), intent(in) :: time !(target) model time
    integer, intent(inout), optional :: data_index
    logical, intent(in), optional :: discrete_type
    real, dimension(lonr,lats_node_r), intent(out) :: data1 !data returned by this call

    real, dimension(lonr,lats_node_r) :: data
    character(len=512) :: filename !file containing source data
    character(len=128) :: fieldname ! fieldname used in the data file
    integer :: i
    integer :: index1 ! field index in data_table
    integer :: id_time !index for time interp in override array
    real :: factor
    logical :: dis_type
    logical :: verb
  
    if(.not.module_is_initialized) &
      call handle_error(FATAL, 'Error: need to call data_override_init first')
  
    !1  Look  for the data file in data_table 
    if(present(override)) override = .false.

    dis_type = .false.

    if (present(discrete_type)) dis_type = discrete_type

    if (present(data_index).and.(data_index>0)) then
      index1 = data_index
    elseif (present(data_index).and.(data_index==-1)) then
      if(debug_data_override) &
          call handle_error(WARNING, 'this field is NOT found in data_table:'//trim(fieldname_code))
         return  ! NO override was performed
    else
      index1 = -1
      do i = 1, table_size
         if( trim(fieldname_code) /= trim(data_table(i)%fieldname_code)) cycle
         index1 = i                               ! field found        
         exit
      enddo
      if(present(data_index)) data_index=index1
      if(index1 .eq. -1) then
         if(debug_data_override) &
          call handle_error(WARNING, 'this field is NOT found in data_table: '//trim(fieldname_code))
         return  ! NO override was performed
      endif
    endif
     
    fieldname = data_table(index1)%fieldname_file ! fieldname in netCDF data file
    factor = data_table(index1)%factor
  
    if(fieldname == "") then
       data1 = factor
       if(PRESENT(override)) override = .true.
       if(debug_data_override) call handle_error (WARNING,'Overridden '// trim(fieldname_code) // &
         ' with constant value')
       return
    else
       filename = data_table(index1)%file_name
       if (filename == "") call handle_error(FATAL,'data_override: filename not given in data_table')
    endif  
  
    if(data_table(index1)%field_id<=0) then ! the field has not been processed previously
      !4 get index for time interp
      verb=.false.
      if(debug_data_override)verb=.true. 
      id_time = init_external_field(filename,fieldname,verbose=verb)
      data_table(index1)%field_id=id_time
    endif
  
    !10 do time interp to get data in compute_domain
    call time_interp_external_2d(data_table(index1)%field_id,time,data,verbose=.false.,discrete_type=dis_type)

    data1 = data*factor
    if (debug_data_override) call handle_error(WARNING,'overridden '//trim(fieldname_code)// &
      ' with '//trim(fieldname)//' from file '//trim(filename))
    if(PRESENT(override)) override = .true.
  end subroutine data_override_2d

  function init_external_field(file,fieldname,nlev,verbose)
    character(len=*), intent(in)            :: file,fieldname
    logical, intent(in), optional           :: verbose 
    integer, intent(in), optional           :: nlev
    
    integer :: init_external_field
    
    integer :: unit,nvar,ntime,i,j, outunit
    logical :: verb, transpose_xy, n2s
    integer :: nfile, nbuf, varid, ndim, nx, ny, nz

    if (.not. module_is_initialized) call handle_error(FATAL,'Must call init_data_override first')

    if (PRESENT(verbose)) verb=verbose

    nfile = 0
    do i=1,num_files
       if(trim(opened_files(i)%filename) == trim(file)) then
          nfile = i
          exit  ! file is already opened
       endif
    enddo

    if(nfile == 0) then      
       !call mpp_open(unit,trim(file),MPP_RDONLY,form,threading=thread,&
       !     fileset=fset)
       call nc_open_read(unit,trim(file))
       num_files = num_files + 1
       opened_files(num_files)%filename = trim(file)
       opened_files(num_files)%unit = unit
    else
       unit = opened_files(nfile)%unit
    endif

    
    transpose_xy = .false.     
    init_external_field = -1

    outunit = 6
    
    if(present(nlev)) then
      call nc_get_info(unit,trim(fieldname),varid=varid, ndim=ndim, &
                                   nx=nx, ny=ny, nz=nz, ntime=ntime, n2s=n2s)

      if (ndim /= 4) call handle_error(FATAL, 'ndims for external field '// &
                                    trim(fieldname)//' should be equal to 4')
      write(msg,*)nlev
      if (nz /= nlev) call handle_error(FATAL, 'nz for external field '// &
                           trim(fieldname)//' .ne. nlev : '//trim(adjustl(msg)))
    else
      call nc_get_info(unit,trim(fieldname),varid=varid, ndim=ndim, &
                                   nx=nx, ny=ny, ntime=ntime, n2s=n2s)
      if (ndim /= 3) call handle_error(FATAL, 'ndims for external field '// &
                                    trim(fieldname)//' should be equal to 3')
    endif

    if (ntime < 1) then
        write(msg,'(a15,a,a58)') 'external field ',trim(fieldname),&
         ' does not have an associated record dimension (REQUIRED) '
        call handle_error(FATAL,trim(msg))
    endif

    if (nx /= lonr) &
      call handle_error(FATAL, 'No of x for external field '//trim(fieldname)//' .ne. nlon')
    
    if (ny /= latr) &
      call handle_error(FATAL, 'No of y for external field '//trim(fieldname)//' .ne. nlat')
    
    if (verb) write(outunit,*) 'found field ',trim(fieldname), ' in file !!'

    num_fields = num_fields + 1
    init_external_field = num_fields
    field(num_fields)%unit = unit
    field(num_fields)%name = trim(fieldname)
    field(num_fields)%ntime = ntime
    field(num_fields)%varid = varid
    field(num_fields)%nlev = 1
    if (present(nlev)) field(num_fields)%nlev = nlev

    if (num_io_buffers == -1) then
       nbuf = min(ntime,2)                 
    else
       if (num_io_buffers .le. 1) call handle_error(FATAL,'time_interp_ext:num_io_buffers should be at least 2')
       nbuf = min(num_io_buffers,ntime)
    endif

    allocate(field(num_fields)%data(lonr,lats_node_r,field(num_fields)%nlev,nbuf))
    field(num_fields)%data = 0.0
    
    allocate(field(num_fields)%buf2d(lonr,lats_node_r,field(num_fields)%nlev))
    field(num_fields)%buf2d = 0.0

    allocate(field(num_fields)%ibuf(nbuf))
    field(num_fields)%ibuf(:) = -1
    field(num_fields)%nbuf =  0

    allocate(field(num_fields)%time(ntime))

    allocate(field(num_fields)%ilat(lats_node_r))
    field(num_fields)%ilat(:)=lat_index_node(:)

    field(num_fields)%nlon=lonr
    field(num_fields)%nlat=latr
    field(num_fields)%flip_y=.not.n2s
    
    call nc_get_info(unit,field(num_fields)%time(:), &
                     field(num_fields)%modulo_time)

    if(ntime == 1) then
       call handle_error(WARNING, 'time_interp_external_mod: file '//trim(file)//'  has only one time level')
    else
      do j=1,ntime-1
         if (field(num_fields)%time(j) >= field(num_fields)%time(j+1)) then
            write(msg,'(A,i20)') "times not monotonically increasing. Filename: " &
                 //TRIM(file)//"  field:  "//TRIM(fieldname)//" timeslice: ", j
            call handle_error(FATAL, trim(msg))
         endif
      enddo
    endif

    return
  end function init_external_field

  subroutine time_interp_external_3d(index, time, data, verbose)
    integer, intent(in) :: index
    type(time_type), intent(in) :: time
    real, dimension(:,:,:), intent(inout) :: data
    logical, intent(in), optional :: verbose
    
    integer :: t1, t2
    integer :: i1, i2, mod_time, outunit
    integer :: yy, mm, dd, hh, min, ss

    real :: w1,w2
    logical :: verb

    outunit = 6

    verb=.false.
    if (PRESENT(verbose)) verb=verbose
    
    if (index < 1.or.index > num_fields) &
         call handle_error(FATAL,'invalid index in call to time_interp_ext -- field was not initialized or failed to initialize')
   
    if (field(index)%ntime == 1) then
       ! only one record in the file => time-independent field
       call load_record(field(index),1)
       data(:,:,:)=field(index)%data(:,:,:,1)
       return
    else
      if(field(index)%modulo_time) then
        mod_time=1
      else
        mod_time=0
      endif
      call time_interp(time,field(index)%time(:),w2,t1,t2,modtime=mod_time)
      w1 = 1.0-w2
      if (verb) then
        call get_date(time,yy,mm,dd,hh,min,ss)
        write(outunit,'(a,i4,a,i2,a,i2,1x,i2,a,i2,a,i2)') &
             'target time yyyy/mm/dd hh:mm:ss= ',yy,'/',mm,'/',dd,hh,':',min,':',ss
        write(outunit,*) 't1, t2, w1, w2= ', t1, t2, w1, w2
      endif
      call load_record(field(index),t1)
      call load_record(field(index),t2)
      i1 = find_buf_index(t1,field(index)%ibuf)
      i2 = find_buf_index(t2,field(index)%ibuf)

       if(i1<0.or.i2<0) &
            call handle_error(FATAL,'time_interp_external : records were not loaded correctly in memory')

       if (verb) then
          write(outunit,*) 'ibuf= ',field(index)%ibuf
          write(outunit,*) 'i1,i2= ',i1, i2
       endif

       data(:,:,:) = field(index)%data(:,:,:,i1)*w1 + &
            field(index)%data(:,:,:,i2)*w2
    endif
  end subroutine time_interp_external_3d

  subroutine time_interp_external_2d(index, time, data, verbose, discrete_type)
    integer, intent(in) :: index
    type(time_type), intent(in) :: time
    real, dimension(:,:), intent(inout) :: data
    logical, intent(in), optional :: verbose
    logical, intent(in), optional :: discrete_type
    
    integer :: t1, t2
    integer :: i1, i2, mod_time, outunit
    integer :: yy, mm, dd, hh, min, ss

    real :: w1,w2
    logical :: verb, dis_type

    outunit = 6

    verb=.false.
    if (PRESENT(verbose)) verb=verbose

    dis_type = .false.
    if (present(discrete_type)) dis_type = discrete_type
    
    if (index < 1.or.index > num_fields) &
         call handle_error(FATAL,'invalid index in call to time_interp_ext -- field was not initialized or failed to initialize')
   
    if (field(index)%ntime == 1) then
       ! only one record in the file => time-independent field
       call load_record(field(index),1)
       data(:,:)=field(index)%data(:,:,1,1)
       return
    else
      if(field(index)%modulo_time) then
        mod_time=1
      else
        mod_time=0
      endif
      call time_interp(time,field(index)%time(:),w2,t1,t2,modtime=mod_time)
      w1 = 1.0-w2
      if (verb) then
        call get_date(time,yy,mm,dd,hh,min,ss)
        write(outunit,'(a,i4,a,i2,a,i2,1x,i2,a,i2,a,i2)') &
             'target time yyyy/mm/dd hh:mm:ss= ',yy,'/',mm,'/',dd,hh,':',min,':',ss
        write(outunit,*) 't1, t2, w1, w2= ', t1, t2, w1, w2
      endif
      call load_record(field(index),t1,dis_type)
      call load_record(field(index),t2,dis_type)
      i1 = find_buf_index(t1,field(index)%ibuf)
      i2 = find_buf_index(t2,field(index)%ibuf)

       if(i1<0.or.i2<0) &
            call handle_error(FATAL,'time_interp_external : records were not loaded correctly in memory')

       if (verb) then
          write(outunit,*) 'ibuf= ',field(index)%ibuf
          write(outunit,*) 'i1,i2= ',i1, i2
       endif

       if (dis_type) then
         data(:,:) = field(index)%data(:,:,1,i1)
       else
         data(:,:) = field(index)%data(:,:,1,i1)*w1 + &
            field(index)%data(:,:,1,i2)*w2
       endif
    endif
  end subroutine time_interp_external_2d

  ! load specified record from file  
  subroutine load_record(field, rec, discrete_type)
    type(ext_fieldtype), intent(inout) :: field
    integer            , intent(in)    :: rec    ! record number
    logical, intent(in), optional :: discrete_type
  
    ! ---- local vars 
    integer :: ib, k ! index in the array of input buffers
    integer :: outunit=6
    integer :: bufi(size(field%data,1),size(field%data,2))
    logical :: dis_type
    integer :: values(13)=(/1,2,3,4,5,6,7,8,9,10,11,12,13/)
   
   dis_type = .false.

    if (present(discrete_type)) dis_type = discrete_type
  
    ib = find_buf_index(rec,field%ibuf)
    if(ib>0) then
       ! do nothing, since field is already in memory
    else
      if (debug_data_override) &
      write(outunit,*) 'going to read record :',rec,'for field :',trim(field%name)

      if (field%nlev==1) then
         call nc_io_read(field%unit,field%varid,field%nlon,field%ilat,rec, &
                                   field%buf2d(:,:,1),field%flip_y,field%nlat)
      elseif (field%nlev>1) then
         call nc_io_read(field%unit,field%varid,field%nlon,field%ilat,rec, &
                         field%nlev,field%buf2d(:,:,:),field%flip_y,field%nlat)
      else
         call handle_error(FATAL, 'Invalid nlev for ext field : '//trim(field%name))
      endif
  
      if (debug_data_override) &
      write(outunit,*) 'read record :',rec,'for field :',trim(field%name)

      ! calculate current buffer number in round-robin fasion
      field%nbuf = field%nbuf + 1
      if(field%nbuf > size(field%data,4).or.field%nbuf <= 0) field%nbuf = 1
  
      ib = field%nbuf
     
      if (.not.dis_type) then
        do k=1,field%nlev
          call interp2reduced(field%buf2d(:,:,k),field%data(:,:,k,ib))
        enddo
        else
        do k=1,field%nlev
          call interp2reduced_discrete(int(field%buf2d(:,:,k)),bufi,values(1:13))
          field%data(:,:,k,ib)=real(bufi(:,:))
        enddo
      endif
       
      field%ibuf(ib) = rec
    endif
  end subroutine load_record

  function find_buf_index(indx,buf)
    integer :: indx
    integer, dimension(:) :: buf
    integer :: find_buf_index
    integer :: nbuf, i

    nbuf = size(buf(:))
    find_buf_index = -1
    do i=1,nbuf
       if (buf(i) == indx) then
          find_buf_index = i
          exit
       endif
    enddo
  end function find_buf_index
end module data_override_mod
