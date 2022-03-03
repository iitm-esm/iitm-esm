      subroutine tldfi(deltim,kdt,phour,
     &                 trie_ls,trio_ls,
     &                 ls_node,ls_nodes,max_ls_nodes,
     &                 lats_nodes_a,global_lats_a,
     &                 lonsperlat,
     &                 lats_nodes_r,global_lats_r,
     &                 lonsperlar,
     &                 epse,epso,epsedn,epsodn,
     &                 snnp1ev,snnp1od,ndexev,ndexod,
     &                 plnev_a,plnod_a,pddev_a,pddod_a,
     &                 plnew_a,plnow_a,
     &                 plnev_r,plnod_r,pddev_r,pddod_r,
     &                 plnew_r,plnow_r,
     &                 lslag,
     &                 xlon,xlat,coszdg,sfc_fld,flx_fld,
     &                 hprime,swh,hlw,fluxr,
     &                 sfalb,slag,sdec,cdec,
     &                 ozplin,jindx1,jindx2,
     &                 ddy,pdryini,
     &                 phy_f3d,  phy_f2d, nblck,
     &                 zhour,lsout,colat1,
     &                 cfhour1,time)

      use resol_def
      use layout1
      use gg_def
      use vert_def
      use date_def, only: idate, fhour
      use namelist_def
      use ozne_def
      use sfc_flx_mod
      use do_tstep_mod, only: do_tstep
      use time_manager_mod, only: time_type
      implicit none
      include 'mpif.h'

      type(sfc_var_data)        :: sfc_fld
      type(flx_var_data)        :: flx_fld
      type(time_type)           :: time
      character(16)                     :: cfhour1
      integer,intent(in):: lonsperlat(latg)
      real(kind=kind_evod),intent(inout):: deltim,phour,zhour
      integer nblck,i
      real(kind=kind_evod) trie_ls(len_trie_ls,2,11*levs+3*levh+6)
      real(kind=kind_evod) trio_ls(len_trio_ls,2,11*levs+3*levh+6)
      integer              ls_node (ls_dim)
      integer              ls_nodes(ls_dim,nodes)
      integer          max_ls_nodes(nodes)
      integer               lats_nodes_a(nodes)
      integer              global_lats_a(latg)
      integer               lats_nodes_r(nodes)
      integer              global_lats_r(latr)
      integer                 lonsperlar(latr)
      real(kind=kind_evod) colat1
      real(kind=kind_evod)    epse(len_trie_ls)
      real(kind=kind_evod)    epso(len_trio_ls)
      real(kind=kind_evod)  epsedn(len_trie_ls)
      real(kind=kind_evod)  epsodn(len_trio_ls)
      real(kind=kind_evod) snnp1ev(len_trie_ls)
      real(kind=kind_evod) snnp1od(len_trio_ls)
      integer               ndexev(len_trie_ls)
      integer               ndexod(len_trio_ls)
      real(kind=kind_evod)   plnev_a(len_trie_ls,latg2)
      real(kind=kind_evod)   plnod_a(len_trio_ls,latg2)
      real(kind=kind_evod)   pddev_a(len_trie_ls,latg2)
      real(kind=kind_evod)   pddod_a(len_trio_ls,latg2)
      real(kind=kind_evod)   plnew_a(len_trie_ls,latg2)
      real(kind=kind_evod)   plnow_a(len_trio_ls,latg2)
      real(kind=kind_evod)   plnev_r(len_trie_ls,latr2)
      real(kind=kind_evod)   plnod_r(len_trio_ls,latr2)
      real(kind=kind_evod)   pddev_r(len_trie_ls,latr2)
      real(kind=kind_evod)   pddod_r(len_trio_ls,latr2)
      real(kind=kind_evod)   plnew_r(len_trie_ls,latr2)
      real(kind=kind_evod)   plnow_r(len_trio_ls,latr2)
      real (kind=kind_rad) xlon(lonr,lats_node_r)
      real (kind=kind_rad) xlat(lonr,lats_node_r)
      real (kind=kind_rad) coszdg(lonr,lats_node_r),
     &                     hprime(nmtvr,lonr,lats_node_r),
     &                     fluxr(nfxr,lonr,lats_node_r),
     &                     sfalb(lonr,lats_node_r),
     &                     swh(ngptc,levs,nblck,lats_node_r),
     &                     hlw(ngptc,levs,nblck,lats_node_r)

      real (kind=kind_phys)
     &     phy_f3d(ngptc,levs,nblck,lats_node_r,num_p3d),
     &     phy_f2d(lonr,lats_node_r,num_p2d),
     &     ddy(lats_node_r)

      integer jindx1(lats_node_r),jindx2(lats_node_r)
      real ozplin(latsozp,levozp,pl_coeff,timeoz) !ozone coeff
      real (kind=kind_phys) pdryini
      real(kind=kind_evod) slag,sdec,cdec
      integer   kdt,k,l,n
      integer  idt,mdt,jdt,kdtdfi
      logical lsout
      integer              indlsev,jbasev
      integer              indlsod,jbasod
      include 'function2'
      logical lslag
      real qse(lnte,2),dise(lnte,2,levs),
     &     zes(lnte,2,levs),
     &     tes(lnte,2,levs),rqse(lnte,2,levh)
      real qso(lnto,2),diso(lnto,2,levs),
     &     zos(lnto,2,levs),
     &     tos(lnto,2,levs),rqso(lnto,2,levh)
      real totsum

