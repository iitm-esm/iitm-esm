      MODULE constant_cc

      USE MACHINE, ONLY: kind_phys

      USE physcons

      END MODULE constant_cc
!
!***********************************************************************
!
      MODULE ATM_cc

      USE CMP_COMM, ONLY:
     >   MPI_COMM_Atmos => COMM_local,
     >   Coupler_id,
     >   component_master_rank_local,
     >   process_rank_local,
!          Note: the latter two are only to compare with each
!          other and thus determine if the process is the local
!          master (root) process. (Comparison of
!          component_master_rank_global with process_rank_global
!          would not work because the former is known only to
!          Coupler process and the local master process itself.)
     >   component_nprocs,
     >   kind_REAL,MPI_kind_REAL,
     >   MPI_INTEGER,MPI_STATUS_SIZE,
     >   ibuffer
      USE mpi_def, ONLY: COMM_TILES => MC_COMP
      USE layout1, ONLY: TILES_nprocs => nodes_comp

      implicit none

      integer latg,latr,lonf,lonr
      integer latd
      integer lats_node_r,ipt_lats_node_r

      integer N2D

      integer, allocatable:: global_lats_r(:),lonsperlar(:)

      logical COMP /.false./

      integer nunit_announce_cc /6/, VerbLev /1/
      
      logical :: debug=.false.

      save

      END MODULE ATM_cc
!
!***********************************************************************
!
      SUBROUTINE ATM_CMP_START

      USE ATM_cc, ONLY: component_nprocs,VerbLev,ibuffer,Coupler_id

      implicit none

      integer Atmos_id /1/, Atmos_master_rank_local /0/
      character*20 s

!        print*,'AM: to call CMP_INIT'
                      !<-id of AM as a component of the coupled system
      call CMP_INIT(Atmos_id,1)
                             !<-"flexibility level"
