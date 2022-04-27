module interpred_mod
  use layout1, only : me, lats_node_r, ioproc=>nodes_comp
  use layout1, only : ipt_lats_node_r
  use resol_def, only : lonr, latr
  use physcons, only : con_pi
  use error_mod, only : handle_error, FATAL, WARNING
  use horiz_interp_mod, only: horiz_interp_type, horiz_interp_init, horiz_interp, horiz_interp_new
  use diag_data_mod, only: fill_value
  implicit none

  private

  public :: init_interpred, interp2reduced, interp2reduced_discrete, interp2regular, interp2regular_fms
  
  logical :: debug=.false., initialized_this_module=.false.
  character (len=32) :: reg2red_interp_method='conservative', red2reg_interp_method='bilinear'
  
  type(horiz_interp_type), allocatable :: interp2reg(:), interp2red(:)
  integer, allocatable :: nlon(:)
  integer :: verbose=0

  type int_data_type
    integer :: nele, max_ele
    integer, allocatable :: iele(:)
    real, allocatable :: wgt(:)
    integer :: nlon, iiele(2), niiele
    real :: reg_dx, red_dx
    real :: lon
  end type

  type(int_data_type), allocatable :: ida(:,:)
  real :: tolerance=0.0000000001

  interface interp2regular
     module procedure interp2regular2
  end interface interp2regular

  interface interp2regular_fms
     module procedure interp2regular1_fms
     module procedure interp2regular2_fms
  end interface interp2regular_fms

  namelist/interpred_mod_nml/debug
  
  contains
  
  subroutine init_interpred(xlon, xlonf, global_lats_r, lonsperlar)
    implicit none
    integer, intent(in) :: global_lats_r(latr), lonsperlar(latr)
    real, intent(in) :: xlon(lonr,lats_node_r), xlonf(lonr,lats_node_r)
    real :: red_dx, reg_dx
    integer :: j, i, lat
    type(int_data_type) :: dd
    real :: lon_in(size(xlon,1)+1), lon_out(size(xlonf,1)+1), dlon_in, dlon_out
    integer :: istat
    
    if(me==ioproc) return
    if(initialized_this_module) return
    
    open(10,file='gfs_namelist')
    read(10,nml=interpred_mod_nml,iostat=istat)
    close(10)
    if(me==0) write(*,nml=interpred_mod_nml)
    
    call horiz_interp_init()

    allocate(interp2reg(lats_node_r), interp2red(lats_node_r))
    allocate(nlon(lats_node_r))
    dlon_out = xlonf(2,1)-xlonf(1,1)
    lon_out(1) = xlonf(1,1)-(dlon_out*0.5)

    do i = 2, size(lon_out)
       lon_out(i) = lon_out(i-1) + dlon_out
    enddo


    do j=1,lats_node_r
      lat = global_lats_r(ipt_lats_node_r-1+j)
      nlon(j) = lonsperlar(lat)
      
      dlon_in = xlon(2,j)-xlon(1,j)
      lon_in(1) = xlon(1,j)-(dlon_in*0.5)
      do i = 2, nlon(j)+1
         lon_in(i) = lon_in(i-1) + dlon_in
      enddo

            

      call horiz_interp_new (lon_in=lon_in(1:nlon(j)+1), lat_in=(/0.0,0.01/), lon_out=lon_out(:), lat_out=(/0.0,0.01/),  &
           verbose=verbose, interp_method=trim(red2reg_interp_method), src_modulo=.true., interp=interp2reg(j))
      call horiz_interp_new (lon_in=lon_out(:), lat_in=(/0.0,0.01/), lon_out=lon_in(1:nlon(j)+1), lat_out=(/0.0,0.01/),  &
           verbose=verbose, interp_method=trim(reg2red_interp_method), src_modulo=.true., interp=interp2red(j))
    enddo
        
    allocate(ida(lonr, lats_node_r))
    ida(:,:)%lon=-1.0
    ida(:,:)%iiele(1)=0
    ida(:,:)%iiele(2)=0
    ida(:,:)%niiele=0
    do j=1,lats_node_r
      lat=global_lats_r(ipt_lats_node_r-1+j)
      ida(:,j)%nlon=lonsperlar(lat)
      ida(:,j)%reg_dx=2*con_pi/lonr
      ida(:,j)%red_dx=2*con_pi/lonsperlar(lat)
      ida(:,j)%max_ele=ceiling(ida(1,j)%red_dx/ida(1,j)%reg_dx)+2
      ida(:,j)%nele=0
      do i=1,ida(1,j)%nlon
        allocate(ida(i,j)%iele(ida(i,j)%max_ele))
        ida(i,j)%iele(:)=0
        allocate(ida(i,j)%wgt(ida(i,j)%max_ele))
        ida(i,j)%wgt(:)=0.0
        ida(i,j)%lon=xlon(i,j)
      enddo
    enddo

    do j=1,lats_node_r
      do i=1,ida(1,j)%nlon
        call find_ele_wgt(ida(i,j)%lon, ida(i,j)%reg_dx, ida(i,j)%red_dx, xlonf(:,1), &
                          ida(i,j)%iele(:), ida(i,j)%wgt(:), ida(i,j)%nele)
      enddo
    enddo

    call find_iiele()
    
    initialized_this_module=.true.
  end subroutine init_interpred

  subroutine find_iiele
    integer :: i, j, k, ii
    do j=1,lats_node_r
      do i=1,ida(1,j)%nlon
        do k=1,ida(i,j)%nele
          ii=ida(i,j)%iele(k)
          ida(ii,j)%niiele=ida(ii,j)%niiele+1
          if(ida(ii,j)%niiele>2) call handle_error(FATAL, 'find_iiele: niiele > 2')
          ida(ii,j)%iiele(ida(ii,j)%niiele)=i
        enddo
      enddo
    enddo
  end subroutine find_iiele

  subroutine find_ele_wgt(lon, reg_dx, red_dx, xlonf, iele, wgt, nele)
    implicit none
    real, intent(in) :: lon, reg_dx, red_dx, xlonf(:)
    integer, intent(out) :: iele(:), nele
    real, intent(out) :: wgt(:)
    integer :: max_ele, i, j, n
    real :: lon_xlon, ddx, max_wgt
    character(len=512)::msg
    
    ddx=0.5*(red_dx+reg_dx)
    max_wgt=reg_dx/red_dx
    
    max_ele=size(iele,1)
    nele=0
    wgt(:)=0
    iele(:)=0
    n=1

    do i=1,max_ele
      do j=n,size(xlonf,1)
        lon_xlon=abs(xlonf(j)-lon)
        lon_xlon=min(lon_xlon,2*con_pi-lon_xlon)
        if (lon_xlon<ddx) then
          iele(i)=j
          n=j+1
          wgt(i)= max_wgt*min((ddx-lon_xlon)/reg_dx,1.0)
          nele=nele+1
          if(sum(wgt)>(1.0-tolerance).and.sum(wgt)<(1.0+tolerance)) return
          if(sum(wgt)>(1.0+tolerance)) then
            print *, 'iele, wgt = ', iele, wgt, lon, size(xlonf,1), red_dx, reg_dx
            call handle_error(FATAL,'interpred_mod: Sum of wgts .gt. 1 + tolerance')
          endif
          exit
        endif
      enddo
    enddo
    if(sum(wgt)<(1.0-tolerance)) then 
        print *, 'sum(wgt) =', sum(wgt)
      call handle_error(FATAL, "interpred_mod: Sum of wgts .lt. 1 - tolerance")
    endif
  end subroutine find_ele_wgt

  subroutine interp2reduced(in_field,out_field)
    implicit none
    real, intent(in) :: in_field(lonr,lats_node_r)
    real, intent(out) :: out_field(lonr,lats_node_r)
    integer :: i, j, k, lons

    if(me==ioproc) return
    
    if(.not.initialized_this_module) &
         call handle_error(FATAL, 'Module not initialized : interp2reduced')

    out_field(:,:)=0.0
    do j=1,lats_node_r
       do i=1,ida(1,j)%nlon
          do k=1,ida(i,j)%nele
             out_field(i,j)= out_field(i,j)+in_field(ida(i,j)%iele(k),j)*ida(i,j)%wgt(k)
          enddo
       enddo
    enddo
  end subroutine interp2reduced

  subroutine interp2reduced_discrete(in_field, out_field, values)
    implicit none
    integer, intent(in) :: in_field(lonr,lats_node_r), values(:)
    integer, intent(out) :: out_field(lonr,lats_node_r)
    integer :: i, j, k, nvalues, ival(1)
    real :: votes(size(values,1))
    
    if(me==ioproc) return
    if(.not.initialized_this_module) &
        call handle_error(FATAL, 'Module not initialized : interp2reduced_discrete')

    out_field(:,:)=0
    nvalues=size(values,1)

    do j=1,lats_node_r
      do i=1,ida(1,j)%nlon
        votes(:)=0.0
        do k=1,ida(i,j)%nele
          if(any(in_field(ida(i,j)%iele(k),j)==values(:))) then
            ival=minloc(values,mask=in_field(ida(i,j)%iele(k),j)==values)
            votes(ival(1))=votes(ival(1))+ida(i,j)%wgt(k)
          endif
        enddo
          ival=maxloc(votes(:))
          if(sum(votes)>0.0) then
            out_field(i,j)=values(ival(1))
          endif
      enddo
    enddo
  end subroutine interp2reduced_discrete
    
  subroutine interp2regular2(fi, f, imask)
    implicit none
    real,intent(in):: fi(:,:)
    real,intent(out):: f(:,:)
    real, intent(in), optional :: imask(:,:)
    
    logical :: mask(size(fi,1),size(fi,2))
    real :: rmask(size(fi,1),size(fi,2))
    integer :: j,lons,lat

    if(me==ioproc) return
    if(.not.initialized_this_module) &
         call handle_error(FATAL, 'Module not initialized : interp2regular')
    
    rmask(:,:)=1.0

    if (present(imask)) rmask=imask
    
    mask(:,:)=.true.
    do j=1,lats_node_r
      lons=ida(1,j)%nlon
      if(lons<lonr) then
        call interplon(fi(1:lons,j),f(1:lonr,j),j,mask(1:lons,j))
      elseif(lons==lonr) then
        f(:,j)=fi(:,j)
      else
        call handle_error(FATAL, "interp2regular: lons > lonr")
      endif
   enddo
   
 end subroutine interp2regular2

 subroutine interp2regular2_fms(fi, f, imask)
   implicit none
   real,intent(in):: fi(:,:)
   real,intent(out):: f(:,:)
   real, intent(in), optional :: imask(:,:)
   
   logical :: mask(size(fi,1),size(fi,2))
   real :: rmask(size(fi,1),size(fi,2))
   integer :: j,lons,lat

    if(me==ioproc) return
    if(.not.initialized_this_module) &
         call handle_error(FATAL, 'Module not initialized : interp2regular')
    
    rmask(:,:)=1.0

    if (present(imask)) rmask=imask
    
