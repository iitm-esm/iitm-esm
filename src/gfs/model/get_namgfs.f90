subroutine get_namgfs(int_state)
  use gfs_internalstate_mod, only: gfs_internalstate

 	type(gfs_internalstate),   intent(inout) :: int_state ! the internal state.
	
	int_state%nam_gfs%total_member=1

	int_state%grib_inp=0

  int_state%nam_gfs%member_id=1
  
	int_state%nam_gfs%nlunit=35
 
	int_state%nam_gfs%gfs_namelist='gfs_namelist'

  int_state%nam_gfs%sig_ini  = 'INPUT/sig_ini'
  int_state%nam_gfs%sfc_ini  = 'INPUT/sfc_ini'
  int_state%nam_gfs%sig_ini2 = 'INPUT/sig_ini2'

end subroutine get_namgfs 