c  include first two time levels
      kdtdfi=kdt+nsdfi
      call dfini(-nsdfi-1  ,nsdfi,
     & trie_ls(1,1,p_q),trie_ls(1,1,p_di),
     & trie_ls(1,1,p_ze),trie_ls(1,1,p_te),trie_ls(1,1,p_rq),
     & trio_ls(1,1,p_q),trio_ls(1,1,p_di),
     & trio_ls(1,1,p_ze),trio_ls(1,1,p_te),trio_ls(1,1,p_rq),
     & totsum,qse,dise,zes,tes,rqse,qso,diso,zos,tos,rqso)
!!
      call dfini(kdt-kdtdfi,nsdfi,
     & trie_ls(1,1,p_q),trie_ls(1,1,p_di),
     & trie_ls(1,1,p_ze),trie_ls(1,1,p_te),trie_ls(1,1,p_rq),
     & trio_ls(1,1,p_q),trio_ls(1,1,p_di),
     & trio_ls(1,1,p_ze),trio_ls(1,1,p_te),trio_ls(1,1,p_rq),
     & totsum,qse,dise,zes,tes,rqse,qso,diso,zos,tos,rqso)
      kdt=kdt+1
      fhour=kdt*deltim/3600
ccccccccccccccccccccccccccccccccccc
      lssav=.true. !always true, except in digital filter
      lsswr=.true. !ex short wave radaition, used in gloopr(astronomy)
      lslwr=.true. !ex long  wave radaition, used in gloopr(astronomy)
      lsfwd=.true. !true only during forward step
      lscca=.false.!get clouds from precp.(first step use fixio_r clds)
      lsout=mod(kdt,nsout).eq.0.or.phour.eq.0.
ccccccccccccccccccccccccccccccccccc
!!
      if(hybrid)then
       call get_cd_hyb(deltim/2.)
      else if( gen_coord_hybrid ) then				
       call get_cd_hyb_gc(deltim/2.)				
      else
       call get_cd_sig(am,bm,deltim/2.,tov,sv)
      endif
cc
      call do_tstep(deltim/2.,kdt,phour,
     &           trie_ls,trio_ls,
     &           ls_node,ls_nodes,max_ls_nodes,
     &           lats_nodes_a,global_lats_a,
     &           lonsperlat,
     &           lats_nodes_r,global_lats_r,
     &           lonsperlar,
     &           epse,epso,epsedn,epsodn,
     &           snnp1ev,snnp1od,ndexev,ndexod,
     x           plnev_a,plnod_a,pddev_a,pddod_a,
     x           plnew_a,plnow_a,
     x           plnev_r,plnod_r,pddev_r,pddod_r,
     x           plnew_r,plnow_r,
     &           lslag,
     &           xlon,xlat,coszdg,sfc_fld,flx_fld,
     &           hprime,swh,hlw,fluxr,
     &           sfalb,slag,sdec,cdec,
     &           ozplin,jindx1,jindx2,
     &           ddy,pdryini,
     &           phy_f3d,  phy_f2d, nblck,
     &           zhour,lsout,colat1,
     &           cfhour1,time)
cc
      if(me.eq.0) print*,'kdt after forward step in digifilter=',kdt
!!
      phour=fhour
      call dfini(kdt-kdtdfi,nsdfi,
     & trie_ls(1,1,p_q),trie_ls(1,1,p_di),
     & trie_ls(1,1,p_ze),trie_ls(1,1,p_te),trie_ls(1,1,p_rq),
     & trio_ls(1,1,p_q),trio_ls(1,1,p_di),
     & trio_ls(1,1,p_ze),trio_ls(1,1,p_te),trio_ls(1,1,p_rq),
     & totsum,qse,dise,zes,tes,rqse,qso,diso,zos,tos,rqso)
c - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
c.....
      if(hybrid)then
       call get_cd_hyb(deltim)
      else if( gen_coord_hybrid ) then				
       call get_cd_hyb_gc(deltim)				
      else
       call get_cd_sig(am,bm,deltim,tov,sv)
      endif
c.....

      lsfwd=.false.
      lssav=.true.
      idt=kdt+1
      mdt=kdtdfi
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      do jdt=idt,mdt
        kdt=kdt+1
        fhour=kdt*deltim/3600
        lsout=mod(kdt,nsout).eq.0
        lscca=mod(kdt,nsswr).eq.0
        lsswr=mod(kdt,nsswr).eq.1
        lslwr=mod(kdt,nslwr).eq.1
