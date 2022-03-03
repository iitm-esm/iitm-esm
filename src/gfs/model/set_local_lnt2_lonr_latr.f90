subroutine set_local_lnt2_lonr_latr(int_state)

	use gfs_internalstate_mod, only: gfs_internalstate
	implicit none
	type(gfs_internalstate), intent(inout) :: int_state
	integer :: jcount
  
	!set local no: of spectral grids for each pe
	!------------------------------------------!
  jcount=(int_state%jcap+1)*(int_state%jcap+2)
  int_state%lnt2_s=jcount/int_state%nodes
	if (int_state%me < mod(jcount,int_state%nodes)) int_state%lnt2_s=int_state%lnt2_s+1
	
	!set local no: lonr and latr for each pe
	!--------------------------------------!
  int_state%latr_s=int_state%latr
	int_state%lonr_s=int_state%lonr/int_state%nodes
	if (int_state%me < mod(int_state%lonr,int_state%nodes))int_state%lonr_s=int_state%lonr_s+1

end subroutine set_local_lnt2_lonr_latr
