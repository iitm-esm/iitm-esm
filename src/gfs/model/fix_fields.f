      SUBROUTINE fix_fields(LONSPERLAR,GLOBAL_LATS_R,XLON,XLONF,XLAT,
     &                  sfc_fld,HPRIME,JINDX1,JINDX2,DDY,OZPLIN,CREAD)
!!     
      use machine , only : kind_rad
      use funcphys                         
      use module_progtm             
      use resol_def
      use namelist_def
      use layout1
      use ozne_def
      use sfc_flx_mod
      IMPLICIT NONE
!!     
      TYPE(Sfc_Var_Data)        :: sfc_fld
      INTEGER NREAD
      CHARACTER (len=*)   :: CREAD
      INTEGER JINDX1(LATS_NODE_R),JINDX2(LATS_NODE_R)
      REAL (KIND=KIND_RAD) DDY(LATS_NODE_R)
      REAL (KIND=KIND_RAD) HPRIME(NMTVR,LONR,LATS_NODE_R)

      INTEGER IOZONDP
      REAL (kind=kind_rad) OZPLIN(LATSOZP,LEVOZP,pl_coeff,timeoz)
     &,                    XLON(LONR,LATS_NODE_R)
     &,                    XLONF(LONR,LATS_NODE_R)
     &,                    XLAT(LONR,LATS_NODE_R)
       
      INTEGER              GLOBAL_LATS_R(LATR)
      INTEGER                 LONSPERLAR(LATR)
      integer needoro
!!     
      call gfuncphys
!     if (lsm == 0) then ! For OSU LSM
!        CALL GRDDF
!        CALL GRDKT
!     endif
!!     
      IOZONDP = 0
      if (ntoz .gt. 0) IOZONDP = 1
      NREAD   = 14
!     CREAD   = 'fort.14'
      sfc_fld%ORO     = 0.
      NEEDORO = 0
      if(.not.adiab)then
        if (is_first_time) then
          if (me .eq. 0) print *,' call read_sfc CREAD=',cread
    !      CALL read_sfc(sfc_fld,NEEDORO,NREAD,
    ! &                  CREAD,GLOBAL_LATS_R,LONSPERLAR)
        else
          if (me .eq. 0) print *,' call read_sfc_r CREAD=',cread
          CALL read_sfc_r(sfc_fld,NEEDORO,NREAD,
     &                    CREAD,GLOBAL_LATS_R,LONSPERLAR)
        endif
      endif
      NEEDORO=1
      CALL read_mtn_hprim_oz(sfc_fld%SLMSK,HPRIME,NEEDORO,sfc_fld%ORO,
     &     IOZONDP,OZPLIN, GLOBAL_LATS_R,LONSPERLAR)
!      
      CALL SETINDXOZ(LATS_NODE_R,LATS_NODE_R,GLOBAL_LATS_R,
     &               JINDX1,JINDX2,DDY)
!      
      CALL LONLAT_PARA(GLOBAL_LATS_R,XLON,XLONF,XLAT,LONSPERLAR)
!!     
      RETURN
      END
