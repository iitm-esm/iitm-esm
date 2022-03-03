module radiation_aerosol_mod

  use layout1, only : me, lats_node_r
  use resol_def, only : lonr, latr, levs
  use module_radsw_parameters, only : NBDSW
  use module_radlw_parameters, only : NBDLW
  use data_override_mod, only : data_override
  use error_mod, only : handle_error, fatal, warning, note
  use physcons, only : con_pi, con_rd, con_fvirt, con_g,con_rog,&
                       con_t0c, con_c, con_boltz, con_plnk
  use output_manager_fms, only: register_var, update_opdata
  use time_manager_mod, only: time_type
   
  implicit none
  private

  integer, parameter, public :: NF_AESW = 3     ! num of output fields for sw rad
  integer, parameter, public :: NF_AELW = 3     ! num of output fields for lw rad

  real, allocatable :: aod_tropo_sw_in(:,:,:), asy_tropo_sw_in(:,:,:), ssa_tropo_sw_in(:,:,:)

  real, allocatable :: aod_anthrop_sw_in(:,:,:,:), asy_anthrop_sw_in(:,:,:,:), ssa_anthrop_sw_in(:,:,:,:)

  real, allocatable :: aod_strato_sw_in(:,:,:,:), asy_strato_sw_in(:,:,:,:), ssa_strato_sw_in(:,:,:,:)



  real, allocatable :: extcoef_sw_in(:,:,:)

  integer :: nlevs_of_tropo_in = 0, nlevs_of_strato_in = 0, nlevs_of_anthrop_in = 0
  integer :: id_aero
  logical :: dz_in_equal=.true.
  real :: z1_in=-1.0, rdz_clim
  real :: dz_in_strato = 0.0, z0_in_strato = 0.0, dz_in_tropo = 0.0, z0_in_tropo =0.0
  character (len=32) :: vert_interp_opt='nearest'
  
  logical :: initialized=.false., use_this_aerosol=.true., strato=.true., tropo = .true., anthrop = .true., natural = .true.
  
  integer :: aod_tropo_sw_in_id=0, ssa_tropo_sw_in_id = 0, asy_tropo_sw_in_id = 0
  integer :: extcoef_sw_in_id=0
  integer :: id_aod_tropo_sw_in=0, id_ssa_tropo_sw_in=0, id_asy_tropo_sw_in=0, id_extcoef_sw_in=0
  integer :: id_zhaero=0, id_oro=0, id_ext_coef_sw=0

  integer :: id_aod_anthrop_sw_in1=0, id_aod_anthrop_sw_in2=0, id_aod_anthrop_sw_in3=0
  integer :: id_aod_anthrop_sw_in4=0, id_aod_anthrop_sw_in5=0, id_aod_anthrop_sw_in6=0
  integer :: id_aod_anthrop_sw_in7=0, id_aod_anthrop_sw_in8=0, id_aod_anthrop_sw_in9=0
  integer :: id_aod_anthrop_sw_in10=0, id_aod_anthrop_sw_in11=0, id_aod_anthrop_sw_in12=0
  integer :: id_aod_anthrop_sw_in13=0, id_aod_anthrop_sw_in14=0

  integer :: aod_anthrop_sw_in_id1=0, aod_anthrop_sw_in_id2=0, aod_anthrop_sw_in_id3=0
  integer :: aod_anthrop_sw_in_id4=0, aod_anthrop_sw_in_id5=0, aod_anthrop_sw_in_id6=0
  integer :: aod_anthrop_sw_in_id7=0, aod_anthrop_sw_in_id8=0, aod_anthrop_sw_in_id9=0
  integer :: aod_anthrop_sw_in_id10=0, aod_anthrop_sw_in_id11=0, aod_anthrop_sw_in_id12=0
  integer :: aod_anthrop_sw_in_id13=0, aod_anthrop_sw_in_id14=0

  integer :: id_ssa_anthrop_sw_in1=0, id_ssa_anthrop_sw_in2=0, id_ssa_anthrop_sw_in3=0
  integer :: id_ssa_anthrop_sw_in4=0, id_ssa_anthrop_sw_in5=0, id_ssa_anthrop_sw_in6=0
  integer :: id_ssa_anthrop_sw_in7=0, id_ssa_anthrop_sw_in8=0, id_ssa_anthrop_sw_in9=0
  integer :: id_ssa_anthrop_sw_in10=0, id_ssa_anthrop_sw_in11=0, id_ssa_anthrop_sw_in12=0
  integer :: id_ssa_anthrop_sw_in13=0, id_ssa_anthrop_sw_in14=0
!
  integer :: ssa_anthrop_sw_in_id1=0, ssa_anthrop_sw_in_id2=0, ssa_anthrop_sw_in_id3=0
  integer :: ssa_anthrop_sw_in_id4=0, ssa_anthrop_sw_in_id5=0, ssa_anthrop_sw_in_id6=0
  integer :: ssa_anthrop_sw_in_id7=0, ssa_anthrop_sw_in_id8=0, ssa_anthrop_sw_in_id9=0
  integer :: ssa_anthrop_sw_in_id10=0, ssa_anthrop_sw_in_id11=0, ssa_anthrop_sw_in_id12=0
  integer :: ssa_anthrop_sw_in_id13=0, ssa_anthrop_sw_in_id14=0
