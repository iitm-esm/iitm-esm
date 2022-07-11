#!/bin/bash

set -e

ROOTDIR=$(pwd)
MACHINE="intel_pratyush"

debug=""
npes=8
while getopts 'dj:' flag; do
    case "${flag}" in
    d) debug=".debug" ;;
    j) npes=$OPTARG ;;
    esac
done

shift $(($OPTIND - 1))

opts=$@

EXECDIR="$ROOTDIR/exec"
SRCDIR="$ROOTDIR/src"
MKMF="$ROOTDIR/bin/mkmf"

MKMFTEMPLATE="$ROOTDIR/bin/mkmf.template.$MACHINE$debug"

. "$ROOTDIR/bin/env.$MACHINE"

rm -f $ROOTDIR/.exec_path

echo '...............Compiling lib_fms for MoM4p1.....................'
libname='lib_fms.a'
libsrc='mom4p1/shared'
builddir=$EXECDIR/$libsrc
FMS_MOM=$SRCDIR/$libsrc
paths=" \
        $FMS_MOM/astronomy \
        $FMS_MOM/column_diagnostics \
        $FMS_MOM/coupler \
        $FMS_MOM/drifters \
        $FMS_MOM/exchange \
        $FMS_MOM/fft \
        $FMS_MOM/field_manager \
        $FMS_MOM/oda_tools \
        $FMS_MOM/random_numbers \
        $FMS_MOM/sat_vapor_pres \
        $FMS_MOM/station_data \
        $FMS_MOM/topography \
        $FMS_MOM/tracer_manager \
        $FMS_MOM/tridiagonal \
        $FMS_MOM/include \
        $FMS_MOM/platform \
        $FMS_MOM/constants \
		$FMS_MOM/fms \
		$FMS_MOM/time_manager \
		$FMS_MOM/mpp \
		$FMS_MOM/diag_manager  \
		$FMS_MOM/memutils \
		$FMS_MOM/constants \
		$FMS_MOM/mpp/include \
		$FMS_MOM/data_override \
		$FMS_MOM/horiz_interp \
		$FMS_MOM/time_interp \
		$FMS_MOM/axis_utils \
		$FMS_MOM/mosaic \
        $FMS_MOM/amip_interp \
        "
lib=$builddir/$libname
mkdir -p $builddir
cd $builddir
cppDefs="-Duse_netCDF4 -Duse_libMPI -DENABLE_ODA -DUSE_OCEAN_BGC"
$MKMF -c "$cppDefs" -f -p $libname -t $MKMFTEMPLATE $paths
make -j $npes
LIB_FMS_MOM=$lib
INC_FMS_MOM=$builddir
echo '...............Done.....................'



echo "#-------------------------MAKE MOM4P1--------------------------------------"
cppDef="-Duse_netCDF4 -Duse_libMPI -DENABLE_ODA -DUSE_OCEAN_BGC"
execname="ocean.exe"
libsrc="mom4p1"
builddir=$EXECDIR/$libsrc/mom4p1
mkdir -p $builddir
cd $builddir
SRC="$SRCDIR/$libsrc"
paths=" $SRC/atmos_param/diag_integral \
        $SRC/atmos_param/monin_obukhov \
        $SRC/mom4p1/ocean_bgc  \
        $SRC/mom4p1/ocean_core  \
        $SRC/mom4p1/ocean_diag  \
        $SRC/mom4p1/ocean_param/sources  \
        $SRC/mom4p1/ocean_param/mixing  \
        $SRC/mom4p1/ocean_param/gotm-4.0/include  \
        $SRC/mom4p1/ocean_param/gotm-4.0/turbulence  \
        $SRC/mom4p1/ocean_param/gotm-4.0/util  \
        $SRC/mom4p1/ocean_tracers   \
        $SRC/ocean_shared/generic_tracers   \
        $SRC/atmos_null  \
        $SRC/coupler  \
        $SRC/ice_sis  \
        $SRC/ice_param  \
        $SRC/rivers \
        $SRC/shared/include \
        $SRCDIR/utils/nc_combine_nml.F90 \
        "
OPTS="-I$INC_FMS_MOM"
LIBS="$LIB_FMS_MOM"
export LD=$FC
$MKMF -c "$cppDef" -f -p ${execname} -t $MKMFTEMPLATE -o "$OPTS" -l "$LIBS"  $paths
make -j $npes
echo "OCEAN_EXE=$builddir/$execname" >> $ROOTDIR/.exec_path
echo "#--------------------------------------------------------------------------------"