cccccccccccccccccccccccccccc
      call do_tstep(deltim,kdt,phour,
     &           trie_ls,trio_ls,
     &           ls_node,ls_nodes,max_ls_nodes,
     &           lats_nodes_a,global_lats_a,
     &           lonsperlat,
     &           lats_nodes_r,global_lats_r,
     &           lonsperlar,
     &           epse,epso,epsedn,epsodn,
     &           snnp1ev,snnp1od,ndexev,ndexod,
     x           plnev_a,plnod_a,pddev_a,pddod_a,
     x           plnew_a,plnow_a,
     x           plnev_r,plnod_r,pddev_r,pddod_r,
     x           plnew_r,plnow_r,
     &           lslag,
     &           xlon,xlat,coszdg,sfc_fld,flx_fld,
     &           hprime,swh,hlw,fluxr,
     &           sfalb,slag,sdec,cdec,
     &           ozplin,jindx1,jindx2,
     &           ddy,pdryini,
     &           phy_f3d,  phy_f2d, nblck,
     &           zhour,lsout,colat1,
     &           cfhour1,time)
!!
      call dfini(kdt-kdtdfi,nsdfi,
     & trie_ls(1,1,p_q),trie_ls(1,1,p_di),
     & trie_ls(1,1,p_ze),trie_ls(1,1,p_te),trie_ls(1,1,p_rq),
     & trio_ls(1,1,p_q),trio_ls(1,1,p_di),
     & trio_ls(1,1,p_ze),trio_ls(1,1,p_te),trio_ls(1,1,p_rq),
     & totsum,qse,dise,zes,tes,rqse,qso,diso,zos,tos,rqso)
        phour=fhour
      enddo
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
c  save surface conditions
!!
!!
c  save surface conditions
      call fixwr(1,
     & sfc_fld%hice,   sfc_fld%fice,   sfc_fld%tisfc, sfc_fld%tsea,
     & sfc_fld%smc,    sfc_fld%sheleg, sfc_fld%stc,   sfc_fld%tg3,
     & sfc_fld%zorl,   sfc_fld%cv,     sfc_fld%cvb,   sfc_fld%cvt,
     & sfc_fld%alvsf,  sfc_fld%alvwf,  sfc_fld%alnsf, sfc_fld%alnwf,
     & sfc_fld%vfrac,  sfc_fld%canopy, sfc_fld%f10m,  sfc_fld%vtype,
     & sfc_fld%stype,  sfc_fld%facsf,  sfc_fld%facwf, sfc_fld%uustar,
     & sfc_fld%ffmm,   sfc_fld%ffhh,   sfc_fld%tprcp, sfc_fld%srflag,
     + sfc_fld%slc,    sfc_fld%snwdph, sfc_fld%slope, sfc_fld%shdmin,
     & sfc_fld%shdmax, sfc_fld%snoalb, sfc_fld%sncovr)

c......................................................................
c  but do not save diagnostics for this time
      lssav=.false.
      lsout=.false.
      idt=kdt+1
      mdt=kdt+nsdfi
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      do jdt=idt,mdt
        kdt=kdt+1
        fhour=kdt*deltim/3600
        lscca=mod(kdt,nsswr).eq.0
        lsswr=mod(kdt,nsswr).eq.1
        lslwr=mod(kdt,nslwr).eq.1
cccccccccccccccccccccccccccc
      call do_tstep(deltim,kdt,phour,
     &           trie_ls,trio_ls,
     &           ls_node,ls_nodes,max_ls_nodes,
     &           lats_nodes_a,global_lats_a,
     &           lonsperlat,
     &           lats_nodes_r,global_lats_r,
     &           lonsperlar,
     &           epse,epso,epsedn,epsodn,
     &           snnp1ev,snnp1od,ndexev,ndexod,
     x           plnev_a,plnod_a,pddev_a,pddod_a,
     x           plnew_a,plnow_a,
     x           plnev_r,plnod_r,pddev_r,pddod_r,
     x           plnew_r,plnow_r,
     &           lslag,
     &           xlon,xlat,coszdg,sfc_fld,flx_fld,
     &           hprime,swh,hlw,fluxr,
     &           sfalb,slag,sdec,cdec,
     &           ozplin,jindx1,jindx2,
     &           ddy,pdryini,
     &           phy_f3d,  phy_f2d, nblck,
     &           zhour,lsout,colat1,
     &           cfhour1,time)
