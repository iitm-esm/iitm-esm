#!/bin/ksh
# compile mom4ice & coupler
set -x

echo
export  platform=ibm
export  name=cfs_ocean_mom4ice
export  curdir=$(pwd)
cd ..
#export  root=$(pwd)
export  root=/gpfs3/home/prajeesh/mom4p1_ESM
export  code_dir=$root/src
export  executable=$curdir/exec/$name
export  time_stamp=$root/bin/time_stamp.csh
export  mkmfTemplate=$root/bin/mkmf.template.$platform
export  mkmf=$root/bin/mkmf
export  pathnames=$curdir/path_names    # path to file containing list of source paths
export  cppDefs="-DENABLE_GDS -Duse_netCDF4 -Duse_libMPI"

#--------------------------------------------------------------------------------------------------------
# compile mppnccombine.c, needed only if $npes > 1
#--------------------------------------------------------------------------------------------------------
# setup directory structure
  if [ ! -d $executable:h ] ; then   mkdir  $executable:h ; fi
#--------------------------------------------------------------------------------------------------------
# compile the model code and create executable
  cd $executable:h
  $mkmf -f -a $code_dir -t $mkmfTemplate -p $executable -c "$cppDefs" $pathnames $root/include $code_dir/shared/mpp/include /usr/local/include

  make -f Makefile
