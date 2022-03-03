       subroutine precpd (im,ix,km,dt,del,prsl,ps,q,cwm,t,rn,sn
     &,                                             u00k,lprnt,jpr)
!
!
!     ******************************************************************
!     *                                                                *
!     *           subroutine for precipitation processes               *
!     *           from suspended cloud water/ice                       *
!     *                                                                *
!     ******************************************************************
!     *                                                                *
!     *  originally created by  q. zhao                jan. 1995       *
!     *                         -------                                *    
!     *  modified and rewritten by shrinivas moorthi   oct. 1998       *
!     *                            -----------------                   *
!     *  and                       hua-lu pan                          *
!     *                            ----------                          *
!     *                                                                *
!     *  references:                                                   *
!     *                                                                *
!     *  zhao and carr (1997), monthly weather review (august)         *
!     *  sundqvist et al., (1989) monthly weather review. (august)     *
!     *                                                                *
!     ******************************************************************
!
!     in this code vertical indexing runs from surface to top of the
!     model
!
!     argument list:
!     --------------
!       im         : inner dimension over which calculation is made
!       ix         : maximum inner dimension
!       km         : number of vertical levels
!       dt         : time step in seconds
!       del(km)    : pressure layer thickness (bottom to top)
!       prsl(km)   : pressure values for model layers (bottom to top)
!       ps(im)     : surface pressure (centibars)
!       q(ix,km)   : specific humidity (updated in the code)
!       cwm(ix,km) : condensate mixing ratio (updated in the code)
!       t(ix,km)   : temperature       (updated in the code)
!       rn(im)     : precipitation over one time-step dt (m/dt)
!       sr(im)     : index (=-1 snow, =0 rain/snow, =1 rain)
!       tcw(im)    : vertically integrated liquid water (kg/m**2)
!       cll(ix,km) : cloud cover
!
      use machine , only : kind_phys
      use funcphys , only : fpvs
      use physcons, grav => con_g, hvap => con_hvap, hfus => con_hfus
     &,             ttp => con_ttp, cp => con_cp
     &,             eps => con_eps, epsm1 => con_epsm1
      implicit none
!     include 'constant.h'
!
      real (kind=kind_phys) g,      h1,    h2,   h1000
     &,                     h1000g, d00,   d125, d5
     &,                     elwv,   eliv,  row
     &,                     epsq,   dldt,  tm10, eliw
     &,                     rcp,    rrow
       parameter (g=grav,         h1=1.e0,     h2=2.e0,     h1000=1000.0
     &,           h1000g=h1000/g, d00=0.e0,    d125=.125e0, d5=0.5e0
     &,           elwv=hvap,      eliv=hvap+hfus,   row=1.e3
     &,           epsq=2.e-12,    dldt=2274.e0,tm10=ttp-10.0
     &,           eliw=eliv-elwv, rcp=h1/cp,   rrow=h1/row)
!
      real(kind=kind_phys), parameter :: cons_0=0.0,     cons_p01=0.01
     &,                                  cons_20=20.0
     &,                                  cons_m30=-30.0, cons_50=50.0
!
      integer im, ix, km, lat, jpr
      real (kind=kind_phys) q(ix,km),   t(ix,km),    cwm(ix,km)
     &,                                 del(ix,km),  prsl(ix,km)
!    &,                     cll(im,km), del(ix,km),  prsl(ix,km)
     &,                     ps(im),     rn(im),      sr(im)
     &,                     tcw(im),    dt, sn(im)
!
!
      real (kind=kind_phys) err(im),      ers(im),     precrl(im)
     &,                     precsl(im),   precrl1(im), precsl1(im)
     &,                     rq(im),       condt(im)
     &,                     conde(im),    rconde(im),  tmt0(im)
     &,                     wmin(im,km),  wmink(im),   pres(im)
     &,                     wmini(im,km), ccr(im),     cclim(km)
     &,                     tt(im),       qq(im),      ww(im)
     &,                     wfix(km),     u00k(im,km), es(im)
     &,                     zaodt