!
  integer :: id_asy_anthrop_sw_in1=0, id_asy_anthrop_sw_in2=0, id_asy_anthrop_sw_in3=0
  integer :: id_asy_anthrop_sw_in4=0, id_asy_anthrop_sw_in5=0, id_asy_anthrop_sw_in6=0
  integer :: id_asy_anthrop_sw_in7=0, id_asy_anthrop_sw_in8=0, id_asy_anthrop_sw_in9=0
  integer :: id_asy_anthrop_sw_in10=0, id_asy_anthrop_sw_in11=0, id_asy_anthrop_sw_in12=0
  integer :: id_asy_anthrop_sw_in13=0, id_asy_anthrop_sw_in14=0
!
  integer :: asy_anthrop_sw_in_id1=0, asy_anthrop_sw_in_id2=0, asy_anthrop_sw_in_id3=0
  integer :: asy_anthrop_sw_in_id4=0, asy_anthrop_sw_in_id5=0, asy_anthrop_sw_in_id6=0
  integer :: asy_anthrop_sw_in_id7=0, asy_anthrop_sw_in_id8=0, asy_anthrop_sw_in_id9=0
  integer :: asy_anthrop_sw_in_id10=0, asy_anthrop_sw_in_id11=0, asy_anthrop_sw_in_id12=0
  integer :: asy_anthrop_sw_in_id13=0, asy_anthrop_sw_in_id14=0

  integer :: id_aod_strato_sw_in1=0, id_aod_strato_sw_in2=0, id_aod_strato_sw_in3=0
  integer :: id_aod_strato_sw_in4=0, id_aod_strato_sw_in5=0, id_aod_strato_sw_in6=0
  integer :: id_aod_strato_sw_in7=0, id_aod_strato_sw_in8=0, id_aod_strato_sw_in9=0
  integer :: id_aod_strato_sw_in10=0, id_aod_strato_sw_in11=0, id_aod_strato_sw_in12=0
  integer :: id_aod_strato_sw_in13=0, id_aod_strato_sw_in14=0

  integer :: aod_strato_sw_in_id1=0, aod_strato_sw_in_id2=0, aod_strato_sw_in_id3=0
  integer :: aod_strato_sw_in_id4=0, aod_strato_sw_in_id5=0, aod_strato_sw_in_id6=0
  integer :: aod_strato_sw_in_id7=0, aod_strato_sw_in_id8=0, aod_strato_sw_in_id9=0
  integer :: aod_strato_sw_in_id10=0, aod_strato_sw_in_id11=0, aod_strato_sw_in_id12=0
  integer :: aod_strato_sw_in_id13=0, aod_strato_sw_in_id14=0




  real, allocatable:: z_strato_in(:), z_tropo_in(:)

  namelist /radiation_aerosol_nml/ dz_in_equal, nlevs_of_tropo_in, z1_in, vert_interp_opt, nlevs_of_strato_in, z0_in_strato, dz_in_strato, z0_in_tropo, dz_in_tropo, use_this_aerosol, strato, tropo, nlevs_of_anthrop_in, anthrop, natural

  public :: get_aerosols, set_aerosols, use_this_aerosol, strato
  
  contains

  subroutine init_aerosol_mod()
    integer :: i
    character (len=32) :: name

    if (initialized) return

    open(10,file='gfs_namelist')
    read(10,nml=radiation_aerosol_nml)
    if (me==0) write(*,nml=radiation_aerosol_nml)

    if (.not.use_this_aerosol) then
      initialized = .true.
      return
    endif
    
    if (nlevs_of_tropo_in <=0) call handle_error(fatal, 'nlevs_of_tropo_in if aerosol data should be greater than 0')
!    if (dz_in_equal) then
!      if (dz_in<=0.0) call handle_error(fatal, 'if dz_in_equal=.true. then dz hould be greter than 0.0')
!      if (z1_in<0.0.and.trim(vert_interp_opt)/='nearest') &
!      call handle_error(fatal, 'if dz_in_equal=.true. then z1_in should be greater than or equal to 0.0')
!    endif

    allocate(aod_tropo_sw_in(lonr, lats_node_r, NBDSW)) 
    allocate(ssa_tropo_sw_in(lonr, lats_node_r, NBDSW)) 
    allocate(asy_tropo_sw_in(lonr, lats_node_r, NBDSW)) 
    allocate(extcoef_sw_in(lonr, lats_node_r, nlevs_of_tropo_in)) 

    allocate(aod_anthrop_sw_in(lonr, lats_node_r, nlevs_of_anthrop_in,NBDSW))
    allocate(ssa_anthrop_sw_in(lonr, lats_node_r, nlevs_of_anthrop_in,NBDSW))
    allocate(asy_anthrop_sw_in(lonr, lats_node_r, nlevs_of_anthrop_in,NBDSW))

    allocate(aod_strato_sw_in(lonr, lats_node_r, nlevs_of_strato_in,NBDSW))
