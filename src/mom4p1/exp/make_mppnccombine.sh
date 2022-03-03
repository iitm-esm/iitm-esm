
LDFLAGS="-L/gpfs1/home/Libs/INTEL/NETCDF4/netcdf-4.1.3/lib -lnetcdf -lnetcdff"
INCL="-I/gpfs1/home/Libs/INTEL/NETCDF4/netcdf-4.1.3/include"

icc -O -o ../bin/mppnccombine $INCL $LDFLAGS ../src/postprocessing/mppnccombine/mppnccombine.c