echo "#-------------------------MAKE NC_COMBINE--------------------------------------"
cppDef="-Dlib_mppnccp2r -Duse_libMPI"
execname=nc_combine.exe
libsrc="mom4p1/postprocessing/nc_combine"
paths="$SRCDIR/$libsrc $SRCDIR/utils"
builddir=$EXECDIR/$libsrc
mkdir -p $builddir
cd $builddir
export LD=$FC
OPTS="-I$INC_FMS_MOM"
LIBS="$LIB_FMS_MOM"
$MKMF -c "$cppDef" -f -p ${execname} -t $MKMFTEMPLATE -o "$OPTS" -l "$LIBS"  $paths
make -j $numproc
echo "NC_COMBINE_EXE=$builddir/$execname" >> $ROOTDIR/.exec_path
echo "#--------------------------------------------------------------------------------"


echo "#-------------------------MAKE AOCOUPLER--------------------------------------"
cppDef="-Duse_netCDF4 -Duse_libMPI"
execname="aocoupler.exe"
libsrc="aocoupler"
paths="$SRCDIR/$libsrc"
builddir=$EXECDIR/$libsrc
export LD=$FC
mkdir -p $builddir
cd $builddir
$MKMF -c "$cppDef" -f -p ${execname} -t $MKMFTEMPLATE -o "$OPTS" -l "$LIBS"  $paths
make -j $npes
echo "COUPLER_EXE=$builddir/$execname" >> $ROOTDIR/.exec_path
echo "#--------------------------------------------------------------------------------"

echo '...............Compiling lib_bacio.....................'
cppDefs=""
libname='lib_bacio.a'
libsrc='gfs/lib/bacio'
builddir=$EXECDIR/$libsrc
paths=$SRCDIR/$libsrc
lib=$builddir/$libname
mkdir -p $builddir
cd $builddir

$MKMF -c "$cppDefs" -f -p $libname -t $MKMFTEMPLATE $paths
make -j $npes
LIB_BACIO=$lib
INC_BACIO=$builddir
echo '...............Done.....................'

echo '...............Compiling lib_w3nco.....................'
cppDefs="-DLINUX"
libname='lib_w3nco.a'
libsrc='gfs/lib/w3nco_v2.0.5'
builddir=$EXECDIR/$libsrc
paths=$SRCDIR/$libsrc
lib=$builddir/$libname
mkdir -p $builddir
cd $builddir

$MKMF -c "$cppDefs" -f -p $libname -t $MKMFTEMPLATE $paths
make -j $npes
LIB_W3NCO=$lib
INC_W3NCO=$builddir
echo '...............Done.....................'

echo '...............Compiling lib_w3emc.....................'
cppDefs="-DLINUX"
libname='lib_w3emc.a'
libsrc='gfs/lib/w3emc_v2.0.5'
builddir=$EXECDIR/$libsrc
paths=$SRCDIR/$libsrc
lib=$builddir/$libname
mkdir -p $builddir
cd $builddir

$MKMF -c "$cppDefs" -f -p $libname -t $MKMFTEMPLATE $paths
make -j $npes
LIB_W3EMC=$lib
INC_W3EMC=$builddir
echo '...............Done.....................'

echo '...............Compiling gfsio lib.....................'
libname='lib_gfsio.a'
libsrc='gfs/lib/gfsio'
builddir=$EXECDIR/$libsrc
paths=$SRCDIR/$libsrc
lib=$builddir/$libname
mkdir -p $builddir
cd $builddir

sed "s/\-r8//g" $MKMFTEMPLATE > mkmf.template
$MKMF -c "$cppDefs" -f -p $libname -t mkmf.template $paths
make -j $npes
LIB_GFSIO=$lib
INC_GFSIO=$builddir
echo '...............Done.....................'


echo '...............Compiling lib_fms_gfs.....................'
cppDefs="-Duse_netCDF -Duse_libMPI -DENABLE_ODA -Dfms_interp" # -Dtest_interp"
libname='lib_fms_gfs.a'
libsrc='gfs/shared'
builddir=$EXECDIR/$libsrc
SRC=$SRCDIR/$libsrc
paths="$SRC/mpp $SRC/include \
       $SRC/mpp/include \
       $SRC/fms $SRC/platform \
       $SRC/memutils $SRC/constants \
       $SRC/horiz_interp $SRC/mosaic \
       "