!
      integer iw(im,km), ipr(im), iwl(im),     iwl1(im)
!
       logical comput(im)
       logical lprnt
!
      real (kind=kind_phys) ke,   rdt,  us, cclimit, climit, cws, csm1
     &,                     crs1, crs2, cr, aa2,     dtcp,   c00, cmr
     &,                     tem,  c1,   c2, wwn
!    &,                     tem,  c1,   c2, u00b,    u00t,   wwn
     &,                     precrk, precsk, pres1,   qk,     qw,  qi
     &,                     ai,     bi, qint, fiw, wws, cwmk, expf
     &,                     psaut, psaci, amaxcm, tem1, tem2
     &,                     tmt0k, tmt15, psm1, psm2, ppr, pswi
     &,                     rprs,  erk,   pps, sid, rid, amaxps
     &,                     praut, pracw, fi, qc, amaxrq, rqkll
      integer i, k, ihpr, n
!
!-----------------------preliminaries ---------------------------------
!
      rdt     = h1 / dt
      ke      = 2.0e-5  ! commented on 09/10/99
      us      = h1
      cclimit = 1.0e-3
      climit  = 1.0e-20
      cws     = 0.025

      zaodt   = 800.0 * rdt

      csm1    = 5.0000e-8   * zaodt
      crs1    = 5.00000e-6  * zaodt
      crs2    = 6.66600e-10 * zaodt
      cr      = 5.0e-4      * zaodt
      aa2     = 1.25e-3     * zaodt

      ke      = ke * sqrt(rdt)
      dtcp    = dt * rcp
      c00 = 1.0e-4 * dt          !05/09/2000
      cmr = 1.0 / 3.0e-4
      c1  = 300.0
      c2  = 0.5
!
!
!--------calculate c0 and cmr using lc at previous step-----------------
!
      do k=1,km
        do i=1,im
          tem   = (prsl(i,k)*0.01)
          iw(i,k)    = 0.0
          wmin(i,k)  = 1.0e-5 * tem
          wmini(i,k) = 1.0e-5 * tem       ! testing for ras
        enddo
      enddo
      do i=1,im
        iwl1(i)    = 0
        precrl1(i) = d00
        precsl1(i) = d00
        comput(i)  = .false.
        rn(i)      = d00
        sn(i)      = d00
        sr(i)      = d00
        ccr(i)     = d00
      enddo
!------------select columns where rain can be produced--------------
      do k=1, km-1
        do i=1,im
          tem = min(wmin(i,k), wmini(i,k))
          if (cwm(i,k) .gt. tem) comput(i) = .true.
        enddo
      enddo
      ihpr = 0
      do i=1,im
        if (comput(i)) then
           ihpr      = ihpr + 1
           ipr(ihpr) = i
        endif
      enddo
!***********************************************************************
!-----------------begining of precipitation calculation-----------------
!***********************************************************************

      do k=km,1,-1
        do n=1,ihpr
          precrl(n) = precrl1(n)
          precsl(n) = precsl1(n)
          err  (n)  = d00
          ers  (n)  = d00
          iwl  (n)  = 0

          i         = ipr(n)
          tt(n)     = t(i,k)
          qq(n)     = q(i,k)
          ww(n)     = cwm(i,k)
          wmink(n)  = wmin(i,k)
          pres(n)   = h1000 * prsl(i,k)

          precrk = max(cons_0,    precrl1(n))
          precsk = max(cons_0,    precsl1(n))
          wwn    = max(ww(n), climit)

          if (wwn .gt. climit .or. (precrk+precsk) .gt. d00) then
            comput(n) = .true.
          else
            comput(n) = .false.
          endif
        enddo

        do n=1,ihpr
          if (comput(n)) then
            i = ipr(n)
            conde(n)  = (h1000*dt/g) * del(i,k)
            condt(n)  = conde(n) * rdt
            rconde(n) = h1 / conde(n)
            qk        = max(epsq,  qq(n))
            tmt0(n)   = tt(n) - 273.16
            wwn       = max(ww(n), climit)


