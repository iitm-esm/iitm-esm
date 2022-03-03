!CFPP$ NOCONCUR R
      SUBROUTINE MONINP(IX,IM,ntcw,KM,ntrac,DV,DU,TAU,RTG,
     &     U1,V1,T1,Q1,
     &     PSK,RBSOIL,FM,FH,TSEA,QSS,HEAT,EVAP,STRESS,SPD1,KPBL,
     &     PRSI,DEL,PRSL,PRSLK,PHII,PHIL,RCL,DELTIM,
     &     DUSFC,DVSFC,DTSFC,DQSFC,HPBL,HGAMT,HGAMQ,xkzm,
     &     sfcdspheat)

      USE MACHINE     , ONLY : kind_phys
      USE PHYSCONS, grav => con_g, RD => con_RD, CP => con_CP
     &,             HVAP => con_HVAP, ROG => con_ROG, FV => con_FVirt
      implicit none

!     Arguments

      integer IX, IM, ntcw, KM, ntrac, KPBL(IM)

      real(kind=kind_phys) DELTIM
      real(kind=kind_phys) DV(IM,KM),     DU(IM,KM),
     &                     TAU(IM,KM),    RTG(IM,KM,ntrac),
     &                     U1(IX,KM),     V1(IX,KM),
     &                     T1(IX,KM),     Q1(IX,KM,ntrac),
     &                     PSK(IM),       RBSOIL(IM),
     &                     FM(IM),        FH(IM),
     &                     TSEA(IM),      QSS(IM),
     &                                    SPD1(IM),
     &                     PRSI(IX,KM+1), DEL(IX,KM),
     &                     PRSL(IX,KM),   PRSLK(IX,KM),
     &                     PHII(IX,KM+1), PHIL(IX,KM),
     &                     RCL(IM),       DUSFC(IM),
     &                     dvsfc(IM),     dtsfc(IM),
     &                     DQSFC(IM),     HPBL(IM),
     &                     HGAMT(IM),     hgamq(IM)
      
!    Locals
 
      integer i,iprt,is,iun,k,kk,kmpbl,lond
      real(kind=kind_phys) evap(IM),  heat(IM),    phih(IM),
     &                     phim(IM),  rbdn(IM),    rbup(IM),
     &                     the1(IM),  stress(im),  beta(im),
     &                     the1v(IM), thekv(IM),   thermal(IM),
     &                     thesv(IM), ustar(IM),   wscale(IM),
     &                     sfcdspheat(im), rho(im)

      real(kind=kind_phys) RDZT(IM,KM-1),
     &                     ZI(IM,KM+1),     ZL(IM,KM),
     &                     DKU(IM,KM-1),    DKT(IM,KM-1),
     &                     AL(IM,KM-1),     AD(IM,KM),
     &                     AU(IM,KM-1),     A1(IM,KM),
     &                     A2(IM,KM*ntrac), THETA(IM,KM)
      logical              pblflg(IM),   sfcflg(IM), stable(IM),
     &                     dspheatnew

      real(kind=kind_phys) aphi16,  aphi5,  bet1,   bvf2,
     &                     cfac,    conq,   cont,   conw,
     &                     conwrc,  dk,     dkmax,  dkmin,
     &                     dq1,     dsdz2,  dsdzq,  dsdzt,
     &                     dsig,    dt,     dthe1,  dtodsd,
     &                     dtodsu,  dw2,    dw2min, g,
     &                     gamcrq,  gamcrt, gocp,   gor, gravi,
     &                     hol,     pfac,   prmax,  prmin, prinv,
     &                     prnum,   qmin,   qtend,  rbcr,
     &                     rbint,   rdt,    rdz,
     &                     ri,      rimin,  rl2,    rlam,  rlamun,
     &                     rone,   rzero,   sfcfrac,
     &                     sflux(im),   shr2,   spdk2,  sri,
     &                     tem,     ti,     ttend,  tvd,
     &                     tvu,     utend,  vk,     vk2,
     &                     vpert,   vtend,  xkzo(im,km),   zfac,
     &                     zfmin,   zk,     tem1, xkzm,
