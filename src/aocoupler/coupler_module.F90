module coupler_module
  use write_debug_nc, only: end_write_debug, init_write_debug, write_debug

!---- error return code ---------
!   0: success
!   1: coupler init
!   3: atm dim
!   4: sst
!   5: flux
!   6: coupler finilize
!----------------------

  implicit none

  include 'mpif.h'

  !define domain type
  type domain2d
    integer :: npes
    integer,dimension(2) :: layout
    integer :: xdimg,ydimg
    integer,dimension(:),allocatable :: is,ie,js,je
  end type domain2d
  type(domain2d) :: atm_domain

  !define mpi communicator
  type communicator
    character(len=32) :: name
    integer,dimension(:),allocatable :: list  !here we only need global rank list corresponding to 0--npes-1
    integer           :: count
    integer           :: id, group         ! mpi communicator and group id for this pe set.
    integer           :: master_rank       ! mast rank in mpi_comm_world
    integer           :: coupler_rank      ! coupler rank in mpi_comm_world
    integer           :: flexlev           ! 
  end type communicator
  type(communicator) :: atmosphere_comm
  type(communicator) :: ocean_comm
  type(communicator) :: coupler_comm

  !parameters
  integer,parameter :: kind_real=8,kind_integer=4,kind_alt_real=12-kind_real
  real,parameter :: dinr=180./3.1415926535897932
  real,parameter :: tzero=273.16,tfreez=273.16-1.79
  real,parameter :: jcal=4.1855,hf_conv_a2o=1.e-4/jcal
  real,parameter :: rhow=1.e3,cw=4200

  !mpi vars
  integer :: coupler_id=0, atmos_id=1, ocean_id=2
  integer :: ierr,rc,nprocs
  integer :: coupler_rank,atmos_rank,ocean_rank
  integer :: mpi_kind_real,mpi_kind_alt_real

  integer :: verblev=2,nprint=6, mask_tolerance_level=2
  integer :: nprper=120,npr1st=0

  private

  !*** need to change dt_c, not sent from ocean
  integer :: dt_c=0, dt_o=0
  integer :: ndto2dtc
  
  logical :: fluxdebug=.false.
  logical :: invertind=.true.
  logical :: debug=.false., debug_flux_file=.false.

  character(len=1) :: restart_old
  character(len=8) :: date
  character(len=10) :: time
  real :: om_ul_thickn,efoldingtime

  integer :: cstep,runlength
  character(len=20) :: cs
  character(len=20) :: sb, s, sr
  character(len=80) :: s1,s2

  ! data on atmos grid
  integer :: anx,any,anxny
  real(kind=kind_real),dimension(:),allocatable:: alon,alat
  real(kind=kind_real),dimension(:,:),allocatable:: nsw_i, nsw_o, nlw, shflx_i, &
      shflx_o, lhflx_i, lhflx_o, lprec, fprec, drdt, dhdt, dqdt, uflux, vflux, &
      totrunoff
  real(kind=kind_real),dimension(:,:),allocatable:: t_sst, fice, &
      hice,hsno,cice,tice,tocean,ofrac
  integer,dimension(:,:),allocatable:: neighbour(:,:,:)

   namelist /cpl_settings/ &
       debug, &
       debug_flux_file 

!public method
   public coupler_init,coupler_run,coupler_finalize,glob_abort,cpl_announce
     
   contains