!!
!!
      call dfini(kdt-kdtdfi,nsdfi,
     & trie_ls(1,1,p_q),trie_ls(1,1,p_di),
     & trie_ls(1,1,p_ze),trie_ls(1,1,p_te),trie_ls(1,1,p_rq),
     & trio_ls(1,1,p_q),trio_ls(1,1,p_di),
     & trio_ls(1,1,p_ze),trio_ls(1,1,p_te),trio_ls(1,1,p_rq),
     & totsum,qse,dise,zes,tes,rqse,qso,diso,zos,tos,rqso)
       phour=fhour
      enddo
!++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
c  do final digital filter, set (n-1)=(n), and run forward step in main
      call dfini(nsdfi+1,nsdfi,
     & trie_ls(1,1,p_q),trie_ls(1,1,p_di),
     & trie_ls(1,1,p_ze),trie_ls(1,1,p_te),trie_ls(1,1,p_rq),
     & trio_ls(1,1,p_q),trio_ls(1,1,p_di),
     & trio_ls(1,1,p_ze),trio_ls(1,1,p_te),trio_ls(1,1,p_rq),
     & totsum,qse,dise,zes,tes,rqse,qso,diso,zos,tos,rqso)
      if(me.eq.0) print*,'kdt after last dfini in digifilter=',kdt
!!
      do i=1,len_trie_ls
        trie_ls(i,1,p_qm)=trie_ls(i,1,p_q)
        trie_ls(i,2,p_qm)=trie_ls(i,2,p_q)
      enddo
      do k=1,levs
        do i=1,len_trie_ls
          trie_ls(i,1,p_tem+k-1)=trie_ls(i,1,p_te+k-1)
          trie_ls(i,1,p_dim+k-1)=trie_ls(i,1,p_di+k-1)
          trie_ls(i,1,p_zem+k-1)=trie_ls(i,1,p_ze+k-1)
          trie_ls(i,2,p_tem+k-1)=trie_ls(i,2,p_te+k-1)
          trie_ls(i,2,p_dim+k-1)=trie_ls(i,2,p_di+k-1)
          trie_ls(i,2,p_zem+k-1)=trie_ls(i,2,p_ze+k-1)
        enddo
      enddo
      do k=1,levh
        do i=1,len_trie_ls
          trie_ls(i,1,p_rm+k-1)=trie_ls(i,1,p_rq+k-1)
          trie_ls(i,2,p_rm+k-1)=trie_ls(i,2,p_rq+k-1)
        enddo
      enddo
!!
      do i=1,len_trio_ls
        trio_ls(i,1,p_qm)=trio_ls(i,1,p_q)
        trio_ls(i,2,p_qm)=trio_ls(i,2,p_q)
      enddo
      do k=1,levs
        do i=1,len_trio_ls
          trio_ls(i,1,p_tem+k-1)=trio_ls(i,1,p_te+k-1)
          trio_ls(i,1,p_dim+k-1)=trio_ls(i,1,p_di+k-1)
          trio_ls(i,1,p_zem+k-1)=trio_ls(i,1,p_ze+k-1)
          trio_ls(i,2,p_tem+k-1)=trio_ls(i,2,p_te+k-1)
          trio_ls(i,2,p_dim+k-1)=trio_ls(i,2,p_di+k-1)
          trio_ls(i,2,p_zem+k-1)=trio_ls(i,2,p_ze+k-1)
        enddo
      enddo
      do k=1,levh
        do i=1,len_trio_ls
          trio_ls(i,1,p_rm+k-1)=trio_ls(i,1,p_rq+k-1)
          trio_ls(i,2,p_rm+k-1)=trio_ls(i,2,p_rq+k-1)
        enddo
      enddo
c - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
c  replace surface conditions with conditions written at mid ini segment.
c  forward step in main begins with values in the middle of the filter span
      call fixwr(2,
     & sfc_fld%hice,   sfc_fld%fice,   sfc_fld%tisfc, sfc_fld%tsea,
     & sfc_fld%smc,    sfc_fld%sheleg, sfc_fld%stc,   sfc_fld%tg3,
     & sfc_fld%zorl,   sfc_fld%cv,     sfc_fld%cvb,   sfc_fld%cvt,
     & sfc_fld%alvsf,  sfc_fld%alvwf,  sfc_fld%alnsf, sfc_fld%alnwf,
     & sfc_fld%vfrac,  sfc_fld%canopy, sfc_fld%f10m,  sfc_fld%vtype,
     & sfc_fld%stype,  sfc_fld%facsf,  sfc_fld%facwf, sfc_fld%uustar,
     & sfc_fld%ffmm,   sfc_fld%ffhh,   sfc_fld%tprcp, sfc_fld%srflag,
     + sfc_fld%slc,    sfc_fld%snwdph, sfc_fld%slope, sfc_fld%shdmin,
     & sfc_fld%shdmax, sfc_fld%snoalb, sfc_fld%sncovr)
!!
c - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
c  reset clock and output initialized fields
      kdt=kdtdfi
      fhour=kdt*deltim/3600 ! note that fhour also comes from last fixio
      if(me.eq.0) print*,'fhour after reset clock digifilter=',fhour,kdt
      lsout=mod(kdt,nsout).eq.0