!--> added for TKE heating
     &                     diss(im,km), shr2a(im,km-1), thvi(im,km-1),
     &                     bf(im,km-1), qlmin, thvx(im,km)
      parameter (qlmin=1.e-12)
!<--

      parameter (gravi=1.0/grav)
      PARAMETER(g=grav)
      PARAMETER(GOR=G/RD,GOCP=G/CP)
      PARAMETER(CONT=1000.*CP/G,CONQ=1000.*HVAP/G,CONW=1000./G)
      PARAMETER(RLAM=30.0,VK=0.4,VK2=VK*VK,PRMIN=1.0,PRMAX=4.)
      PARAMETER(DW2MIN=0.0001,DKMIN=0.0,DKMAX=1000.,RIMIN=-100.)
      PARAMETER(RBCR=0.25,CFAC=7.8,PFAC=2.0,SFCFRAC=0.1)
      PARAMETER(QMIN=1.E-8,         ZFMIN=1.E-8,APHI5=5.,APHI16=16.)
      PARAMETER(GAMCRT=3.,GAMCRQ=0., RLAMUN=150.0)
      PARAMETER(IUN=84)

!-----------------------------------------------------------------------

 601  FORMAT(1X,' MONINP LAT LON STEP HOUR ',3I6,F6.1)
 602      FORMAT(1X,'    K','        Z','        T','       TH',
     1     '      TVH','        Q','        U','        V',
     2     '       SP')
 603      FORMAT(1X,I5,8F9.1)
 604      FORMAT(1X,'  SFC',9X,F9.1,18X,F9.1)
 605      FORMAT(1X,'    K      ZL    SPD2   THEKV   THE1V'
     1         ,' THERMAL    RBUP')
 606      FORMAT(1X,I5,6F8.2)
 607      FORMAT(1X,' KPBL    HPBL      FM      FH   HGAMT',
     1         '   HGAMQ      WS   USTAR      CD      CH')
 608      FORMAT(1X,I5,9F8.2)
 609      FORMAT(1X,' K PR DKT DKU ',I5,3F8.2)
 610      FORMAT(1X,' K PR DKT DKU ',I5,3F8.2,' L2 RI T2',
     1         ' SR2  ',2F8.2,2E10.2)
C - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
C     COMPUTE PRELIMINARY VARIABLES
C
      dspheatnew=.true.
      sfcdspheat=0.0
      if (IX .lt. im) stop

      DT    = 2. * DELTIM
      !DT    = DELTIM
      RDT   = 1. / DT
      KMPBL = KM / 2

      do k=1,km
        do i=1,im
          zi(i,k) = phii(i,k) * gravi
          zl(i,k) = phil(i,k) * gravi
        enddo
      enddo

      do k=1,km
        do i=1,im
          theta(i,k) = t1(i,k) * psk(i) / prslk(i,k)
          tem = max(q1(i,k,ntcw),qlmin)
          thvx(i,k)  = theta(i,k)*(1.+fv*max(q1(i,k,1),qmin)-tem)
        enddo
      enddo
      
      do i=1,im
        rho(i)=1000*prsl(i,1)/(rd*t1(i,1)*(1+fv*max(0.,q1(i,1,1))))
      enddo

      DO K = 1,KM-1
        DO I=1,IM
          RDZT(I,K) = 1.0 / (ZL(I,K+1) - ZL(I,K))
        ENDDO
      ENDDO

      DO I = 1,IM
         DUSFC(I) = 0.
         DVSFC(I) = 0.
         DTSFC(I) = 0.
         DQSFC(I) = 0.
         HGAMT(I) = 0.
         HGAMQ(I) = 0.
         WSCALE(I) = 0.
         KPBL(I) = 1
         HPBL(I) = ZI(I,2)
         PBLFLG(I) = .TRUE.
         SFCFLG(I) = .TRUE.
         IF(RBSOIL(I).GT.0.0) SFCFLG(I) = .FALSE.
      ENDDO
!!
      DO I=1,IM
         BETA(I)  = DT / (zi(i,2)-zi(i,1))
      ENDDO
C
      DO I=1,IM
         USTAR(I) = SQRT(STRESS(I))
      ENDDO
