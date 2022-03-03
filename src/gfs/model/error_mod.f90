module error_mod
  use mpi_def
  use layout1, only: me
  implicit none
  integer, parameter :: FATAL=-1, WARNING=-2, NOTE=-3
  contains
  subroutine handle_error(errtype,msg)
    integer :: errtype
    character (len=*) :: msg
    integer :: stat

    if (errtype==FATAL) then
      print *, "FATAL ERROR: "// trim(msg)
      call MPI_ABORT(MPI_COMM_WORLD,FATAL,stat)
    else if (errtype==WARNING) then
      if(me==0) print *, "WARNING: "// trim(msg)
    else if (errtype==NOTE) then
      if(me==0) print *, "NOTE: "// trim(msg)
    endif
  end subroutine handle_error
end module error_mod
