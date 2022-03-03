!****f* SUBROUTINE/GLOOPA
! FUNCTION
! Calculate Spectral Dynamics.
!
      subroutine gloopa
     x    (deltim,trie_ls,trio_ls,
     x     ls_node,ls_nodes,max_ls_nodes,
     x     lats_nodes_a,global_lats_a,
     x     lonsperlat,
     x     epse,epso,epsedn,epsodn,
     x     snnp1ev,snnp1od,ndexev,ndexod,
     x     plnev_a,plnod_a,pddev_a,pddod_a,plnew_a,plnow_a,
     x     global_times_a,kdt)

      use resol_def
      use layout1
      use gg_def
      use vert_def
      use date_def, only: spdmax
      use namelist_def
      use mpi_def
      use physcons, rerth => con_rerth
      implicit none

      real(kind=kind_evod), intent(in) :: deltim
      real(kind=kind_evod), intent(inout) :: 
     &                      trie_ls(len_trie_ls,2,11*levs+3*levh+6), 
     &                      trio_ls(len_trio_ls,2,11*levs+3*levh+6)

      integer, intent(in) :: ls_node(ls_dim,3)

!ls_node(1,1) ... ls_node(ls_max_node,1) : values of L
!ls_node(1,2) ... ls_node(ls_max_node,2) : values of jbasev
!ls_node(1,3) ... ls_node(ls_max_node,3) : values of jbasod

      integer, intent(in) :: ls_nodes(ls_dim,nodes)
      integer, intent(in) :: max_ls_nodes(nodes)
      integer, intent(in) :: lats_nodes_a(nodes)
      integer, intent(in) :: global_lats_a(latg)
      integer, intent(in) :: lonsperlat(latg)
      real(kind=kind_evod), intent(in) :: epse(len_trie_ls),
     &                                    epso(len_trio_ls),
     &                                    epsedn(len_trie_ls),
     &                                    epsodn(len_trio_ls),
     &                                    snnp1ev(len_trie_ls),
     &                                    snnp1od(len_trio_ls)

      integer, intent(in) :: ndexev(len_trie_ls)
      integer, intent(in) :: ndexod(len_trio_ls)
      real(kind=kind_evod), intent(in) :: plnev_a(len_trie_ls,latg2),
     &                                    plnod_a(len_trio_ls,latg2),
     &                                    pddev_a(len_trie_ls,latg2),
     &                                    pddod_a(len_trio_ls,latg2),
     &                                    plnew_a(len_trie_ls,latg2),
     &                                    plnow_a(len_trio_ls,latg2)
      real(kind=kind_evod), intent(out) :: global_times_a(latg,nodes)
      integer, intent(in) :: kdt

!Local Variables
      real (kind=8) :: rtc ,timer1,timer2
      integer dimg
      real(kind=kind_evod) for_gr_a_1(lonfx*lots,lats_dim_a)
      real(kind=kind_evod) dyn_gr_a_1(lonfx*lotd,lats_dim_a)
      real(kind=kind_evod) bak_gr_a_1(lonfx*lota,lats_dim_a)

      real(kind=kind_evod) for_gr_a_2(lonfx*lots,lats_dim_a)
      real(kind=kind_evod) dyn_gr_a_2(lonfx*lotd,lats_dim_a)
      real(kind=kind_evod) bak_gr_a_2(lonfx*lota,lats_dim_a)