!  the global qsat computation is done in pa
            pres1   = pres(n) 
            qw      = min(pres1, fpvs(tt(n)))
            qw      = eps * qw / (pres1 + epsm1 * qw)
            qw      = max(qw,epsq)
            qi   = qw
            qint = qw


!-------------------ice-water id number iw------------------------------
            if(tmt0(n).lt.-15.) then
               fi = qk - u00k(i,k)*qi
               if(fi.gt.d00.or.wwn.gt.climit) then
                  iwl(n) = 1
               else
                  iwl(n) = 0
               endif
            elseif (tmt0(n).ge.0.) then
               iwl(n) = 0
            else
              iwl(n) = 0
              if(iwl1(n).eq.1.and.wwn.gt.climit) iwl(n)=1
            endif

!----------------the satuation specific humidity------------------------
            fiw   = float(iwl(n))
            qc    = (h1-fiw)*qint + fiw*qi
!----------------the relative humidity----------------------------------
            if(qc .le. 1.0e-10) then
               rq(n) = d00
            else
               rq(n) = qk / qc
            endif
!----------------cloud cover ratio ccr----------------------------------
            if(rq(n).lt.u00k(i,k)) then
                   ccr(n)=d00
            elseif(rq(n).ge.us) then
                   ccr(n)=us
            else
                 rqkll=min(us,rq(n))
                 ccr(n)= h1-sqrt((us-rqkll)/(us-u00k(i,k)))
            endif
          endif
        enddo
!-------------------ice-water id number iwl------------------------------
!
!---   precipitation production --  auto conversion and accretion
!
        do n=1,ihpr
          if (comput(n) .and. ccr(n) .gt. 0.0) then
            wws    = ww(n)
            cwmk   = max(cons_0, wws)
            if (iwl(n) .eq. 1) then                 !  ice phase
               amaxcm = max(cons_0, cwmk - wmini(ipr(n),k))
               expf      = dt * exp(0.025*tmt0(n))
               psaut     = min(cwmk, 4.0e-4*expf*amaxcm)
               ww(n)     = ww(n) - psaut
               cwmk      = max(cons_0, ww(n))
               psaci     = min(cwmk, aa2*expf*precsl1(n)*cwmk)
               ww(n)     = ww(n) - psaci
               precsl(n) = precsl(n) + (wws - ww(n)) * condt(n)
               pswi = (wws - ww(n)) * condt(n) * rconde(n) !Prajeesh: pswi is water -> ice
               tt(n) = tt(n) + dtcp * (eliw*pswi) 

            else                                    !  liquid water

!          for using sundqvist precip formulation of rain

               amaxcm    = cwmk
               tem1      = precsl1(n) + precrl1(n)
               tem2      = min(max(cons_0, 268.0-tt(n)), cons_20)
               tem       = (1.0+c1*sqrt(tem1*rdt)) * (1+c2*sqrt(tem2))
               tem2      = amaxcm * cmr * tem / max(ccr(n),cons_p01)
               tem2      = min(cons_50, tem2*tem2)
               praut     = c00  * tem * amaxcm * (1.0-exp(-tem2))
               praut     = min(praut, cwmk)
               ww(n)     = ww(n) - praut

!          below is for zhao's precip formulation (water)

               precrl(n) = precrl(n) + (wws - ww(n)) * condt(n)
            endif
          endif
        enddo

!-----evaporation of precipitation-------------------------
!**** err & ers positive--->evaporation-- negtive--->condensation

        do n=1,ihpr
          if (comput(n)) then
            i      = ipr(n)
            qk     = max(epsq,  qq(n))
            tmt0k  = max(cons_m30, tmt0(n))
            precrk = max(cons_0,    precrl(n))
            precsk = max(cons_0,    precsl(n))
            amaxrq = max(cons_0,    u00k(i,k)-rq(n)) * conde(n)
