      subroutine hyb2press(njeff,nsize_ar, pgr,prsi,prsl,prsik,prslk)
 
      use machine , only : kind_phys
 
 
      use resol_def
      use coordinate_def
      use physcons, rk => con_rocp
      implicit none

 
      real (kind=kind_phys), parameter :: rk1 = rk + 1.0, rkr = 1.0/rk
     &,                                   r100=100.0, pt01=0.01
      integer njeff,nsize_ar
      real(kind=kind_phys) prsl(nsize_ar,levs), prslk(nsize_ar,levs)
      real(kind=kind_phys) prsi(nsize_ar,levs+1), prsik(nsize_ar,levs+1)
      real(kind=kind_phys) pgr(nsize_ar)
      real(kind=kind_phys) tem
 
      integer iq,ilat,me
      integer i,k
 
      do k=1,levp1
        do i=1,njeff
          prsi(i,levs+2-k) = ak5(k) + bk5(k)*pgr(i) ! prsi are now pressures
        enddo
      enddo

      do i=1,njeff
        prsik(i,1) = (prsi(i,1)*pt01) ** rk
      enddo

      do k=1,levs
        do i=1,njeff
          prsik(i,k+1) = (prsi(i,k+1)*pt01) ** rk
          tem          = rk1 * (prsi(i,k) - prsi(i,k+1))
          prslk(i,k)   = (prsik(i,k)*prsi(i,k)-prsik(i,k+1)*prsi(i,k+1))
     &                 / tem
          prsl(i,k)    = r100 * prslk(i,k) ** rkr
        enddo
      enddo
 
      return
      end
