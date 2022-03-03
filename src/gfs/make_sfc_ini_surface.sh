set -e

cppDef="-Dlib_xgrid -Duse_netCDF -Duse_libMPI -DENABLE_ODA -Dfms_interp" # -Dtest_interp"

export srcdir=$(pwd)

thisdir=$(pwd)

EXE="sfc_initToSurface"

execdir="$thisdir/exec/"
mkmf="$thisdir/bin/mkmf"

srcnor8="sfcio_module.f90 sigio_module.f90 gfsio_def.f90 gfsio_module.f90 sigio_r_module.f90 bafrio.f"

mkmftemplate="$thisdir/bin/mkmf.template"

paths="$thisdir/model/sfcio_module.f90 \
  $thisdir/sfc_ini_surface \
	$thisdir/shared/mpp \
	$thisdir/shared/include \
  $thisdir/shared/mpp/include \
  $thisdir/shared/fms \
	$thisdir/shared/platform \
  $thisdir/shared/memutils \
	$thisdir/shared/constants"

mkdir -p $execdir
cd $execdir

$mkmf -c "$cppDef" -f -p $EXE -t $mkmftemplate $paths

sed -i s'/(FFLAGS)/(FFLAGS) \-r8/' Makefile

for src in $srcnor8; do
  echo Removing -r8 option for $src
	sed -i -e "/$src/ s/\-r8//" Makefile
done
	
make $@

