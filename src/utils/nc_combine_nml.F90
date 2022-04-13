module nc_combine_nml_mod

use mpp_mod, only: mpp_pe, mpp_root_pe

implicit none
private

integer, dimension(6) :: startdate = 0, enddate = 0
integer :: calendar, deltim=1, atmpes=0
character(len=128) :: fname='nc_combine_nml'
        
namelist/nc_combine_nml/calendar, startdate, enddate, deltim, atmpes

public :: write_nc_combine_nml, read_nc_combine_nml, wait_seconds

contains

    subroutine write_nc_combine_nml(start_date, end_date, del_time, calendar_type, atm_pes)
        integer, intent(in) :: start_date(6), end_date(6), del_time, calendar_type
        integer, intent(in), optional :: atm_pes

        if (mpp_pe() /= mpp_root_pe()) return

        if (present(atm_pes)) atmpes=atm_pes

        startdate = start_date
        enddate = end_date
        deltim = del_time
        calendar = calendar_type

        open(10, file=trim(fname))
        write(10,nml=nc_combine_nml) 
        close(10)

    end subroutine write_nc_combine_nml

    subroutine read_nc_combine_nml(start_date, end_date, del_time, calendar_type, atm_pes)
        integer, intent(out) :: start_date(6), end_date(6), del_time, calendar_type
        integer, intent(out), optional :: atm_pes

        integer :: i
        logical :: file_exists


        do i = 1, 5
          INQUIRE(FILE=trim(fname), EXIST=file_exists)
          if (.not.file_exists) then
            call wait_seconds(60.)
            cycle
          endif
          exit
        enddo
        
        open(10, file=trim(fname), status='old')
        read(10,nml=nc_combine_nml) 
        close(10)

        start_date = startdate
        end_date = enddate
        del_time = deltim
        calendar_type = calendar
        if (present(atm_pes)) atm_pes=atmpes
        
    end subroutine read_nc_combine_nml

    subroutine wait_seconds(seconds)
        real, intent(in) :: seconds
        real :: rWait, rDT
        integer :: iStart, iNew, count_rate
        integer :: percent1, percent2
        character(len=10) :: dtime

        ! rWait: seconds that you want to wait for; 
        rWait = seconds; rDT = 0.d0
        percent1=0; percent2=0
        call system_clock(iStart)
        do while (rDT <= rWait)
            call system_clock(iNew,count_rate)
            rDT = float(iNew - iStart)/count_rate
            percent2 = (rDT/rWait)*100
        enddo
    end subroutine wait_seconds

end module nc_combine_nml_mod