lib=$builddir/$libname
mkdir -p $builddir
cd $builddir

$MKMF -c "$cppDefs" -f -p $libname -t $MKMFTEMPLATE $paths
make -j $npes
LIB_FMS_GFS=$lib
INC_FMS_GFS=$builddir
echo '...............Done.....................'


echo "#-------------------------MAKE GFS--------------------------------------"
cppDefs="-Duse_netCDF -Duse_libMPI -DENABLE_ODA -Dfms_interp" # -Dtest_interp"
execname="atm.exe"
libsrc="gfs"
SRC="$SRCDIR/$libsrc"
paths="$SRC/model $SRC/shared/include $SRC/shared/diag_manager $SRCDIR/utils/nc_combine_nml.F90"
builddir=$EXECDIR/$libsrc/gfs
export LD=$FC
mkdir -p $builddir
cd $builddir
OPTS="-I$INC_GFSIO -I$INC_BACIO -I$INC_W3NCO -I$INC_W3EMC -I$INC_FMS_GFS"
LIBS="$LIB_GFSIO $LIB_BACIO $LIB_W3EMC $LIB_W3NCO $LIB_FMS_GFS"
$MKMF -c "$cppDefs" -f -p ${execname} -t $MKMFTEMPLATE -o "$OPTS" -l "$LIBS"  $paths
make -j $npes
echo "ATM_EXE=$builddir/$execname" >> $ROOTDIR/.exec_path
echo "#--------------------------------------------------------------------------------"



echo "#-------------------------MAKE NC_COMBINE_GFS--------------------------------------"
cppDefs="-Duse_netCDF -Duse_libMPI -DENABLE_ODA -Dlib_mppnccp2r -DnotInterp"
execname="nc_combine_gfs.exe"
libsrc="gfs"
SRC="$SRCDIR/$libsrc"
paths="$SRC/postprocessing/nc_combine_gfs $SRC/shared/include \
       $SRC/shared/diag_manager $SRC/model/time_manager.F90 \
       $SRCDIR/utils"
builddir=$EXECDIR/$libsrc/nc_combine_gfs
export LD=$FC
mkdir -p $builddir
cd $builddir
OPTS="-I$INC_FMS_GFS"
LIBS="$LIB_FMS_GFS"
$MKMF -c "$cppDefs" -f -p ${execname} -t $MKMFTEMPLATE -o "$OPTS" -l "$LIBS"  $paths
make -j $npes
echo "NC_COMBINE_ATM_EXE=$builddir/$execname" >> $ROOTDIR/.exec_path
echo "#--------------------------------------------------------------------------------"


echo "#------------------------- PLEVEL --------------------------------------"
cppDefs="-Duse_netCDF "
execname="plevel.exe"
libsrc="gfs"
SRC="$SRCDIR/$libsrc"
paths="$SRC/postprocessing/plevel"
builddir=$EXECDIR/$libsrc/plevel
export LD=$FC
mkdir -p $builddir
cd $builddir
OPTS="-I$INC_FMS_GFS"
LIBS="$LIB_FMS_GFS"
$MKMF -c "$cppDefs" -f -p ${execname} -t $MKMFTEMPLATE -o "$OPTS" -l "$LIBS"  $paths
make -j $npes
echo "PLEVEL_EXE=$builddir/$execname" >> $ROOTDIR/.exec_path
echo "#--------------------------------------------------------------------------------"

echo "#------------------------- REGRID --------------------------------------"
cppDefs="-Duse_netCDF -Duse_netCDF3 -Duse_libMPI "
execname="regrid.exe"
libsrc="mom4p1"
SRC="$SRCDIR/$libsrc"
paths="$SRC/postprocessing/regrid"
builddir=$EXECDIR/$libsrc/regrid
export LD=$FC
mkdir -p $builddir
cd $builddir
OPTS="-I$INC_FMS_MOM"
LIBS="$LIB_FMS_MOM"
$MKMF -c "$cppDefs" -f -p ${execname} -t $MKMFTEMPLATE -o "$OPTS" -l "$LIBS"  $paths
make -j $npes
echo "REGRID_EXE=$builddir/$execname" >> $ROOTDIR/.exec_path
echo "#--------------------------------------------------------------------------------"