!!
      if (me.eq.0) then
        write(*,*)'initialized values in digifilter'
        write(*,*)'************'
c$$$        call bar3(trie_ls(1,1,p_ze),trio_ls(1,1,p_ze),'ze ',levs)
c$$$        call bar3(trie_ls(1,1,p_di),trio_ls(1,1,p_di),'di ',levs)
c$$$        call bar3(trie_ls(1,1,p_te),trio_ls(1,1,p_te),'te ',levs)
c$$$        call bar3(trie_ls(1,1,p_rq),trio_ls(1,1,p_rq),'rq ',levs)
c$$$        call bar3(trie_ls(1,1,p_rq+levs),trio_ls(1,1,p_rq+levs),
c$$$     &            'oz1 ',levs)
c$$$        call bar3(trie_ls(1,1,p_rq+2*levs),trio_ls(1,1,p_rq+2*levs),
c$$$     &            'oz2 ',levs)
c$$$        call bar3(trie_ls(1,1,p_q),trio_ls(1,1,p_q),'q ',1)
c$$$        call bar3(trie_ls(1,1,p_gz),trio_ls(1,1,p_gz),'gz ',1)
!       print*,'p_qm =',p_qm ,' p_rm =',p_rm
!sela if (.not.liope.or.icolor.ne.2) then
c$$$        call rms_spect(trie_ls(1,1,p_qm ), trie_ls(1,1,p_dim),
c$$$     x             trie_ls(1,1,p_tem), trie_ls(1,1,p_zem),
c$$$     x             trie_ls(1,1,p_rm ),
c$$$     x             trio_ls(1,1,p_qm ), trio_ls(1,1,p_dim),
c$$$     x             trio_ls(1,1,p_tem), trio_ls(1,1,p_zem),
c$$$     x             trio_ls(1,1,p_rm ),
c$$$     x             ls_nodes,max_ls_nodes)
!sela endif
!---------------------------------------------------------------

      endif
!!
      phour=fhour
!--------------------------------------------
cmy reset digifilter switch to zero for activiation of reshuffling lats loopa
      do_filter = .false.

!     print *,' leave tldfi ' 					

      return
      end
!!
      subroutine dfini(kstep,nstep,qe,die,ze,te,rqe,
     &                qo,dio,zo,to,rqo,
     & totsum,qse,dise,zes,tes,rqse,qso,diso,zos,tos,rqso)
      use resol_def
      use layout1
      implicit none
      real qe(len_trie_ls,2),die(len_trie_ls,2,levs),
     &     ze(len_trie_ls,2,levs),
     &     te(len_trie_ls,2,levs),rqe(len_trie_ls,2,levh)
      real qo(len_trio_ls,2),dio(len_trio_ls,2,levs),
     &     zo(len_trio_ls,2,levs),
     &     to(len_trio_ls,2,levs),rqo(len_trio_ls,2,levh)
      real digfil,sx,wx,totsumi
      real qse(lnte,2),dise(lnte,2,levs),
     &     zes(lnte,2,levs),
     &     tes(lnte,2,levs),rqse(lnte,2,levh)
      real qso(lnto,2),diso(lnto,2,levs),
     &     zos(lnto,2,levs),
     &     tos(lnto,2,levs),rqso(lnto,2,levh)
      integer kl
      real totsum
      integer i,k,nstep,kstep

!     print *,' enter dfini ' 					

      if(kstep.lt.-nstep) then !++++++++++++++++++++++++++++++++++
        totsum = 0
        qse=0.
        qso=0.
        dise=0.
        zes=0.
        tes=0.
        rqse=0.
        diso=0.
        zos=0.
        tos=0.
        rqso=0.
c
      elseif(kstep.le.nstep) then !++++++++++++++++++++++++++++++
csela  print*,'arrived at elseif(kstep.le.nstep)',ktstep
        if(kstep.ne.0) then  !--------------------------------
          sx     = acos(-1.)*kstep/nstep
          wx     = acos(-1.)*kstep/(nstep+1)
          digfil = sin(wx)/wx*sin(sx)/sx
          if(me.eq.0)then
          print*,'in dfini sx=',sx,'wx=',wx,'digfil=',digfil,
     &    'at kstep=',kstep
          endif
        else                 !--------------------------------
