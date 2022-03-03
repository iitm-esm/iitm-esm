      module semi_lag_def
!     use resol_def
      use machine
      implicit none
      save
      INTEGER PMAP                ! DIMENSION OF ARTIFICIAL ARRAY
      PARAMETER(PMAP=2000)
!
      INTEGER
     &     KDPMPF(PMAP), ! MAPPING FROM ARTIFICIAL ARRAY TO MODEL LEVELS
     &     KDPMPH(PMAP)  ! MAPPING FROM ARTIFICIAL ARRAY TO INTERFACES
!
!  LBASDZ  WEIGHTS FOR LAGRANGE CUBIC DERIVATIVE ESTIMATES ON THE
!          UNEQUALLY SPACED VERTICAL GRID (CORRESPONDING TO MODEL
!          FULL LEVELS).
      REAL(KIND=KIND_EVOD) ,ALLOCATABLE :: LBASDZ(:,:,:)
!  LBASIZ  WEIGHTS FOR LAGRANGE CUBIC INTERPOLATION ON THE
!          UNEQUALLY SPACED VERTICAL GRID (CORRESPONDING TO MODEL
!          FULL LEVELS).
      REAL(KIND=KIND_EVOD) ,ALLOCATABLE :: LBASIZ(:,:,:)
! DELTA ETA AT INTERFACES
      REAL(KIND=KIND_EVOD) ,ALLOCATABLE :: DETAI(:)
! DELTA ETA AT LEVELS
      REAL(KIND=KIND_EVOD) ,ALLOCATABLE :: DETAM(:)
! ETA AT LEVELS
      REAL(KIND=KIND_EVOD) ,ALLOCATABLE :: ETAMID(:)
! ETA AT INTERFACES
      REAL(KIND=KIND_EVOD) ,ALLOCATABLE :: ETAINT(:)
!  SINLAM  SINE OF LONGITUDES IN GLOBAL GRID (NO EXTENSION POINTS).
!  COSLAM  COSINE OF LONGITUDES IN GLOBAL GRID (NO EXTENSION POINTS).
      REAL(KIND=KIND_EVOD) ,ALLOCATABLE :: SINLAMG(:,:),COSLAMG(:,:)
      end module semi_lag_def

