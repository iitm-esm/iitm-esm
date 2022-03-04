!=======================================================================
!
      program Coupler
!
      use coupler_module
!
      implicit none
     
      integer iret
! ------------------------------------------------------------------

      call coupler_init(iret)
      if (iret.ne.0 ) CALL GLOB_ABORT(iret,'error in coupler INIT ',iret)
!
      call coupler_run(iret)
      if (iret.ne.0 ) CALL GLOB_ABORT(iret,'error in coupler RUN ',iret)
!
      call coupler_finalize(iret)
      if (iret.ne.0 ) CALL GLOB_ABORT(iret,'error in coupler finalize ',iret)
!
      stop
      end
!
!=======================================================================