C
      DO I=1,IM
         THESV(I)   = TSEA(I)*(1.+FV*MAX(QSS(I),QMIN))
         THE1(I)    = THETA(I,1)
         THE1V(I)   = THE1(I)*(1.+FV*MAX(Q1(I,1,1),QMIN))
         THERMAL(I) = THE1V(I)
      ENDDO
C
C
C     COMPUTE THE FIRST GUESS OF PBL HEIGHT
C
      DO I=1,IM
         STABLE(I) = .FALSE.
!        ZL(i,1) = ZL1(i)
         RBUP(I) = RBSOIL(I)
      ENDDO
      DO K = 2, KMPBL
        DO I = 1, IM
          IF(.NOT.STABLE(I)) THEN
             RBDN(I)   = RBUP(I)
             THEKV(I)  = THETA(i,k)*(1.+FV*MAX(Q1(i,k,1),QMIN))
             SPDK2     = MAX(RCL(i)*(U1(i,k)**2+V1(i,k)**2),1.)
             RBUP(I)   = (THEKV(I)-THE1V(I))*(G*ZL(I,k)/THE1V(I))/SPDK2
             KPBL(I)   = K
             STABLE(I) = RBUP(I).GT.RBCR
          ENDIF
        ENDDO
      ENDDO
C
      DO I = 1,IM
         K = KPBL(I)
         IF(RBDN(I).GE.RBCR) THEN
            RBINT = 0.
         ELSEIF(RBUP(I).LE.RBCR) THEN
            RBINT = 1.
         ELSE
            RBINT = (RBCR-RBDN(I))/(RBUP(I)-RBDN(I))
         ENDIF
         HPBL(I) = ZL(I,K-1) + RBINT*(ZL(I,K)-ZL(I,K-1))
         IF(HPBL(I).LT.ZI(I,KPBL(I))) KPBL(I) = KPBL(I) - 1
      ENDDO
!!
      DO I=1,IM
           HOL = MAX(RBSOIL(I)*FM(I)*FM(I)/FH(I),RIMIN)
           IF(SFCFLG(I)) THEN
              HOL = MIN(HOL,-ZFMIN)
           ELSE
              HOL = MAX(HOL,ZFMIN)
           ENDIF
C
!          HOL = HOL*HPBL(I)/ZL1(I)*SFCFRAC
           HOL = HOL*HPBL(I)/ZL(I,1)*SFCFRAC
           IF(SFCFLG(I)) THEN
!             PHIM = (1.-APHI16*HOL)**(-1./4.)
!             PHIH = (1.-APHI16*HOL)**(-1./2.)
              TEM  = 1.0 / (1. - APHI16*HOL)
              PHIH(I) = SQRT(TEM)
              PHIM(I) = SQRT(PHIH(I))
           ELSE
              PHIM(I) = (1.+APHI5*HOL)
              PHIH(I) = PHIM(I)
           ENDIF
           WSCALE(I) = USTAR(I)/PHIM(I)
           WSCALE(I) = MIN(WSCALE(I),USTAR(I)*APHI16)
           WSCALE(I) = MAX(WSCALE(I),USTAR(I)/APHI5)
      ENDDO
C
C     COMPUTE THE SURFACE VARIABLES FOR PBL HEIGHT ESTIMATION
C     UNDER UNSTABLE CONDITIONS
C
      DO I = 1,IM
         SFLUX(i)  = HEAT(I) + EVAP(I)*FV*THE1(I)
         IF(SFCFLG(I).AND.SFLUX(i).GT.0.0) THEN
           HGAMT(I)   = MIN(CFAC*HEAT(I)/WSCALE(I),GAMCRT)
           HGAMQ(I)   = MIN(CFAC*EVAP(I)/WSCALE(I),GAMCRQ)
           VPERT      = HGAMT(I) + FV*THE1(I)*HGAMQ(I)
           VPERT      = MIN(VPERT,GAMCRT)
           THERMAL(I) = THERMAL(I) + MAX(VPERT,0.)
           HGAMT(I)   = MAX(HGAMT(I),0.0)
           HGAMQ(I)   = MAX(HGAMQ(I),0.0)
         ELSE
           PBLFLG(I) = .FALSE.
         ENDIF
      ENDDO
