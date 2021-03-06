      SUBROUTINE spect_fields(n1,n2, PDRYINI,TRIE_LS,TRIO_LS,
     &                 LS_NODE,LS_NODES,MAX_LS_NODES,SNNP1EV,SNNP1OD,
     &                 phy_f3d,phy_f2d,global_lats_r,nblck,lonsperlar,
     &                 epse,epso,plnev_r,plnod_r,
     &                 plnew_r,plnow_r,lats_nodes_r,
     &                 cread, cread2)
!
      use resol_def
      use layout1
      use gg_def
      use vert_def
!     use sig_io
      use namelist_def
      use gfsio_module
      use gfsio_def
      use mpi_def
      IMPLICIT NONE
!!
 
cmy fix pdryini type
cmy      REAL(KIND=KIND_EVOD) PDRYINI
      REAL(KIND=KIND_PHYS) PDRYINI
      INTEGER              N1,N2
      CHARACTER (len=*)   :: CREAD, CREAD2
      REAL(KIND=KIND_EVOD) TRIE_LS(LEN_TRIE_LS,2,11*LEVS+3*LEVH+6)
      REAL(KIND=KIND_EVOD) TRIO_LS(LEN_TRIO_LS,2,11*LEVS+3*LEVH+6)
      REAL(KIND=KIND_EVOD) SNNP1EV(LEN_TRIE_LS)
      REAL(KIND=KIND_EVOD) SNNP1OD(LEN_TRIO_LS)
      REAL(KIND=KIND_EVOD) EPSE   (LEN_TRIE_LS)
      REAL(KIND=KIND_EVOD) EPSO   (LEN_TRIE_LS)
      REAL(KIND=KIND_EVOD) PLNEV_R(LEN_TRIE_LS,LATR2)
      REAL(KIND=KIND_EVOD) PLNOD_R(LEN_TRIE_LS,LATR2)
      REAL(KIND=KIND_EVOD) PLNEW_R(LEN_TRIE_LS,LATR2)
      REAL(KIND=KIND_EVOD) PLNOW_R(LEN_TRIE_LS,LATR2)
!
!
      integer nblck
      real (kind=kind_phys)
     &     phy_f3d(NGPTC,LEVS,NBLCK,lats_node_r,num_p3d),
     &     phy_f2d(lonr,lats_node_r,num_p2d)
      integer global_lats_r(latr), lonsperlar(latr)
 
cmy bug fix on dimension of ls_node
      INTEGER              LS_NODE (LS_DIM*3)
      INTEGER              LS_NODES(LS_DIM,NODES)
      INTEGER          MAX_LS_NODES(NODES)
      integer            lats_nodes_r(nodes)
!
      INTEGER              IERR,IPRINT,J,JDT,K,L,LOCL,N,i
      REAL(KIND=KIND_EVOD) TEE1(LEVS)
      REAL(KIND=KIND_EVOD)  YE1(LEVS)
      INTEGER              INDLSEV,JBASEV
      INTEGER              INDLSOD,JBASOD
      REAL(KIND=KIND_EVOD), parameter :: CONS0=0.0, CONS2=2.0,
     &                                   CONS600=600.0
      LOGICAL LSLAG
      integer :: idate(4)
      real :: fhour
!
      if(me.eq.0) PRINT  9876,N1,N2,FHOUR,idate
 9876 FORMAT(1H ,'N1,N2,FHOUR IN spect_fields ',2(I4,1X),F6.2,
     & ' idate no yet read in',4(1x,i4))
      IPRINT = 0