!saved vertical advection of tracers from time step n-1
      real(kind=kind_evod),allocatable, save:: szdrdt(:,:)
      logical,save :: zfirst=.true.

      integer              i,ierr,iter,j,k,kap,kar,kat,kau,kav,kdrlam
      integer              kdrphi,kdtlam,kdtphi,kdulam,kduphi,kdvlam
      integer              kdvphi,ksd,ksplam,kspphi,ksq,ksr,kst
      integer              ksu,ksv,ksz,l,lan,lan0,lat,lmax,locl
      integer              lon_dim,lons_lat,n,node,nvcn,ii

      integer              init
      integer              ibmsign
      integer              ipt_ls

      real(kind=kind_evod) rone
      real(kind=kind_evod) scale_ibm

      real(kind=kind_evod) xvcn

      integer              iter_max

      real(kind=kind_evod) ,allocatable :: spdlat(:,:)

      real(kind=kind_evod) spdmax_node (levs)
      real(kind=kind_mpi) spdmax_nodem (levs)
      real(kind=kind_evod) spdmax_nodes(levs,nodes)
      real(kind=kind_mpi) spdmax_nodesm(levs,nodes)

      real(kind=kind_evod) reall
      real(kind=kind_evod) rlcs2(jcap1)

      integer              indlsev,jbasev
      integer              indlsod,jbasod
      include 'function2'

      integer njeff,istrt,lon,iblk
      integer     ngptcd
      parameter ( ngptcd = 12 )
      real(kind=kind_evod) cons0,cons2     !constant
      logical lslag
      
      for_gr_a_1(:,:)=0.0 
      dyn_gr_a_1(:,:)=0.0
      bak_gr_a_1(:,:)=0.0

      for_gr_a_2(:,:)=0.0
      dyn_gr_a_2(:,:)=0.0
      bak_gr_a_2(:,:)=0.0

      i=0;ierr=0;iter=0;j=0;k=0;kap=0;kar=0;kat=0;kau=0;kav=0;kdrlam=0
      kdrphi=0;kdtlam=0;kdtphi=0;kdulam=0;kduphi=0;kdvlam=0
      kdvphi=0;ksd=0;ksplam=0;kspphi=0;ksq=0;ksr=0;kst=0
      ksu=0;ksv=0;ksz=0;l=0;lan=0;lan0=0;lat=0;lmax=0;locl=0
      lon_dim=0;lons_lat=0;n=0;node=0;nvcn=0;ii=0

      init = 0
      ibmsign = 0
      ipt_ls = 0

      rone = 0.0
      scale_ibm = 0.0
      xvcn = 0.0 

      iter_max=0

      spdmax_node (:) = 0.0
      spdmax_nodem (:) = 0.0
      spdmax_nodes(:,:) = 0.0
      spdmax_nodesm(:,:) = 0.0
      reall = 0.0
      rlcs2(:) = 0.0
      njeff=0
      istrt=0
      lon=0
      iblk=0
      

!xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
!................................................................
!syn(1, 0*levs+0*levh+1, lan)  ze
!syn(1, 1*levs+0*levh+1, lan)  di
!syn(1, 2*levs+0*levh+1, lan)  te
!syn(1, 3*levs+0*levh+1, lan)  rq
!syn(1, 3*levs+1*levh+1, lan)  q
!syn(1, 3*levs+1*levh+2, lan)  dpdlam
!syn(1, 3*levs+1*levh+3, lan)  dpdphi
!syn(1, 3*levs+1*levh+4, lan)  uln
!syn(1, 4*levs+1*levh+4, lan)  vln
!..............................................................
!dyn(1, 0*levs+0*levh+1, lan)  d(t)/d(phi)
!dyn(1, 1*levs+0*levh+1, lan)  d(rq)/d(phi)
!dyn(1, 1*levs+1*levh+1, lan)  d(t)/d(lam)
!dyn(1, 2*levs+1*levh+1, lan)  d(rq)/d(lam)
!dyn(1, 2*levs+2*levh+1, lan)  d(u)/d(lam)
!dyn(1, 3*levs+2*levh+1, lan)  d(v)/d(lam)
!dyn(1, 4*levs+2*levh+1, lan)  d(u)/d(phi)
!dyn(1, 5*levs+2*levh+1, lan)  d(v)/d(phi)
!..............................................................
!anl(1, 0*levs+0*levh+1, lan)  w     dudt
!anl(1, 1*levs+0*levh+1, lan)  x     dvdt
!anl(1, 2*levs+0*levh+1, lan)  y     dtdt
!anl(1, 3*levs+0*levh+1, lan)  rt    drdt
!anl(1, 3*levs+1*levh+1, lan)  z     dqdt
!................................................................


!      if(zfirst) then
      if(.not.allocated(szdrdt)) then
        allocate (szdrdt(lonfx*levh,lats_dim_a))
        szdrdt=0.
      endif
      szdrdt=0.

      ksz     =0*levs+0*levh+1
      ksd     =1*levs+0*levh+1
      kst     =2*levs+0*levh+1
      ksr     =3*levs+0*levh+1
      ksq     =3*levs+1*levh+1
      ksplam  =3*levs+1*levh+2
      kspphi  =3*levs+1*levh+3
      ksu     =3*levs+1*levh+4
      ksv     =4*levs+1*levh+4

      kdtphi  =0*levs+0*levh+1
      kdrphi  =1*levs+0*levh+1
      kdtlam  =1*levs+1*levh+1
      kdrlam  =2*levs+1*levh+1
      kdulam  =2*levs+2*levh+1
      kdvlam  =3*levs+2*levh+1
      kduphi  =4*levs+2*levh+1
      kdvphi  =5*levs+2*levh+1

      kau     =0*levs+0*levh+1
      kav     =1*levs+0*levh+1
      kat     =2*levs+0*levh+1
      kar     =3*levs+0*levh+1
      kap     =3*levs+1*levh+1

      cons0 = 0.d0     !constant
      cons2 = 2.d0     !constant
      lslag=.false.

      iter_max=0
      do lan=1,lats_node_a
         lat = global_lats_a(ipt_lats_node_a-1+lan)
         lons_lat = lonsperlat(lat)
         iter_max = max ( iter_max , (lons_lat+ngptcd-1)/ngptcd )
      enddo

      allocate ( spdlat(levs,iter_max ) )