csela   print*,'arrived at if(kstep.ne.0) in elseif(kstep.le.nstep),
csela&                ktstep= ntstep=',ktstep,ntstep
          digfil=1
        endif                !--------------------------------

        totsum = totsum + digfil
        do k=1,2
          do i=1,len_trie_ls
           qse(i,k)=qse(i,k)+digfil*qe(i,k)
          enddo
        enddo
        do k=1,2
          do i=1,len_trio_ls
           qso(i,k)=qso(i,k)+digfil*qo(i,k)
          enddo
        enddo
        do kl=1,levs
        do k=1,2
          do i=1,len_trie_ls
            dise(i,k,kl)=dise(i,k,kl)+digfil*die(i,k,kl)
            zes(i,k,kl)=zes(i,k,kl)+digfil*ze(i,k,kl)
            tes(i,k,kl)=tes(i,k,kl)+digfil*te(i,k,kl)
          enddo
          do i=1,len_trio_ls
            diso(i,k,kl)=diso(i,k,kl)+digfil*dio(i,k,kl)
            zos(i,k,kl)=zos(i,k,kl)+digfil*zo(i,k,kl)
            tos(i,k,kl)=tos(i,k,kl)+digfil*to(i,k,kl)
          enddo
        enddo
        enddo
        do kl=1,levh
        do k=1,2
          do i=1,len_trie_ls
            rqse(i,k,kl)=rqse(i,k,kl)+digfil*rqe(i,k,kl)
          enddo
          do i=1,len_trio_ls
            rqso(i,k,kl)=rqso(i,k,kl)+digfil*rqo(i,k,kl)
          enddo
        enddo
        enddo
c
      else  !++++++++++++++++++++++++++++++++++++++++++++++++++++
csela   print*,'arrived at (kstep.lt.-nstep) in dfini
csela& ktstep= ntstep=',ktstep,ntstep
        totsumi = 1.0 / totsum
        do k=1,2
          do i=1,len_trie_ls
            qe(i,k)  = qse(i,k)  * totsumi
          enddo
          do i=1,len_trio_ls
            qo(i,k)  = qso(i,k)  * totsumi
          enddo
        enddo
        do kl=1,levs
        do k=1,2
          do i=1,len_trie_ls
            die(i,k,kl) = dise(i,k,kl) * totsumi
            ze(i,k,kl) = zes(i,k,kl) * totsumi
            te(i,k,kl) = tes(i,k,kl) * totsumi
          enddo
          do i=1,len_trio_ls
            dio(i,k,kl) = diso(i,k,kl) * totsumi
            zo(i,k,kl) = zos(i,k,kl) * totsumi
            to(i,k,kl) = tos(i,k,kl) * totsumi
          enddo
        enddo
        enddo
        do kl=1,levh
        do k=1,2
          do i=1,len_trie_ls
            rqe(i,k,kl) = rqse(i,k,kl) * totsumi
          enddo
          do i=1,len_trio_ls
            rqo(i,k,kl) = rqso(i,k,kl) * totsumi
          enddo
        enddo
        enddo
      endif !+++++++++++++++++++++++++++++++++++++++++++++++++++++
c
!     print *,' leave dfini ' 					
      end
      subroutine fixwr(iflag,
     & hice,fice,tisfc,                                  ! for sea-ice - xw nov04
     & tsea,smc,sheleg,stc,tg3,zorl,cv,cvb,cvt,
     & alvsf,alvwf,alnsf,alnwf,vfrac,canopy,f10m,vtype,stype,
clu [-1l/+2l]: add (tprcp,srflag),(slc,snwdph,slope,shdmin,shdmax,snoalb)
clu  & facsf,facwf,uustar,ffmm,ffhh)
     + facsf,facwf,uustar,ffmm,ffhh,tprcp,srflag,
     + slc,snwdph,slope,shdmin,shdmax,snoalb,sncovr)

c
c***********************************************************************
c     purpose:
c      save or retrieve fixed fields in digifilt
c
c***********************************************************************
c
      use resol_def
      use layout1
      implicit none
      integer iflag
      real smc(lsoil,lonr,lats_node_r),stc(lsoil,lonr,lats_node_r),
     &     hice(lonr,lats_node_r),fice(lonr,lats_node_r),  ! for sea-ice - nov04
     &     tisfc(lonr,lats_node_r),
     &     tsea  (lonr,lats_node_r),sheleg(lonr,lats_node_r),
     &     tg3   (lonr,lats_node_r),
     &     zorl  (lonr,lats_node_r),cv    (lonr,lats_node_r),
     &     cvb   (lonr,lats_node_r),
     &     cvt   (lonr,lats_node_r),alvsf (lonr,lats_node_r),
     &     alvwf (lonr,lats_node_r),
     &     alnsf (lonr,lats_node_r),alnwf (lonr,lats_node_r),
     &     slmsk (lonr,lats_node_r),
     &     vfrac (lonr,lats_node_r),canopy(lonr,lats_node_r),
     &     f10m  (lonr,lats_node_r),
     &     vtype (lonr,lats_node_r),stype (lonr,lats_node_r),
     &     facsf (lonr,lats_node_r),
     &     facwf (lonr,lats_node_r),uustar(lonr,lats_node_r),
     &     ffmm  (lonr,lats_node_r),
     &     ffhh  (lonr,lats_node_r)
