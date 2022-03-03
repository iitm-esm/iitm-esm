module spectralgridconv
  use omp_lib, only: omp_get_num_threads
  use resol_def
  use layout1
  use gg_def
  use vert_def
  use date_def, only: idate
  use namelist_def
  use coordinate_def
  use tracer_const
  use physcons,only : fv => con_fvirt, rk => con_rocp, rerth => con_rerth, &
                      grav => con_g
	implicit none

	private

	public :: spectral2grid

	contains
	
	subroutine spectral2grid(trie_te,trio_te,teg,nvars, &
	                         ls_node,ls_nodes,max_ls_nodes, &
	                         lats_nodes_r,global_lats_r,lonsperlar, &
	                         plnev_r,plnod_r)

	  !!this routine do spectral to grid transform in model partial reduced grid

	  implicit none

	  real(kind=kind_evod), intent(in) :: trie_te(len_trie_ls,2,nvars)
	  real(kind=kind_evod), intent(in) :: trio_te(len_trio_ls,2,nvars)
	  real(kind=kind_rad), intent(out) :: teg(lonr,lats_node_r,nvars)
	  integer, intent(in) :: nvars
	  integer, intent(in) :: ls_node(ls_dim,3), ls_nodes(ls_dim,nodes)
	  integer, intent(in) :: max_ls_nodes(nodes)
	  integer, intent(in) :: lats_nodes_r(nodes)
	  integer, intent(in) :: global_lats_r(latr)
	  integer, intent(in) :: lonsperlar(latr)
	  real(kind=kind_evod), intent(in) :: plnev_r(len_trie_ls,latr2)
	  real(kind=kind_evod), intent(in) :: plnod_r(len_trio_ls,latr2)

	  real(kind=kind_evod) :: for_gr_r_1(lonrx*nvars,lats_dim_r)
	  real(kind=kind_evod) :: for_gr_r_2(lonrx*nvars,lats_dim_r)
	  integer :: dimg, k

	  real(kind=kind_evod), parameter :: one=1.0, cb2pa=1000.0

	  integer :: lan,lat,is,ie
	  integer :: lon_dim,lons_lat

	  logical :: lslag

	  real(kind=kind_evod), parameter :: cons_0=0.0,   cons_24=24.0, &
	                                     cons_99=99.0, cons_1p0d9=1.0E9, &
	                                     qmin=1.0e-10

	  lslag = .false.

	  dimg=0

	  call spectral2four(trie_te,trio_te, &
	               lat1s_r, &
	               plnev_r,plnod_r, &
	               nvars,ls_node,latr2, &
	               lslag,lats_dim_r,nvars,for_gr_r_1, &
	               ls_nodes,max_ls_nodes, &
	               lats_nodes_r,global_lats_r, &
	               lats_node_r,ipt_lats_node_r,lon_dims_r,dimg, &
	               lonsperlar,lonrx,latr)

	  do lan=1,lats_node_r
	    lat = global_lats_r(ipt_lats_node_r-1+lan)
	    lon_dim = lon_dims_r(lan)
	    lons_lat = lonsperlar(lat)
	    call four2grid_thread(for_gr_r_1(1,lan),for_gr_r_2(1,lan), &
	                          lon_dim,lons_lat,lonrx,nvars,lan,me)
	  enddo
