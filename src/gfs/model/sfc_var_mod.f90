! !module: sfc_flx_mod  ---              definition of the surface
!                                            fields in the internal state.
!---------------------------------------------------------------------------

 module sfc_flx_mod

 use machine , only : kind_phys

 implicit none

 type sfc_var_data
    real(kind=kind_phys),pointer:: tsea(:,:)=>null()
    real(kind=kind_phys),pointer:: smc(:,:,:)=>null()
    real(kind=kind_phys),pointer:: sheleg(:,:)=>null()
    real(kind=kind_phys),pointer:: sncovr(:,:)=>null()
    real(kind=kind_phys),pointer:: stc(:,:,:)=>null()
    real(kind=kind_phys),pointer:: tg3(:,:)=>null()
    real(kind=kind_phys),pointer:: zorl(:,:)=>null()
    real(kind=kind_phys),pointer:: cv(:,:)=>null()
    real(kind=kind_phys),pointer:: cvb(:,:)=>null()
    real(kind=kind_phys),pointer:: cvt(:,:)=>null()
    real(kind=kind_phys),pointer:: alvsf(:,:)=>null()
    real(kind=kind_phys),pointer:: alvwf(:,:)=>null()
    real(kind=kind_phys),pointer:: alnsf(:,:)=>null()
    real(kind=kind_phys),pointer:: alnwf(:,:)=>null()
    real(kind=kind_phys),pointer:: slmsk(:,:)=>null()
    real(kind=kind_phys),pointer:: vfrac(:,:)=>null()
    real(kind=kind_phys),pointer:: canopy(:,:)=>null()
    real(kind=kind_phys),pointer:: f10m(:,:)=>null()
    real(kind=kind_phys),pointer:: t2m(:,:)=>null()
    real(kind=kind_phys),pointer:: q2m(:,:)=>null()
    real(kind=kind_phys),pointer:: vtype(:,:)=>null()
    real(kind=kind_phys),pointer:: stype(:,:)=>null()
    real(kind=kind_phys),pointer:: facsf(:,:)=>null()
    real(kind=kind_phys),pointer:: facwf(:,:)=>null()
    real(kind=kind_phys),pointer:: uustar(:,:)=>null()
    real(kind=kind_phys),pointer:: ffmm(:,:)=>null()
    real(kind=kind_phys),pointer:: ffhh(:,:)=>null()
    real(kind=kind_phys),pointer:: hice(:,:)=>null()
    real(kind=kind_phys),pointer:: fice(:,:)=>null()
    real(kind=kind_phys),pointer:: tisfc(:,:)=>null()
    real(kind=kind_phys),pointer:: tprcp(:,:)=>null()
    real(kind=kind_phys),pointer:: srflag(:,:)=>null()
    real(kind=kind_phys),pointer:: snwdph(:,:)=>null()
    real(kind=kind_phys),pointer:: slc(:,:,:)=>null()
    real(kind=kind_phys),pointer:: shdmin(:,:)=>null()
    real(kind=kind_phys),pointer:: shdmax(:,:)=>null()
    real(kind=kind_phys),pointer:: slope(:,:)=>null()
    real(kind=kind_phys),pointer:: snoalb(:,:)=>null()
    real(kind=kind_phys),pointer:: oro(:,:)=>null()
 end type sfc_var_data
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 type flx_var_data
    real(kind=kind_phys),pointer:: sfcdsw(:,:)=>null()
    real(kind=kind_phys),pointer:: coszen(:,:)=>null()
    real(kind=kind_phys),pointer:: pwat(:,:)=>null()
    real(kind=kind_phys),pointer:: tmpmin(:,:)=>null()
    real(kind=kind_phys),pointer:: tmpmax(:,:)=>null()