! ................................................................
!
! Calc dpsurf/dphi (P_dphi) , dpsurf/dlam (P_dlam) in spectral space from psurf (P_q) [delnpe, delnpo]
!
      call delnpe(trie_ls(1,1,P_q   ),
     x            trio_ls(1,1,P_dphi),
     x            trie_ls(1,1,P_dlam),
     x            epse,epso,ls_node)

      call delnpo(trio_ls(1,1,P_q   ),
     x            trie_ls(1,1,P_dphi),
     x            trio_ls(1,1,P_dlam),
     x            epse,epso,ls_node)


! Calc U (p_uln) and V (p_vln) in spectral space from Div (p_di) and Vort (p_ze) [dezouv dozeuv]
!

!$omp parallel do shared(trie_ls,trio_ls)
!$omp+shared(epsedn,epsodn,snnp1ev,snnp1od,ls_node)
!$omp+private(k)
      do k=1,levs
         call dezouv(trie_ls(1,1,P_di +k-1), trio_ls(1,1,P_ze +k-1),
     x               trie_ls(1,1,P_uln+k-1), trio_ls(1,1,P_vln+k-1),
     x               epsedn,epsodn,snnp1ev,snnp1od,ls_node)

         call dozeuv(trio_ls(1,1,P_di +k-1), trie_ls(1,1,P_ze +k-1),
     x               trio_ls(1,1,P_uln+k-1), trie_ls(1,1,P_vln+k-1),
     x               epsedn,epsodn,snnp1ev,snnp1od,ls_node)
      enddo

      dimg=0

! Calc fourier coef (for_gr_a_1) from spectral (trie_ls, trio_ls) for variables
! Vort (p_ze), Div (p_di), temp (p_te), tracers (p_rq), psurf (p_q), (p_dlam),
! (p_dhpi), U (p_uln), V (p_vln). [sumflna]
!

      call sumflna(trie_ls(1,1,P_ze),
     x            trio_ls(1,1,P_ze),
     x            lat1s_a,
     x            plnev_a,plnod_a,
     x            lots,ls_node,latg2,
     x            lslag,lats_dim_a,lots,
     x            for_gr_a_1,
     x            ls_nodes,max_ls_nodes,
     x            lats_nodes_a,global_lats_a,
     x            lats_node_a,ipt_lats_node_a,lon_dims_a,dimg,
     x            lonsperlat,lonfx,latg)

! Calc (phi) meridional deravatives in fourier space (dyn_gr_a_1) of temp
! (kdtphi), tracers (kdrphi). [sumdera]
!

      call sumdera(trie_ls(1,1,P_te),
     x             trio_ls(1,1,P_te),
     x             lat1s_a,
     x             pddev_a,pddod_a,
     x             levs+levh,ls_node,latg2,
     x             lslag,lats_dim_a,lotd,
     x             dyn_gr_a_1,
     x             ls_nodes,max_ls_nodes,
     x             lats_nodes_a,global_lats_a,
     x             lats_node_a,ipt_lats_node_a,lon_dims_a,dimg,
     x             lonsperlat,lonfx,latg)

      do k=1,levs
         spdmax_node(k) = cons0     !constant
      enddo

      do lan=1,lats_node_a   !sela begin lan loop 1
 
       timer1=rtc()

         lat = global_lats_a(ipt_lats_node_a-1+lan)

         lon_dim = lon_dims_a(lan)
         lons_lat = lonsperlat(lat)

!calculate t rq u v zonal derivs. by multiplication with i*l
!note rlcs2=rcs2*L/rerth

         lmax = min(jcap,lons_lat/2)

         ipt_ls=min(lat,latg-lat+1)
 
         do i=1,lmax+1
            if ( ipt_ls .ge. lat1s_a(i-1) ) then
               reall=i-1
               rlcs2(i)=reall*rcs2_a(ipt_ls)/rerth
            else
               rlcs2(i)=cons0     !constant
            endif
         enddo

