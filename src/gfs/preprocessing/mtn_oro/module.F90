module module_mod
    use mpp_mod, only: mpp_init, mpp_exit
    use mpp_io_mod, only: fieldtype, axistype, mpp_write_meta, mpp_write, mpp_open, &
            mpp_close, MPP_OVERWR, MPP_NETCDF, MPP_SINGLE, mpp_io_init
    implicit none

    logical :: module_initialized = .false.

    interface write_data
        module procedure write_data_2d, write_data_3d 
    end interface write_data

    contains

    subroutine create_file_name(fname, jcap, nlon, nlat) 
        character(len=*), intent(inout) :: fname
        integer, intent(in) :: jcap, nlon, nlat
        character(len=range(jcap)+10) :: tmp
        fname = trim(adjustl(fname))//'.t'
        write(tmp, *) jcap
        tmp = trim(adjustl(tmp))//'.'
        fname = trim(fname)//trim(tmp)
        write(tmp, *) nlon
        tmp = trim(adjustl(tmp))//'.'
        fname = trim(fname)//trim(tmp)
        write(tmp, *) nlat
        tmp = trim(adjustl(tmp))//'.nc'
        fname = trim(fname)//trim(tmp)
    end subroutine create_file_name

    subroutine init_module()
        if (module_initialized) return 
        call mpp_init()
        call mpp_io_init()
        module_initialized = .true.
    end subroutine init_module

    subroutine write_data_3d(fname,varname,data)
        character(len=*), intent(in) :: fname, varname
        real, intent(in) :: data(:,:,:)

        integer :: nx, ny, nz, unit, i
        type(fieldtype) :: field 
        type(axistype) :: x, y, z

        call init_module()

        nx = size(data,1)
        ny = size(data,2)
        nz = size(data,3)

        call mpp_open(unit, fname, action=MPP_OVERWR, form=MPP_NETCDF, threading=MPP_SINGLE)
        call mpp_write_meta( unit, x, 'X', '1', 'X', data=[(float(i),i=1,nx)] )
        call mpp_write_meta( unit, y, 'Y', '1', 'Y', data=[(float(i),i=1,ny)] )
        call mpp_write_meta( unit, z, 'Z', '1', 'Z', data=[(float(i),i=1,nz)] )
        call mpp_write_meta( unit, field, (/x,y,z/), varname, '?', varname,  missing=-1e36)
        call mpp_write(unit,x)
        call mpp_write(unit,y)
        call mpp_write(unit,z)
        call mpp_write(unit,field,data)
        call mpp_close(unit)
    end subroutine write_data_3d

    subroutine write_data_2d(fname,varname,data)
        character(len=*), intent(in) :: fname, varname
        real, intent(in) :: data(:,:)

        integer :: nx, ny, unit, i
        type(fieldtype) :: field 
        type(axistype) :: x, y

        call init_module()

        nx = size(data,1)
        ny = size(data,2)

        call mpp_open(unit, fname, action=MPP_OVERWR, form=MPP_NETCDF, threading=MPP_SINGLE)
        call mpp_write_meta( unit, x, 'X', '1', 'X', data=[(float(i),i=1,nx)] )
        call mpp_write_meta( unit, y, 'Y', '1', 'Y', data=[(float(i),i=1,ny)] )
        call mpp_write_meta( unit, field, (/x,y/), varname, '?', varname,  missing=-1e36)
        call mpp_write(unit,x)
        call mpp_write(unit,y)
        call mpp_write(unit,field,data)
        call mpp_close(unit)
    end subroutine write_data_2d

end module module_mod