#ifdef fms_interp
    do j = 1, lats_node_r
       lons=nlon(j)
       call horiz_interp ( interp2reg(j), fi(1:lons,j:j), f(1:lonr,j:j), mask_in=rmask(1:lons,j:j), missing_value=fill_value)
    enddo
#else
    call handle_error(FATAL, "interp2regular1: use fms_interp")
#endif
   
 end subroutine interp2regular2_fms
 
 subroutine interp2regular1_fms(fi, f, lan, imask)
   implicit none
   real,intent(in):: fi(:)
   real,intent(out):: f(:,:)
   integer, intent(in) :: lan
   real, intent(in), optional :: imask(:)
    
   integer :: j,lons,lat
   real :: fi1(size(fi),1), f1(size(f),1), imask1(size(fi1),1)

   if(me==ioproc) return
   if(.not.initialized_this_module) &
        call handle_error(FATAL, 'Module not initialized : interp2regular')
    
#ifdef fms_interp
   j = lan
   lons=nlon(j)
   fi1(:,1) = fi
   imask1 = 1.0
   if(present(imask)) imask1(:,1) = imask(:)
   call horiz_interp ( interp2reg(j), fi1(:,:), f(:,:), mask_in=imask1(:,:), missing_value=fill_value)
#else
   call handle_error(FATAL, "interp2regular1: use fms_interp")
#endif
   
 end subroutine interp2regular1_fms


  subroutine interplon(f1,f2,j,mask)
    implicit none
    real, intent(in):: f1(:)
    real, intent(out):: f2(:)
    integer, intent(in) :: j
    logical, intent(in) :: mask(:)
    integer :: i2,in,il,ir,m1,m2
    real ::  r,x1

    m1=size(f1,1)
    m2=size(f2,1)

    r=real(m1)/real(m2)

    f2(:) = 0.0

    do i2=1,m2
      x1=(i2-1)*r
      il=int(x1)+1
      ir=mod(il,m1)+1
      if(ida(i2,j)%niiele==1) then
        if (mask(ida(i2,j)%iiele(1))) then
           f2(i2)=f1(il)*(il-x1)+f1(ir)*(x1-il+1)
        endif
      else
        if (mask(ida(i2,j)%iiele(1)).and. &
           mask(ida(i2,j)%iiele(2))) then
           f2(i2)=f1(il)*(il-x1)+f1(ir)*(x1-il+1)
        endif
      endif
    enddo
  end subroutine interplon

end module interpred_mod
