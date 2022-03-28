! !iroutine: gfs_standalone --- application main program to run the ncep 
!                                    gfs system alone.
!

program gfs_standalone

  ! coupling insertion->
  use atm_cc, only: mpi_comm_atmos
  !<-coupling insertion

  use gfs_internalstate_mod, only: gfs_internalstate
  use gfs_initialize_mod, only: gfs_initialize
  use gfs_run_mod, only: gfs_run
  use time_manager_mod, only: set_calendar_type, julian, time_type, gregorian
  use time_manager_mod, only: operator(+), assignment(=), set_date
  use time_manager_mod, only: increment_date, get_date, julian
  use cmp_comm, only: process_rank_local, component_nprocs
  use date_def, only: idate, fhour
  use mpp_mod, only: mpp_exit

  implicit none

  integer              :: rc = 0 ! the running error signal.
  integer              :: rcfinal ! the final value of the running error signal.
  type(time_type) :: currtime_fms, stoptime_fms
  type(gfs_internalstate), pointer   :: int_state    ! the internal state pointer.
  integer                            :: yy, mm, dd
  integer                            :: hh, mns, sec
  integer                            :: advancecount4
  integer :: current_time(6)
  logical :: current_time_from_res=.true.

  namelist/main_nml/current_time, current_time_from_res

  !!begin gfs code.

  rcfinal = 0

  ! coupling insertion->
  call mpi_init(rc)
  call atm_cmp_start
  !<-coupling insertion

  ! allocate the internal state pointer.
  !-------------------------------------
  allocate(int_state, stat = rc)

  ! the function is similar to reading the namelist in the original gfs.
  !---------------------------------------------------------------------
  call get_namgfs(int_state)

  ! initialize time interval to the parameter from the configure file.
  !-------------------------------------------------------------------

  int_state%n1=11; int_state%n2=12

  open(10,file='gfs_namelist',status='old')
  read(10,nml=main_nml)
  close(10)

  if (current_time_from_res) then
    open(10,file='INPUT/atm.res',status='old')
    read(10,*) current_time
    close(10)
  endif

  if(process_rank_local==0) write(*,nml=main_nml)

  int_state%kfhour=0
  advancecount4=0
  int_state%phour=0.0
  int_state%kfhour=0

  ! initialize the clock with the start time based on the information
  ! from calling starttimeget.
  !------------------------------------------

  call set_calendar_type(gregorian)
  yy=current_time(1); mm=current_time(2); dd=current_time(3)
  hh=current_time(4); mns=current_time(5); sec=current_time(6)

  idate(1)=current_time(4)
  idate(2)=current_time(2)
  idate(3)=current_time(3)
  idate(4)=current_time(1)
  fhour=0.0

  currtime_fms = set_date(yy,mm,dd,hh,mns,sec,0)

  int_state%me=process_rank_local
  int_state%nodes=component_nprocs

  call gfs_initialize(int_state, currtime_fms, stoptime_fms, rc)

  !call get_date(stoptime_fms,yy,mm,dd,hh,mns,sec)
  !print *, "fms stoptime:",yy,mm,dd,hh,mns,sec

  call set_local_lnt2_lonr_latr(Int_State)


  call gfs_run(currtime_fms, stoptime_fms, int_state, rc)

  call mpp_exit()

  call mpi_finalize(rcfinal)

end program gfs_standalone