!        print*,'AM: back from CMP_INIT'
!      if (Coupler_id.ge.0) VerbLev=min(VerbLev,ibuffer(4))
      if (Coupler_id.ge.0) VerbLev=min(VerbLev,2)

        Atmos_master_rank_local=component_nprocs-1
                               !<- this redefinition is to meet the
                               ! requirement of subr. split2d_r used
                               ! in DISASSEMBLE_cc for disassembling
                               ! 2D fields. The requirement seems
                               ! to be that the input argument
                               ! representing a whole grid array be
                               ! defined in process of the largest rank
                               ! which seems to be considered i/o
                               ! process. To use a different value,
                               ! e.g. the conventional 0, split2d_r
                               ! (or DISASSEMBLE_cc) must be rewritten.
                     ! (Strangely, unsplit2d_r does not pose this
                     ! requirement and uses a dummy arg. ioproc to
                     ! identify the process where the whole grid array
                     ! is to be defined. Seemingly.)

      Atmos_master_rank_local=0  ! see above for modifications needed
                                 ! to support this change

      call CMP_INTRO(Atmos_master_rank_local)

      write(s,'(i2)') VerbLev
      call ATM_ANNOUNCE('back from CMP_INTRO, VerbLev='//s,2)

      return
      END
!
!***********************************************************************
!
      SUBROUTINE ATM_TILES_INIT(lonr_dummy,latr_dummy,lonf_dummy,
     >latg_dummy,latd_dummy,ipt_lats_node_r_dummy,
     >global_lats_r_dummy,lonsperlar_dummy)

      USE ATM_cc

      implicit none

      integer lonr_dummy,latr_dummy,lonf_dummy,latg_dummy,latd_dummy
      integer ipt_lats_node_r_dummy
      integer global_lats_r_dummy(latr_dummy),
     >        lonsperlar_dummy(latr_dummy)

      character*10 s
!

      lonr=lonr_dummy
      latr=latr_dummy
      lonf=lonf_dummy
      latg=latg_dummy
      latd=latd_dummy
      lats_node_r=latd
      ipt_lats_node_r=ipt_lats_node_r_dummy

      N2D=lonf*latg

      write(s,'(i5)') lonr
      CALL ATM_ANNOUNCE('ATM_TILES_INIT: lonr='//s,2)
      write(s,'(i5)') latr
      CALL ATM_ANNOUNCE('ATM_TILES_INIT: latr='//s,2)
      write(s,'(i5)') lonf
      CALL ATM_ANNOUNCE('ATM_TILES_INIT: lonf='//s,2)
      write(s,'(i5)') latg
      CALL ATM_ANNOUNCE('ATM_TILES_INIT: latg='//s,2)
      write(s,'(i5)') latd
      CALL ATM_ANNOUNCE('ATM_TILES_INIT: latd='//s,2)

      call GLOB_ABORT(abs(lonr-lonf)+abs(latr-latg),
     >'Unexpected: lonr, lonf or latr, latg differ. Aborting',1)

      allocate(global_lats_r(latr),lonsperlar(latr))
      global_lats_r=global_lats_r_dummy
      lonsperlar=lonsperlar_dummy

      CALL ATM_ANNOUNCE(
     >'ATM_TILES_INIT: global_lats_r, lonsperlar assigned',2)
      if (VerbLev.ge.2) then
        print*,'AM: ATM_TILES_INIT',component_master_rank_local,
     >  ' ipt_lats_node_r=',ipt_lats_node_r,' latd=',latd
        print*,'AM: ATM_TILES_INIT',component_master_rank_local,
     >  ' global_lats_r: ',global_lats_r
        print*,'AM: ATM_TILES_INIT',component_master_rank_local,
     >  ' lonsperlar: ',lonsperlar
      end if

      call INITIALIZE_TILING

      return
      END
!
!***********************************************************************
!
      SUBROUTINE ATM_SENDGRID(XLON,XLAT)

      USE ATM_cc

      implicit none

      real (kind=kind_REAL) XLON(lonr,latd),XLAT(lonr,latd)
      real (kind=kind_REAL) ALON(lonf),ALAT(latg),
     >x(lonf,latg),y(lonf,latg)

      integer buf(2),i,j

      logical fg

      character*50 s
      
      if (Coupler_id.lt.0) return    !   <- standalone mode

      buf(1)=lonf
      buf(2)=latg
      call ATM_ANNOUNCE('to send grid dimensions',1)
      call CMP_INTEGER_SEND(buf,2)
      call ATM_ANNOUNCE('grid dimensions sent',1)
      call ASSEMBLE_cc(x,XLON)
      call ASSEMBLE_cc(x,XLAT)
      return
      END
!
!***********************************************************************
!
      SUBROUTINE ATM_GETSSTICE

      USE ATM_cc, ONLY: kind_REAL,lonr,latd,Coupler_id,N2D,latg,lonf,
     &                  debug

      use ocean_mod, only: ocn
      use layout1, only: me
      use interpred_mod, only: interp2reduced
      use land_model_mod, only: lnd

      implicit none
      integer :: loc(2)
      
      if (Coupler_id.lt.0) return !   <- standalone mode

      call ATM_TILES_RECV(ocn%fice)
      call ATM_TILES_RECV(ocn%hice)
      call ATM_TILES_RECV(ocn%hsnow)
      call ATM_TILES_RECV(ocn%tice)
      call ATM_TILES_RECV(ocn%twater)
      where(lnd%ofrac(:,:)>0.0)
        ocn%twater(:,:)=ocn%twater(:,:)/lnd%ofrac(:,:)
        ocn%fice(:,:)=ocn%fice(:,:)/lnd%ofrac(:,:)
        ocn%hice(:,:)=ocn%hice(:,:)/lnd%ofrac(:,:)
        ocn%hsnow(:,:)=ocn%hsnow(:,:)/lnd%ofrac(:,:)
        ocn%tice(:,:)=ocn%tice(:,:)/lnd%ofrac(:,:)
      elsewhere
        !ocn%twater(:,:)=0.0
        ocn%fice(:,:)=0.0
        ocn%hice(:,:)=0.0
        ocn%hsnow(:,:)=0.0
        ocn%tice(:,:)=0.0
      endwhere

      ocn%hsnow(:,:)=ocn%hsnow(:,:)
      ocn%fwater(:,:)=0.0
      where(lnd%ofrac>0.0) ocn%fwater(:,:)=1.0-ocn%fice(:,:)
      
      where(ocn%fice(:,:)>0.0)
        ocn%tice(:,:)=ocn%tice(:,:)/ocn%fice(:,:)
        ocn%hice(:,:)=ocn%hice(:,:)/ocn%fice(:,:)
        ocn%hsnow(:,:)=ocn%hsnow(:,:)/ocn%fice(:,:)
      elsewhere
        ocn%tice(:,:)=0.0
        ocn%hice(:,:)=0.0
        ocn%hsnow(:,:)=0.0
      endwhere

      where(ocn%fwater(:,:)>0.0)
        ocn%twater(:,:)=ocn%twater(:,:)/ocn%fwater(:,:)
      elsewhere
        !ocn%twater(:,:)=0.0
      endwhere
     
      if(debug) then
        print *, 'atm fice:', minval(ocn%fice), maxval(ocn%fice)
        print *, 'atm twater:', minval(ocn%twater,mask=ocn%fwater>0.0), 
     &   maxval(ocn%twater)
        loc(:) = minloc(ocn%twater,mask=ocn%fwater>0.0)
        print *, 'atm fwater(min(twater)):', ocn%fwater(loc(1),loc(2))
        print *, 'atm lfrac(min(twater)):', lnd%frac(loc(1),loc(2))
        print *, 'atm ofrac(min(twater)):', lnd%ofrac(loc(1),loc(2))
        print *, 'atm fice(min(twater)):', ocn%fice(loc(1),loc(2))
        print *, 'atm fwater:', minval(ocn%fwater), maxval(ocn%fwater)
        print *, 'atm hice:', minval(ocn%hice), maxval(ocn%hice)
        print *, 'atm hsnow:', minval(ocn%hsnow), maxval(ocn%hsnow)
        print *, 'atm tice:', minval(ocn%tice, mask=ocn%fice>0.0), 
     &   maxval(ocn%tice)
      endif

      contains

      SUBROUTINE ATM_TILES_RECV(f)
      implicit none
      real (kind=kind_REAL) f(lonr,latd)
      real (kind=kind_REAL) f1(lonr,latd)
      real (kind=kind_REAL) x(lonf,latg)

      if (Coupler_id.lt.0) return    !   <- standalone mode
      call CMP_RECV(x,N2D)
      call DISASSEMBLE_cc(x,f1)
      call interp2reduced(f1,f)
      END subroutine ATM_TILES_RECV
      end subroutine atm_getsstice
!
!***********************************************************************
!
      SUBROUTINE ATM_ANNOUNCE(s,DbgLev)

      USE ATM_cc, ONLY: nunit_announce_cc,VerbLev

      implicit none

      character*(*) s
      integer DbgLev
!
      if (DbgLev.le.VerbLev)
     >  CALL CMP_ANNOUNCE(nunit_announce_cc,'AM: '//s)

      return
      END
!
!***********************************************************************
!
      subroutine ATM_SENDFLUXES()
      use atm_cc, only: Coupler_id, lonr, latd, lonf, latg, N2D
      use ocean_mod, only: ocn
      use interpred_mod, only: interp2regular

      implicit none

      call atm_sendflux(ocn%nsw_i)
      call atm_sendflux(ocn%nsw_o)
      call atm_sendflux(ocn%dlw)
      call atm_sendflux(ocn%shflx_i)
      call atm_sendflux(ocn%shflx_o)
      call atm_sendflux(ocn%lhflx_i)
      call atm_sendflux(ocn%lhflx_o)
      call atm_sendflux(ocn%lprec)
      call atm_sendflux(ocn%fprec)
      call atm_sendflux(ocn%drdt)
      call atm_sendflux(ocn%dhdt)
      call atm_sendflux(ocn%dedt)
      call atm_sendflux(ocn%uflux)
      call atm_sendflux(ocn%vflux)
      call atm_sendflux(ocn%totrunoff)

      contains

      SUBROUTINE ATM_SENDFLUX(f)
      implicit none
      real, intent(in) :: f(lonr,latd)
      real, dimension(lonr,latd):: f1,f2
      real ::  x(lonf,latg)

      if (Coupler_id.lt.0) return    !   <- standalone mode

      f1(:,:)=f(:,:)

      call interp2regular(f1,f2)
                ! <- interpolation FROM reduced grid (i.e. with # of
                ! longitudes varying from lat. circle to lat. circle)
                ! to full grid
      call  ASSEMBLE_cc(x,f2)
      call CMP_SEND(x,N2D)
      END subroutine ATM_SENDFLUX
      end subroutine ATM_SENDFLUXES
