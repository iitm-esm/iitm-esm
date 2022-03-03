module mkxgrid_mod

use iso_c_binding

implicit none

type, bind(C) :: vtx
    real(C_DOUBLE) :: x, y
end type vtx

interface
    integer(C_INT) function clip(v_in, n_in, lolf, uprt, v_out) bind(C,name="clip")
        import
        integer(C_INT), intent(in), value :: n_in
        type(vtx), intent(in) :: v_in(*)
        type(vtx), intent(in),value :: lolf
        type(vtx), intent(in),value :: uprt
        type(vtx), intent(out) :: v_out(*)
    end function clip

    real(C_DOUBLE) function poly_area(v, n) bind(C,name="poly_area")
        import
        type(vtx), intent(in) :: v(*)
        integer(C_INT), intent(in), value :: n
    end function poly_area

    integer(C_INT) function lon_fix(v, n, tlon) bind(C,name="lon_fix")
        import
        type(vtx), intent(inout) :: v(*)
        integer(C_INT), intent(in), value :: n
        real(C_DOUBLE), intent(in), value :: tlon
    end function lon_fix
end interface


contains

integer function clipin(v1, v2, vout)
    type(vtx), intent(in) :: v1(2), v2(2)
    type(vtx), intent(out) :: vout(:)

    integer :: n_in, n_out
    
    type(vtx) :: v_in(4), lolf, uprt
    real :: tlon

    v_in(1)%y = v1(1)%y
    v_in(2)%y = v1(1)%y
    v_in(3)%y = v1(2)%y
    v_in(4)%y = v1(2)%y

    v_in(1)%x = v1(1)%x
    v_in(2)%x = v1(2)%x
    v_in(3)%x = v1(2)%x
    v_in(4)%x = v1(1)%x

    n_in = 4

    lolf = v2(1)
    uprt = v2(2)

    tlon = (lolf%x+uprt%x)/2.
    n_in = lon_fix(v_in, 4, tlon)

    n_out = clip(v_in, n_in, lolf, uprt, vout)

    clipin = n_out 

end function clipin

end module mkxgrid_mod
