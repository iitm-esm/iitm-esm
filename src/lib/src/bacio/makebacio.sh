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
###############################################################

#
#     Remove make file, if it exists.  May need a new make file
#
if [ -f make.bacio ] 
then
  rm -f make.bacio
fi
#
#     Generate a make file ( make.bacio) from this HERE file.
#
cat > make.bacio << EOF
SHELL=/bin/sh
ncepxlc=$CC
ncepxlf=$FC

\$(LIB):	\$(LIB)( bacio.v1.4.o baciof.o bafrio.o )

\$(LIB)(bacio.v1.4.o):       bacio.v1.4.c \$(INC)
	ln -fs \$(INC) clib.h
	\$(ncepxlc) -c \$(CFLAGS) bacio.v1.4.c
	ar -rv \$(AFLAGS) \$(LIB) bacio.v1.4.o
#	rm clib.h

\$(LIB)(baciof.o):   baciof.f
	\$(ncepxlf) -c \$(FFLAGS) baciof.f
	ar -rv \$(AFLAGS) \$(LIB) baciof.o 

\$(LIB)(bafrio.o):   bafrio.f
	\$(ncepxlf) -c \$(FFLAGS) bafrio.f
	ar -rv \$(AFLAGS) \$(LIB) bafrio.o 
	rm -f baciof.o bafrio.o clib.h
EOF

 export LIB="${ESM_HOME}/src/lib/libbacio_d.a"
 export INC="clibd.h"
 export FFLAGS=" -O3 -xAVX -i4 -r8"
 export AFLAGS=" "
 export CFLAGS=" -O3  -xAVX -longlong"
 make -f make.bacio
 rm -f make.bacio *.o *.mod
