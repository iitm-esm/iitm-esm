!****f* MODULE/DIAG_TOOLS
! FUNCTION
!
! Author: Prajeesh Gopinathan
! email: prajeesh.cat@tropmet.res.in
!
!
!******
module diag_tools
  use machine , only : kind_phys
  use resol_def, only : lonr, levs, levp1, latr, latr2, jcap
  use coordinate_def, only : ak5, bk5
  use layout1, only : lats_node_r, len_trie_ls, len_trio_ls
  use layout1, only : nodes, ls_dim, ipt_lats_node_r, ls_max_node
  use physcons, only : rk => con_rocp, con_cp, con_g, con_hvap
  use physcons, only : fv => con_fvirt, con_rerth, con_pi
  use gg_def, only : coslat_r
  use mpi_def, only: mc_comp
  use spectralgridconv, only : spectral2grid

  implicit none
  private
  include 'mpif.h'
  real(kind=kind_phys), parameter :: cont = 1000.*con_cp/con_g, &
                                      conq = 1000.*con_hvap/con_g, &
                                      con_ke = 0.5*1000./con_g

  real(kind=8), allocatable, public :: cellarea(:,:)
  integer, allocatable :: d_global_lats_r(:), d_lonsperlar(:)
  logical :: initialized=.false.

  public :: get_press_hybrid, calc_int_lat_energy_hybrid
  public :: spect_div_vor_to_grid_uv, calc_kinetic_energy_hybrid
  public :: init_diag_tools, area_weighted_global_mean, get_topo

  contains

  subroutine check_init
    if(initialized) return
    print *, "Error diag_tools not initialised."
    stop "Error diag_tools not initialised."
  end subroutine check_init

 
  subroutine init_diag_tools(global_lats_r, lonsperlar)
    integer, intent(in) :: global_lats_r(latr), lonsperlar(latr)
    real(kind=8) :: tem1, tem2
    integer :: lan, lat, lons_lat
    if (initialized) return

    allocate(d_global_lats_r(latr), d_lonsperlar(latr))
    d_global_lats_r(:)=global_lats_r(:)
    d_lonsperlar(:)=lonsperlar(:)

    allocate(cellarea(lonr,lats_node_r))
    do lan=1,lats_node_r
      lat = d_global_lats_r(ipt_lats_node_r-1+lan)
      lons_lat = d_lonsperlar(lat)
      tem1 = con_rerth*(con_pi+con_pi)*coslat_r(lat)/real(lons_lat)
      tem2 = con_rerth*con_pi/real(latr)
      cellarea(:,lan) = tem1*tem2
    enddo
    initialized=.true.
  end subroutine init_diag_tools

  function area_weighted_global_mean(field)
    real(kind=8) :: area_weighted_global_mean
    real(kind=8), intent(in) :: field(lonr,lats_node_r)
    real(kind=8) :: sum_weighted_field, sum_weights
    real(kind=8) :: global_sum_weighted_field, global_sum_weights
    integer :: lat, lan, lons_lat, ierr
    
    call check_init 

    global_sum_weighted_field=0.0 
    global_sum_weighted_field=0.0 
    sum_weights=0.0
    sum_weights=0.0
    do lan=1,lats_node_r
      lat = d_global_lats_r(ipt_lats_node_r-1+lan)
      lons_lat = d_lonsperlar(lat)
      sum_weighted_field=sum_weighted_field+ &
          sum(cellarea(1:lons_lat,lan)*field(1:lons_lat,lan))
      sum_weights=sum_weights+sum(cellarea(1:lons_lat,lan))
    enddo

    call mpi_allreduce(sum_weighted_field, global_sum_weighted_field, 1, &
                       mpi_double, mpi_sum, mc_comp, ierr)
    call mpi_allreduce(sum_weights, global_sum_weights, 1, &
                       mpi_double, mpi_sum, mc_comp, ierr)
    area_weighted_global_mean=global_sum_weighted_field/global_sum_weights

  end function area_weighted_global_mean

  subroutine spect_div_vor_to_grid_uv &
                (trie_vor,trie_div,trio_vor,trio_div, &
                 ls_node,ls_nodes,max_ls_nodes,lats_nodes_r, &
                 plnev_r,plnod_r, &
                 epsedn,epsodn,snnp1ev,snnp1od,uvel,vvel)

    real(kind=8), intent(in) :: trie_vor(len_trie_ls,2,levs), &
                                trie_div(len_trie_ls,2,levs)
                                
    real(kind=8), intent(in) :: trio_vor(len_trio_ls,2,levs), &
                                trio_div(len_trio_ls,2,levs)

    integer, intent(in) :: ls_node(ls_dim,3), ls_nodes(ls_dim,nodes), &
                           max_ls_nodes(nodes), lats_nodes_r(nodes)

    real(kind=8), intent(in) :: plnev_r(len_trie_ls, latr2)
    real(kind=8), intent(in) :: plnod_r(len_trio_ls, latr2)

    real(kind=8), intent(in) :: epsedn(len_trie_ls), snnp1ev(len_trie_ls), &
                                epsodn(len_trio_ls), snnp1od(len_trio_ls)

    real(kind=8), intent(out) :: uvel(lonr,lats_node_r,levs), vvel(lonr,lats_node_r,levs)

    !->Local variables.
    real(kind=8) :: trie_u(len_trie_ls,2,levs), &
                    trie_v(len_trie_ls,2,levs), &
                    trio_u(len_trio_ls,2,levs), &
                    trio_v(len_trio_ls,2,levs)
    integer :: k
    
    call check_init

    uvel(:,:,:)=0.0; vvel(:,:,:)=0.0
    trie_u(:,:,:)=0.0; trie_v(:,:,:)=0.0
    trio_u(:,:,:)=0.0; trio_v(:,:,:)=0.0

    !$omp parallel do shared(trie_vor,trio_vor,trie_div,trio_div) &
    !$omp shared(trie_u,trio_u,trie_v,trio_v) &
    !$omp shared(epsedn,epsodn,snnp1ev,snnp1od,ls_node) &
    !$omp private(k)
    do k=1,levs
      call dezouv(trie_div(:,:,k), trio_vor(:,:,k), &
                  trie_u(:,:,k), trio_v(:,:,k), &
                  epsedn,epsodn,snnp1ev,snnp1od,ls_node)

      call dozeuv(trio_div(:,:,k), trie_vor(:,:,k), &
                  trio_u(:,:,k), trie_v(:,:,k), &
                  epsedn,epsodn,snnp1ev,snnp1od,ls_node)
    enddo

    call spectral2grid(trie_u(:,:,:),trio_u(:,:,:),uvel,levs, &
                       ls_node,ls_nodes,max_ls_nodes, &
                       lats_nodes_r,d_global_lats_r,d_lonsperlar, &
                       plnev_r,plnod_r)

    call spectral2grid(trie_v(:,:,:),trio_v(:,:,:),vvel,levs, &
                       ls_node,ls_nodes,max_ls_nodes, &
                       lats_nodes_r,d_global_lats_r,d_lonsperlar, &
                       plnev_r,plnod_r)

  end subroutine spect_div_vor_to_grid_uv
  
  subroutine calc_kinetic_energy_hybrid  &
                (trie_p,trie_vor,trie_div,trio_p,trio_vor,trio_div, &
                 ls_node,ls_nodes,max_ls_nodes,lats_nodes_r, &
                 plnev_r,plnod_r, &
                 epsedn,epsodn,snnp1ev,snnp1od,k_energy,psurfo)

    real(kind=8), intent(in) :: trie_p(len_trie_ls,2), &
                                trie_vor(len_trie_ls,2,levs), &
                                trie_div(len_trie_ls,2,levs)
                                
    real(kind=8), intent(in) :: trio_p(len_trio_ls,2), &
                                trio_vor(len_trio_ls,2,levs), &
                                trio_div(len_trio_ls,2,levs)

    integer, intent(in) :: ls_node(ls_dim,3), ls_nodes(ls_dim,nodes), &
                           max_ls_nodes(nodes), lats_nodes_r(nodes)

    real(kind=8), intent(in) :: plnev_r(len_trie_ls, latr2)
    real(kind=8), intent(in) :: plnod_r(len_trio_ls, latr2)
    real(kind=8), intent(in) :: epsedn(len_trie_ls), snnp1ev(len_trie_ls), &
                                epsodn(len_trio_ls), snnp1od(len_trio_ls)

    real(kind=8), intent(out) :: k_energy(lonr,lats_node_r)
    real(kind=8), intent(out), optional :: psurfo(lonr, lats_node_r)

    real(kind=8) :: uvel(lonr, lats_node_r, levs), &
                    vvel(lonr, lats_node_r, levs), &
                    del(lonr, lats_node_r, levs), &
                    psurf(lonr, lats_node_r)
    integer :: k
    
    call check_init

    uvel(:,:,:)=0.0; vvel(:,:,:)=0.0
    psurf(:,:)=0.0; k_energy(:,:)=0.0

    call spect_div_vor_to_grid_uv &
                (trie_vor,trie_div,trio_vor,trio_div, &
                 ls_node,ls_nodes,max_ls_nodes,lats_nodes_r, &
                 plnev_r,plnod_r, &
                 epsedn,epsodn,snnp1ev,snnp1od,uvel,vvel)
    

    call spectral2grid(trie_p(:,:),trio_p(:,:),psurf,1, &
                       ls_node,ls_nodes,max_ls_nodes, &
                       lats_nodes_r,d_global_lats_r,d_lonsperlar, &
                       plnev_r,plnod_r)
  
    psurf=exp(psurf)

    if(present(psurfo)) psurfo(:,:)=psurf(:,:)
    
    call get_press_hybrid(psurf,dprsi=del)
  
    do k=1,levs
      k_energy(:,:) = k_energy(:,:)+con_ke*del(:,:,k)* &
                      (uvel(:,:,k)**2+vvel(:,:,k)**2)
    enddo
    return    
  end subroutine calc_kinetic_energy_hybrid

  subroutine calc_int_lat_energy_hybrid  &
                (trie_p,trie_t,trie_q,trio_p,trio_t,trio_q, &
                 ls_node,ls_nodes,max_ls_nodes,lats_nodes_r, &
                 plnev_r,plnod_r, &
                 heatc,moistc,htemp,hmoist)

    real(kind=8), intent(in) :: trie_p(len_trie_ls,2), &
                                trie_t(len_trie_ls,2,levs), &
                                trie_q(len_trie_ls,2,levs)
                                
    real(kind=8), intent(in) :: trio_p(len_trio_ls,2), &
                                trio_t(len_trio_ls,2,levs), &
                                trio_q(len_trio_ls,2,levs)

    integer, intent(in) :: ls_node(ls_dim,3), ls_nodes(ls_dim,nodes), &
                           max_ls_nodes(nodes), lats_nodes_r(nodes)

    real(kind=8), intent(in) :: plnev_r(len_trie_ls, latr2)
    real(kind=8), intent(in) :: plnod_r(len_trio_ls, latr2)

    real(kind=8), intent(out) :: heatc(lonr,lats_node_r), &
                                 moistc(lonr,lats_node_r)

    real(kind=8), intent(out), optional :: htemp(lonr,lats_node_r,levs), &
                                           hmoist(lonr,lats_node_r,levs)

    real(kind=8) :: temp(lonr, lats_node_r, levs), &
                    qr(lonr, lats_node_r, levs), &
                    del(lonr, lats_node_r, levs), &
                    psurf(lonr, lats_node_r)
    integer :: k

    call check_init

    temp = 0.0 
    qr = 0.0
    psurf = 0.0

    call spectral2grid(trie_p(:,:),trio_p(:,:),psurf,1, &
                       ls_node,ls_nodes,max_ls_nodes, &
                       lats_nodes_r,d_global_lats_r,d_lonsperlar, &
                       plnev_r,plnod_r)
  
    call spectral2grid(trie_t(:,:,:),trio_t(:,:,:),temp,levs, &
                       ls_node,ls_nodes,max_ls_nodes, &
                       lats_nodes_r,d_global_lats_r,d_lonsperlar, &
                       plnev_r,plnod_r)


    call spectral2grid(trie_q(:,:,:),trio_q(:,:,:),qr,levs, &
                       ls_node,ls_nodes,max_ls_nodes, &
                       lats_nodes_r,d_global_lats_r,d_lonsperlar, &
                       plnev_r,plnod_r)

    if(present(hmoist))hmoist=qr
    
    where(qr>0.0) temp=temp/(1.0+fv*qr)

    if(present(htemp))htemp=temp
    
    psurf=exp(psurf)
    
    call get_press_hybrid(psurf,dprsi=del)
  
    heatc=0.0; moistc=0.0
  
    do k=1,levs
      heatc(:,:) = heatc(:,:)+cont*del(:,:,k)*temp(:,:,k)
      moistc(:,:) = moistc(:,:)+conq*del(:,:,k)*qr(:,:,k)
    enddo
    return    
  end subroutine calc_int_lat_energy_hybrid
  
  subroutine get_press_hybrid(psurf,prsi,prsl,dprsi)
    implicit none

    real(kind=kind_phys), intent(in) :: psurf(lonr, lats_node_r)
    real(kind=kind_phys), intent(out), optional :: prsi(lonr,lats_node_r,levp1)
    real(kind=kind_phys), intent(out), optional :: prsl(lonr,lats_node_r,levs)
    real(kind=kind_phys), intent(out), optional :: dprsi(lonr,lats_node_r,levs)

    real(kind=kind_phys) :: tmp1(lonr,lats_node_r,levp1)
    real(kind=kind_phys) :: prsik(lonr,lats_node_r,levp1)
    real(kind=kind_phys) :: prslk(lonr,lats_node_r,levs)
    real(kind=kind_phys) :: tem(lonr,lats_node_r)

    real (kind=kind_phys), parameter :: rk1=rk+1.0, rkr=1.0/rk, r100=100.0, pt01=0.01
    integer :: k

    call check_init

    tmp1=0.0 
    do k=1,levp1
      where(psurf>0.0) tmp1(:,:,levs+2-k) = ak5(k) + bk5(k)*psurf(:,:) !tmp1 are now pressures
    enddo
    
    if(present(prsi)) prsi=tmp1
   
    if(present(dprsi)) then
      dprsi=0.0 
      do k=1,levs
        dprsi(:,:,k) = tmp1(:,:,k) - tmp1(:,:,k+1)
      enddo
    endif

    if(.not.present(prsl)) return
      
    prsik=0.0
    prslk=0.0
    tem=0.0
    prsl=0.0

    prsik = (tmp1*pt01) ** rk
    do k=1,levs
      tem(:,:)  = rk1 * (tmp1(:,:,k) - tmp1(:,:,k+1))
      where(tem>0.0)
        prslk(:,:,k) = (prsik(:,:,k)*tmp1(:,:,k)-prsik(:,:,k+1)*tmp1(:,:,k+1))/tem(:,:)
        prsl(:,:,k) = r100 * prslk(:,:,k) ** rkr
      endwhere
    enddo
    return
  end subroutine get_press_hybrid 

  subroutine get_topo(zsg,trie_zs,trio_zs, &
             ls_node,ls_nodes,max_ls_nodes, &
             lats_nodes_r,global_lats_r,lonsperlar, &
             snnp1ev,snnp1od,plnew_r,plnow_r)