!!!!!!! Chance for an OMP implimentation.
    do k=1,nvars
	  	do lan=1,lats_node_r
	    	lon_dim  = lon_dims_r(lan)
	    	lat      = global_lats_r(ipt_lats_node_r-1+lan)
	    	lons_lat = lonsperlar(lat)
        is=(k-1)*lon_dim+1; ie=is-1+lons_lat
	    	teg(1:lons_lat,lan,k) = for_gr_r_2(is:ie,lan)
	  	enddo
    enddo
	  return
	end subroutine spectral2grid

	subroutine spectral2four(flnev,flnod,lat1s,plnev,plnod, &
	                      nvars,ls_node,latl2, &
	                      lslag,workdim,nvarsdim,four_gr, &
	                      ls_nodes,max_ls_nodes, &
	                      lats_nodes,global_lats, &
	                      lats_node,ipt_lats_node,lon_dims,dimg, &
	                      lons_lat,londi,latl)
	  use mpi_def
	  implicit none
	
	  integer              :: lat1s(0:jcap),latl2
	  integer              :: nvars
	  real(kind=kind_evod) :: flnev(len_trie_ls,2,nvars)
	  real(kind=kind_evod) :: flnod(len_trio_ls,2,nvars)
	  real(kind=kind_evod) :: plnev(len_trie_ls,latl2)
	  real(kind=kind_evod) :: plnod(len_trio_ls,latl2)
	  integer              :: ls_node(ls_dim,3)
	  integer              :: j, l, lat, lat1, n
	  real(kind=kind_evod) :: apev(latl2,2,5*levs+1*levh+3)
	  real(kind=kind_evod) :: apod(latl2,2,5*levs+1*levh+3)
	  integer              :: num_threads
	  integer              :: nvar_thread_max
	  integer              :: nvar_1,nvar_2
	  integer              :: thread
	  integer              :: nvarsdim,latl
	  integer              :: workdim
	  integer              :: id,dimg,londi
	  logical              :: lslag
	  integer              :: lats_node,ipt_lats_node
	  integer              :: lon_dims(latr)
	  real(kind=kind_evod) :: four_gr( londi*nvarsdim, workdim )
	  integer              :: ls_nodes(ls_dim,nodes)
	  integer              :: max_ls_nodes(nodes)
	  integer              :: lats_nodes(nodes)
	  integer              :: global_lats(latl+dimg)
	  integer              :: lons_lat(latl)
	  real(kind=kind_mpi)  :: works(2,nvars,ls_dim*workdim,nodes)
	  real(kind=kind_mpi)  :: workr(2,nvars,ls_dim*workdim,nodes)
	  integer              :: kpts(1+jcap)
	  integer              :: kptr(1+jcap)
	  integer              :: sendcounts(1+jcap)
	  integer              :: recvcounts(1+jcap)
	  integer              :: sdispls(1+jcap)
	  integer              :: ierr,ilat,ipt_ls
	  integer              :: lmax,lval,jj
	  integer              :: ndisp,node,nvar
	  integer              :: ilat_list(nodes)
	  integer              :: indlsev,jbasev
	  integer              :: indlsod,jbasod
	  real(kind=kind_evod), parameter :: cons0=0.d0, cons1=1.d0
	  include 'function2'
	
!$omp parallel 
    num_threads=omp_get_num_threads()