c$$$  IF ( ME .EQ. 0 ) IPRINT = 1
!
      if (me .eq. 0) print *,' cread=',cread
      if (.not. gfsio_in) then
        CALL TREADEO(N1,FHOUR,IDATE,
     X               TRIE_LS(1,1,P_GZ ), TRIE_LS(1,1,P_QM ),
     X               TRIE_LS(1,1,P_TEM), TRIE_LS(1,1,P_DIM),
     X               TRIE_LS(1,1,P_ZEM), TRIE_LS(1,1,P_RM ),
     X               TRIO_LS(1,1,P_GZ ), TRIO_LS(1,1,P_QM ),
     X               TRIO_LS(1,1,P_TEM), TRIO_LS(1,1,P_DIM),
     X               TRIO_LS(1,1,P_ZEM), TRIO_LS(1,1,P_RM ),
     X               LS_NODE,LS_NODES,MAX_LS_NODES,
     &               plnev_r, plnod_r, plnew_r, plnow_r,lats_nodes_r,
     X               SNNP1EV,SNNP1OD,PDRYINI,IPRINT,
     &               phy_f3d, phy_f2d, global_lats_r, nblck, lonsperlar,
     &               cread)
      else
        CALL TREADEO_gfsio(FHOUR,IDATE,
     X               TRIE_LS(1,1,P_GZ ), TRIE_LS(1,1,P_QM ),
     X               TRIE_LS(1,1,P_TEM), TRIE_LS(1,1,P_DIM),
     X               TRIE_LS(1,1,P_ZEM), TRIE_LS(1,1,P_RM ),
     X               TRIO_LS(1,1,P_GZ ), TRIO_LS(1,1,P_QM ),
     X               TRIO_LS(1,1,P_TEM), TRIO_LS(1,1,P_DIM),
     X               TRIO_LS(1,1,P_ZEM), TRIO_LS(1,1,P_RM ),
     X               LS_NODE,LS_NODES,MAX_LS_NODES,
     X               SNNP1EV,SNNP1OD,PDRYINI,IPRINT,
     &               global_lats_r,lats_nodes_r,lonsperlar, cread,
     &               epse, epso, plnew_r, plnow_r)
      endif
 
      if(me.eq.0) PRINT 9877, N1,FHOUR
 9877 FORMAT(1H ,'N1,FHOUR AFTER TREAD',1(I4,1X),F6.2)
 
      if (.NOT.LIOPE.or.icolor.ne.2) then
!sela   print*,'liope=',liope,' icolor=',icolor
        CALL RMS_spect(TRIE_LS(1,1,P_QM ), TRIE_LS(1,1,P_DIM),
     X             TRIE_LS(1,1,P_TEM), TRIE_LS(1,1,P_ZEM),
     X             TRIE_LS(1,1,P_RM ),
     X             TRIO_LS(1,1,P_QM ), TRIO_LS(1,1,P_DIM),
     X             TRIO_LS(1,1,P_TEM), TRIO_LS(1,1,P_ZEM),
     X             TRIO_LS(1,1,P_RM ),
     X             LS_NODES,MAX_LS_NODES)
      endif
!---------------------------------------------------------------
      if(is_first_time) THEN
!set n time level values to n-1 time
        do i=1,len_trie_ls
           trie_ls(i,1,P_q )=trie_ls(i,1,P_qm )
           trie_ls(i,2,P_q )=trie_ls(i,2,P_qm )
        enddo
        do i=1,len_trio_ls
           trio_ls(i,1,P_q )=trio_ls(i,1,P_qm )
           trio_ls(i,2,P_q )=trio_ls(i,2,P_qm )
        enddo
 
        do k=1,levs
          do i=1,len_trie_ls
            trie_ls(i,1,P_te +k-1)=trie_ls(i,1,P_tem +k-1)
            trie_ls(i,2,P_te +k-1)=trie_ls(i,2,P_tem +k-1)
 
            trie_ls(i,1,P_di +k-1)=trie_ls(i,1,P_dim +k-1)
            trie_ls(i,2,P_di +k-1)=trie_ls(i,2,P_dim +k-1)
 
            trie_ls(i,1,P_ze +k-1)=trie_ls(i,1,P_zem +k-1)
            trie_ls(i,2,P_ze +k-1)=trie_ls(i,2,P_zem +k-1)
          enddo
          do i=1,len_trio_ls
            trio_ls(i,1,P_te +k-1)=trio_ls(i,1,P_tem+k-1)
            trio_ls(i,2,P_te +k-1)=trio_ls(i,2,P_tem+k-1)
 
            trio_ls(i,1,P_di +k-1)=trio_ls(i,1,P_dim+k-1)
            trio_ls(i,2,P_di +k-1)=trio_ls(i,2,P_dim+k-1)
 
            trio_ls(i,1,P_ze +k-1)=trio_ls(i,1,P_zem+k-1)
            trio_ls(i,2,P_ze +k-1)=trio_ls(i,2,P_zem+k-1)
          enddo
        enddo
 
        do k=1,levh
          do i=1,len_trie_ls
            trie_ls(i,1,P_rq +k-1)=trie_ls(i,1,P_rm +k-1)
            trie_ls(i,2,P_rq +k-1)=trie_ls(i,2,P_rm +k-1)
          enddo
          do i=1,len_trio_ls
            trio_ls(i,1,P_rq +k-1)=trio_ls(i,1,P_rm+k-1)
            trio_ls(i,2,P_rq +k-1)=trio_ls(i,2,P_rm+k-1)
          enddo
        enddo