C
      DO I = 1,IM
         IF(PBLFLG(I)) THEN
            KPBL(I) = 1
            HPBL(I) = ZI(I,2)
         ENDIF
      ENDDO
C
C     ENHANCE THE PBL HEIGHT BY CONSIDERING THE THERMAL
C
      DO I = 1, IM
         IF(PBLFLG(I)) THEN
            STABLE(I) = .FALSE.
            RBUP(I) = RBSOIL(I)
         ENDIF
      ENDDO
      DO K = 2, KMPBL
        DO I = 1, IM
          IF(.NOT.STABLE(I).AND.PBLFLG(I)) THEN
            RBDN(I)   = RBUP(I)
            THEKV(I)  = THETA(i,k)*(1.+FV*MAX(Q1(i,k,1),QMIN))
            SPDK2     = MAX(RCL(i)*(U1(i,k)**2+V1(i,k)**2),1.)
            RBUP(I)   = (THEKV(I)-THERMAL(I))*(G*ZL(I,k)/THE1V(I))/SPDK2
            KPBL(I)   = K
            STABLE(I) = RBUP(I).GT.RBCR
          ENDIF
        ENDDO
      ENDDO
C
      DO I = 1,IM
         IF(PBLFLG(I)) THEN
            K = KPBL(I)
            IF(RBDN(I).GE.RBCR) THEN
               RBINT = 0.
            ELSEIF(RBUP(I).LE.RBCR) THEN
               RBINT = 1.
            ELSE
               RBINT = (RBCR-RBDN(I))/(RBUP(I)-RBDN(I))
            ENDIF
            HPBL(I) = ZL(I,K-1) + RBINT*(ZL(I,k)-ZL(I,K-1))
            IF(HPBL(I).LT.ZI(I,KPBL(I))) KPBL(I) = KPBL(I) - 1
            IF(KPBL(I).LE.1) PBLFLG(I) = .FALSE.
         ENDIF
      ENDDO

      DO K = 1,KM-1
        DO I=1,IM
          tem1      = 1.0 - prsi(i,k+1) / prsi(i,1)
          tem1      = tem1 * tem1 * 10.0
          xkzo(i,k) = xkzm * min(1.0, exp(-tem1))
        ENDDO
      ENDDO
!!
C
C     COMPUTE DIFFUSION COEFFICIENTS BELOW PBL
C
      DO K = 1, KMPBL
         DO I=1,IM
            IF(KPBL(I).GT.K) THEN
               PRINV = 1.0 / (PHIH(I)/PHIM(I)+CFAC*VK*.1)
               PRINV = MIN(PRINV,PRMAX)
               PRINV = MAX(PRINV,PRMIN)
!              ZFAC = MAX((1.-(ZI(I,K+1)-ZL1(I))/
!    1                (HPBL(I)-ZL1(I))), ZFMIN)
               ZFAC = MAX((1.-(ZI(I,K+1)-ZL(I,1))/
     1                (HPBL(I)-ZL(I,1))), ZFMIN)
               DKU(i,k) = XKZO(i,k) + WSCALE(I)*VK*ZI(I,K+1)
     1                         * ZFAC**PFAC
               DKT(i,k) = DKU(i,k)*PRINV
               DKU(i,k) = MIN(DKU(i,k),DKMAX)
               DKU(i,k) = MAX(DKU(i,k),DKMIN)
               DKT(i,k) = MIN(DKT(i,k),DKMAX)
               DKT(i,k) = MAX(DKT(i,k),DKMIN)
            ENDIF
         ENDDO
      ENDDO