!  use resol_def
!  use layout1
!  use gg_def
!  use vert_def
!  use date_def, only: idate
!  use namelist_def
!  use coordinate_def 
!  use tracer_const
  use physcons, only: rerth => con_rerth, grav => con_g
  implicit none

  real, intent(out) :: zsg(lonr,lats_node_r)
  real, intent(in) :: trie_zs(len_trie_ls,2), trio_zs(len_trio_ls,2)
  integer, intent(in) :: ls_node(ls_dim,3)
  integer, intent(in) :: ls_nodes(ls_dim,nodes)
  integer, intent(in) :: max_ls_nodes(nodes)
  integer, intent(in) :: lats_nodes_r(nodes)
  integer, intent(in) :: global_lats_r(latr)
  integer, intent(in) :: lonsperlar(latr)

  real, intent(in) ::  snnp1ev(len_trie_ls)
  real, intent(in) ::  snnp1od(len_trio_ls)

  real, intent(in) ::   plnew_r(len_trie_ls,latr2)
  real, intent(in) ::   plnow_r(len_trio_ls,latr2)

  integer :: indev1,indev2
  integer :: indod1,indod2
  integer :: indlsev,jbasev
  integer :: indlsod,jbasod
  integer :: n, locl, l, indev, indod

  real :: trie_zs1(len_trie_ls,2), trio_zs1(len_trio_ls,2)

  real, parameter :: one=1.0, pa2cb=0.001
  real, parameter :: cons_0=0.0,   cons_24=24.0, &
                                     cons_99=99.0, cons_1p0d9=1.0e9, &
                                     qmin=1.0e-10

  real :: ga2, tem

  include 'function2'

  ga2 = grav / (rerth*rerth)
  do locl=1,ls_max_node
    l=ls_node(locl,1)
    jbasev=ls_node(locl,2)
    indev1 = indlsev(l,l)
    if (mod(l,2).eq.mod(jcap+1,2)) then
      indev2 = indlsev(jcap+1,l)
    else
      indev2 = indlsev(jcap  ,l)
    endif
    do indev = indev1 , indev2
       tem = ga2 * snnp1ev(indev)
       if(tem/=0.0) then
        trie_zs1(indev,1) = trie_zs(indev,1) / tem
        trie_zs1(indev,2) = trie_zs(indev,2) / tem
       else
        trie_zs1(indev,1) = trie_zs(indev,1) 
        trie_zs1(indev,2) = trie_zs(indev,2)
       endif
    end do
  end do
  do locl=1,ls_max_node
    l=ls_node(locl,1)
    jbasod=ls_node(locl,3)
    indod1 = indlsod(l+1,l)
    if (mod(l,2).eq.mod(jcap+1,2)) then
      indod2 = indlsod(jcap  ,l)
    else
      indod2 = indlsod(jcap+1,l)
    endif
    do indod = indod1 , indod2
      tem = ga2 * snnp1od(indod)
      if(tem/=0.0) then
        trio_zs1(indod,1) = trio_zs(indod,1) / tem
        trio_zs1(indod,2) = trio_zs(indod,2) / tem
      else 
        trio_zs1(indod,1) = trio_zs(indod,1)
        trio_zs1(indod,2) = trio_zs(indod,2)
      endif
    end do
  end do

  call spectral2grid(trie_zs1(:,:),trio_zs1(:,:),zsg,1, &
                           ls_node,ls_nodes,max_ls_nodes, &
                           lats_nodes_r,global_lats_r,lonsperlar, &
                           plnew_r,plnow_r)  
  end subroutine get_topo
end module diag_tools
