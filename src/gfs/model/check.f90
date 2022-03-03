        subroutine check(status)
        use netcdf
        integer, intent ( in) :: status
        if(status /= nf90_noerr) then
        !call handle_err(status)
        !print *, trim(nf90_strerror(status))
        stop "Stopped"
        end if
        end subroutine check
