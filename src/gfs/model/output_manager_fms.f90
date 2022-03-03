module output_manager_fms
  use diag_manager_mod, only: diag_manager_init, diag_manager_end 
  use diag_manager_mod, only: diag_axis_init, register_static_field
  use diag_manager_mod, only: register_diag_field, send_data
  use diag_manager_mod, only: set_diag_global_att
  use time_manager_mod, only: time_type
  use constants_mod, only: RAD_TO_DEG
  use resol_def, only : lonr, latr
  use layout1, only : lats_node_r
  use error_mod, only : handle_error, fatal, WARNING, NOTE
  use interpred_mod, only: interp2regular
  use layout1, only : ipt_lats_node_r
  use diag_data_mod, only: fill_value=>CMOR_MISSING_VALUE
  use coordinate_def, only: ak5, bk5  
  use time_manager_mod, only: time_type

  implicit none
  private

  integer, public :: lon_id, lat_id, lev_id
  integer :: max_nlevs=100, n_nlevs=0, total_eles=0
  integer, allocatable :: nlevs(:,:)
  type(time_type), public :: currtime
  
  public :: init_output_manager
  public :: end_output_manager
  public :: register_var, update_opdata, register_static

  interface update_opdata
     module procedure update_opdata_2d_o
     module procedure update_opdata_3d_o
     module procedure update_opdata_2d
     module procedure update_opdata_3d
  end interface update_opdata
  
  
  contains

    subroutine init_output_manager(xlat, xlonf, global_lats_r, lonsperlar, Time)
      real, intent(in) :: xlat(lats_node_r), xlonf(lonr)
      integer, intent(in) :: global_lats_r(latr), lonsperlar(latr)
      type(time_type), intent(in) :: Time
      
      integer :: i, lev_id, id
      logical :: used
      integer :: tmp(lats_node_r+1)
      Character (len=32) :: tmpc

      call diag_manager_init()

      lon_id = diag_axis_init(name='lon', data=xlonf(:)*RAD_TO_DEG, units='degrees_east' , cart_name='X', &
           long_name='longitude')
      lat_id = diag_axis_init(name='lat', data=xlat(:)*RAD_TO_DEG, units='degrees_north' , cart_name='Y', &
           long_name='latitude')

      allocate(nlevs(2,max_nlevs))

      tmp(1)=latr
      total_eles = 0
      do i=1,lats_node_r
         tmp(i+1)=global_lats_r(ipt_lats_node_r-1+i)
         total_eles = total_eles + lonsperlar(tmp(i+1))
      enddo
      
      call set_diag_global_att(decomp=tmp)

      n_nlevs = 2
      
      nlevs(1,1) = size(ak5,1)
      write(tmpc,*) size(ak5,1)
      tmpc=trim(adjustl(tmpc))
      nlevs(2,1) = diag_axis_init(name='lev'//trim(tmpc), data=(/(real(i),i=1,size(ak5,1))/), units='', &
              cart_name='Z', long_name='levels')
      lev_id = nlevs(2,1)
      id = register_static_field('gfs', 'coef_ai', (/lev_id/), units='Pa')
      used = send_data(id,ak5*1000.0)
      
      id = register_static_field('gfs', 'coef_bi', (/lev_id/))
      used = send_data(id,bk5)

      nlevs(1,2) = size(ak5,1)-1
      write(tmpc,*) size(ak5,1)-1
      tmpc=trim(adjustl(tmpc))
      nlevs(2,2) = diag_axis_init(name='lev'//trim(tmpc), data=(/(real(i),i=1,size(ak5,1)-1)/), units='', &
           cart_name='Z', long_name='levels')
      lev_id = nlevs(2,2)
     
      id = register_static_field('gfs', 'coef_a', (/lev_id/), units='Pa')
      used = send_data(id,(ak5(1:size(ak5)-1)+ak5(2:size(ak5)))*0.5*1000.0)

      id = register_static_field('gfs', 'coef_b', (/lev_id/))
      used = send_data(id,(bk5(1:size(bk5)-1)+bk5(2:size(bk5)))*0.5)

    end subroutine init_output_manager

    integer function register_var(name, time, long_name, units, range, standard_name, red2reg, levs, mask, wgt)
      
      character (len=*), intent(in) :: name
      type(time_type), intent(in) :: time
      character (len=*), intent(in), optional :: long_name, units
      real, intent(in), optional :: range(2)
      character (len=*), intent(in), optional :: standard_name
      integer, intent(in), optional :: levs
      real, intent(in), optional :: mask(:,:)
      logical, intent(in), optional :: wgt
      logical, intent(in), optional :: red2reg 

      character (len=32) :: tmp
      integer :: n, i
      logical :: wgt1,red2reg1

      wgt1=.false.
      if(present(wgt)) wgt1=wgt

      red2reg1=.true.
      if(present(red2reg)) red2reg1=red2reg

      if (.not.present(levs)) then
         register_var = register_diag_field('gfs', trim(name), (/lon_id, lat_id/), &
              time, long_name, units, fill_value, range, wgt1, standard_name, mask=mask, red2reg=red2reg1, total_elements=total_eles)
      else
         n=0
         do i = 1, n_nlevs
            if (levs==nlevs(1,i)) then
               n=i
               exit
            endif
         enddo

         if (n==0) then
            n_nlevs=n_nlevs+1
            if (n_nlevs > max_nlevs) call handle_error(fatal, 'register_var: n_nlevs>max_nlevs, increase max_nlevs!')
            n=n_nlevs
            nlevs(1,n) = levs
            write(tmp,*) levs
            tmp=trim(adjustl(tmp))
            nlevs(2,n) = diag_axis_init(name='lev'//trim(tmp), data=(/(real(i),i=1,levs)/), units='', &
                                        cart_name='Z', long_name='levels')
         endif

         lev_id = nlevs(2,n)

         register_var = register_diag_field('gfs', name, (/lon_id, lat_id, lev_id/), &
              time, long_name, units, fill_value, range, wgt1, standard_name, mask=mask, red2reg=red2reg1, total_elements=total_eles*levs)
         
      endif
            
    end function register_var

    integer function register_static(name, long_name, units, range, standard_name, levs, mask, wgt)
      character (len=*), intent(in) :: name
      character (len=*), intent(in), optional :: long_name, units
      real, intent(in), optional :: range(2)
      character (len=*), intent(in), optional :: standard_name
      integer, intent(in), optional :: levs
      real, intent(in), optional :: mask(:,:)
      logical, intent(in), optional :: wgt 

      character (len=32) :: tmp
      integer :: n, i

      if (.not.present(levs)) then
         register_static = register_static_field('gfs', trim(name), (/lon_id, lat_id/), &
              long_name, units, fill_value, range, wgt, standard_name, mask=mask, red2reg=.true., total_elements=total_eles)
      else
         n=0
         do i = 1, n_nlevs
            if (levs==nlevs(1,i)) then
               n=i
               exit
            endif
         enddo

         if (n==0) then
            n_nlevs=n_nlevs+1
            if (n_nlevs > max_nlevs) call handle_error(fatal, 'register_var: n_nlevs>max_nlevs, increase max_nlevs!')
            n=n_nlevs
            nlevs(1,n) = levs
            write(tmp,*) levs
            tmp=trim(adjustl(tmp))
            nlevs(2,n) = diag_axis_init(name='lev'//trim(tmp), data=(/(real(i),i=1,levs)/), units='', &
                                        cart_name='Z', long_name='levels')
         endif

         lev_id = nlevs(2,n)

         register_static = register_static_field('gfs', name, (/lon_id, lat_id, lev_id/), &
              long_name, units, fill_value, range, wgt, standard_name, mask=mask, red2reg=.true., total_elements=total_eles*levs)
         
      endif
            
    end function register_static

    subroutine update_opdata_2d_o(field_id, field, istrt, im, lan, wgt)
      integer, intent(in) :: field_id
      real, intent(in) :: field(:)
      integer, intent(in) :: lan, istrt, im
      real, intent(in), optional :: wgt(:)
      !local
      real :: field1(im,1)
      real :: wgt1(im,1)
      logical :: mask(im,1)
      logical :: used
      integer :: is, ie 

      if (field_id<=0) return

      is = istrt
      ie = is+im-1

      field1(1:im,1)=field(:)

      if (.not.present(wgt)) then
         used = send_data(field_id, field1(:,:), currtime, js_in=lan, je_in=lan, is_in=is, ie_in=ie)
      else
         wgt1=0.
         wgt1(1:im,1)=wgt
         mask=.false.
         where (wgt1>0.0) mask=.true.
         used = send_data(field_id, field1(:,:), currtime, js_in=lan, je_in=lan, is_in=is, ie_in=ie, mask=mask, weight=wgt1)
      endif
            
    end subroutine update_opdata_2d_o

    subroutine update_opdata_3d_o(field_id, field, istrt, im, lan, wgt)
      integer, intent(in) :: field_id
      real, intent(in) :: field(:,:)
      integer, intent(in) :: lan, im, istrt
      real, intent(in), optional :: wgt(:,:)
      !local
      real :: field2(im,1,size(field,2))
      real :: wgt1(im,1,size(field,2))
      logical :: mask(im,1,size(field,2))
      logical :: used
      integer :: k, is, ie

      if (field_id<=0) return

      is = istrt
      ie = is+im-1

      field2(1:im,1,:) = field(:,:)

      if (.not.present(wgt)) then
         used = send_data(field_id, field2(:,:,:), currtime, js_in=lan, je_in=lan, is_in=is, ie_in=ie)
      else
         wgt1=0.
         wgt1(1:im,1,:)=wgt(:,:)
         mask=.false.
         where (wgt1>0.0) mask=.true.
         used = send_data(field_id, field2(:,:,:), currtime, js_in=lan, je_in=lan, is_in=is, ie_in=ie, mask=mask, weight=wgt1)
      endif
      
    end subroutine update_opdata_3d_o

    subroutine update_opdata_2d(field_id, field, time, wgt)
      integer, intent(in) :: field_id
      real, intent(in) :: field(:,:)
      type(time_type), intent(in), optional :: Time
      real, intent(in), optional :: wgt(:,:)
      !local
      logical :: used
      logical :: mask(size(field,1),size(field,2))

      if (field_id<=0) return

      if (.not.present(wgt)) then
         used = send_data(field_id, field(:,:), time)
      else
         mask = .false.
         where(wgt>0.0) mask=.true.
         used = send_data(field_id, field(:,:), time, mask=mask, weight=wgt)
      endif
            
    end subroutine update_opdata_2d

    subroutine update_opdata_3d(field_id, field, time, wgt)
      integer, intent(in) :: field_id
      real, intent(in) :: field(:,:,:)
      type(time_type), intent(in), optional :: Time
      real, intent(in), optional :: wgt(:,:,:)
      !local
      logical :: used
      logical :: mask(size(field,1),size(field,2),size(field,3))

      if (field_id<=0) return

      if(.not.present(wgt)) then
         used = send_data(field_id, field(:,:,:), time)
      else
         mask =.false.
         where(wgt>0.0)mask=.true.
         used = send_data(field_id, field(:,:,:), time, mask=mask, weight=wgt)
      endif
      
    end subroutine update_opdata_3d

    subroutine end_output_manager(Time)
      type(time_type), intent(in) :: Time

      call diag_manager_end(Time)
    end subroutine end_output_manager

end module output_manager_fms