!    allocate(ssa_strato_sw_in(lonr, lats_node_r, nlevs_of_strato_in,NBDSW))
!    allocate(asy_strato_sw_in(lonr, lats_node_r, nlevs_of_strato_in,NBDSW))
    allocate(z_strato_in(nlevs_of_strato_in))
    allocate(z_tropo_in(nlevs_of_tropo_in))

    rdz_clim = 1.0 / dz_in_tropo     !lay(k+1)-lay(k)

    ! Calculate the heights of stratospheric aerosol file 
    do i=1,nlevs_of_strato_in
      z_strato_in(i) = z0_in_strato + (i-1) * dz_in_strato
    end do

    if(me==0) print *, 'z_strato_in=', z_strato_in
 
 !   do i = 1, NBDSW
  !    write(name,'(A,I2.2)') 'aod',i
   ! enddo

    !id_extcoef_sw_in =  register_var('extcoef_sw_in', 'Extinction Coef', ' ', nlevs_of_tropo_in )
    !id_aod_tropo_sw_in = register_var('aod_tropo_sw_in', 'AOD input', ' ', NBDSW) 
    !id_zhaero = register_var('zhaero', 'zhaero', ' ', levs) 
    !id_oro = register_var('oro','oro',' ')
    !id_ext_coef_sw = register_var('ext_coef_sw','ext_coef_sw',' ',levs)
  
    initialized = .true.

  end subroutine init_aerosol_mod
  
  subroutine get_aerosols(Time)
    !This should be called before grrad, Either in dotstep or in the beging of gloopr.
    ! Get the data from aerosol input files given in atm_data_table.
    type(time_type), intent(in) :: Time
    logical :: overriden


    call init_aerosol_mod()

    if (.not.use_this_aerosol) return
   
    overriden = .true.
     
    call data_override('aod_sw',aod_tropo_sw_in,Time,aod_tropo_sw_in_id,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_sw.') 
    call update_opdata(id_aod_tropo_sw_in, aod_tropo_sw_in)
   
    call data_override('ssa_sw',ssa_tropo_sw_in,Time,ssa_tropo_sw_in_id,overriden)  
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_sw.')
    call update_opdata(id_ssa_tropo_sw_in, ssa_tropo_sw_in)
   
    call data_override('asy_sw',asy_tropo_sw_in,Time,asy_tropo_sw_in_id,overriden)  
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_sw.')
    call update_opdata(id_asy_tropo_sw_in, asy_tropo_sw_in)
   
    call data_override('extcoef_sw',extcoef_sw_in,Time, extcoef_sw_in_id,overriden)  
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read extcoef_sw.')
    call update_opdata(id_extcoef_sw_in, extcoef_sw_in)

    call data_override('aod_anthrop_sw1',aod_anthrop_sw_in(:,:,:,1),Time,aod_anthrop_sw_in_id1,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_anthrop_sw1.')
    call update_opdata(id_aod_anthrop_sw_in1, aod_anthrop_sw_in(:,:,:,1))

    call data_override('aod_anthrop_sw2',aod_anthrop_sw_in(:,:,:,2),Time,aod_anthrop_sw_in_id2,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_anthrop_sw2.')
    call update_opdata(id_aod_anthrop_sw_in2, aod_anthrop_sw_in(:,:,:,2))

    call data_override('aod_anthrop_sw3',aod_anthrop_sw_in(:,:,:,3),Time,aod_anthrop_sw_in_id3,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_anthrop_sw3.')
    call update_opdata(id_aod_anthrop_sw_in3, aod_anthrop_sw_in(:,:,:,3))

    call data_override('aod_anthrop_sw4',aod_anthrop_sw_in(:,:,:,4),Time,aod_anthrop_sw_in_id4,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_anthrop_sw4.')
    call update_opdata(id_aod_anthrop_sw_in4, aod_anthrop_sw_in(:,:,:,4))

    call data_override('aod_anthrop_sw5',aod_anthrop_sw_in(:,:,:,5),Time,aod_anthrop_sw_in_id5,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_anthrop_sw5.')
    call update_opdata(id_aod_anthrop_sw_in5, aod_anthrop_sw_in(:,:,:,5))

    call data_override('aod_anthrop_sw6',aod_anthrop_sw_in(:,:,:,6),Time,aod_anthrop_sw_in_id6,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_anthrop_sw6.')
    call update_opdata(id_aod_anthrop_sw_in6, aod_anthrop_sw_in(:,:,:,6))

    call data_override('aod_anthrop_sw7',aod_anthrop_sw_in(:,:,:,7),Time,aod_anthrop_sw_in_id7,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_anthrop_sw7.')
    call update_opdata(id_aod_anthrop_sw_in7, aod_anthrop_sw_in(:,:,:,7))

    call data_override('aod_anthrop_sw8',aod_anthrop_sw_in(:,:,:,8),Time,aod_anthrop_sw_in_id8,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_anthrop_sw8.')
    call update_opdata(id_aod_anthrop_sw_in8, aod_anthrop_sw_in(:,:,:,8))

    call data_override('aod_anthrop_sw9',aod_anthrop_sw_in(:,:,:,9),Time,aod_anthrop_sw_in_id9,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_anthrop_sw9.')
    call update_opdata(id_aod_anthrop_sw_in9, aod_anthrop_sw_in(:,:,:,9))

    call data_override('aod_anthrop_sw10',aod_anthrop_sw_in(:,:,:,10),Time,aod_anthrop_sw_in_id10,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_anthrop_sw10.')
    call update_opdata(id_aod_anthrop_sw_in10, aod_anthrop_sw_in(:,:,:,10))

    call data_override('aod_anthrop_sw11',aod_anthrop_sw_in(:,:,:,11),Time,aod_anthrop_sw_in_id11,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_anthrop_sw11.')
    call update_opdata(id_aod_anthrop_sw_in11, aod_anthrop_sw_in(:,:,:,11))

    call data_override('aod_anthrop_sw12',aod_anthrop_sw_in(:,:,:,12),Time,aod_anthrop_sw_in_id12,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_anthrop_sw12.')
    call update_opdata(id_aod_anthrop_sw_in12, aod_anthrop_sw_in(:,:,:,12))

    call data_override('aod_anthrop_sw13',aod_anthrop_sw_in(:,:,:,13),Time,aod_anthrop_sw_in_id13,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_anthrop_sw13.')
    call update_opdata(id_aod_anthrop_sw_in1, aod_anthrop_sw_in(:,:,:,13))

    call data_override('aod_anthrop_sw14',aod_anthrop_sw_in(:,:,:,14),Time,aod_anthrop_sw_in_id14,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_anthrop_sw14.')
    call update_opdata(id_aod_anthrop_sw_in14, aod_anthrop_sw_in(:,:,:,14))


    call data_override('ssa_anthrop_sw1',ssa_anthrop_sw_in(:,:,:,1),Time,ssa_anthrop_sw_in_id1,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_anthrop_sw1.')
    call update_opdata(id_ssa_anthrop_sw_in1, ssa_anthrop_sw_in(:,:,:,1))

    call data_override('ssa_anthrop_sw2',ssa_anthrop_sw_in(:,:,:,2),Time,ssa_anthrop_sw_in_id2,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_anthrop_sw2.')
    call update_opdata(id_ssa_anthrop_sw_in2, ssa_anthrop_sw_in(:,:,:,2))

    call data_override('ssa_anthrop_sw3',ssa_anthrop_sw_in(:,:,:,3),Time,ssa_anthrop_sw_in_id3,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_anthrop_sw3.')
    call update_opdata(id_ssa_anthrop_sw_in3, ssa_anthrop_sw_in(:,:,:,3))

    call data_override('ssa_anthrop_sw4',ssa_anthrop_sw_in(:,:,:,4),Time,ssa_anthrop_sw_in_id4,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_anthrop_sw4.')
    call update_opdata(id_ssa_anthrop_sw_in4, ssa_anthrop_sw_in(:,:,:,4))

    call data_override('ssa_anthrop_sw5',ssa_anthrop_sw_in(:,:,:,5),Time,ssa_anthrop_sw_in_id5,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_anthrop_sw5.')
    call update_opdata(id_ssa_anthrop_sw_in5, ssa_anthrop_sw_in(:,:,:,5))

    call data_override('ssa_anthrop_sw6',ssa_anthrop_sw_in(:,:,:,6),Time,ssa_anthrop_sw_in_id6,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_anthrop_sw6.')
    call update_opdata(id_ssa_anthrop_sw_in6, ssa_anthrop_sw_in(:,:,:,6))

    call data_override('ssa_anthrop_sw7',ssa_anthrop_sw_in(:,:,:,7),Time,ssa_anthrop_sw_in_id7,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_anthrop_sw7.')
    call update_opdata(id_ssa_anthrop_sw_in7, ssa_anthrop_sw_in(:,:,:,7))

    call data_override('ssa_anthrop_sw8',ssa_anthrop_sw_in(:,:,:,8),Time,ssa_anthrop_sw_in_id8,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_anthrop_sw8.')
    call update_opdata(id_ssa_anthrop_sw_in8, ssa_anthrop_sw_in(:,:,:,8))

    call data_override('ssa_anthrop_sw9',ssa_anthrop_sw_in(:,:,:,9),Time,ssa_anthrop_sw_in_id9,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_anthrop_sw9.')
    call update_opdata(id_ssa_anthrop_sw_in9, ssa_anthrop_sw_in(:,:,:,9))

    call data_override('ssa_anthrop_sw10',ssa_anthrop_sw_in(:,:,:,10),Time,ssa_anthrop_sw_in_id10,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_anthrop_sw10.')
    call update_opdata(id_ssa_anthrop_sw_in10, ssa_anthrop_sw_in(:,:,:,10))

    call data_override('ssa_anthrop_sw11',ssa_anthrop_sw_in(:,:,:,11),Time,ssa_anthrop_sw_in_id11,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_anthrop_sw11.')
    call update_opdata(id_ssa_anthrop_sw_in11, ssa_anthrop_sw_in(:,:,:,11))

    call data_override('ssa_anthrop_sw12',ssa_anthrop_sw_in(:,:,:,12),Time,ssa_anthrop_sw_in_id12,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_anthrop_sw12.')
    call update_opdata(id_ssa_anthrop_sw_in12, ssa_anthrop_sw_in(:,:,:,12))

    call data_override('ssa_anthrop_sw13',ssa_anthrop_sw_in(:,:,:,13),Time,ssa_anthrop_sw_in_id13,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_anthrop_sw13.')
    call update_opdata(id_ssa_anthrop_sw_in1, ssa_anthrop_sw_in(:,:,:,13))

    call data_override('ssa_anthrop_sw14',ssa_anthrop_sw_in(:,:,:,14),Time,ssa_anthrop_sw_in_id14,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read ssa_anthrop_sw14.')
    call update_opdata(id_ssa_anthrop_sw_in14, ssa_anthrop_sw_in(:,:,:,14))

    call data_override('asy_anthrop_sw1',asy_anthrop_sw_in(:,:,:,1),Time,asy_anthrop_sw_in_id1,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_anthrop_sw1.')
    call update_opdata(id_asy_anthrop_sw_in1, asy_anthrop_sw_in(:,:,:,1))

    call data_override('asy_anthrop_sw2',asy_anthrop_sw_in(:,:,:,2),Time,asy_anthrop_sw_in_id2,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_anthrop_sw2.')
    call update_opdata(id_asy_anthrop_sw_in2, asy_anthrop_sw_in(:,:,:,2))

    call data_override('asy_anthrop_sw3',asy_anthrop_sw_in(:,:,:,3),Time,asy_anthrop_sw_in_id3,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_anthrop_sw3.')
    call update_opdata(id_asy_anthrop_sw_in3, asy_anthrop_sw_in(:,:,:,3))

    call data_override('asy_anthrop_sw4',asy_anthrop_sw_in(:,:,:,4),Time,asy_anthrop_sw_in_id4,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_anthrop_sw4.')
    call update_opdata(id_asy_anthrop_sw_in4, asy_anthrop_sw_in(:,:,:,4))

    call data_override('asy_anthrop_sw5',asy_anthrop_sw_in(:,:,:,5),Time,asy_anthrop_sw_in_id5,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_anthrop_sw5.')
    call update_opdata(id_asy_anthrop_sw_in5, asy_anthrop_sw_in(:,:,:,5))

    call data_override('asy_anthrop_sw6',asy_anthrop_sw_in(:,:,:,6),Time,asy_anthrop_sw_in_id6,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_anthrop_sw6.')
    call update_opdata(id_asy_anthrop_sw_in6, asy_anthrop_sw_in(:,:,:,6))

    call data_override('asy_anthrop_sw7',asy_anthrop_sw_in(:,:,:,7),Time,asy_anthrop_sw_in_id7,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_anthrop_sw7.')
    call update_opdata(id_asy_anthrop_sw_in7, asy_anthrop_sw_in(:,:,:,7))

    call data_override('asy_anthrop_sw8',asy_anthrop_sw_in(:,:,:,8),Time,asy_anthrop_sw_in_id8,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_anthrop_sw8.')
    call update_opdata(id_asy_anthrop_sw_in8, asy_anthrop_sw_in(:,:,:,8))

    call data_override('asy_anthrop_sw9',asy_anthrop_sw_in(:,:,:,9),Time,asy_anthrop_sw_in_id9,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_anthrop_sw9.')
    call update_opdata(id_asy_anthrop_sw_in9, asy_anthrop_sw_in(:,:,:,9))

    call data_override('asy_anthrop_sw10',asy_anthrop_sw_in(:,:,:,10),Time,asy_anthrop_sw_in_id10,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_anthrop_sw10.')
    call update_opdata(id_asy_anthrop_sw_in10, asy_anthrop_sw_in(:,:,:,10))

    call data_override('asy_anthrop_sw11',asy_anthrop_sw_in(:,:,:,11),Time,asy_anthrop_sw_in_id11,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_anthrop_sw11.')
    call update_opdata(id_asy_anthrop_sw_in11, asy_anthrop_sw_in(:,:,:,11))

    call data_override('asy_anthrop_sw12',asy_anthrop_sw_in(:,:,:,12),Time,asy_anthrop_sw_in_id12,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_anthrop_sw12.')
    call update_opdata(id_asy_anthrop_sw_in12, asy_anthrop_sw_in(:,:,:,12))

    call data_override('asy_anthrop_sw13',asy_anthrop_sw_in(:,:,:,13),Time,asy_anthrop_sw_in_id13,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_anthrop_sw13.')
    call update_opdata(id_asy_anthrop_sw_in1, asy_anthrop_sw_in(:,:,:,13))

    call data_override('asy_anthrop_sw14',asy_anthrop_sw_in(:,:,:,14),Time,asy_anthrop_sw_in_id14,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read asy_anthrop_sw14.')
    call update_opdata(id_asy_anthrop_sw_in14, asy_anthrop_sw_in(:,:,:,14))

    if (strato) then
    call data_override('aod_strato_sw1',aod_strato_sw_in(:,:,:,1),Time,aod_strato_sw_in_id1,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_strato_sw1.')
    call update_opdata(id_aod_strato_sw_in1, aod_strato_sw_in(:,:,:,1))

    call data_override('aod_strato_sw2',aod_strato_sw_in(:,:,:,2),Time,aod_strato_sw_in_id2,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_strato_sw2.')
    call update_opdata(id_aod_strato_sw_in2, aod_strato_sw_in(:,:,:,2))

    call data_override('aod_strato_sw3',aod_strato_sw_in(:,:,:,3),Time,aod_strato_sw_in_id3,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_strato_sw3.')
    call update_opdata(id_aod_strato_sw_in3, aod_strato_sw_in(:,:,:,3))

    call data_override('aod_strato_sw4',aod_strato_sw_in(:,:,:,4),Time,aod_strato_sw_in_id4,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_strato_sw4.')
    call update_opdata(id_aod_strato_sw_in4, aod_strato_sw_in(:,:,:,4))

    call data_override('aod_strato_sw5',aod_strato_sw_in(:,:,:,5),Time,aod_strato_sw_in_id5,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_strato_sw5.')
    call update_opdata(id_aod_strato_sw_in5, aod_strato_sw_in(:,:,:,5))

    call data_override('aod_strato_sw6',aod_strato_sw_in(:,:,:,6),Time,aod_strato_sw_in_id6,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_strato_sw6.')
    call update_opdata(id_aod_strato_sw_in6, aod_strato_sw_in(:,:,:,6))

    call data_override('aod_strato_sw7',aod_strato_sw_in(:,:,:,7),Time,aod_strato_sw_in_id7,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_strato_sw7.')
    call update_opdata(id_aod_strato_sw_in7, aod_strato_sw_in(:,:,:,7))

    call data_override('aod_strato_sw8',aod_strato_sw_in(:,:,:,8),Time,aod_strato_sw_in_id8,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_strato_sw8.')
    call update_opdata(id_aod_strato_sw_in8, aod_strato_sw_in(:,:,:,8))

    call data_override('aod_strato_sw9',aod_strato_sw_in(:,:,:,9),Time,aod_strato_sw_in_id9,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_strato_sw9.')
    call update_opdata(id_aod_strato_sw_in9, aod_strato_sw_in(:,:,:,9))

    call data_override('aod_strato_sw10',aod_strato_sw_in(:,:,:,10),Time,aod_strato_sw_in_id10,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_strato_sw10.')
    call update_opdata(id_aod_strato_sw_in10, aod_strato_sw_in(:,:,:,10))

    call data_override('aod_strato_sw11',aod_strato_sw_in(:,:,:,11),Time,aod_strato_sw_in_id11,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_strato_sw11.')
    call update_opdata(id_aod_strato_sw_in11, aod_strato_sw_in(:,:,:,11))

    call data_override('aod_strato_sw12',aod_strato_sw_in(:,:,:,12),Time,aod_strato_sw_in_id12,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_strato_sw12.')
    call update_opdata(id_aod_strato_sw_in12, aod_strato_sw_in(:,:,:,12))

    call data_override('aod_strato_sw13',aod_strato_sw_in(:,:,:,13),Time,aod_strato_sw_in_id13,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_strato_sw13.')
    call update_opdata(id_aod_strato_sw_in13, aod_strato_sw_in(:,:,:,13))

    call data_override('aod_strato_sw14',aod_strato_sw_in(:,:,:,14),Time,aod_strato_sw_in_id14,overriden)
    if (.not.overriden) call handle_error(fatal, 'get_aerosols: Could not read aod_strato_sw14.')
    call update_opdata(id_aod_strato_sw_in14, aod_strato_sw_in(:,:,:,14))


    endif
    if(me==0) print *, 'reading aerosols over'

  end subroutine get_aerosols



  subroutine set_aerosols (istrt, im, lan, nlay, prsi, prsl, tlay, geopl, oro,   &
                                             aerosw, aerolw,zh)

!  ==================================================================  !
!                                                                      !
!  outputs:                                                            !
!     aerosw - aeros opt properties for sw      im*NLAY*NBDSW*NF_AESW!
!               (:,:,:,1): optical depth                               !
!               (:,:,:,2): single scattering albedo                    !
!               (:,:,:,3): asymmetry parameter                         !
!     aerolw - aeros opt properties for lw      im*NLAY*NBDLW*NF_AELW!
!               (:,:,:,1): optical depth                               !
!               (:,:,:,2): single scattering albedo                    !
!               (:,:,:,3): asymmetry parameter                         !
!                                                                      !
!                                                                      !
!                                                                      !
!  ==================================================================  !

      implicit none

!  ---  inputs:
      integer, intent(in) :: im, istrt, lan, nlay
      real, dimension(:,:), intent(in) :: prsi, prsl, tlay
      real, dimension(:,:), intent(in) :: geopl
      real, dimension(:),   intent(in) :: oro

!  ---  outputs:
      real, dimension(:,:,:,:), intent(out) :: aerosw, aerolw

!  ---  locals:

      integer               :: i, i1, i2, j1, j2, k, m, m1, kp,jk,j,l
      integer               ::jwl, jl, isc, iec,nlev_start

      integer, dimension(im):: kindex

      real :: zdeltag(im,nlay), min_index,zhif(im,nlay+1)

      real :: zh(im,nlay), delp(im,nlay),wt(im,nlay),donm(im,nlay)

      real, dimension(im,nlay ):: ext_coef_sw
      real, dimension(im):: ext_coef_sum 
      real, dimension(im,nlay,nbdsw):: aod_strato_sw, ssa_strato_sw, asy_strato_sw
      real, dimension(im,nlay,nbdsw):: aod_anthrop_sw, ssa_anthrop_sw, asy_anthrop_sw
      real, dimension(im,nlay,nbdsw):: aod_natural_sw, ssa_natural_sw, asy_natural_sw

!===>  ...  begin here

      if (.not.use_this_aerosol) return

      isc = istrt;  iec=istrt+im-1

! Calculate the heights of tropospheric aerosol file 
      do i=1,nlevs_of_tropo_in
        z_tropo_in(i) = z0_in_tropo + (i-1) * dz_in_tropo
      end do

! (i) calculate altitude above NN and layer thickness in 
!     gfs for altitude profiles

      do k=1,nlay
        delp(1:im,k)=prsi(1:im,k)-prsi(1:im,k+1)
      enddo

      zdeltag(1:im,1:nlay) =( delp(1:im,1:nlay) * tlay(1:im,1:nlay) / &
                                              prsl(1:im,1:nlay))*con_rog

      DO k=1,nlay
        zh(1:im,k) = (geopl(1:im,k)/con_g) + oro(1:im)
      END DO
!interface height
         zhif(1:im,0)=0.0
      DO k=2,nlay
        zhif(1:im,k) =(zh(1:im,k+1)+zh(1:im,k))/2.0 
      END DO

! put the stratospheric aerosols to the nearest model
! levels
    aod_strato_sw = 0.0
    do i=1,im
      nlev_start=1
          do j=1,nlay-1

              do k=nlev_start,nlevs_of_strato_in

                if (z_strato_in(k).gt.zhif(i,j+1)) exit
                if ((z_strato_in(k) > zhif(i,j)).and.(z_strato_in(k) <= zhif(i,j+1))) then
                if ((z_strato_in(k) > zhif(i,j)).and.(z_strato_in(k) <= zh(i,j))) then
                   aod_strato_sw(i,j,:)   = aod_strato_sw(i,j,:)+((z_strato_in(k)-zhif(i,j))/(zh(i,j)-zhif(i,j)))*aod_strato_sw_in(istrt+i-1,lan,k,:)
                else
                   aod_strato_sw(i,j,:)   = aod_strato_sw(i,j,:)+((zhif(i,j+1)-z_strato_in(k))/(zhif(i,j+1)-zh(i,j)))*aod_strato_sw_in(istrt+i-1,lan,k,:)
                endif
                endif
            end do
nlev_start = k
      end do
    end do
!-----Multiply extinction coefficient with zh
do i=1,im

do jwl=1,nbdsw
do jk=1,nlay
aod_strato_sw(i,jk,nbdsw) = (aod_strato_sw(i,jk,nbdsw)) *  zdeltag(i,jk)  * 0.001
end do

end do
end do

! Put the stratospheric aerosols to zero wherever tropospheric aerosols are
! present
  
    do j=1,im
      do i=1,nlay

      if (zh(j,i) < z_tropo_in(nlevs_of_tropo_in).or.(zh(j,i) >z_strato_in(nlevs_of_strato_in))) then
        aod_strato_sw(j,i,:) = 0.0
!        ssa_strato_sw(j,i,:) = 1.0
!        asy_strato_sw(j,i,:) = 0.0
      end if

      end do
    end do
! Put the anthropogenic aerosols to the model heights 
do i=1,im
  do jwl=1,nbdsw
     do j=1,nlay

               aod_anthrop_sw(i,j,jwl)= aod_anthrop_sw_in(isc+i-1,lan,j,jwl)
               ssa_anthrop_sw(i,j,jwl)= ssa_anthrop_sw_in(isc+i-1,lan,j,jwl)
               asy_anthrop_sw(i,j,jwl)= asy_anthrop_sw_in(isc+i-1,lan,j,jwl)
               aod_anthrop_sw(i,j,jwl)= nint(aod_anthrop_sw(i,j,jwl) * 1000000.0) * 1E-6
end do
end do
end do



! (ii) Vertical indexing of extinction coeff in for gfs grid (following
! Echam) 

      ext_coef_sw(1:im,1:nlay)=0.0

      do jk=1,nlay
        kindex(1:im)=int(zh(1:im,jk)*rdz_clim+0.50)
        where(kindex<1) kindex=1
        do jl=1,im
           if (kindex(jl) > 0 .and. kindex(jl) <= nlevs_of_tropo_in) then
             ext_coef_sw(jl,jk)= extcoef_sw_in(istrt+jl-1, lan, kindex(jl))
           end if
        end do
      end do

! normalize height profile for all modes(anthropogenic and natural)
! Needed even if exticntion data is in model levels

      ext_coef_sum(1:im)=0.0

   !   do jk=1,nlay
   !     ext_coef_sum(1:im)=ext_coef_sum(1:im)+                                  &
   !  &                   ext_coef_sw(1:im,jk)*zdeltag(1:im,jk)
   !   enddo

   !   where (ext_coef_sum(1:im) <= 0.0)
   !     ext_coef_sum(1:im)=1.0
   !   end where

      DO jk=1,nlay
       ! ext_coef_sw(1:im,jk)=zdeltag(1:im,jk)*ext_coef_sw(1:im,jk)/ext_coef_sum(1:im)
        ext_coef_sw(1:im,jk)=zdeltag(1:im,jk)*ext_coef_sw(1:im,jk)
        ext_coef_sum(1:im)=ext_coef_sum(1:im)+ext_coef_sw(1:im,jk)
      END DO

      where (ext_coef_sum(1:im) <= 0.0)
        ext_coef_sum(1:im)=1.0
      end where

      do jk=1,nlay
        ext_coef_sw(1:im,jk)=ext_coef_sw(1:im,jk)/ext_coef_sum(1:im)
      enddo
      
      aerosw(:,:,:,:) = 0.0
   
! calculate optical properties
! aerosol optical depth 
      do jk=1,nlay
        do jwl=1,nbdsw
          if(use_this_aerosol) then

            if(tropo) then

               do i=1,im 
                
                if (zh(i,jk) < z_tropo_in(nlevs_of_tropo_in)) then

                  if(natural) then
                    aod_natural_sw(i,jk,jwl) = aod_tropo_sw_in(isc+i-1,lan,jwl) * ext_coef_sw(i,jk)
                    aerosw(i,jk,jwl,1) = aerosw(i,jk,jwl,1) + aod_natural_sw(i,jk,jwl)
                  end if ! end if for natural

                  if(anthrop) then
                    aerosw(i,jk,jwl,1) = aerosw(i,jk,jwl,1) + aod_anthrop_sw(i,jk,jwl)
                  end if ! end if for anthrop

                end if ! end if to make sure tropospheric aerosol is below 17 km

               end do ! end do for im loop

            end if ! end if for tropo

            if (strato) then
                do i=1,im
                  if (zh(i,jk) > z_tropo_in(nlevs_of_tropo_in).and.(zh(i,jk) < z_strato_in(nlevs_of_strato_in))) then
                    aerosw(i,jk,jwl,1) = aerosw(i,jk,jwl,1) + aod_strato_sw(i, jk,jwl)
                  end if ! end if to make sure that the stratospheric aerosol goes only in stratosphere 
                end do ! end do for im
            end if ! end if for strato
          end if ! end if for use_this_aerosol redundant, as control will not enter this subroutine if false

      if(tropo) then  
        do i=1,im
          if (zh(i,jk) < z_tropo_in(nlevs_of_tropo_in)) then
            ssa_natural_sw(i,jk,jwl) = ssa_tropo_sw_in(isc+i-1,lan,jwl)
            asy_natural_sw(i,jk,jwl)  = asy_tropo_sw_in(isc+i-1,lan,jwl)

            if(natural.and.anthrop.and.(.not.(aerosw(i,jk,jwl,1)==0.0))) then

              aerosw(i,jk,jwl,2)= ((ssa_natural_sw(i,jk,jwl)*aod_natural_sw(i,jk,jwl))+(ssa_anthrop_sw(i,jk,jwl)*aod_anthrop_sw(i,jk,jwl)))/(aod_natural_sw(i,jk,jwl)+aod_anthrop_sw(i,jk,jwl))
              aerosw(i,jk,jwl,3)= ((ssa_natural_sw(i,jk,jwl)*aod_natural_sw(i,jk,jwl)*asy_natural_sw(i,jk,jwl))+(ssa_anthrop_sw(i,jk,jwl)*aod_anthrop_sw(i,jk,jwl)*asy_anthrop_sw(i,jk,jwl)))/((ssa_natural_sw(i,jk,jwl)*aod_natural_sw(i,jk,jwl))+(ssa_anthrop_sw(i,jk,jwl)*aod_anthrop_sw(i,jk,jwl)))
!              aerosw(i,jk,jwl,3)= ((ssa_natural_sw(i,jk,jwl)*aod_natural_sw(i,jk,jwl)*asy_natural_sw(i,jk,jwl))+(ssa_anthrop_sw(i,jk,jwl)*aod_anthrop_sw(i,jk,jwl)*asy_anthrop_sw(i,jk,jwl)))/(aerosw(i,jk,jwl,1)*aerosw(i,jk,jwl,2))
            end if ! end if for natural and anthrop 



            if(anthrop.and.(.not.(natural))) then

              aerosw(i,jk,jwl,2)= ssa_anthrop_sw(i,jk,jwl)
              aerosw(i,jk,jwl,3)= asy_anthrop_sw(i,jk,jwl)
            end if ! end if for anthrop and no natural

            if(natural.and.(.not.(anthrop))) then

              aerosw(i,jk,jwl,2)= ssa_natural_sw(i,jk,jwl)
              aerosw(i,jk,jwl,3)= asy_natural_sw(i,jk,jwl)
            end if ! end if for natural and no anthrop



          end if ! end if for limiting tropospheric aerosols to below 17 km
        end do ! end do for im
      end if ! end if for tropo

   end do! end do for nbdsw


    if(strato) then

      do i=1,im 
        if (zh(i,jk) > z_tropo_in(nlevs_of_tropo_in).and.(zh(i,jk) < z_strato_in(nlevs_of_strato_in))) then
          aerosw(i,jk,1:nbdsw,2)  = 0.99 
          aerosw(i,jk,1:nbdsw,3)  = 0.6366 
        end if ! end if for ssa and asy in stratosphere  
      end do !end do for im 
    end if ! end if for strato



        where (aerosw(1:im,jk,1:nbdsw,1) == 0.0)
          aerosw(1:im,jk,1:nbdsw,2) = 1.0
          aerosw(1:im,jk,1:nbdsw,3) = 0.0
        end where
      enddo ! end do for jk/nlay

        !write(301,*) aerosw(i,jk,10,2)
!      if (any(id_aero>0)) then
 !       do i = 1, nbdsw
!call update_opdata(id_ua,tmp3d(1:im,1:levs),istrt, im,lan)
  !      enddo
!      endif
      !call update_opdata(id_zhaero,zh(1:im,:),istrt,im,lan)
      !call update_opdata(id_oro,oro(1:im), istrt,im,lan)
      !call update_opdata(id_ext_coef_sw,ext_coef_sw(1:im,:), istrt,im,lan)

      aerolw(:,:,:,:) = 0.0

  end subroutine set_aerosols

end module radiation_aerosol_mod 
