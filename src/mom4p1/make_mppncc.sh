
#!/bin/bash

set -e

rootdir=$(pwd)
machine="intel_pratyush"

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

execdir="$rootdir/exec"
mkmf="$rootdir/bin/mkmf"

mkmftemplate="$rootdir/bin/mkmf.template.$machine$debug"

. "$rootdir/bin/env.$machine"

FMS_UTILS=$rootdir/src/shared

FMS_UTILITIES=" \
        $FMS_UTILS/astronomy \
        $FMS_UTILS/column_diagnostics \
        $FMS_UTILS/coupler \
        $FMS_UTILS/drifters \
        $FMS_UTILS/exchange \
        $FMS_UTILS/fft \
        $FMS_UTILS/field_manager \
        $FMS_UTILS/oda_tools \
        $FMS_UTILS/random_numbers \
        $FMS_UTILS/sat_vapor_pres \
        $FMS_UTILS/station_data \
        $FMS_UTILS/topography \
        $FMS_UTILS/tracer_manager \
        $FMS_UTILS/tridiagonal \
        $FMS_UTILS/include \
        $FMS_UTILS/platform \
        $FMS_UTILS/constants \
		$FMS_UTILS/fms \
		$FMS_UTILS/time_manager \
		$FMS_UTILS/mpp \
		$FMS_UTILS/diag_manager  \
		$FMS_UTILS/memutils \
		$FMS_UTILS/constants \
		$FMS_UTILS/mpp/include \
		$FMS_UTILS/data_override \
		$FMS_UTILS/horiz_interp \
		$FMS_UTILS/time_interp \
		$FMS_UTILS/axis_utils \
		$FMS_UTILS/mosaic \
        $FMS_UTILS/amip_interp \
        $FMS_UTILS/
        "

mkdir -p $execdir/lib_fms

echo '...............Compiling lib_fms.....................'
cd $execdir/lib_fms
cppDefs="-Duse_netCDF4 -Duse_libMPI -DENABLE_ODA -DUSE_OCEAN_BGC"
$mkmf -c "$cppDefs" -f -p lib_fms.a -t $mkmftemplate $FMS_UTILITIES

make -j 16
echo '...............Done compiling lib_fms.....................'

echo "#-------------------------MAKE RUN_NCCOMBINEP2R--------------------------------------"
cppDef="-Dlib_mppnccp2r -Duse_libMPI"
exe=run_mppncc
paths="$rootdir/src/postprocessing/run_mppncc"
export LD=$FC
mkdir -p $execdir/$exe
cd $execdir/$exe

OPTS="-I$execdir/lib_fms"

LIBS="$execdir/lib_fms/lib_fms.a"

$mkmf -c "$cppDef" -f -p ${exe} -t $mkmftemplate -o "$OPTS" -l "$LIBS"  $paths
make -j $numproc
echo "#--------------------------------------------------------------------------------"


echo "#-------------------------MAKE MOM4P1--------------------------------------"
cppDef="-Duse_netCDF4 -Duse_libMPI -DENABLE_ODA -DUSE_OCEAN_BGC"
exe=ocean.exe


paths=" $rootdir/src/atmos_param/diag_integral \
        $rootdir/src/atmos_param/monin_obukhov \
        $rootdir/src/mom4p1/ocean_bgc  \
        $rootdir/src/mom4p1/ocean_core  \
        $rootdir/src/mom4p1/ocean_diag  \
        $rootdir/src/mom4p1/ocean_param/sources  \
        $rootdir/src/mom4p1/ocean_param/mixing  \
        $rootdir/src/mom4p1/ocean_param/gotm-4.0/include  \
        $rootdir/src/mom4p1/ocean_param/gotm-4.0/turbulence  \
        $rootdir/src/mom4p1/ocean_param/gotm-4.0/util  \
        $rootdir/src/mom4p1/ocean_tracers   \
        $rootdir/src/ocean_shared/generic_tracers   \
        $rootdir/src/atmos_null  \
        $rootdir/src/coupler  \
        $rootdir/src/ice_sis  \
        $rootdir/src/ice_param  \
        $rootdir/src/rivers \
        $rootdir/src/shared/include \
        "

export LD=$FC
mkdir -p $execdir/$exe
cd $execdir/$exe

OPTS="-I$execdir/lib_fms"

LIBS="$execdir/lib_fms/lib_fms.a"

$mkmf -c "$cppDef" -f -p ${exe} -t $mkmftemplate -o "$OPTS" -l "$LIBS"  $paths
make -j $numproc
echo "#--------------------------------------------------------------------------------"