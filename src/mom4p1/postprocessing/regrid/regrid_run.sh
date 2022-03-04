#!/bin/bash
#=======================================================================
#      regrid_2d : interp 2-D data
#         Contact : Zhi Liang   email : z1l@gfdl.noaa.gov
#
#  This runscritp can be used to regrid data $src_data on any grid $src_grid to logically
#  rectangular grid described by grid descriptor file $dst_grid. 
#
#  This preprocessing program was tested with Intel Fortran compiler on ia64 at GFDL.
#  In order to run on other system, some changes may be needed.
#######################################################################
# Users need to modify the following variables according to their need. 
# These particular values are here for testing purposes in GFDL only.  
#######################################################################

npes=1

cat >input.nml << EOF
    &regrid_nml
       src_data       = "$1",
       grid_spec_file = "$2",
       dst_data       = "$(basename $1)",
       num_flds       = 1
       fld_name       = "$3" 
       fld_pos        = "T"
       vector_fld     = .false.
       debug          = .true. /
EOF

#  run the executable
if [ "$npes" -eq 1 ] ; then
   ./regrid.exe >fms.out
else
   mpirun -np $npes ./regrid.exe >fms.out
fi
  
cat fms.out
     
mv fms.out $name.fms.out