!$omp parallel do private(k,i)
         do k=1,levs
            do i=1,lmax+1
! Calc (lam) zonal deravatives in fourier space (dyn_gr_a_1) of temp (kdtlam),
! tracers (kdrlam), U (kdulam), V (kdvlam).
!           d(t)/d(lam)
               dyn_gr_a_1(2*i-1+(kdtlam-2+k)*lon_dim,lan)=
     x        -for_gr_a_1(2*i  +(kst   -2+k)*lon_dim,lan)*rlcs2(i)
               dyn_gr_a_1(2*i  +(kdtlam-2+k)*lon_dim,lan)=
     x         for_gr_a_1(2*i-1+(kst   -2+k)*lon_dim,lan)*rlcs2(i)

!           d(u)/d(lam)
               dyn_gr_a_1(2*i-1+(kdulam-2+k)*lon_dim,lan)=
     x        -for_gr_a_1(2*i  +(ksu   -2+k)*lon_dim,lan)*rlcs2(i)
               dyn_gr_a_1(2*i  +(kdulam-2+k)*lon_dim,lan)=
     x         for_gr_a_1(2*i-1+(ksu   -2+k)*lon_dim,lan)*rlcs2(i)

!           d(v)/d(lam)
               dyn_gr_a_1(2*i-1+(kdvlam-2+k)*lon_dim,lan)=
     x        -for_gr_a_1(2*i  +(ksv   -2+k)*lon_dim,lan)*rlcs2(i)
               dyn_gr_a_1(2*i  +(kdvlam-2+k)*lon_dim,lan)=
     x         for_gr_a_1(2*i-1+(ksv   -2+k)*lon_dim,lan)*rlcs2(i)

            enddo
         end do

!$omp parallel do private(k,i)
         do k=1,levh
            do i=1,lmax+1

!           d(rq)/d(lam)
               dyn_gr_a_1(2*i-1+(kdrlam-2+k)*lon_dim,lan)=
     x        -for_gr_a_1(2*i  +(ksr   -2+k)*lon_dim,lan)*rlcs2(i)
               dyn_gr_a_1(2*i  +(kdrlam-2+k)*lon_dim,lan)=
     x         for_gr_a_1(2*i-1+(ksr   -2+k)*lon_dim,lan)*rlcs2(i)

            enddo
         enddo
!
! Fourier to Grid of for_gr_a_1 and dyn_gr_a_1. Output is in for_gr_a_2 and
! dyn_gr_a_2 respectively. [four2grid_thread]
!
         CALL FOUR2GRID_thread(for_gr_a_1(1,lan),for_gr_a_2(1,lan),
     &                  lon_dim,lons_lat,lonfx,5*levs+levh+3,lan,me)

         CALL FOUR2GRID_thread(dyn_gr_a_1(1,lan),dyn_gr_a_2(1,lan),
     &                  lon_dim,lons_lat,lonfx,4*levs+2*levh,lan,me)

          timer2=rtc()
          global_times_a(lat,me+1)=timer2-timer1

 
      enddo !sela fin lan loop 1

      do lan=1,lats_node_a   !sela begin lan loop 2
 
       timer1=rtc()

         lat = global_lats_a(ipt_lats_node_a-1+lan)

         lon_dim = lon_dims_a(lan)
         lons_lat = lonsperlat(lat)

! Calc (phi) meridional deravatives in grid space of U (kduphi) and V (kdvphi).
! {Now and only now dyn_gr_a_2 contain all meridional and zonal deravatives of
! temp, tracers, U, V}
!
!  cos*d(u)/d(theta)= d(v)/d(lam)-a*zeta*cos**2
!  cos*d(v)/d(theta)=-d(u)/d(lam)+a*divr*cos**2
!
!$omp parallel do private(k,j)

      do k=1,levs
         do j=1,lons_lat

            dyn_gr_a_2(j+(kduphi-2+k)*lon_dim,lan)=
     x      dyn_gr_a_2(j+(kdvlam-2+k)*lon_dim,lan)-
     x      for_gr_a_2(j+(ksz   -2+k)*lon_dim,lan)

            dyn_gr_a_2(j+(kdvphi-2+k)*lon_dim,lan)=
     x     -dyn_gr_a_2(j+(kdulam-2+k)*lon_dim,lan)+
     x      for_gr_a_2(j+(ksd   -2+k)*lon_dim,lan)

           if( .not. gen_coord_hybrid ) then			! hmhj
            for_gr_a_2(j+(kst-2+k)*lon_dim,lan)=
     x      for_gr_a_2(j+(kst-2+k)*lon_dim,lan)-tov(k)
           endif						! hmhj

         enddo
      enddo


