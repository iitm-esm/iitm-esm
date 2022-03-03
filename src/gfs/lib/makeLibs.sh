#!/bin/bash

if [ -s incmod ]; then
  echo 'incmod directory exists'
else
  mkdir incmod
fi

echo "Making bacio library"
cd "src/bacio"
chmod u+x ./makebacio.sh; ./makebacio.sh
cd -

cd "src/w3emc_v2.0.5"
chmod u+x ./makelibw3.sh; ./makelibw3.sh
cd -

cd "src/w3nco_v2.0.5"
chmod u+x ./makelibw3_nco.sh; ./makelibw3_nco.sh
cd -

if [ $? = 0 ]; then
  echo 'Compilation successful for all the libraries'
else
  echo 'Error in compilation of libraries'
  exit 1
fi

