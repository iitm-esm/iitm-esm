#!/bin/sh

# ---  qsub_mtnlsm190.384x190_128-192.sh
 set -x
# --- Create mtnvar14, orog and lsm files needed input into GFS, chgres, etc. 
# ---  
mac=$(hostname | cut -c1-1)
mac2=$(hostname | cut -c1-2)

echo " ===== mac=$mac "
#

 export machine=ZEUS
 ptmp=/home/SSPMRES/rphani
 export NCEPLIB=/home/apps/NWPROD/test/global_shared.v14.1.3/sorc/ncep_post.fd/nwprod/lib
 export ESMFDIR=${ESMFDIR:-$LIBDIR}


# --- /scratch2/portfolios/NCEPDEV/global/noscrub/Jordan.Alpert/terr/landmask/ocean_lm
# --- the Zeus qsub to create the orgmlw orog slm and mtn blocking files

#JASET   set machine
echo " ===== machine=$machine  "
#
# ---        OROG Resolution Settings
# for no filter, set filt1=jcap+1 and filt2=filt1+1 or switch with 0 0
#
export jcap=765
export latb=1536
export lonb=3088
export filt1=383
export filt2=384

# --- (*j*) 20150422 ocean governed landsea mask - set for t62 192x94 hard wire
# ---                compiles new code mtnlm7_oclsm.f located locally

first_dir=""
ptmp=ptmpp2
local_dir=""
pwd

#
#qsub -V -F"slmgb${jcap} orogb${jcap} mtnvar14_${jcap} $lonb $latb ${jcap} $filt1 $filt2 1 " orgmlw_ZEUS.sh 
qsub orgmlw_pratyush.sh

#
# submited batch job
echo " ===== ------ QSUB   MTN BLOCKING/GWD/OROG SCRIPT -----  "
echo " ===== ------ Submited batch job ...             -----  "
echo " ===== first_dir=$first_dir "
echo " ===== local_dir=$local_dir "
echo " =====      jcap=$jcap  "
echo " =====      lonb=$lonb  "
echo " =====      latb=$latb  "
echo " =====     filt1=$filt1 "
echo " =====     filt2=$filt2 "
echo " ===== ------------------------------------------------  "

#
exit

