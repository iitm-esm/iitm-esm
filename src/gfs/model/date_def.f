      module date_def
      use machine, only: kind_evod
      implicit none
      save
      integer :: idate(4)
      real(kind=kind_evod) :: fhour
      real(kind=kind_evod) ,allocatable :: spdmax(:)
      end module date_def
