#!/bin/bash
if [ -s ${ESM_HOME}/src/lib/incmod ]; then
  echo 'incmod directory exists'
else
  mkdir ${ESM_HOME}/src/lib/incmod
fi

echo "Making bacio library"
cd ${ESM_HOME}/src/lib/src/bacio
chmod u+x ./makebacio.sh; ./makebacio.sh

echo "Making bacio library version 2.0.1"
cd ${ESM_HOME}/src/lib/src/bacio_v2.0.1/src
chmod u+x ./makebacio.sh; ./makebacio.sh

echo "Making gfsio library"
cd ${ESM_HOME}/src/lib/src/gfsio_v1.1.0
chmod u+x ./make.sh; ./make.sh

echo "Making ip library"
cd ${ESM_HOME}/src/lib/src/ip/src
chmod u+x ./makelibip.sh; ./makelibip.sh

echo "Making landsfcutil library"
cd ${ESM_HOME}/src/lib/src/landsfcutil
chmod u+x ./makelib.ksh; ./makelib.ksh 4; ./makelib.ksh d;

echo "Making nemsio library"
cd ${ESM_HOME}/src/lib/src/nemsio
chmod u+x ./compile; ./compile

echo "Making sfcio library"
cd ${ESM_HOME}/src/lib/src/sfcio
chmod u+x ./make.sh; ./make.sh

echo "Making sigio library versions 1.0.0 & 1.0.1"
cd ${ESM_HOME}/src/lib/src/sigio/v1.0.0/sorc
chmod u+x ./make.sh; ./make.sh

cd ${ESM_HOME}/src/lib/src/sigio/v1.0.1/sorc
chmod u+x ./make.sh; ./make.sh


echo "Making sp library"
cd ${ESM_HOME}/src/lib/src/sp
chmod u+x makelibsp.sh_Linux; ./makelibsp.sh_Linux

echo "Making w3emc & w3emc v2.0.5 library"
cd ${ESM_HOME}/src/lib/src/w3emc
chmod u+x ./makelibw3.sh; ./makelibw3.sh

cd ${ESM_HOME}/src/lib/src/w3emc_v2.0.5
chmod u+x ./makelibw3.sh; ./makelibw3.sh

echo "Making w3nco & w3nco v2.0.5 library"
cd ${ESM_HOME}/src/lib/src/w3nco
chmod u+x ./makelibw3_nco.sh; ./makelibw3_nco.sh

cd ${ESM_HOME}/src/lib/src/w3nco_v2.0.5
chmod u+x ./makelibw3_nco.sh; ./makelibw3_nco.sh

if [ $? = 0 ]; then
  echo 'Compilation successful for all the libraries'
else
  echo 'Error in compilation of libraries'
  exit 1
fi