!--------------------------------------------------------
      else
!--------------------------------------------------------
        IPRINT = 0
c$$$      IF ( ME .EQ. 0 ) IPRINT = 1
      if (me .eq. 0) print *,' cread2=',cread2
        if (.not. gfsio_in) then
          CALL TREADEO(N2,FHOUR,IDATE,
     X                 TRIE_LS(1,1,P_GZ), TRIE_LS(1,1,P_Q ),
     X                 TRIE_LS(1,1,P_TE), TRIE_LS(1,1,P_DI),
     X                 TRIE_LS(1,1,P_ZE), TRIE_LS(1,1,P_RQ),
     X                 TRIO_LS(1,1,P_GZ), TRIO_LS(1,1,P_Q ),
     X                 TRIO_LS(1,1,P_TE), TRIO_LS(1,1,P_DI),
     X                 TRIO_LS(1,1,P_ZE), TRIO_LS(1,1,P_RQ),
     X                 LS_NODE,LS_NODES,MAX_LS_NODES,
     &                 plnev_r, plnod_r, plnew_r, plnow_r,lats_nodes_r,
     X                 SNNP1EV,SNNP1OD,PDRYINI,IPRINT,
     &                 phy_f3d, phy_f2d, global_lats_r, nblck,
     &                 lonsperlar, cread2)
        else
          CALL TREADEO_gfsio(FHOUR,IDATE,
     X                 TRIE_LS(1,1,P_GZ), TRIE_LS(1,1,P_Q ),
     X                 TRIE_LS(1,1,P_TE), TRIE_LS(1,1,P_DI),
     X                 TRIE_LS(1,1,P_ZE), TRIE_LS(1,1,P_RQ),
     X                 TRIO_LS(1,1,P_GZ), TRIO_LS(1,1,P_Q ),
     X                 TRIO_LS(1,1,P_TE), TRIO_LS(1,1,P_DI),
     X                 TRIO_LS(1,1,P_ZE), TRIO_LS(1,1,P_RQ),
     X                 LS_NODE,LS_NODES,MAX_LS_NODES,
     X                 SNNP1EV,SNNP1OD,PDRYINI,IPRINT,
     &                 global_lats_r,lats_nodes_r,lonsperlar, cread2,
     &                 epse, epso, plnew_r, plnow_r)
        endif
        if(me.eq.0) PRINT 9878, N2,FHOUR
 9878   FORMAT(1H ,'N2,FHOUR AFTER TREAD',1(I4,1X),F6.2)
      endif
!--------------------------------------------------------
!!
!sela IF (me.eq.0) THEN
!sela   write(*,*)'Initial values'
!sela   write(*,*)'*********'
!sela   CALL bar3(trie_ls(1,1,P_ze),trio_ls(1,1,P_ze),'ze ',levs)
!sela   CALL bar3(trie_ls(1,1,P_di),trio_ls(1,1,P_di),'di ',levs)
!sela   CALL bar3(trie_ls(1,1,P_te),trio_ls(1,1,P_te),'te ',levs)
!sela   CALL bar3(trie_ls(1,1,P_rq),trio_ls(1,1,P_rq),'rq ',levs)
!sela   CALL bar3(trie_ls(1,1,P_rq+levs),trio_ls(1,1,P_rq+levs),
!sela&            'oz1 ',levs)
!sela   CALL bar3(trie_ls(1,1,P_rq+2*levs),trio_ls(1,1,P_rq+2*levs),
!sela&            'oz2 ',levs)
!sela   CALL bar3(trie_ls(1,1,P_q),trio_ls(1,1,P_q),'q ',1)
!sela   CALL bar3(trie_ls(1,1,P_gz),trio_ls(1,1,P_gz),'gz ',1)
!sela ENDIF
!!
      RETURN
      END
