
#!/bin/bash

set -e

odtmroot=$(pwd)

debug=""
npes=1
while getopts 'dj:' flag; do
    case "${flag}" in
    d) debug=".debug" ;;
    j) npes=$OPTARG ;;
    esac
done

shift $(($OPTIND - 1))

opts=$@

execdir="$odtmroot/exec"
mkmf="$odtmroot/bin/mkmf"

mkmftemplate="$odtmroot/bin/mkmf.template$debug"

FMS_UTILS=$odtmroot/shared
thisdir=$odtmroot

paths="$thisdir/shared/mpp $thisdir/shared/include \
       $thisdir/shared/mpp/include \
       $thisdir/shared/fms $thisdir/shared/platform \
       $thisdir/shared/memutils $thisdir/shared/constants \
       $thisdir/shared/horiz_interp $thisdir/shared/mosaic $thisdir/shared/diag_manager \
       $thisdir/model/time_manager.f90 $thisdir/model/time_interp.f90"

mkdir -p $execdir/lib_fms

echo '...............Compiling lib_fms.....................'
cd $execdir/lib_fms
cppDef="-Duse_netCDF -Duse_libMPI -DENABLE_ODA -Dfms_interp -DnotInterp"
$mkmf -c "$cppDef" -f -p lib_fms.a -t $mkmftemplate $paths
sed -i s'/(FFLAGS)/(FFLAGS) \-r8/' Makefile
make -j 16
echo '...............Done compiling lib_fms.....................'

echo "#-------------------------MAKE RUN_NCCOMBINEP2R--------------------------------------"
cppDef="-Dlib_mppnccp2r -Duse_libMPI"
exe=run_mppncc_gfs
paths="$odtmroot/run_mppncc_gfs"
export LD=$FC
mkdir -p $execdir/$exe
cd $execdir/$exe

OPTS="-I$execdir/lib_fms"

LIBS="$execdir/lib_fms/lib_fms.a"

$mkmf -c "$cppDef" -f -p ${exe} -t $mkmftemplate -o "$OPTS" -l "$LIBS"  $paths
make -j $numproc
echo "#--------------------------------------------------------------------------------"

