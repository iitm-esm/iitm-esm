#!/bin/bash

export ESM_HOME=/home/CMIP/prajeesh/iitm-esm/

if [ -s ${ESM_HOME}/src/lib/incmod ]; then
  echo 'incmod directory exists'
else
  mkdir ${ESM_HOME}/src/lib/incmod
fi

echo "Making bacio library"
#cd ${ESM_HOME}/src/lib/src/bacio
#chmod u+x ./makebacio.sh; ./makebacio.sh

cd ${ESM_HOME}/src/lib/src/w3emc_v2.0.5
chmod u+x ./makelibw3.sh; ./makelibw3.sh

#cd ${ESM_HOME}/src/lib/src/w3nco_v2.0.5
#chmod u+x ./makelibw3_nco.sh; ./makelibw3_nco.sh

