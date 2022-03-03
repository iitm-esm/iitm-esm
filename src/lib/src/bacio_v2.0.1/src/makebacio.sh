#!/bin/sh
###############################################################
#
#   AUTHOR:    Gilbert - W/NP11
#
#   DATE:      01/11/1999
#
#   PURPOSE:   This script uses the make utility to update the bacio 
#              archive libraries.
#
#
###############################################################
#
#
#
#     Remove make file, if it exists.  May need a new make file
#
if [ -f make.bacio ] ;  then
  rm -f make.bacio
fi
#
#     Generate a make file ( make.bacio) from this HERE file.
#
cat > make.bacio << EOF
SHELL=/bin/sh

\$(LIB):	\$(LIB)( bacio.o baciof.o bafrio.o byteswap.o chk_endianc.o)

\$(LIB)(bacio.o):       bacio.c clib.h
	\${CCMP} -c \$(CFLAGS) bacio.c
	ar -rv \$(AFLAGS) \$(LIB) bacio.o

\$(LIB)(baciof.o):   baciof.f
	\${FCMP} -c \$(FFLAGS) baciof.f
	ar -rv \$(AFLAGS) \$(LIB) baciof.o 

\$(LIB)(bafrio.o):   bafrio.f
	\${FCMP} -c \$(FFLAGS) bafrio.f
	ar -rv \$(AFLAGS) \$(LIB) bafrio.o 

\$(LIB)(byteswap.o):       byteswap.c 
	\${CCMP} -c \$(CFLAGS) byteswap.c
	ar -rv \$(AFLAGS) \$(LIB) byteswap.o

\$(LIB)(chk_endianc.o):       chk_endianc.f 
	\${FCMP} -c \$(FFLAGS) chk_endianc.f
	ar -rv \$(AFLAGS) \$(LIB) chk_endianc.o
	rm -f baciof.o bafrio.o bacio.o *.mod byteswap.o chk_endianc.o

EOF

#
export FCMP=${1:-ifort}
export CCMP=${2:-icc}
#
#     Update 4-byte version of libbacio_4.a
#
export LIB="${ESM_HOME}/src/lib/libbacio_v2.0.1_4.a"

export FFLAGS=" -O3 -xHOST -traceback"
export AFLAGS=" "
export CFLAGS=" -O3 -DUNDERSCORE -DLINUX"
make -f make.bacio
#
#     Update 8-byte version of libbacio_8.a
#
export LIB="${ESM_HOME}/src/lib/libbacio_v2.0.1_8.a"

export FFLAGS=" -O3 -i8 -r8 -xHOST -traceback"
export AFLAGS=" "
#export CFLAGS=" -O3"
export CFLAGS=" -O3 -DUNDERSCORE -DLINUX"
make -f make.bacio
#
#     Update double version of libbacio_d.a
#
export LIB="${ESM_HOME}/src/lib/libbacio_v2.0.1_d.a"

export FFLAGS=" -O3 -i4 -r8 -xHOST -traceback"
export AFLAGS=" "
#export CFLAGS=" -O3"
export CFLAGS=" -O3 -DUNDERSCORE -DLINUX"
make -f make.bacio

 rm -f make.bacio
