! !module: namelist_mod  ---                definition of the name list

 module namelist_mod

 implicit none

 type nam_gfs_namelist
      integer                :: nlunit, total_member, member_id
      real                   :: deltim
      character(80)          :: gfs_namelist
      character(20)          :: sig_ini, sig_ini2, sfc_ini
 end type nam_gfs_namelist

 end module namelist_mod