!$omp end parallel
	  nvar_thread_max=(nvars+num_threads-1)/num_threads
	  kpts   = 0
	  do j = 1, ls_max_node
	    l=ls_node(j,1)
	    jbasev=ls_node(j,2)
	    jbasod=ls_node(j,3)
	    lat1 = lat1s(l)
	    if ( kind_evod .eq. 8 ) then
	      !$omp parallel do shared(apev,apod,flnev,flnod,plnev,plnod) &
	      !$omp private(thread,nvar_1,nvar_2)
	      do thread=1,min(num_threads,nvars)   ! start of thread loop ..............
	        nvar_1=(thread-1)*nvar_thread_max+1
	        nvar_2=min(nvar_1+nvar_thread_max-1,nvars)
	        call dgemm('t','n',latl2-lat1+1, 2*(nvar_2-nvar_1+1), &
	                   (jcap+3-l)/2,cons1,plnev(indlsev(l,l),lat1),len_trie_ls, &
	                   flnev(indlsev(l,l),1,nvar_1),len_trie_ls,cons0, &
	                   apev(lat1,1,nvar_1), latl2)
	        call dgemm('t','n',latl2-lat1+1, 2*(nvar_2-nvar_1+1), &
	                   (jcap+2-l)/2,cons1,plnod(indlsod(l+1,l),lat1),len_trio_ls, &
	                   flnod(indlsod(l+1,l),1,nvar_1),len_trio_ls,cons0, &
	                   apod(lat1,1,nvar_1), latl2)
	
	      enddo   ! end of thread loop ..................................
	    else
	      !$omp parallel do shared(apev,apod,flnev,flnod,plnev,plnod) &
	      !$omp private(thread,nvar_1,nvar_2)
	      do thread=1,min(num_threads,nvars)   ! start of thread loop ..............
	        nvar_1=(thread-1)*nvar_thread_max+1
	        nvar_2=min(nvar_1+nvar_thread_max-1,nvars)
	        call sgemm('t','n',latl2-lat1+1, 2*(nvar_2-nvar_1+1), &
	                   (jcap+3-l)/2,cons1,plnev(indlsev(l,l),lat1),len_trie_ls, &
	                   flnev(indlsev(l,l),1,nvar_1),len_trie_ls,cons0, &
	                   apev(lat1,1,nvar_1), latl2)
	        call sgemm('t','n',latl2-lat1+1, 2*(nvar_2-nvar_1+1), &
	                    (jcap+2-l)/2,cons1,plnod(indlsod(l+1,l),lat1),len_trio_ls, &
	                    flnod(indlsod(l+1,l),1,nvar_1),len_trio_ls,cons0, & 
	                    apod(lat1,1,nvar_1), latl2)
	
	      enddo ! end of thread loop ..................................
	    endif
	
	    ilat_list(1) = 0
	    do node = 1, nodes - 1
	      ilat_list(node+1) = ilat_list(node) + lats_nodes(node)
	    end do
	    !$omp parallel do private(node,jj,ilat,lat,ipt_ls,nvar)
	    do node=1,nodes
	      do jj=1,lats_nodes(node)
	        ilat = ilat_list(node) + jj
	        lat=global_lats(ilat)
	        ipt_ls=min(lat,latl-lat+1)
	        if ( ipt_ls .ge. lat1s(ls_nodes(j,me+1)) ) then
	          kpts(node)=kpts(node)+1
	          if ( lat .le. latl2 ) then
	            do nvar=1,nvars
	              works(1,nvar,kpts(node),node)= &
	                apev(ipt_ls,1,nvar)+apod(ipt_ls,1,nvar)
	              works(2,nvar,kpts(node),node)= &
	                apev(ipt_ls,2,nvar)+apod(ipt_ls,2,nvar)
	            enddo
	          else
	            do nvar=1,nvars
	              works(1,nvar,kpts(node),node)= &
	                apev(ipt_ls,1,nvar)-apod(ipt_ls,1,nvar)
	              works(2,nvar,kpts(node),node)= &
	                apev(ipt_ls,2,nvar)-apod(ipt_ls,2,nvar)
	            enddo
	          endif
	        endif
	      enddo
	    enddo
	  enddo   ! end of do j loop
	  kptr = 0
	  do node=1,nodes
	    do l=1,max_ls_nodes(node)
	      lval=ls_nodes(l,node)+1
	      do j=1,lats_node
	        lat=global_lats(ipt_lats_node-1+j)
	        if ( min(lat,latl-lat+1) .ge. lat1s(lval-1) ) then
	          kptr(node)=kptr(node)+1
	        endif
	      enddo
	    enddo
	  enddo
	  do node=1,nodes
	    sendcounts(node) = kpts(node) * 2 * nvars
	    recvcounts(node) = kptr(node) * 2 * nvars
	    sdispls(node) = (node-1) * 2*ls_dim*workdim*nvars
	  end do
	  call mpi_barrier (mc_comp,ierr)
	  call mpi_alltoallv(works,sendcounts,sdispls,mpi_r_mpi, &
	                     workr,recvcounts,sdispls,mpi_r_mpi, &
	                     mc_comp,ierr)
	  !$omp parallel do private(j,lat,lmax,nvar,ndisp,lval)
	  do j=1,lats_node
	    lat = global_lats(ipt_lats_node-1+j)
	    lmax = min(jcap,lons_lat(lat)/2)
	    if ( (lmax+1)*2+1 .le. lons_lat(lat)+2 ) then
	      do nvar=1,nvars
	        ndisp = (nvar-1)*lon_dims(j)
	        do lval = (lmax+1)*2+1, lons_lat(lat)+2
	          four_gr(ndisp+lval,j) = cons0
	        enddo
	      enddo
	    endif
	  enddo
	  kptr = 0
	  if (lslag) then
	    id=1
	  else
	    id=0
	  endif
	  !$omp parallel do private(node,l,lval,j,lat,ndisp,nvar)
	  do node=1,nodes
	    do l=1,max_ls_nodes(node)
	      lval=ls_nodes(l,node)+1
	      do j=1,lats_node
	        lat=global_lats(ipt_lats_node-1+j)
	        if ( min(lat,latl-lat+1) .ge. lat1s(lval-1) ) then
	          kptr(node)=kptr(node)+1
	          do nvar=1,nvars
	            ndisp = (nvar-1)*lon_dims(j)
	            four_gr(ndisp+2*lval-1+id,j) =workr(1,nvar,kptr(node),node)
	            four_gr(ndisp+2*lval+id,j) =workr(2,nvar,kptr(node),node)
	          enddo
	        endif
	      enddo
	    enddo
	  enddo
	  return
	end subroutine spectral2four
	
end module spectralgridconv