!*********************************************************************

  subroutine coupler_init(iret)      
  !----------------------------------------------------------------------
  ! set up mpi for coupler
  !----------------------------------------------------------------------
    implicit none
 
    integer,optional,intent(out)  :: iret
    integer :: ios
    logical :: ex
    iret=1

    !define npi real:
    if (kind_real.eq.8) then
      mpi_kind_real=mpi_real8
      mpi_kind_alt_real=mpi_real4
    else if (kind_real.eq.4) then
      mpi_kind_real=mpi_real4
      mpi_kind_alt_real=mpi_real8
    else
      write(s,'(i0)') kind_real
      call glob_abort(1,'cpl_init: illegal value of kind_real='//s,1)
    end if

    !read namelist
    inquire(file='cpl_nml',exist=ex)
    if (ex) then
      open(14,file='cpl_nml',status='old',iostat=ios)
      call glob_abort(ios,'error opening file cpl_nml. c terminated',1)
      read(14,nml=cpl_settings,iostat=ios)
    endif
    write(nprint,nml=cpl_settings)
  
    if (nprint.eq.7) then
      open(nprint,file='c_printout',form='formatted',status='unknown')
    else if (nprint.ne.6) then
      call date_and_time(date,time)
      open(nprint,file='c_printout.'// &
      date(5:6)//'.'//date(7:8)//'.'//date(3:4)//'_'// &
      time(1:2)//'.'//time(3:4)//'.'//time(5:6), &
      form='formatted',status='unknown')
    end if

    ! environment. in that environment, cstep init. value was 0 and
    ! surface fluxes from am (data in fluxes_for_om file were used
    ! in lieu of the latter)

    restart_old='f'
    if (restart_old.ne.'f') call glob_abort(1, &
      'wrong restart_old value: restart_old='//restart_old,1)

    !---  initialize mpi ---
    call cpl_announce('mpi initialization to begin',1)
    call mpi_init(ierr)
    call glob_abort(ierr,'c: aborted upon call mpi_init',1)
    call cpl_announce('coupler: back from mpi_init',1)

    call cpl_init
    call cpl_announce('back from cpl_init',1)

    call cpl_announce('before call cpl_intro',1)
    call cpl_intro(atmos_id)
    call cpl_announce('after call cpl_intro',1)
    write(s,'(i2)') atmos_id
    call cpl_announce('back from cpl_intro(atmos_id), atmos_id='//s,0)

    call cpl_intro(ocean_id)
    write(s,'(i2)') ocean_id
    call cpl_announce('back from cpl_intro(ocean_id), ocean_id='//s,0)
    call update_ocean_comm_concurrency
    call cpl_announce('back from update_ocean_comm_concurrency',0)
    call cpl_announce('mpi initialization completed',1)

    iret=0
  end subroutine coupler_init
!- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


  subroutine cpl_init(iret) 

    implicit none

    integer,optional,intent(in) :: iret
    integer color,key,natmpes,nompes
    integer,dimension(:),allocatable :: ids
    character(256) s
    integer :: i,comm_coupler,ibuffer_size=4,tag, world_group,ocean_group,nocn,natm
    integer,dimension(:),allocatable :: ibuffer

    coupler_comm%name="coupler"
    coupler_comm%id=0
    coupler_comm%count=1
    allocate(coupler_comm%list(coupler_comm%count))

    color=coupler_comm%id
    key=1
    call mpi_comm_split(mpi_comm_world,color,key,comm_coupler,ierr)
    call glob_abort(ierr,'cpl_init: error in mpi_comm_split',1)
    !call cpl_announce('coupler:back from mpi_comm_split',0)
    !call cpl_announce('coupler:  in cpl_init,before mpi_comm_split',0)

    call mpi_comm_rank(mpi_comm_world,coupler_comm%master_rank,ierr)
    call glob_abort(ierr,'cpl_init: error in mpi_comm_rank',1)
    write(s,'(i2)') coupler_comm%master_rank
    call cpl_announce('coupler:back from mpi_comm_rank,coupler_rank='//s,0)

    call mpi_comm_size(mpi_comm_world,nprocs,ierr)
    call glob_abort(ierr,'cpl_init: error in mpi_comm_size',1)
    write(s,'(i2)') nprocs
    call cpl_announce('coupler:back from mpi_comm_size,comm_world size='//s,0)

    coupler_comm%list(1)=coupler_comm%master_rank
    coupler_comm%coupler_rank=coupler_comm%master_rank

    allocate(ids(nprocs*2),ibuffer(ibuffer_size))
    ibuffer(2)=coupler_rank
    ibuffer(1)=coupler_id
    tag=1
    do i=0,nprocs-1
      if (i.ne.coupler_comm%master_rank) then
        call mpi_send(ibuffer,2,mpi_integer,i,tag, &
        mpi_comm_world,ierr)
    write(s,'(i3)') i
    !call cpl_announce('coupler: back from mpi_comm_send,nproc='//s,0)
        if (ierr.ne.0) then
           write(s,'(i5)') i
           write(nprint,*) 'c: '//"cpl_init: stopped, error in mpi_send to proc. "//trim(s)
           call mpi_abort(mpi_comm_world,2,ierr)
        endif
       endif
    enddo

    ibuffer(1)=coupler_id
    ibuffer(2)=coupler_comm%master_rank  !global rank

    call mpi_gather(ibuffer,2,mpi_integer,ids,2,mpi_integer,  &
       coupler_rank,mpi_comm_world,ierr)
    !call cpl_announce('coupler: back from mpi_gather',0)

    write(nprint,*) 'from cpl pe ',coupler_comm%master_rank,'ids=',ids

    atmosphere_comm%name="atmosphere"
    atmosphere_comm%id=atmos_id
    atmosphere_comm%coupler_rank=coupler_comm%coupler_rank
    ocean_comm%name="ocean"
    ocean_comm%id=ocean_id
    ocean_comm%coupler_rank=coupler_comm%coupler_rank
    atmosphere_comm%count=0
    ocean_comm%count=0
    do i=1,nprocs
      if(ids(2*i-1).eq.atmos_id) atmosphere_comm%count=atmosphere_comm%count+1
      if(ids(2*i-1).eq.ocean_id) ocean_comm%count=ocean_comm%count+1
    enddo

    if(atmosphere_comm%count+ocean_comm%count+coupler_comm%count .ne. nprocs) &
      call cpl_announce('warning: there are some pes inactive',1)

    allocate(atmosphere_comm%list(atmosphere_comm%count),  &
               ocean_comm%list(ocean_comm%count)  )
    natm=0
    nocn=0
    do i=1,nprocs
      if(ids(2*i-1).eq.atmos_id) then
          natm=natm+1
          atmosphere_comm%list(natm)=ids(2*i)
      endif
      if(ids(2*i-1).eq.ocean_id) then
        nocn=nocn+1
        ocean_comm%list(nocn)=ids(2*i)
      endif
    enddo

     !let ocean pe knows it list
   !prajeesh   do i=1,ocean_comm%count
   !      call mpi_send(ocean_comm%list,ocean_comm%count,mpi_integer, &
   !        ocean_comm%list(i),1, mpi_comm_world,ierr)
   ! enddo

    return
  end subroutine cpl_init
!- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


  subroutine cpl_intro(component_id)

    implicit none

    integer,intent(inout) ::  component_id

    integer :: tag,i,istatus(mpi_status_size),ierr
    integer(kind_integer),dimension(2) :: ibuffer
    logical :: component_inactive
    character(len=32) :: s

    if (component_id.le.0)  &
       call glob_abort(1,'c: cpl_intro: component_id nonpositive, terminated',1)

    component_inactive=.true. 
    if (atmosphere_comm%id.eq.component_id .or. ocean_comm%id.eq.component_id) &
       component_inactive=.false.

    if (component_inactive) then
       component_id=-component_id
       print*,'c: cpl_intro: component with id=',-component_id, &
        ' inactive; id made =',component_id
        return
    end if
  
    tag=component_id-1          ! to keep tag=1 for ocean
    ibuffer=0
    call mpi_recv(ibuffer,2,mpi_integer,mpi_any_source,tag, &
      mpi_comm_world,istatus,ierr)
    call glob_abort(ierr,'cpl_intro: error in mpi_recv',1)
    call cpl_announce('coupler:back from mpi_recv from atm/ocean to get local_root',0)

    if (ibuffer(1).ne.component_id) then
       write(nprint,'("c: cpl_intro: stopped, received component id value",i9,'// &
        ' "not equal to component_id argument",i9)') ibuffer(1),component_id 
       call glob_abort(1,'cpl_intro: error',2)
    end if

    if( component_id.eq.atmosphere_comm%id ) then
       atmosphere_comm%master_rank=ibuffer(2) 
    else if( component_id.eq.ocean_comm%id ) then 
       ocean_comm%master_rank=ibuffer(2) 
    else
       write(s,'(i5)') component_id
       call glob_abort(1,'cpl_intro: component id wrong'//trim(s),2)
    endif

     return
  end subroutine cpl_intro
!----------------------------------------------------------------------


  subroutine cpl_announce(s,dbglev) 

    implicit none

    character*(*),intent(in) :: s
    integer,intent(in) :: dbglev

    if (dbglev.le.verblev)  write(nprint,*) 'c: '//s

    return
  end subroutine cpl_announce
!----------------------------------------------------------------------



  subroutine glob_abort(ie,s,rc)

    implicit none

    integer rc,ie,ierr
    character*(*) s
    if (ie.ne.0) then
      print*,'glob_abort: '//s//' ie,rc:',ie,rc
      if (rc.eq.0) return
      call mpi_abort(mpi_comm_world,rc,ierr)
    end if
    return
  end subroutine glob_abort
!----------------------------------------------------------------------


  subroutine coupler_run(iret) 
  !----------------------------------------------------------------------
  ! this subroutine contains all the transmits coupler has done including
  !   receiving sst from ocean and sending to atmos, and sending flux to
  !   ocean and receiving flux from atmos 
  !----------------------------------------------------------------------
  implicit none
    integer,optional,intent(out) :: iret
    integer ios,i
    integer,dimension(:),allocatable :: ids
    integer :: ierr,ibuf(2)
    integer,dimension(mpi_status_size) :: istatus
    real(kind_real) buf(2)
    real buff(2)
    logical exist

    iret=2

    !-----------------------------------------------------------------------
    !--- step 1: receive om time step; send coupling om and am
    !
    ! --1.1 get dt_c, dto from ocean
    call cpl_announce('going to recieve dt_cc and dto_cc',1)
    call mpi_recv(ibuf,2,mpi_integer,ocean_comm%master_rank,ocean_comm%id-1, &
       mpi_comm_world,istatus, ierr)
    call glob_abort(ierr, "error in transferring ocn dt_c/dt_o",1)
    dt_c=ibuf(1)
    dt_o=ibuf(2)
    write(s1,'(I10,I10)') ibuf(1),ibuf(2)
    call cpl_announce('from ocean, dt_cc, dto_cc: '//trim(s1),1)
    
    call mpi_recv(ibuf,2,mpi_integer,ocean_comm%master_rank,ocean_comm%id-1, &
       mpi_comm_world,istatus, ierr)
    
    print *, 'total run length from ocn:',ibuf(1)*ibuf(2)
    runlength=ibuf(1)*ibuf(2)

    ! --1.2 get domain division from mom4 atmos

    if (ocean_comm%count .lt. 1)  &
      call glob_abort(2001,'no ocean pes,domain size from ocean_comm master',1)
    allocate( ids(ocean_comm%count*6) )
    call recv_data_domain(ocean_comm%count, ids,ierr )
    if( ierr .ne.0 ) call glob_abort(2001,'coupler cannot recv local'// &
       'domain size from ocean_comm master',1)

    !-----------------------------------------------------------------------
    !--- step 2: recevie am grid dimention and allocate arrays 
    !---      ** currently, coupler only need to know atm grid **

    call mpi_recv(ibuf,2,mpi_integer,atmosphere_comm%master_rank,atmosphere_comm%id-1, &
      mpi_comm_world,istatus, ierr)
    call glob_abort(ierr, "error in transferring atm anx/any",1)
    anx=ibuf(1)
    any=ibuf(2)
    anxny=anx*any
    
    write(s,'(i3,2i6)') atmos_id,anx,any
    call cpl_announce('atmos_id, anx, any: '//s,1)

    buf(1)=dt_c
    buf(2)=dt_o

    ! allocate arrays:
    !am
    allocate(alon(anx),alat(any))
    allocate(nsw_i(anx,any), nsw_o(anx,any), nlw(anx,any), &
             shflx_i(anx,any), shflx_o(anx,any), lhflx_i(anx,any), &
             lhflx_o(anx,any), lprec(anx,any), fprec(anx,any), &
             drdt(anx,any), dhdt(anx,any), dqdt(anx,any), &
             uflux(anx,any), vflux(anx,any),totrunoff(anx,any))
    allocate(t_sst(anx,any), fice(anx,any),hice(anx,any), &
             cice(anx,any),hsno(anx,any),tice(anx,any),tocean(anx,any), &
             ofrac(anx,any))
   ! tice=263. !initial
    !-- implicit mpp_define domain
    call set_domain(atm_domain,anx,any,ocean_comm%count,ids)
    
    if (debug_flux_file) call init_write_debug(anx,any)

    !--- 5.1 time steps

    print *, 'Coupler: Runlength:', runlength
    
    do cstep=1,runlength  ! <- here and elsewhere ostep replaced by
      !-- receive sst from om, no interpolation,send it to atm
        if(debug) print *, 'before recv_from_ocn'
        call recv_from_ocn
        if(debug) print *, 'after recv_from_ocn'

        if(debug) print *, 'before send_sst'
        call send_sst
        if(debug) print *, 'after send_sst'
        
        !recev flux from atmos
        ndto2dtc=dt_o/dt_c

        if(debug) print *, 'before recv_fluxes'
        call recv_fluxes
        if(debug) print *, 'after recv_fluxes'
        if (debug_flux_file) then  
          call write_restart_am
        end if
        !send fluxes to ocean
        if(debug) print *, 'before send_fluxes'
        call send_fluxes
        if(debug) print *, 'after send_fluxes'

        if (debug_flux_file) then
          call write_restart
        endif
    enddo  !end cstep loop5.1
    if (debug_flux_file) call end_write_debug
    iret=0
    return
  end subroutine coupler_run
   
  subroutine write_restart
    implicit none
    call write_debug('t_sst', t_sst)
    call write_debug('fice', fice)
    call write_debug('hice', hice)
    call write_debug('hsno', hsno)
    call write_debug('tice', tice)
    call write_debug('tocean', tocean)
    call write_debug('lfrac', 1.0d0-ofrac)
    return
  end subroutine write_restart

  subroutine write_restart_am
    implicit none
    call write_debug('nsw_i', nsw_i)
    call write_debug('nsw_o', nsw_o)
    call write_debug('nlw', nlw)
    call write_debug('shflx_i', shflx_i)
    call write_debug('shflx_o', shflx_o)
    call write_debug('lhflx_i', lhflx_i)
    call write_debug('lhflx_o', lhflx_o)
    call write_debug('lprec', lprec)
    call write_debug('fprec', fprec)
    call write_debug('drdt', drdt)
    call write_debug('dhdt', dhdt)
    call write_debug('dqdt', dqdt)
    call write_debug('uflux', uflux)
    call write_debug('vflux', vflux)
    call write_debug('totrunoff', totrunoff)
    return
  end subroutine write_restart_am

!*********************************************************************
!
  subroutine coupler_finalize(iret) 
  !----------------------------------------------------------------------
  !  coupler finalize
  !----------------------------------------------------------------------
  !
    implicit none
    integer,optional,intent(out) :: iret
    iret=3
    deallocate(nsw_i)
    deallocate(nsw_o)
    deallocate(nlw)
    deallocate(shflx_i)
    deallocate(shflx_o)
    deallocate(lhflx_i)
    deallocate(lhflx_o)
    deallocate(lprec)
    deallocate(fprec)
    deallocate(drdt)
    deallocate(dhdt)
    deallocate(dqdt)
    deallocate(uflux)
    deallocate(vflux)
    deallocate(totrunoff)

    deallocate(fice)
    deallocate(hice)
    deallocate(hsno)
    deallocate(cice)
    deallocate(tice)
    deallocate(tocean)
    deallocate(ofrac)

    call mpi_finalize(ierr)
    call glob_abort(ierr,'c: aborted upon call mpi_finalize',1)
    write(nprint,*)'c: back from mpi_finalize,ierr=',ierr
    iret=0
    return
  end subroutine coupler_finalize
!- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


  subroutine recv_from_ocn
  !----------------------------------------------------------------------
  !  receive sst from ocean model
  !----------------------------------------------------------------------
    implicit none

    real(kind=kind_real) :: eps_fi=1.e-6
    integer i,j,k
    integer :: m,n,q,css,nx

    call recv_sglfield(fice,atm_domain,ocean_comm%id)
    
    call recv_sglfield(hice,atm_domain,ocean_comm%id)
    
    call recv_sglfield(hsno,atm_domain,ocean_comm%id)
    
    call recv_sglfield(tice,atm_domain,ocean_comm%id)
    
    call recv_sglfield(tocean,atm_domain,ocean_comm%id)

    return
  end subroutine recv_from_ocn
!- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   
    
  subroutine send_sst
  !----------------------------------------------------------------------
  !  send sst to atm
  !----------------------------------------------------------------------
    implicit none
    integer :: ierr

    call invind(size(fice,1),size(fice,2), fice)
    call debug_fluxes(fice,'fice')
    call mpi_send(fice,size(fice,1)*size(fice,2),mpi_kind_real, &
       atmosphere_comm%master_rank, &
       atmosphere_comm%id-1, mpi_comm_world,ierr)
 
    call invind(size(hice,1),size(hice,2), hice)
    call debug_fluxes(hice,'hice')
    call mpi_send(hice,size(hice,1)*size(hice,2),mpi_kind_real, &
       atmosphere_comm%master_rank, &
       atmosphere_comm%id-1, mpi_comm_world,ierr)

    call invind(size(hsno,1),size(hsno,2), hsno)
    call debug_fluxes(hsno,'hsno')
    call mpi_send(hsno,size(hsno,1)*size(hsno,2),mpi_kind_real, &
       atmosphere_comm%master_rank, &
       atmosphere_comm%id-1, mpi_comm_world,ierr)

    call invind(size(tice,1),size(tice,2), tice)
    call debug_fluxes(tice,'tice')
    call mpi_send(tice,size(tice,1)*size(tice,2),mpi_kind_real, &
       atmosphere_comm%master_rank, &
       atmosphere_comm%id-1, mpi_comm_world,ierr)
    
    call invind(size(tocean,1),size(tocean,2), tocean)
    call debug_fluxes(tocean,'tocean')
    call mpi_send(tocean,size(tocean,1)*size(tocean,2),mpi_kind_real, &
       atmosphere_comm%master_rank, &
       atmosphere_comm%id-1, mpi_comm_world,ierr)
    return
  end subroutine send_sst

!*********************************************************************

  subroutine recv_fluxes
  !----------------------------------------------------------------------
  !  receive fluxes from atm
  !----------------------------------------------------------------------
    implicit none
    call cpl_announce('to receive flux from am for sea-ice model, '//cs,3)

    call cpl_recv(nsw_i, anx, any, atmos_id)
    call debug_fluxes(nsw_i,'nsw_i')

    call cpl_recv(nsw_o, anx, any, atmos_id)
    call debug_fluxes(nsw_o,'nsw_o')

    call cpl_recv(nlw, anx, any, atmos_id)
    call debug_fluxes(nlw,'nlw')

    call cpl_recv(shflx_i, anx, any, atmos_id)
    call debug_fluxes(shflx_i,'shflx_i')

    call cpl_recv(shflx_o, anx, any, atmos_id)
    call debug_fluxes(shflx_o,'shflx_o')

    call cpl_recv(lhflx_i, anx, any, atmos_id)
    call debug_fluxes(lhflx_i,'lhflx_i')

    call cpl_recv(lhflx_o, anx, any, atmos_id)
    call debug_fluxes(lhflx_o,'lhflx_o')

    call cpl_recv(lprec, anx, any, atmos_id)
    call debug_fluxes(lprec,'lprec')

    call cpl_recv(fprec, anx, any, atmos_id)
    call debug_fluxes(fprec,'fprec')

    call cpl_recv(drdt, anx, any, atmos_id)
    call debug_fluxes(drdt,'drdt')

    call cpl_recv(dhdt, anx, any, atmos_id)
    call debug_fluxes(dhdt,'dhdt')

    call cpl_recv(dqdt, anx, any, atmos_id)
    call debug_fluxes(dqdt,'dqdt')

    call cpl_recv(uflux, anx, any, atmos_id)
    call debug_fluxes(uflux,'uflux')

    call cpl_recv(vflux, anx, any, atmos_id)
    call debug_fluxes(vflux,'vflux')
    
    call cpl_recv(totrunoff, anx, any, atmos_id)
    call debug_fluxes(totrunoff,'totrunoff')
  end subroutine recv_fluxes

!*********************************************************************

  subroutine send_fluxes
  !----------------------------------------------------------------------
  !  send fluxes to ocean. for each surface flux,if required, 
  !     fill it with invalid values, to force om to use its own data;
  !     invert indexation if necessary, change sign / convert units 
  !     if necessary 
  !----------------------------------------------------------------------

    implicit none
    integer :: i,j
    integer :: m,n,q,css,nx
    call send_sglfield(nsw_i,atm_domain,ocean_comm%id)
    call send_sglfield(nsw_o,atm_domain,ocean_comm%id)
    call send_sglfield(nlw,atm_domain,ocean_comm%id)
    call send_sglfield(shflx_i,atm_domain,ocean_comm%id)
    call send_sglfield(shflx_o,atm_domain,ocean_comm%id)
    call send_sglfield(lhflx_i,atm_domain,ocean_comm%id)
    call send_sglfield(lhflx_o,atm_domain,ocean_comm%id)
    call send_sglfield(lprec,atm_domain,ocean_comm%id)
    call send_sglfield(fprec,atm_domain,ocean_comm%id)
    call send_sglfield(drdt,atm_domain,ocean_comm%id)
    call send_sglfield(dhdt,atm_domain,ocean_comm%id)
    call send_sglfield(dqdt,atm_domain,ocean_comm%id)
    call send_sglfield(uflux,atm_domain,ocean_comm%id)
    call send_sglfield(vflux,atm_domain,ocean_comm%id)
    call send_sglfield(totrunoff,atm_domain,ocean_comm%id)

    nsw_i=0.0
    nsw_o=0.0
    nlw=0.0
    shflx_i=0.0
    shflx_o=0.0
    lhflx_i=0.0
    lhflx_o=0.0
    lprec=0.0
    fprec=0.0
    drdt=0.0
    dhdt=0.0
    dqdt=0.0
    uflux=0.0
    vflux=0.0
    totrunoff=0.0
    return
  end subroutine send_fluxes
!- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

  subroutine recv_data_domain(npes,ids,iret)
  !----------------------------------------------------------------
  !-- recv data domain
  !----------------------------------------------------------------
    implicit none
    integer,intent(in) :: npes
    integer,dimension(npes*6),intent(inout) :: ids 
    integer,intent(inout) :: iret
    integer :: tag,istatus(mpi_status_size)

    tag=1    !! mpp send
    call mpi_recv(ids,npes*6,mpi_integer,ocean_comm%master_rank,tag, &
      mpi_comm_world,istatus,ierr)
    if(ierr .ne. 0) call glob_abort(2001,'coupler cannot recv local'// &
      'domain size from ocean_comm master',1)
    
    iret=0 
    return
  end subroutine  recv_data_domain
!----------------------------------------------------------------
    
  subroutine set_domain(domain,xdimg,ydimg,npes,ids)
  !----------------------------------------------------------------
  !-- set domain
  !----------------------------------------------------------------

    implicit none

    type(domain2d),intent(inout) ::  domain
    integer,intent(in)  :: xdimg,ydimg,npes
    integer,dimension(npes*6),intent(in)  :: ids
    integer :: ndiv,i

    domain%xdimg=xdimg
    domain%ydimg=ydimg
    domain%npes=npes
    allocate(domain%is(npes),domain%ie(npes),domain%js(npes),domain%je(npes))

    write(s,'(i2,i2,i2)') ids(1),ids(2),npes
    if ( ids(1)*ids(2) .ne. npes) call glob_abort(2001,'in set domain, layout'// &
       ' doesnot match npes'//s,1 )

    domain%layout= (/ ids(1), ids(2) /)
    do ndiv=1,npes
      if(ids(6*ndiv-5) .ne. domain%layout(1) .or. ids(6*ndiv-4).ne.domain%layout(2))  &
       call glob_abort(2001,'in set domain, layout doesnot same in all pes',1)
      domain%is(ndiv)=ids(6*ndiv-3)
      domain%ie(ndiv)=ids(6*ndiv-2)
      domain%js(ndiv)=ids(6*ndiv-1)
      domain%je(ndiv)=ids(6*ndiv)
    enddo
    return
  end subroutine  set_domain
!----------------------------------------------------------------


  subroutine recv_sglfield(var,domain,component_id)
  !----------------------------------------------------------------
  !-- giving var on global domain (xdimi,ydim), sebd partial domain data
  !     to the component_id pes
  !----------------------------------------------------------------

    implicit none
    type(domain2d),intent(in) :: domain
    real(8),dimension(:,:),intent(inout) :: var(domain%xdimg,domain%ydimg)
    integer,intent(in) :: component_id

    real(8),dimension(:,:),allocatable :: varpart
    integer,dimension(:),allocatable :: pelist
    integer,dimension(mpi_status_size) :: istatus
    integer ndiv,npes,ndiv_xdim,ndiv_ydim,i,j,tag,xdim,ydim,is,js

    if(component_id.eq.ocean_comm%id) then
      allocate(pelist(ocean_comm%count))
      pelist=ocean_comm%list
      npes=ocean_comm%count
    else if (component_id.eq.atmosphere_comm%id) then
      allocate(pelist(atmosphere_comm%count))
      pelist=atmosphere_comm%list
      npes=atmosphere_comm%count
    else
      call glob_abort(2001,"in send_sglfield, invalid component is",1)
    endif

    do ndiv=1,npes
      ndiv_xdim=domain%ie(ndiv)-domain%is(ndiv)+1
      ndiv_ydim=domain%je(ndiv)-domain%js(ndiv)+1
      allocate(varpart(ndiv_xdim,ndiv_ydim))

      !recv ocean var part on atm
      is=domain%is(ndiv)
      js=domain%js(ndiv)
      tag=1   !in mpp_send tag=1

      call mpi_recv(varpart,ndiv_xdim*ndiv_ydim,mpi_kind_real,pelist(ndiv),tag,&
       mpi_comm_world,istatus,ierr)

      call glob_abort(ierr,'coupler read single field to ocean pes',1)

      do j=domain%js(ndiv),domain%je(ndiv)
        do i=domain%is(ndiv),domain%ie(ndiv)
          var(i,j)=varpart(i-is+1,j-js+1)
        enddo
      enddo

      deallocate(varpart)

    enddo

    return
  end subroutine recv_sglfield
!----------------------------------------------------------------
    
  subroutine send_sglfield(var,domain,component_id)
  !----------------------------------------------------------------
  !-- giving var on global domain (xdimi,ydim), sebd partial domain data 
  !     to the component_id pes
  !----------------------------------------------------------------

    implicit none
    type(domain2d),intent(in) :: domain
    real(8),dimension(:,:),intent(inout) :: var(domain%xdimg,domain%ydimg)
    integer,intent(in) :: component_id

    real(8),dimension(:,:),allocatable :: varpart
    integer,dimension(:),allocatable :: pelist
    integer ndiv,npes,ndiv_xdim,ndiv_ydim,i,j,tag,xdim,ydim,is,js

    if(component_id.eq.ocean_comm%id) then
      allocate(pelist(ocean_comm%count))
      pelist=ocean_comm%list
      npes=ocean_comm%count
    else if (component_id.eq.atmosphere_comm%id) then
      allocate(pelist(atmosphere_comm%count))
      pelist=atmosphere_comm%list
      npes=atmosphere_comm%count
    else
      call glob_abort(2001,"in send_sglfield, invalid component is",1)
    endif

    ! change var from n->s(am) to s->n(mom)
    call invind(domain%xdimg, domain%ydimg, var)

    do ndiv=1,npes
      ndiv_xdim=domain%ie(ndiv)-domain%is(ndiv)+1
      ndiv_ydim=domain%je(ndiv)-domain%js(ndiv)+1
      allocate(varpart(ndiv_xdim,ndiv_ydim))

      do j=domain%js(ndiv),domain%je(ndiv)
        do i=domain%is(ndiv),domain%ie(ndiv)
          varpart(i-domain%is(ndiv)+1,j-domain%js(ndiv)+1)=var(i,j)
        enddo
      enddo
      !send to global ocean pelist
      is=domain%is(ndiv)
      js=domain%js(ndiv)
      tag=1   !in mpp_send tag=1
      call mpi_send(varpart,ndiv_xdim*ndiv_ydim,mpi_kind_real,pelist(ndiv),tag,&
      mpi_comm_world,ierr)
      call glob_abort(ierr,'coupler send single field to ocean pes',1)

      deallocate(varpart)
    enddo  !end doloop ndiv
    return
  end subroutine  send_sglfield
!----------------------------------------------------------------
    
  subroutine cpl_recv(var,xdim,ydim,component_id)
  !----------------------------------------------------------------
  !-- giving var on global domain (xdimi,ydim), sebd partial domain data
  !     to the component_id pes
  !----------------------------------------------------------------

    implicit none
    integer,intent(in) :: xdim,ydim,component_id
    real(kind_real),dimension(xdim,ydim),intent(inout) :: var
    integer :: varlen

    integer :: sendpe,tag,ierr, istatus(mpi_status_size)

    if(component_id.eq.ocean_comm%id) then
      sendpe=ocean_comm%master_rank
    else if (component_id.eq.atmosphere_comm%id) then
      sendpe=atmosphere_comm%master_rank
    else
      call glob_abort(2001,"in send_sglfield, invalid component is",1)
    endif

    tag=component_id-1

    call mpi_recv(var,xdim*ydim,mpi_kind_real,sendpe, tag, mpi_comm_world, &
       istatus,ierr)
    call glob_abort(ierr,'cpl_recv: error in mpi_recv',1)

    return
  end subroutine  cpl_recv
!----------------------------------------------------------------

  subroutine pri2d(im,jm,f,s)
  !----------------------------------------------------------------------
  !  print 2d array f(im,jm) 
  !----------------------------------------------------------------------
     
    implicit none

    integer,intent(in) ::  im,jm
    real,dimension(im,jm),intent(in) :: f
    character*(*) :: s
    integer :: n,i,j
    character(len=9) :: sn
    character(len=6) :: fr
    character(len=2) :: sc

    write(nprint,*)' '
    n=10

    if (s(1:3).eq.'sst') then
      fr='f12.7)'
      sc=' '
    else
      fr='e12.4)'
      sc='1p'
    end if

    if (im.eq.1) then
      write(nprint,'("c: '//s//', latitudes from")')
      do j=1,jm,n
        write(sn,'(i0)') min(j+n-1,jm)-j+1
        write(nprint,'("c:",i4," to",i4,'//sc//trim(sn)//fr) &
       j,min(j+n-1,jm),f(1,j:min(j+n-1,jm))
      end do
    else if (jm.eq.1) then
      write(nprint,'("c: '//s//', longitudes from")')
      do i=1,im,n
        write(sn,'(i0)') min(i+n-1,im)-i+1
        write(nprint,'("c:",i4," to",i4,'//sc//trim(sn)//fr) &
       i,min(i+n-1,im),f(i:min(i+n-1,im),1)
      end do
    else
      do i=1,im,n
        write(nprint,'("c: '//s//', longitudes from",i4," to",i4)') &
       i,min(i+n-1,im)
        write(sn,'(i0)') min(i+n-1,im)-i+1
        do j=1,jm
          write (nprint,'("c:",2i4,'//sc//trim(sn)//fr) &
         i,j,f(i:min(i+n-1,im),j)
        end do
      end do
    endif
    return
  end subroutine pri2d
!- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   
  subroutine ipri2d(im,jm,f,s,l)
  !----------------------------------------------------------------------
  !  print 2d array f(im,jm)
  !----------------------------------------------------------------------
    implicit none

    integer,intent(in) :: im,jm,l
    real,dimension(im,jm),intent(in) :: f
    character*(*),intent(in) ::  s
    integer n,i,j
    character*9 sn,sl

    write(sl,'(i0)') l
    write(nprint,*)' '
    n=l
    if (im.eq.1) then
      write(nprint,'("c: '//s//', latitudes from")')
      do j=1,jm,n
        write(sn,'(i0)') min(j+n-1,jm)-j+1
        write(nprint,  &
       '("c:",i4," to",i4,2x,'//trim(sn)//'i'//trim(sl)//')') &
       j,min(j+n-1,jm),f(1,j:min(j+n-1,jm))
      end do
    else if (jm.eq.1) then
      write(nprint,'("c: '//s//', longitudes from")')
      do i=1,im,n
        write(sn,'(i0)') min(i+n-1,im)-i+1
        write(nprint, &
      '("c:",i4," to",i4,2x,'//trim(sn)//'i'//trim(sl)//')') &
       i,min(i+n-1,im),f(i:min(i+n-1,im),1)
      end do
    else
      do i=1,im,n
        write(nprint,'("c: '//s//', longitudes from",i4," to",i4)') &
       i,min(i+n-1,im)
        write(sn,'(i0)') min(i+n-1,im)-i+1
        do j=1,jm
        write(nprint,'("c:",2i4,2x,'//trim(sn)//'i'//trim(sl)//')') &
         i,j,f(i:min(i+n-1,im),j)
        end do
      end do
    end if

    return
  end subroutine ipri2d
!- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   
  subroutine invind(im,jm,f)
  !----------------------------------------------------------------------
  !  inverse 2d array f(im,jm)  s->n or n->s
  !----------------------------------------------------------------------

    implicit none

    integer,intent(in) :: im,jm
    real,dimension(im,jm),intent(inout) :: f
    integer i,j,j1
    real z
    if (.not. invertind) return
    j1=jm/2
    do j=1,j1
      do i=1,im
        z=f(i,j)
        f(i,j)=f(i,jm+1-j)
        f(i,jm+1-j)=z
      end do
    end do
    return
  end subroutine invind
!- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   
  subroutine maxmin(xdim,ydim,x,s)

    implicit none

    integer xdim,ydim,i,j
    real(kind=kind_real) x(xdim,ydim),xmax,xmin
    character(*) s

    xmax=x(1,1)
    xmin=x(1,1)
    do j=1,ydim
    do i=1,xdim
     if ( xmax .lt. x(i,j) ) xmax=x(i,j)
     if ( xmin .gt. x(i,j) ) xmin=x(i,j)
    enddo
    enddo
    print *,s//' in maxmin,xdim=',xdim,'ydim=',ydim, &
       'xmax=',xmax,'xmin=',xmin

    return
  end subroutine maxmin
!- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
       
  subroutine update_ocean_comm_concurrency

    implicit none
    integer :: buf(2), istatus(mpi_status_size)
    integer,allocatable,dimension(:) :: ibuf

    call mpi_recv(buf,2,mpi_integer,ocean_comm%master_rank,ocean_comm%id-1, &
       mpi_comm_world,istatus, ierr) 
    call glob_abort(ierr,'c: aborted in update_ocean_comm 1',1)
    allocate(ibuf(buf(2)))
    call mpi_recv(ibuf,buf(2),mpi_integer,ocean_comm%master_rank,ocean_comm%id-1, &
       mpi_comm_world,istatus, ierr)
    call glob_abort(ierr,'c: aborted in update_ocean_comm 2',1)

    if(buf(2).eq.ocean_comm%count) then
      call cpl_announce('running in serial coupling: ocean_comm%count & ocean_comm%list not changed',1)
      return
    elseif(buf(2).lt.ocean_comm%count) then
      call cpl_announce('running in concurrent coupling: changing ocean_comm%count & ocean_comm%list',1)
      ocean_comm%count=buf(2)
      deallocate(ocean_comm%list)
      allocate(ocean_comm%list(ocean_comm%count))
      ocean_comm%list=ibuf
      print *, "new ocean_comm%count is :",ocean_comm%count
      print *, "new ocean_comm%list is :",ocean_comm%list
      deallocate(ibuf)
    else
      call glob_abort(1,'c: atmos_npes of mom cant be .gt. ocean_npes',1) 
    endif

  end subroutine update_ocean_comm_concurrency
  
  subroutine debug_fluxes(var,varname)
    implicit none
    real (kind=kind_real), intent(in) :: var(:,:)
    character(len=*), intent(in) :: varname
    if (debug) then
     print *, 'checking min, max, sum '//trim(varname)//':',minval(var), maxval(var), sum(var)
    end if
  end subroutine debug_fluxes
end module coupler_module