C
C     COMPUTE DIFFUSION COEFFICIENTS OVER PBL (FREE ATMOSPHERE)
C
      DO K = 1, KM-1
         DO I=1,IM
            IF(K.GE.KPBL(I)) THEN
               TI   = 2.0 / (T1(i,k)+T1(i,K+1))
               RDZ  = RDZT(I,K)

               DW2  = RCL(i)*((U1(i,k)-U1(i,K+1))**2
     &                      + (V1(i,k)-V1(i,K+1))**2)
               SHR2 = MAX(DW2,DW2MIN)*RDZ*RDZ
               TVD  = T1(i,k)*(1.+FV*MAX(Q1(i,k,1),QMIN))
               TVU  = T1(i,K+1)*(1.+FV*MAX(Q1(i,K+1,1),QMIN))
               BVF2 = G*(GOCP+RDZ*(TVU-TVD)) * TI
               RI   = MAX(BVF2/SHR2,RIMIN)
               ZK   = VK*ZI(I,K+1)
               IF(RI.LT.0.) THEN ! UNSTABLE REGIME
                  RL2      = ZK*RLAMUN/(RLAMUN+ZK)
                  DK       = RL2*RL2*SQRT(SHR2)
                  SRI      = SQRT(-RI)
                  DKU(i,k) = XKZO(i,k) + DK*(1+8.*(-RI)/(1+1.746*SRI))
                  DKT(i,k) = XKZO(i,k) + DK*(1+8.*(-RI)/(1+1.286*SRI))
               ELSE             ! STABLE REGIME
                  RL2       = ZK*RLAM/(RLAM+ZK)
                  DK        = RL2*RL2*SQRT(SHR2)
                  DKT(i,k)  = XKZO(i,k) + DK/(1+5.*RI)**2
                  PRNUM     = 1.0 + 2.1*RI
                  PRNUM     = MIN(PRNUM,PRMAX)
                  DKU(i,k)  = (DKT(i,k)-XKZO(i,k))*PRNUM + XKZO(i,k)
               ENDIF

               DKU(i,k) = MIN(DKU(i,k),DKMAX)
               DKU(i,k) = MAX(DKU(i,k),DKMIN)
               DKT(i,k) = MIN(DKT(i,k),DKMAX)
               DKT(i,k) = MAX(DKT(i,k),DKMIN)

            ENDIF
         ENDDO
      ENDDO
C
C     COMPUTE TRIDIAGONAL MATRIX ELEMENTS FOR HEAT AND MOISTURE
C
      DO I=1,IM
         AD(I,1) = 1.
         A1(I,1) = T1(i,1)   + BETA(i) * HEAT(I)
         A2(I,1) = Q1(i,1,1) + BETA(i) * EVAP(I)
      ENDDO
      if(ntrac.ge.2) then
        do k = 2, ntrac
          is = (k-1) * km
          do i = 1, im
            A2(I,1+is) = Q1(i,1,k)
          enddo
        enddo
      endif
C
      DO K = 1,KM-1
        DO I = 1,IM
          DTODSD = DT/DEL(I,K)
          DTODSU = DT/DEL(I,K+1)
          DSIG   = PRSL(I,K)-PRSL(I,K+1)
          RDZ    = RDZT(I,K)
          tem1   = DSIG * DKT(i,k) * RDZ
          IF(PBLFLG(I).AND.K.LT.KPBL(I)) THEN
             tem   = 1.0 / HPBL(I)
             DSDZT = tem1 * (GOCP-HGAMT(I)*tem)
             DSDZQ = tem1 * (-HGAMQ(I)*tem)
             A2(I,k)   = A2(I,k)+DTODSD*DSDZQ
             A2(I,k+1) = Q1(i,k+1,1)-DTODSU*DSDZQ
          ELSE
             DSDZT = tem1 * GOCP
             A2(I,k+1) = Q1(i,k+1,1)
          ENDIF
          DSDZ2     = tem1 * RDZ
          AU(I,k)   = -DTODSD*DSDZ2
          AL(I,k)   = -DTODSU*DSDZ2
          AD(I,k)   = AD(I,k)-AU(I,k)
          AD(I,k+1) = 1.-AL(I,k)
          A1(I,k)   = A1(I,k)+DTODSD*DSDZT
          A1(I,k+1) = T1(i,k+1)-DTODSU*DSDZT
        ENDDO
      ENDDO
      if(ntrac.ge.2) then
        do kk = 2, ntrac
          is = (kk-1) * km
          do k = 1, km - 1
            do i = 1, im
              A2(I,k+1+is) = Q1(i,k+1,kk)
            enddo
          enddo
        enddo
      endif
C
C     SOLVE TRIDIAGONAL PROBLEM FOR HEAT AND MOISTURE
C
      CALL TRIDIN(IM,KM,ntrac,AL,AD,AU,A1,A2,AU,A1,A2)