!jwang add spfhmax/spfhmin
    real(kind=kind_phys),pointer:: spfhmin(:,:)=>null()
    real(kind=kind_phys),pointer:: spfhmax(:,:)=>null()
    real(kind=kind_phys),pointer:: dusfc(:,:)=>null()
    real(kind=kind_phys),pointer:: dvsfc(:,:)=>null()
    real(kind=kind_phys),pointer:: dtsfc(:,:)=>null()
    real(kind=kind_phys),pointer:: dqsfc(:,:)=>null()
    real(kind=kind_phys),pointer:: dlwsfc(:,:)=>null()
    real(kind=kind_phys),pointer:: ulwsfc(:,:)=>null()
    real(kind=kind_phys),pointer:: gflux(:,:)=>null()
    real(kind=kind_phys),pointer:: runoff(:,:)=>null()
    real(kind=kind_phys),pointer:: ep(:,:)=>null()
    real(kind=kind_phys),pointer:: cldwrk(:,:)=>null()
    real(kind=kind_phys),pointer:: dugwd(:,:)=>null()
    real(kind=kind_phys),pointer:: dvgwd(:,:)=>null()
    real(kind=kind_phys),pointer:: psmean(:,:)=>null()
    real(kind=kind_phys),pointer:: geshem(:,:)=>null()
    real(kind=kind_phys),pointer:: bengsh(:,:)=>null()
    real(kind=kind_phys),pointer:: sfcnsw(:,:)=>null()
    real(kind=kind_phys),pointer:: sfcdlw(:,:)=>null()
    real(kind=kind_phys),pointer:: tsflw(:,:)=>null()
    real(kind=kind_phys),pointer:: psurf(:,:)=>null()
    real(kind=kind_phys),pointer:: u10m(:,:)=>null()
    real(kind=kind_phys),pointer:: v10m(:,:)=>null()
    real(kind=kind_phys),pointer:: hpbl(:,:)=>null()
    real(kind=kind_phys),pointer:: chh(:,:)=>null()
    real(kind=kind_phys),pointer:: cmm(:,:)=>null()
    real(kind=kind_phys),pointer:: epi(:,:)=>null()
    real(kind=kind_phys),pointer:: dlwsfci(:,:)=>null()
    real(kind=kind_phys),pointer:: ulwsfci(:,:)=>null()
    real(kind=kind_phys),pointer:: uswsfci(:,:)=>null()
    real(kind=kind_phys),pointer:: dswsfci(:,:)=>null()
    real(kind=kind_phys),pointer:: dtsfci(:,:)=>null()
    real(kind=kind_phys),pointer:: dqsfci(:,:)=>null()
    real(kind=kind_phys),pointer:: gfluxi(:,:)=>null()
    real(kind=kind_phys),pointer:: srunoff(:,:)=>null()
    real(kind=kind_phys),pointer:: t1(:,:)=>null()
    real(kind=kind_phys),pointer:: q1(:,:)=>null()
    real(kind=kind_phys),pointer:: u1(:,:)=>null()
    real(kind=kind_phys),pointer:: v1(:,:)=>null()
    real(kind=kind_phys),pointer:: zlvl(:,:)=>null()
    real(kind=kind_phys),pointer:: evbsa(:,:)=>null()
    real(kind=kind_phys),pointer:: evcwa(:,:)=>null()
    real(kind=kind_phys),pointer:: transa(:,:)=>null()
    real(kind=kind_phys),pointer:: sbsnoa(:,:)=>null()
    real(kind=kind_phys),pointer:: snowca(:,:)=>null()
    real(kind=kind_phys),pointer:: soilm(:,:)=>null()
    real(kind=kind_phys),pointer:: snohfa(:,:)=>null()
    real(kind=kind_phys),pointer:: sfcemis(:,:)=>null()      ! surface emissivity
 end type flx_var_data
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    contains
    subroutine sfcvar_aldata(dim1,dim2,dim3,data,iret)
       implicit none
       integer, intent(in)              :: dim1, dim2, dim3
       type(sfc_var_data),intent(inout) :: data
       integer, intent(out)             :: iret
!
allocate(                          &
      data%tsea   (dim1,dim2),     &
      data%smc    (dim3,dim1,dim2),&
      data%sheleg (dim1,dim2),     &
      data%sncovr (dim1,dim2),     &
      data%stc    (dim3,dim1,dim2),&
      data%tg3    (dim1,dim2),     &
      data%zorl   (dim1,dim2),     &
      data%cv     (dim1,dim2),     &
      data%cvb    (dim1,dim2),     &
      data%cvt    (dim1,dim2),     &
      data%alvsf  (dim1,dim2),     &
      data%alvwf  (dim1,dim2),     &
      data%alnsf  (dim1,dim2),     &
      data%alnwf  (dim1,dim2),     &
      data%slmsk  (dim1,dim2),     &
      data%vfrac  (dim1,dim2),     &
      data%canopy (dim1,dim2),     &
      data%f10m   (dim1,dim2),     &
      data%t2m    (dim1,dim2),     &
      data%q2m    (dim1,dim2),     &
      data%vtype  (dim1,dim2),     &
      data%stype  (dim1,dim2),     &
      data%facsf  (dim1,dim2),     &
      data%facwf  (dim1,dim2),     &
      data%uustar (dim1,dim2),     &
      data%ffmm   (dim1,dim2),     &
      data%ffhh   (dim1,dim2),     &
      data%hice   (dim1,dim2),     &
      data%fice   (dim1,dim2),     &
      data%tisfc  (dim1,dim2),     &
      data%tprcp  (dim1,dim2),     &
      data%srflag (dim1,dim2),     &
      data%snwdph (dim1,dim2),     &
      data%slc    (dim3,dim1,dim2),&
      data%shdmin (dim1,dim2),     &
      data%shdmax (dim1,dim2),     &
      data%slope  (dim1,dim2),     &
      data%snoalb (dim1,dim2),     &
      data%oro    (dim1,dim2),     &
      stat=iret)
    if(iret.ne.0) iret=-3
    return
  end subroutine
    subroutine flxvar_aldata(dim1,dim2,data,iret)
       implicit none
       integer, intent(in)              :: dim1, dim2
       type(flx_var_data),intent(inout) :: data
       integer, intent(out)             :: iret
