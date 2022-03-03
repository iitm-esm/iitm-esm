      module mpi_def
      use machine
      include 'mpif.h'
      integer stat(mpi_status_size),info
      integer :: icolor
      integer :: mc_comp, mc_io, mpi_comm_all, mpi_comm_all_dup
      logical :: liope

      integer mpi_r_io, mpi_r_mpi, mpi_r_def, mpi_a_def
     &,       mpi_r_io_r,mpi_r_mpi_r
      parameter (mpi_r_io =mpi_real4)
      parameter (mpi_r_io_r=mpi_real8)

      parameter (mpi_r_mpi=mpi_real4)
      parameter (mpi_r_mpi_r=mpi_real8)

      parameter (mpi_r_def=mpi_real8)
      parameter (mpi_a_def=mpi_real8)

      integer kind_mpi,kind_sum,kind_mpi_r
      parameter (kind_mpi=4,kind_sum=4,kind_mpi_r=8)
      integer ngrids_sfc,ngrid_global
      parameter(ngrids_sfc=100)

      real(kind=kind_io4) ,pointer ::  buff_mult(:,:,:)
      real(kind=kind_io4) ,allocatable ::  buff_multg(:,:)
      real tmm(10,10)
      end module mpi_def