C
C     RECOVER TENDENCIES OF HEAT AND MOISTURE
C
      DO  K = 1,KM
         DO I = 1,IM
            TTEND      = (A1(I,k)-T1(i,k))*RDT
            QTEND      = (A2(I,k)-Q1(i,k,1))*RDT
            TAU(i,k)   = TAU(i,k)+TTEND
            RTG(I,k,1) = RTG(i,k,1)+QTEND
!            DTSFC(I)   = DTSFC(I)+CONT*DEL(I,K)*TTEND
            if(k==km) then
              dtsfc(i)=cp*rho(i)*heat(i)
            endif
!            DQSFC(I)   = DQSFC(I)+CONQ*DEL(I,K)*QTEND
            if(k==km) then
              dqsfc(i)=hvap*rho(i)*evap(i)
            endif
         ENDDO
      ENDDO

      if(ntrac.ge.2) then
        do kk = 2, ntrac
          is = (kk-1) * km
          do k = 1, km 
            do i = 1, im
              QTEND = (A2(I,K+is)-Q1(i,K,kk))*RDT
              RTG(i,K,kk) = RTG(i,K,kk)+QTEND
            enddo
          enddo
        enddo
      endif

C     COMPUTE TRIDIAGONAL MATRIX ELEMENTS FOR MOMENTUM

      DO I=1,IM
         AD(I,1) = 1.0 + BETA(i) * STRESS(I) / SPD1(I)
         A1(I,1) = U1(i,1)
         A2(I,1) = V1(i,1)
      ENDDO
C
      DO K = 1,KM-1
        DO I=1,IM
          DTODSD    = DT/DEL(I,K)
          DTODSU    = DT/DEL(I,K+1)
          DSIG      = PRSL(I,K)-PRSL(I,K+1)
          RDZ       = RDZT(I,K)
          DSDZ2     = DSIG*DKU(i,k)*RDZ*RDZ
          AU(I,k)   = -DTODSD*DSDZ2
          AL(I,k)   = -DTODSU*DSDZ2
          AD(I,k)   = AD(I,k)-AU(I,k)
          AD(I,k+1) = 1.-AL(I,k)
          A1(I,k+1) = U1(i,k+1)
          A2(I,k+1) = V1(i,k+1)
        ENDDO
      ENDDO
C
C     SOLVE TRIDIAGONAL PROBLEM FOR MOMENTUM
C
      CALL TRIDI2(IM,KM,AL,AD,AU,A1,A2,AU,A1,A2)
C
C     RECOVER TENDENCIES OF MOMENTUM
C
      DO K = 1,KM
         DO I = 1,IM
            CONWRC = CONW*SQRT(RCL(i))
            UTEND = (A1(I,k)-U1(i,k))*RDT
            VTEND = (A2(I,k)-V1(i,k))*RDT
            DU(i,k)  = DU(i,k)+UTEND
            DV(i,k)  = DV(i,k)+VTEND
            DUSFC(I) = DUSFC(I)+CONWRC*DEL(I,K)*UTEND
            DVSFC(I) = DVSFC(I)+CONWRC*DEL(I,K)*VTEND
            if (dspheatnew) then
             TTEND=0.5*RDT*((U1(I,K)**2-A1(I,K)**2) +
     &             (V1(I,K)**2-A2(I,K)**2))/CP 
             TAU(I,K)=TAU(I,K)+TTEND
             sfcdspheat(i)=sfcdspheat(i)+CONT*DEL(i,k)*TTEND
            endif
         ENDDO
      ENDDO
!!
      RETURN
      END

CFPP$ NOCONCUR R
C-----------------------------------------------------------------------
      SUBROUTINE TRIDI2(L,N,CL,CM,CU,R1,R2,AU,A1,A2)
csela %INCLUDE DBTRIDI2;
cc
      USE MACHINE     , ONLY : kind_phys
      implicit none
      integer             k,n,l,i
      real(kind=kind_phys) fk
cc
      real(kind=kind_phys) CL(L,2:N),CM(L,N),CU(L,N-1),R1(L,N),R2(L,N),
     &          AU(L,N-1),A1(L,N),A2(L,N)