!
!   allocate(data%sfcdsw  (dim1,dim2))
    allocate(                  &
     data%sfcdsw  (dim1,dim2), &
     data%coszen  (dim1,dim2), &
     data%pwat    (dim1,dim2), &
     data%tmpmin  (dim1,dim2), &
     data%tmpmax  (dim1,dim2), &
!jwang add spfhmax/spfhmin
     data%spfhmin (dim1,dim2), &
     data%spfhmax (dim1,dim2), &
     data%dusfc   (dim1,dim2), &
     data%dvsfc   (dim1,dim2), &
     data%dtsfc   (dim1,dim2), &
     data%dqsfc   (dim1,dim2), &
     data%dlwsfc  (dim1,dim2), &
     data%ulwsfc  (dim1,dim2), &
     data%gflux   (dim1,dim2), &
     data%runoff  (dim1,dim2), &
     data%ep      (dim1,dim2), &
     data%cldwrk  (dim1,dim2), &
     data%dugwd   (dim1,dim2), &
     data%dvgwd   (dim1,dim2), &
     data%psmean  (dim1,dim2), &
     data%geshem  (dim1,dim2), &
     data%bengsh  (dim1,dim2), &
     data%sfcnsw  (dim1,dim2), &
     data%sfcdlw  (dim1,dim2), &
     data%tsflw   (dim1,dim2), &
     data%psurf   (dim1,dim2), &
     data%u10m    (dim1,dim2), &
     data%v10m    (dim1,dim2), &
     data%hpbl    (dim1,dim2), &
     data%chh     (dim1,dim2), &
     data%cmm     (dim1,dim2), &
     data%epi     (dim1,dim2), &
     data%dlwsfci (dim1,dim2), &
     data%ulwsfci (dim1,dim2), &
     data%uswsfci (dim1,dim2), &
     data%dswsfci (dim1,dim2), &
     data%dtsfci  (dim1,dim2), &
     data%dqsfci  (dim1,dim2), &
     data%gfluxi  (dim1,dim2), &
     data%srunoff (dim1,dim2), &
     data%t1      (dim1,dim2), &
     data%q1      (dim1,dim2), &
     data%u1      (dim1,dim2), &
     data%v1      (dim1,dim2), &
     data%zlvl    (dim1,dim2), &
     data%evbsa   (dim1,dim2), &
     data%evcwa   (dim1,dim2), &
     data%transa  (dim1,dim2), &
     data%sbsnoa  (dim1,dim2), &
     data%snowca  (dim1,dim2), &
     data%soilm   (dim1,dim2), &
     data%snohfa  (dim1,dim2), &
     data%sfcemis (dim1,dim2), &                !yth apr/09
     stat=iret)

    if(iret.ne.0) iret=-4
    return
  end subroutine
    subroutine flx_init(data,iret)
       implicit none
       type(flx_var_data),intent(inout) :: data
       integer, intent(out)             :: iret
!
       data%tmpmin  = 1.e10
       data%tmpmax  = 0.
!jwang add spfhmax/spfhmin
       data%spfhmin = 1.e10
       data%spfhmax = 0.
       data%geshem  = 0.
       data%bengsh  = 0.
       data%dusfc   = 0.
       data%dvsfc   = 0.
       data%dtsfc   = 0.
       data%dqsfc   = 0.
       data%dlwsfc  = 0.
       data%ulwsfc  = 0.
       data%gflux   = 0.
!
       data%runoff  = 0.
       data%ep      = 0.
       data%cldwrk  = 0.
       data%dugwd   = 0.
       data%dvgwd   = 0.
       data%psmean  = 0.
!
       data%evbsa   = 0.
       data%evcwa   = 0.
       data%transa  = 0.
       data%sbsnoa  = 0.
       data%snowca  = 0.
       data%srunoff = 0.
       data%snohfa  = 0.
     return
  end subroutine
 end module sfc_flx_mod