! Calc tendencies in grid space (bak_gr_a_2) of psurf (kap), temp (kat), tracers
! (kar), U (kau), V (kav). [gfidi_hyb]
!

      if(hybrid.or.gen_coord_hybrid) then !-----  hybrid ----------- ! hmhj

!$omp parallel do schedule(dynamic,1) private(lon)
!$omp+private(istrt,njeff,iblk)
!$omp+private(nvcn,xvcn)
      do lon=1,lons_lat,ngptcd

         njeff=min(ngptcd,lons_lat-lon+1)
         istrt=lon
         if (ngptcd.ne.1) then
           iblk=lon/ngptcd+1
         else
           iblk=lon
         endif

         if( gen_coord_hybrid ) then					! hmhj
           if( thermodyn_id.eq.3 ) then					! hmhj
             call gfidi_hyb_gc_h(lon_dim, njeff, lat,			! hmhj
     x               for_gr_a_2(istrt+(ksd   -1)*lon_dim,lan),		! hmhj
     x               for_gr_a_2(istrt+(kst   -1)*lon_dim,lan),		! hmhj
     x               for_gr_a_2(istrt+(ksz   -1)*lon_dim,lan),		! hmhj
     x               for_gr_a_2(istrt+(ksu   -1)*lon_dim,lan),		! hmhj
     x               for_gr_a_2(istrt+(ksv   -1)*lon_dim,lan),		! hmhj
     x               for_gr_a_2(istrt+(ksr   -1)*lon_dim,lan),		! hmhj
     x               for_gr_a_2(istrt+(kspphi-1)*lon_dim,lan),		! hmhj
     x               for_gr_a_2(istrt+(ksplam-1)*lon_dim,lan),		! hmhj
     x               for_gr_a_2(istrt+(ksq   -1)*lon_dim,lan),		! hmhj
     x               rcs2_a(min(lat,latg-lat+1)),			! hmhj
     x               spdlat(1,iblk),					! hmhj
     x               deltim,nvcn,xvcn,					! hmhj
     x               dyn_gr_a_2(istrt+(kdtphi-1)*lon_dim,lan),		! hmhj
     x               dyn_gr_a_2(istrt+(kdtlam-1)*lon_dim,lan),		! hmhj
     x               dyn_gr_a_2(istrt+(kdrphi-1)*lon_dim,lan),		! hmhj
     x               dyn_gr_a_2(istrt+(kdrlam-1)*lon_dim,lan),		! hmhj
     x               dyn_gr_a_2(istrt+(kdulam-1)*lon_dim,lan),		! hmhj
     x               dyn_gr_a_2(istrt+(kdvlam-1)*lon_dim,lan),		! hmhj
     x               dyn_gr_a_2(istrt+(kduphi-1)*lon_dim,lan),		! hmhj
     x               dyn_gr_a_2(istrt+(kdvphi-1)*lon_dim,lan),		! hmhj
     x               bak_gr_a_2(istrt+(kap   -1)*lon_dim,lan),		! hmhj
     x               bak_gr_a_2(istrt+(kat   -1)*lon_dim,lan),		! hmhj
     x               bak_gr_a_2(istrt+(kar   -1)*lon_dim,lan),		! hmhj
     x               bak_gr_a_2(istrt+(kau   -1)*lon_dim,lan),		! hmhj
     x               bak_gr_a_2(istrt+(kav   -1)*lon_dim,lan),		! hmhj
     x               szdrdt(istrt,lan),zfirst)                          ! fyang 
           else								! hmhj
             call gfidi_hyb_gc(lon_dim, njeff, lat,
     x               for_gr_a_2(istrt+(ksd   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(kst   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksz   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksu   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksv   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksr   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(kspphi-1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksplam-1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksq   -1)*lon_dim,lan),
     x               rcs2_a(min(lat,latg-lat+1)),
     x               spdlat(1,iblk),
     x               deltim,nvcn,xvcn,
     x               dyn_gr_a_2(istrt+(kdtphi-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdtlam-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdrphi-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdrlam-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdulam-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdvlam-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kduphi-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdvphi-1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kap   -1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kat   -1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kar   -1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kau   -1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kav   -1)*lon_dim,lan),
     x               szdrdt(istrt,lan),zfirst)                
           endif							! hmhj
         else								! hmhj
           call gfidi_hyb(lon_dim, njeff, lat,
     x               for_gr_a_2(istrt+(ksd   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(kst   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksz   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksu   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksv   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksr   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(kspphi-1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksplam-1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksq   -1)*lon_dim,lan),
     x               rcs2_a(min(lat,latg-lat+1)),
     x               spdlat(1,iblk),
     x               deltim,nvcn,xvcn,
     x               dyn_gr_a_2(istrt+(kdtphi-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdtlam-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdrphi-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdrlam-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdulam-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdvlam-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kduphi-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdvphi-1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kap   -1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kat   -1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kar   -1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kau   -1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kav   -1)*lon_dim,lan),
     x               szdrdt(istrt,lan),zfirst)              
         endif								! hmhj

         enddo   !lon
       else  !-------------  hybrid  ---------------------------
!beginlon omp loop 3333333333333333333333333333333333333333333333333
!$omp parallel do schedule(dynamic,1) private(lon)
!$omp+private(istrt,njeff,iblk)
!$omp+private(nvcn,xvcn)
      do lon=1,lons_lat,ngptcd

         njeff=min(ngptcd,lons_lat-lon+1)
         istrt=lon
         if (ngptcd.ne.1) then
           iblk=lon/ngptcd+1
         else
           iblk=lon
         endif

         call gfidi_sig(lon_dim, njeff, lat,
     x               for_gr_a_2(istrt+(ksd   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(kst   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksz   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksu   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksv   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksr   -1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(kspphi-1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksplam-1)*lon_dim,lan),
     x               for_gr_a_2(istrt+(ksq   -1)*lon_dim,lan),
     x               rcs2_a(min(lat,latg-lat+1)),
     x               del,rdel2,ci,tov,spdlat(1,iblk),
     x               deltim,sl,nvcn,xvcn,
     x               dyn_gr_a_2(istrt+(kdtphi-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdtlam-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdrphi-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdrlam-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdulam-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdvlam-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kduphi-1)*lon_dim,lan),
     x               dyn_gr_a_2(istrt+(kdvphi-1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kap   -1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kat   -1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kar   -1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kau   -1)*lon_dim,lan),
     x               bak_gr_a_2(istrt+(kav   -1)*lon_dim,lan))

         enddo   !lon
       endif ! -----------------------  hybrid  ------------------

         iblk=1
         do lon=1,lons_lat,ngptcd
            do k=1,levs
               spdmax_node(k)=max(spdmax_node(k),spdlat(k,iblk))
            enddo
         iblk=iblk+1
         enddo

! Tendencies are converted from Grid space (bak_gr_a_2) to fourier space
! (bak_gr_a_1) [grid2four_thread].
!

         CALL GRID2FOUR_thread(bak_gr_a_2(1,lan),bak_gr_a_1(1,lan),
     &                  lon_dim,lons_lat,lonfx,lota)

          timer2=rtc()
          global_times_a(lat,me+1)=
     x    global_times_a(lat,me+1)+timer2-timer1
 
      enddo !sela fin lan loop 2

! Tendencies are converted from fourier space (bak_gr_a_1) to spectral space
! (trie_ls, trio_ls) for vars U, V ( p_w, p_x), temp(p_y), tracers (p_rt), psurf (p_zq).
!

      call four2fln(lslag,lats_dim_a,lota,lota,bak_gr_a_1,
     x              ls_nodes,max_ls_nodes,
     x              lats_nodes_a,global_lats_a,lon_dims_a,
     x              lats_node_a,ipt_lats_node_a,dimg,
     x              lat1s_a,lonfx,latg,latg2,
     x              trie_ls(1,1,P_w), trio_ls(1,1,P_w),
     x              plnew_a, plnow_a,
     x              ls_node)

!$omp parallel do shared(trie_ls,trio_ls)
!$omp+shared(epse,epso,ls_node)
!$omp+private(k)

! Calc Div (p_uln) and Vort (p_vln) tendencies from U,V (p_w, p_x) tendencies. [uveodz, uvoedz]
!

      do k=1,levs
         call uveodz(trie_ls(1,1,P_w  +k-1), trio_ls(1,1,P_x  +k-1),
     x               trie_ls(1,1,P_uln+k-1), trio_ls(1,1,P_vln+k-1),
     x               epse,epso,ls_node)

         call uvoedz(trio_ls(1,1,P_w  +k-1), trie_ls(1,1,P_x  +k-1),
     x               trio_ls(1,1,P_uln+k-1), trie_ls(1,1,P_vln+k-1),
     x               epse,epso,ls_node)
      enddo

!move div tendency into x and add topog. contrib.
!integrate vorticity amd moisture in time
!remember uln is old x
!remember vln is old w

! Move Div tendencies (p_uln) + topog contribution (p_gz) to p_x.
! Increment Vorticity{t-1} (p_zem)  with Vorticity tendency (p_vln) and save to
! p_w. (Note: Explicit Calc)
!

      do k=1,levs
         do i=1,len_trie_ls
            trie_ls(i,1,P_x  +k-1)=
     x      trie_ls(i,1,P_uln+k-1)+             trie_ls(i,1,P_gz)
 
            trie_ls(i,2,P_x  +k-1)=
     x      trie_ls(i,2,P_uln+k-1)+             trie_ls(i,2,P_gz)
 
            trie_ls(i,1,P_w  +k-1)=
     x      trie_ls(i,1,P_zem+k-1)+cons2*deltim*trie_ls(i,1,P_vln+k-1)     !cons
 
            trie_ls(i,2,P_w  +k-1)=
     x      trie_ls(i,2,P_zem+k-1)+cons2*deltim*trie_ls(i,2,P_vln+k-1)     !cons
 
         enddo
         do i=1,len_trio_ls
            trio_ls(i,1,P_x  +k-1)=
     x      trio_ls(i,1,P_uln+k-1)+             trio_ls(i,1,P_gz)
 
            trio_ls(i,2,P_x  +k-1)=
     x      trio_ls(i,2,P_uln+k-1)+             trio_ls(i,2,P_gz)
 
            trio_ls(i,1,P_w  +k-1)=
     x      trio_ls(i,1,P_zem+k-1)+cons2*deltim*trio_ls(i,1,P_vln+k-1)     !cons
 
            trio_ls(i,2,P_w  +k-1)=
     x      trio_ls(i,2,P_zem+k-1)+cons2*deltim*trio_ls(i,2,P_vln+k-1)     !cons
 
         enddo
      enddo

! Increment tracers{t-1} (p_rm)  with tracer tendency (p_rt) and save to p_rt. (Note: Explicit Calc).
!

      do k=1,levh
         do i=1,len_trie_ls
            trie_ls(i,1,P_rt+k-1)=
     x      trie_ls(i,1,P_rm+k-1)+cons2*deltim* trie_ls(i,1,P_rt+k-1)     !const
            trie_ls(i,2,P_rt+k-1)=
     x      trie_ls(i,2,P_rm+k-1)+cons2*deltim* trie_ls(i,2,P_rt+k-1)     !const
         enddo
         do i=1,len_trio_ls
            trio_ls(i,1,P_rt+k-1)=
     x      trio_ls(i,1,P_rm+k-1)+cons2*deltim* trio_ls(i,1,P_rt+k-1)     !const
            trio_ls(i,2,P_rt+k-1)=
     x      trio_ls(i,2,P_rm+k-1)+cons2*deltim* trio_ls(i,2,P_rt+k-1)     !const
         enddo
      enddo

      do locl=1,ls_max_node
              l=ls_node(locl,1)
         jbasev=ls_node(locl,2)
         if ( l .eq. 0 ) then
            n = 0

            do k=1,levs
               trie_ls(indlsev(n,l),1,P_w+k-1)=cons0     !constant
               trie_ls(indlsev(n,l),2,P_w+k-1)=cons0     !constant
            enddo

         endif
      end do

!hmhj ----  do explicit scheme --- sicdif should be turned off --- 

! IF(EXPLICIT) THEN
!     Increment Div {t-1} (p_dim) with Div tendency (p_x) and save to p_x. (Note:Explicit Calc)
!
!     Increment temp {t-1} (p_tem) with temp tendency (p_y) and save to p_y. (Note: Explicit Calc)
!
!     Increment psurf {t-1} (p_qm) with psurf tendency (p_zq) and save to p_zq (Note: Explicit Calc)
! ENDIF
!

      if( explicit ) then						! hmhj
      do k=1,levs							! hmhj
         do i=1,len_trie_ls						! hmhj
            trie_ls(i,1,P_x  +k-1)=					! hmhj
     x      trie_ls(i,1,P_dim+k-1)+cons2*deltim*trie_ls(i,1,P_x+k-1) 	! hmhj
            trie_ls(i,2,P_x  +k-1)=					! hmhj
     x      trie_ls(i,2,P_dim+k-1)+cons2*deltim*trie_ls(i,2,P_x+k-1) 	! hmhj
            trie_ls(i,1,P_y  +k-1)=					! hmhj
     x      trie_ls(i,1,P_tem+k-1)+cons2*deltim*trie_ls(i,1,P_y+k-1)	! hmhj
            trie_ls(i,2,P_y  +k-1)=					! hmhj
     x      trie_ls(i,2,P_tem+k-1)+cons2*deltim*trie_ls(i,2,P_y+k-1)	! hmhj
         enddo								! hmhj
         do i=1,len_trio_ls						! hmhj
            trio_ls(i,1,P_x  +k-1)=					! hmhj
     x      trio_ls(i,1,P_dim+k-1)+cons2*deltim*trio_ls(i,1,P_x+k-1)	! hmhj
            trio_ls(i,2,P_x  +k-1)=					! hmhj
     x      trio_ls(i,2,P_dim+k-1)+cons2*deltim*trio_ls(i,2,P_x+k-1)	! hmhj
            trio_ls(i,1,P_y  +k-1)=					! hmhj
     x      trio_ls(i,1,P_tem+k-1)+cons2*deltim*trio_ls(i,1,P_y+k-1)	! hmhj
            trio_ls(i,2,P_y  +k-1)=					! hmhj
     x      trio_ls(i,2,P_tem+k-1)+cons2*deltim*trio_ls(i,2,P_y+k-1)	! hmhj
         enddo								! hmhj
      enddo								! hmhj
!     
         do i=1,len_trie_ls						! hmhj
            trie_ls(i,1,P_zq)=						! hmhj
     x      trie_ls(i,1,P_qm)+cons2*deltim*trie_ls(i,1,P_zq)  		! hmhj
            trie_ls(i,2,P_zq)=						! hmhj
     x      trie_ls(i,2,P_qm)+cons2*deltim*trie_ls(i,2,P_zq) 		! hmhj
         enddo								! hmhj
         do i=1,len_trio_ls						! hmhj
            trio_ls(i,1,P_zq)=						! hmhj
     x      trio_ls(i,1,P_qm)+cons2*deltim*trio_ls(i,1,P_zq)		! hmhj
            trio_ls(i,2,P_zq)=						! hmhj
     x      trio_ls(i,2,P_qm)+cons2*deltim*trio_ls(i,2,P_zq) 		! hmhj
         enddo								! hmhj
      endif	! explicit						! hmhj

      spdmax_nodem=spdmax_node
      call mpi_gather(spdmax_nodem,levs,MPI_R_MPI,
     x                spdmax_nodesm,levs,MPI_R_MPI,
     x                0,MC_COMP,ierr)
      spdmax_nodes=spdmax_nodesm

      if ( me .eq. 0 ) then
         do k=1,levs
            spdmax(k) = cons0     !constant
            do node=1,nodes
               spdmax(k)=max(spdmax(k),spdmax_nodes(k,node))
            enddo
            spdmax(k)=sqrt(spdmax(k))
         enddo

100      format(' spdmx(01:10)=',10f5.0,:/' spdmx(11:20)=',10f5.0,
     x        :/' spdmx(21:30)=',10f5.0,:/' spdmx(31:40)=',10f5.0,
     x        :/' spdmx(41:50)=',10f5.0,:/' spdmx(51:60)=',10f5.0,
     x        :/' spdmx(61:70)=',10f5.0,:/' spdmx(71:80)=',10f5.0,
     x        :/' spdmx(81:90)=',10f5.0,:/' spdmx(91:00)=',10f5.0)
      endif

      call mpi_bcast(spdmax,levs,mpi_real8,
     x               0,MC_COMP,ierr)
      deallocate ( spdlat )

!      if(zfirst) then
!        zfirst=.false.
!      endif

! Upon Return if EXPLICIT : p_x, p_w, p_y, p_rt, p_zq are incremented
! quantities. Else not EXPLICIT, p_x, p_y, p_zq contains tendencies and p_w, p_rt contains
! incremented quantities. where
! * p_x - div
! * p_w - vort
! * p_y - temp
! * p_rt - tracers
! * p_zq - surface pressure
! p_uln contains div tendency without topo contribution (p_gz). p_vln contains
! vort tendency.

      return
      end
!******
