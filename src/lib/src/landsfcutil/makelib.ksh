#!/bin/ksh
#-----------------------------------------------------------------
#
# script: makelib.ksh
#    prgmmr: george gayno     ORG: NP2      DATE: 2005-09-15
#
# abstract: 
#    builds sfcutil libraries with either 4 or d byte floats.
#
# usage:
#    takes one command line argument. 
#    type "makelib.ksh 4" for 4 byte version
#    type "makelib.ksh d" for d byte version
#    type "makelib.ksh clean to remove both libraries
#
#-----------------------------------------------------------------

if [ `uname -s` == "Linux" ];then
. ./makefile.linux.conf
elif [ `uname -s` == "AIX" ];then 
. ./makefile.aix.conf
else
  exit 99
fi

if [[ $1 = 4 ]]
then
  echo Will build library with 4 byte floats.
  export FCOMP
  export AFLAGS
  export FFLAGS=$FFLAGS_4
  export MOD_DIR=$MOD_DIR_4
  export LIB=${ESM_HOME}/src/lib/liblandsfcutil_4.a
  if [ -s $MOD_DIR ]
  then
     echo $MOD_DIR existed.
  else
     echo $MOD_DIR not existed. Creating ....
     mkdir -p -m 775 $MOD_DIR
  fi 
  make clean
  make
elif [[ $1 = d ]]
then
  echo Will build library with d byte floats.
  export FCOMP
  export AFLAGS
  export FFLAGS=$FFLAGS_D
  export MOD_DIR=$MOD_DIR_D
  export LIB=${ESM_HOME}/src/lib/liblandsfcutil_d.a
  if [ -s $MOD_DIR ] 
  then
     echo $MOD_DIR existed.
  else
     echo $MOD_DIR not existed. Creating ....
     mkdir -p -m 775 $MOD_DIR
  fi
  make clean
  make
elif [[ $1 = "clean" ]]
then
  export MOD_DIR=$MOD_DIR_4
  export LIB=${ESM_HOME}/src/lib/liblandsfcutil_4.a
  make clean 
  export MOD_DIR=$MOD_DIR_D
  export LIB=${ESM_HOME}/src/lib/liblandsfcutil_d.a
  make clean 
else
  echo Must choose either 4 or d byte option.
  exit 1
fi

exit 0