C-----------------------------------------------------------------------
      DO I=1,L
        FK      = 1./CM(I,1)
        AU(I,1) = FK*CU(I,1)
        A1(I,1) = FK*R1(I,1)
        A2(I,1) = FK*R2(I,1)
      ENDDO
      DO K=2,N-1
        DO I=1,L
          FK      = 1./(CM(I,K)-CL(I,K)*AU(I,K-1))
          AU(I,K) = FK*CU(I,K)
          A1(I,K) = FK*(R1(I,K)-CL(I,K)*A1(I,K-1))
          A2(I,K) = FK*(R2(I,K)-CL(I,K)*A2(I,K-1))
        ENDDO
      ENDDO
      DO I=1,L
        FK      = 1./(CM(I,N)-CL(I,N)*AU(I,N-1))
        A1(I,N) = FK*(R1(I,N)-CL(I,N)*A1(I,N-1))
        A2(I,N) = FK*(R2(I,N)-CL(I,N)*A2(I,N-1))
      ENDDO
      DO K=N-1,1,-1
        DO I=1,L
          A1(I,K) = A1(I,K)-AU(I,K)*A1(I,K+1)
          A2(I,K) = A2(I,K)-AU(I,K)*A2(I,K+1)
        ENDDO
      ENDDO
C-----------------------------------------------------------------------
      RETURN
      END
CFPP$ NOCONCUR R
C-----------------------------------------------------------------------
      SUBROUTINE TRIDIN(L,N,nt,CL,CM,CU,R1,R2,AU,A1,A2)
csela %INCLUDE DBTRIDI2;
cc
      USE MACHINE     , ONLY : kind_phys
      implicit none
      integer             is,k,kk,n,nt,l,i
      real(kind=kind_phys) fk(L)
cc
      real(kind=kind_phys) CL(L,2:N), CM(L,N), CU(L,N-1),
     &                     R1(L,N),   R2(L,N*nt),
     &                     AU(L,N-1), A1(L,N), A2(L,N*nt),
     &                     FKK(L,2:N-1)
C-----------------------------------------------------------------------
      DO I=1,L
        FK(I)   = 1./CM(I,1)
        AU(I,1) = FK(I)*CU(I,1)
        A1(I,1) = FK(I)*R1(I,1)
      ENDDO
      do k = 1, nt
        is = (k-1) * n
        do i = 1, l
          a2(i,1+is) = fk(I) * r2(i,1+is)
        enddo
      enddo
      DO K=2,N-1
        DO I=1,L
          FKK(I,K) = 1./(CM(I,K)-CL(I,K)*AU(I,K-1))
          AU(I,K)  = FKK(I,K)*CU(I,K)
          A1(I,K)  = FKK(I,K)*(R1(I,K)-CL(I,K)*A1(I,K-1))
        ENDDO
      ENDDO
      do kk = 1, nt
        is = (kk-1) * n
        DO K=2,N-1
          DO I=1,L
            A2(I,K+is) = FKK(I,K)*(R2(I,K+is)-CL(I,K)*A2(I,K+is-1))
          ENDDO
        ENDDO
      ENDDO
      DO I=1,L
        FK(I)   = 1./(CM(I,N)-CL(I,N)*AU(I,N-1))
        A1(I,N) = FK(I)*(R1(I,N)-CL(I,N)*A1(I,N-1))
      ENDDO
      do k = 1, nt
        is = (k-1) * n
        do i = 1, l
          A2(I,N+is) = FK(I)*(R2(I,N+is)-CL(I,N)*A2(I,N+is-1))
        enddo
      enddo
      DO K=N-1,1,-1
        DO I=1,L
          A1(I,K) = A1(I,K) - AU(I,K)*A1(I,K+1)
        ENDDO
      ENDDO
      do kk = 1, nt
        is = (kk-1) * n
        DO K=n-1,1,-1
          DO I=1,L
            A2(I,K+is) = A2(I,K+is) - AU(I,K)*A2(I,K+is+1)
          ENDDO
        ENDDO
      ENDDO
C-----------------------------------------------------------------------
      RETURN
      END