clu [+5l]: add (tprcp,srflag),(slc,snwdph,snoalb,slope,shdmin,shdmax)
     +,    tprcp (lonr,lats_node_r),srflag(lonr,lats_node_r)
     +,    slc    (lsoil,lonr,lats_node_r)
     +,    snwdph (lonr,lats_node_r)
     +,    snoalb (lonr,lats_node_r),slope (lonr,lats_node_r)
     +,    shdmin (lonr,lats_node_r),shdmax(lonr,lats_node_r)
     +,    sncovr (lonr,lats_node_r)

      real , allocatable :: smc1(:,:,:),stc1(:,:,:),
     &  hice1(:,:),fice1(:,:),tisfc1(:,:),                   ! for sea-ice - xw nov04
     &  tsea1(:,:),sheleg1(:,:),tg31(:,:),
     &  zorl1(:,:),cv1(:,:),cvb1(:,:),
     &  cvt1(:,:),alvsf1(:,:),alvwf1(:,:),
     &  alnsf1(:,:),alnwf1(:,:),slmsk1(:,:),
     &  vfrac1(:,:),canopy1(:,:),f10m1(:,:),
     &  vtype1(:,:),stype1(:,:),facsf1(:,:),
     &  facwf1(:,:),uustar1(:,:),ffmm1(:,:),
     &  ffhh1(:,:)
clu [+3l]: add (tprcp1,srflag1),(slc1,snwdph1,slope1,shdmin1,shdmax1,snoalb1)
     +, tprcp1(:,:),srflag1(:,:)
     +, slc1(:,:,:),snwdph1(:,:),slope1(:,:)
     +, shdmin1(:,:),shdmax1(:,:),snoalb1(:,:), sncovr1(:,:)

      logical first
      data first/.true./
      save   first,smc1,stc1,tsea1,sheleg1,tg31,zorl1,cv1,cvb1,cvt1
      save   hice1,fice1,tisfc1                          ! for sea-ice - xw nov04
      save   alvsf1,alvwf1,alnsf1,alnwf1,slmsk1,vfrac1,canopy1,f10m1
      save   vtype1,stype1,facsf1,facwf1,uustar1,ffmm1,ffhh1
clu [+2l]: save (tprcp1,srflag1),(slc1,snwdph1,slope1,shdmin1,shdmax1,snoalb1)
      save   tprcp1,srflag1
      save   slc1,snwdph1,slope1,shdmin1,shdmax1,snoalb1,sncovr1

      integer i,j,k

c@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
c
!     print *,' enter fixwr ' 					
      if (first) then
        allocate (smc1(lsoil,lonr,lats_node_r))
        allocate (stc1(lsoil,lonr,lats_node_r))
        allocate (hice1(lonr,lats_node_r))              ! for sea-ice - xw nov04
        allocate (fice1(lonr,lats_node_r))              ! for sea-ice - xw nov04
        allocate (tisfc1(lonr,lats_node_r))             ! for sea-ice - xw nov04
        allocate (tsea1(lonr,lats_node_r))
        allocate (sheleg1(lonr,lats_node_r))
        allocate (tg31(lonr,lats_node_r))
        allocate (zorl1(lonr,lats_node_r))
        allocate (cv1(lonr,lats_node_r))
        allocate (cvb1(lonr,lats_node_r))
        allocate (cvt1(lonr,lats_node_r))
        allocate (alvsf1(lonr,lats_node_r))
        allocate (alvwf1(lonr,lats_node_r))
        allocate (alnsf1(lonr,lats_node_r))
        allocate (alnwf1(lonr,lats_node_r))
        allocate (slmsk1(lonr,lats_node_r))
        allocate (vfrac1(lonr,lats_node_r))
        allocate (canopy1(lonr,lats_node_r))
        allocate (f10m1(lonr,lats_node_r))
        allocate (vtype1(lonr,lats_node_r))
        allocate (stype1(lonr,lats_node_r))
        allocate (facsf1(lonr,lats_node_r))
        allocate (facwf1(lonr,lats_node_r))
        allocate (uustar1(lonr,lats_node_r))
        allocate (ffmm1(lonr,lats_node_r))
        allocate (ffhh1(lonr,lats_node_r))
clu [+8l]: allocate (tprcp,srflag),(slc,snwdph,slope,shdmin,shdmax,snoalb)
        allocate (tprcp1(lonr,lats_node_r))
        allocate (srflag1(lonr,lats_node_r))
        allocate (slc1(lsoil,lonr,lats_node_r))
        allocate (snwdph1(lonr,lats_node_r))
        allocate (slope1(lonr,lats_node_r))
        allocate (shdmin1(lonr,lats_node_r))
        allocate (shdmax1(lonr,lats_node_r))
        allocate (snoalb1(lonr,lats_node_r))
        allocate (sncovr1(lonr,lats_node_r))
        first = .false.
      endif