!----------------------------------------------------------------------
! increase the evaporation for strong/light prec
!----------------------------------------------------------------------
            ppr    = ke * amaxrq * sqrt(precrk)
            if (tmt0(n) .ge. 0.) then
              pps = 0.
            else
              pps = (crs1+crs2*tmt0k) * amaxrq * precsk / u00k(i,k)
            end if
!---------------correct if over-evapo./cond. occurs--------------------
            erk=precrk+precsk
            if(rq(n).ge.1.0e-10)  erk = amaxrq * qk * rdt / rq(n)
            if (ppr+pps .gt. abs(erk)) then
               rprs   = erk / (precrk+precsk)
               ppr    = precrk * rprs
               pps    = precsk * rprs
            endif
            ppr       = min(ppr, precrk)
            pps       = min(pps, precsk)
            err(n)    = ppr * rconde(n)
            ers(n)    = pps * rconde(n)
            precrl(n) = precrl(n) - ppr
            precsl(n) = precsl(n) - pps
          endif
        enddo
!--------------------melting of the snow--------------------------------
        do n=1,ihpr
          if (comput(n)) then
            if (tmt0(n) .gt. 0.) then
               amaxps = max(cons_0,    precsl(n))
               psm1   = csm1 * tmt0(n) * tmt0(n) * amaxps
               psm2   = cws * cr * max(cons_0, ww(n)) * amaxps
               ppr    = (psm1 + psm2) * conde(n)
               if (ppr .gt. amaxps) then
                 ppr  = amaxps
                 psm1 = amaxps * rconde(n)
               endif
               precrl(n) = precrl(n) + ppr
               precsl(n) = precsl(n) - ppr
               psm1 = ppr * rconde(n) !Prajeesh: psm1 is ice -> water
            else
               psm1 = d00
            endif

!---------------update t and q------------------------------------------
            tt(n) = tt(n) - dtcp * (elwv*err(n)+eliv*ers(n)+eliw*psm1) !Prajeesh
!            tt(n) = tt(n) - dtcp * (elwv*err(n)+elwv*ers(n))
            qq(n) = qq(n) + dt * (err(n)+ers(n))
          endif
        enddo

        do n=1,ihpr
          iwl1(n)    = iwl(n)
          precrl1(n) = max(cons_0, precrl(n))
          precsl1(n) = max(cons_0, precsl(n))
          i          = ipr(n)
          t(i,k)     = tt(n)
          q(i,k)     = qq(n)
          cwm(i,k)   = ww(n)
          iw(i,k)    = iwl(n)
        enddo

!  move water from vapor to liquid should the liquid amount be negative

        do i = 1, im
          if (cwm(i,k) < 0.) then
            tem      = q(i,k) + cwm(i,k)
            if (tem >= 0.0) then
              q(i,k)   = tem
              t(i,k)   = t(i,k) - elwv * rcp * cwm(i,k)
              cwm(i,k) = 0.
            elseif (q(i,k) > 0.0) then
              cwm(i,k) = tem
              t(i,k)   = t(i,k) + elwv * rcp * q(i,k)
              q(i,k)   = 0.0
            endif
          endif
        enddo
      enddo                               ! k loop ends here!
!**********************************************************************
!-----------------------end of precipitation processes-----------------
!**********************************************************************

      do n=1,ihpr
        i = ipr(n)
        rn(i) = precrl1(n) * rrow  ! precip at surface
        sn(i) = precsl1(n) * rrow  ! precip at surface

!----sr=1 if sfc prec is rain ; ----sr=-1 if sfc prec is snow
!----sr=0 for both of them or no sfc prec

        rid = 0.
        sid = 0.
        if (precrl1(n) .ge. 1.e-13) rid = 1.
        if (precsl1(n) .ge. 1.e-13) sid = -1.
        sr(i) = rid + sid  ! sr=1 --> rain, sr=-1 -->snow, sr=0 -->both
      enddo

      return
      end
