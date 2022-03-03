module surface_mod
  use machine , only : kind_phys
  use funcphys, only : fpvs
  use physcons, only : grav => con_g, sbc => con_sbc, &
               cp => con_cp, hfus => con_hfus, &
               rvrdm1 => con_fvirt, rd => con_rd, &
               eps => con_eps, epsm1 => con_epsm1
  implicit none
  private
  public sfc_diff_coe 
  contains
 
  subroutine sfc_diff_coe(im,ps,u1,v1,t1,q1, &
              tskin,rcl,prsl1, &
              prslki,lmask,ddvel,z0rl, &
              cm,ch,rb,stress,fm,fh, &
              ustar,wind,fm10,fh2,isocean1)

  implicit none

  integer, intent(in):: im
  real(kind=kind_phys), dimension(im), intent(in) :: ps,u1,v1,t1,q1,tskin,rcl, &
                                                     prsl1,prslki,ddvel

  real(kind=kind_phys), dimension(im), intent(inout) :: z0rl
  logical, dimension(im), intent(in) :: lmask

  real(kind=kind_phys), dimension(im), intent(out) :: cm, ch, rb, stress, &
                                                      fm, fh, ustar, &
                                                      wind, & 
                                                      fm10, fh2
  logical, optional, intent(in) :: isocean1
  ! compatibilty with MOM coupler surface flux routines:
  ! (sfc_diff = mom)
  ! cm = drag_m
  ! ch = drag_t
  ! rb = rich in subroutine mo_drag_cpl_1d
  ! fm = vonkarm/sqrt(cm)
  ! fh = vonkarm*sqrt(cm)/ch
  ! ustar = u_star
  ! stress = sqrt(ustar)
  ! wind = speed
  ! fm10 = not available; this is used only for calc op vars u10m and v10m 
  ! fh2 = not available: this is used only for calc op vars t2m and q2m
  ! z0rl = rough_mom = rough_heat

  ! locals

  integer :: k,i

  real(kind=kind_phys), dimension(im) :: dtv,hl1,hl12,hlinf,ph,ph2,pm,pm10, &
                                        psurf, q0, rat, theta1, thv1, &
                                        tv1, tvs, xrcl, z0, z0max, z1, &
                                        ztmax, ps1, qs1

  real(kind=kind_phys) :: aa, aa0, &
                         adtv,&
                         bb, bb0,&
                          cc, &
                          fms, fhs, hl0, hl0inf, &
                         hl110, hlt, hltinf,olinf, &
                         restar

  real (kind=kind_phys), parameter :: charnock=.014,ca=.4 !c ca is the von karman constant
  real (kind=kind_phys), parameter :: alpha=5.,a0=-3.975,a1=12.32,b1=-7.755, &
                                     b2=6.041,a0p=-7.941,a1p=24.75,b1p=-8.705, & 
                                     b2p=7.899,vis=1.4e-5,aa1=-1.076,bb1=.7045,&
                                     cc1=-.05808,bb2=-.1954,cc2=.009999, &
                                     rnu=1.51e-5,arnu=.135*rnu
  logical :: isocean

  ! initialize variables. all units are supposedly m.k.s. unless specified
  ! psurf is in pascals
  ! wind is wind speed, theta1 is adiabatic surface temp from level 1
  ! surface roughness length is converted to m from cm

  isocean=.false.

  if(present(isocean1))isocean=isocean1  

  where(lmask)
    psurf = 1000. * ps
    ps1 = 1000. * prsl1
    wind = sqrt(rcl) * sqrt(u1 * u1 + v1 * v1) &
               + max(0.0, min(ddvel, 30.0))
    wind = max(wind,1.)
    q0 = max(q1,1.e-8)
    theta1 = t1 * prslki
    tv1 = t1 * (1. + rvrdm1 * q0)
    thv1 = theta1 * (1. + rvrdm1 * q0)
    tvs = tskin * (1. + rvrdm1 * q0)
    qs1 = fpvs(t1)
    qs1 = eps * qs1 / (ps1 + epsm1 * qs1)
    qs1 = max(qs1, 1.e-8)
    q0 = min(qs1,q0)
    z0 = .01 * z0rl
    z1 = -rd * tv1 * log(ps1/psurf) / grav
  endwhere

  ! compute stability dependent exchange coefficients
  ! this portion of the code is presently suppressed

  do i=1,im
    if(lmask(i)) then
      z0max(i) = min(z0(i),1. * z1(i))
      ztmax(i) = z0max(i)
      if(isocean) then
        ustar(i) = sqrt(grav * z0(i) / charnock)
        ! compute stability indices (rb and hlinf)
        restar = ustar(i) * z0max(i) / vis
        restar = max(restar,.000001)
        ! rat taken from zeng, zhao and dickinson 1997
        rat(i) = 2.67 * restar ** .25 - 2.57
        rat(i) = min(rat(i),7.)
        ztmax(i) = z0max(i) * exp(-rat(i))
      endif
      dtv(i) = thv1(i) - tvs(i)
      adtv = abs(dtv(i))
      adtv = max(adtv,.001)
      dtv(i) = sign(1.,dtv(i)) * adtv
      rb(i) = grav * dtv(i) * z1(i) / (.5 * (thv1(i) + tvs(i)) &
                     * wind(i) * wind(i))
      rb(i) = max(rb(i),-5000.)
      fm(i) = log((z0max(i)+z1(i)) / z0max(i))
      fh(i) = log((ztmax(i)+z1(i)) / ztmax(i))
      hlinf(i) = rb(i) * fm(i) * fm(i) / fh(i)
      fm10(i) = log((z0max(i)+10.) / z0max(i))
      fh2(i) = log((ztmax(i)+2.) / ztmax(i))
      if(dtv(i).ge.0.) then
        hl1(i) = hlinf(i)
      endif
      if(dtv(i).ge.0..and.hlinf(i).gt..25) then
        hl0inf = z0max(i) * hlinf(i) / z1(i)
        hltinf = ztmax(i) * hlinf(i) / z1(i)
        aa = sqrt(1. + 4. * alpha * hlinf(i))
        aa0 = sqrt(1. + 4. * alpha * hl0inf)
        bb = aa
        bb0 = sqrt(1. + 4. * alpha * hltinf)
        pm(i) = aa0 - aa + log((aa + 1.) / (aa0 + 1.))
        ph(i) = bb0 - bb + log((bb + 1.) / (bb0 + 1.))
        fms = fm(i) - pm(i)
        fhs = fh(i) - ph(i)
        hl1(i) = fms * fms * rb(i) / fhs
      endif
      if(dtv(i).ge.0.) then
        hl0 = z0max(i) * hl1(i) / z1(i)
        hlt = ztmax(i) * hl1(i) / z1(i)
        aa = sqrt(1. + 4. * alpha * hl1(i))
        aa0 = sqrt(1. + 4. * alpha * hl0)
        bb = aa
        bb0 = sqrt(1. + 4. * alpha * hlt)
        pm(i) = aa0 - aa + log((aa + 1.) / (aa0 + 1.))
        ph(i) = bb0 - bb + log((bb + 1.) / (bb0 + 1.))
        hl110 = hl1(i) * 10. / z1(i)
        aa = sqrt(1. + 4. * alpha * hl110)
        pm10(i) = aa0 - aa + log((aa + 1.) / (aa0 + 1.))
        hl12(i) = hl1(i) * 2. / z1(i)
        bb = sqrt(1. + 4. * alpha * hl12(i))
        ph2(i) = bb0 - bb + log((bb + 1.) / (bb0 + 1.))
      endif
  !! unstable case
  !! check for unphysical obukhov length
      if(dtv(i).lt.0.) then
        olinf = z1(i) / hlinf(i)
        if(abs(olinf).le.50. * z0max(i)) then
          hlinf(i) = -z1(i) / (50. * z0max(i))
        endif
      endif
  !! get pm and ph

      if(dtv(i).lt.0..and.hlinf(i).ge.-.5) then
        hl1(i) = hlinf(i)
        pm(i) = (a0 + a1 * hl1(i)) * hl1(i) &
            / (1. + b1 * hl1(i) + b2 * hl1(i) * hl1(i))
        ph(i) = (a0p + a1p * hl1(i)) * hl1(i) &
            / (1. + b1p * hl1(i) + b2p * hl1(i) * hl1(i))
        hl110 = hl1(i) * 10. / z1(i)
        pm10(i) = (a0 + a1 * hl110) * hl110 &
            / (1. + b1 * hl110 + b2 * hl110 * hl110)
        hl12(i) = hl1(i) * 2. / z1(i)
        ph2(i) = (a0p + a1p * hl12(i)) * hl12(i) &
            / (1. + b1p * hl12(i) + b2p * hl12(i) * hl12(i))
      endif
      if(dtv(i).lt.0.and.hlinf(i).lt.-.5) then
        hl1(i) = -hlinf(i)
        pm(i) = log(hl1(i)) + 2. * hl1(i) ** (-.25) - .8776
        ph(i) = log(hl1(i)) + .5 * hl1(i) ** (-.5) + 1.386
        hl110 = hl1(i) * 10. / z1(i)
        pm10(i) = log(hl110) + 2. * hl110 ** (-.25) - .8776
        hl12(i) = hl1(i) * 2. / z1(i)
        ph2(i) = log(hl12(i)) + .5 * hl12(i) ** (-.5) + 1.386
      endif

  !! finish the exchange coefficient computation to provide fm and fh

      fm(i) = fm(i) - pm(i)
      fh(i) = fh(i) - ph(i)
      fm10(i) = fm10(i) - pm10(i)
      fh2(i) = fh2(i) - ph2(i)
      cm(i) = ca * ca / (fm(i) * fm(i))
      ch(i) = ca * ca / (fm(i) * fh(i))
      stress(i) = cm(i) * wind(i) * wind(i)
      ustar(i) = sqrt(stress(i))

  !! update z0 over ocean

      if(isocean) then
        z0(i) = (charnock / grav) * ustar(i) ** 2
        z0(i) = min(z0(i),.1)
        z0(i) = max(z0(i),1.e-7)
        z0rl(i) = 100. * z0(i)
      endif
    endif
  enddo
  return
  end subroutine sfc_diff_coe
end module surface_mod