!
      if(iflag.eq.1) then
        do k=1,lsoil
          do j=1,lats_node_r
            do i=1,lonr
              smc1(k,i,j)=smc(k,i,j)
              stc1(k,i,j)=stc(k,i,j)
              slc1(k,i,j)=slc(k,i,j)        !! clu [+1l]: slc -> slc1
            enddo
          enddo
        enddo
        do j=1,lats_node_r
          do i=1,lonr
            hice1(i,j)=hice(i,j)                        ! for sea-ice - xw nov04
            fice1(i,j)=fice(i,j)                        ! for sea-ice - xw nov04
            tisfc1(i,j)=tisfc(i,j)                      ! for sea-ice - xw nov04
            tsea1(i,j)=tsea(i,j)
            sheleg1(i,j)=sheleg(i,j)
            tg31(i,j)=tg3(i,j)
            zorl1(i,j)=zorl(i,j)
            cv1(i,j)=cv(i,j)
            cvb1(i,j)=cvb(i,j)
            cvt1(i,j)=cvt(i,j)
            alvsf1(i,j)=alvsf(i,j)
            alvwf1(i,j)=alvwf(i,j)
            alnsf1(i,j)=alnsf(i,j)
            alnwf1(i,j)=alnwf(i,j)
            slmsk1(i,j)=slmsk(i,j)
            vfrac1(i,j)=vfrac(i,j)
            canopy1(i,j)=canopy(i,j)
            f10m1(i,j)=f10m(i,j)
            vtype1(i,j)=vtype(i,j)
            stype1(i,j)=stype(i,j)
            facsf1(i,j)=facsf(i,j)
            facwf1(i,j)=facwf(i,j)
            uustar1(i,j)=uustar(i,j)
            ffmm1(i,j)=ffmm(i,j)
            ffhh1(i,j)=ffhh(i,j)
clu [+7l]: add (tprcp,srflag),(snwdph,slope,shdmin,shdmax,snoalb)
            tprcp1(i,j)=tprcp(i,j)
            srflag1(i,j)=srflag(i,j)
            snwdph1(i,j)=snwdph(i,j)
            slope1(i,j)=slope(i,j)
            shdmin1(i,j)=shdmin(i,j)
            shdmax1(i,j)=shdmax(i,j)
            snoalb1(i,j)=snoalb(i,j)
            sncovr1(i,j)=sncovr(i,j)
          enddo
        enddo
      elseif(iflag.eq.2) then
        do k=1,lsoil
          do j=1,lats_node_r
            do i=1,lonr
              smc(k,i,j)=smc1(k,i,j)
              stc(k,i,j)=stc1(k,i,j)
              slc(k,i,j)=slc1(k,i,j)          !! clu [+1l]: slc1 -> slc
            enddo
          enddo
        enddo
        do j=1,lats_node_r
          do i=1,lonr
            hice(i,j)=hice1(i,j)                        ! for sea-ice - xw nov04
            fice(i,j)=fice1(i,j)                        ! for sea-ice - xw nov04
            tisfc(i,j)=tisfc1(i,j)                      ! for sea-ice - xw nov04
            tsea(i,j)=tsea1(i,j)
            sheleg(i,j)=sheleg1(i,j)
            tg3(i,j)=tg31(i,j)
            zorl(i,j)=zorl1(i,j)
            cv(i,j)=cv1(i,j)
            cvb(i,j)=cvb1(i,j)
            cvt(i,j)=cvt1(i,j)
            alvsf(i,j)=alvsf1(i,j)
            alvwf(i,j)=alvwf1(i,j)
            alnsf(i,j)=alnsf1(i,j)
            alnwf(i,j)=alnwf1(i,j)
            slmsk(i,j)=slmsk1(i,j)
            vfrac(i,j)=vfrac1(i,j)
            canopy(i,j)=canopy1(i,j)
            f10m(i,j)=f10m1(i,j)
            vtype(i,j)=vtype1(i,j)
            stype(i,j)=stype1(i,j)
            facsf(i,j)=facsf1(i,j)
            facwf(i,j)=facwf1(i,j)
            uustar(i,j)=uustar1(i,j)
            ffmm(i,j)=ffmm1(i,j)
            ffhh(i,j)=ffhh1(i,j)
clu [+7l]: add (tprcp,srflag),(snwdph,slope,shdmin,shdmax,snoalb)
            tprcp(i,j)=tprcp1(i,j)
            srflag(i,j)=srflag1(i,j)
            snwdph(i,j)=snwdph1(i,j)
            slope(i,j)=slope1(i,j)
            shdmin(i,j)=shdmin1(i,j)
            shdmax(i,j)=shdmax1(i,j)
            snoalb(i,j)=snoalb1(i,j)
            sncovr(i,j)=sncovr1(i,j)
          enddo
        enddo
      endif
!     print *,' leave fixwr ' 					
      return
      end

