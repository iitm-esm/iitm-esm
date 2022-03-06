#!/bin/bash

startdate=2011,04,04,00,00,00
calendar_type=2
enddate=2013,04,05,00,00,00
icepes=36

#USER DEFINED PARAMETERS

# queue - Queue name
queue="cccr"

# WCLOCK - Wall clock limit (in hours)
WCLOCK="240"

# JOBNAME - Name of the Job
JOBNAME="ESM_OCN"

# submit_combine - if "False" do not submit postprocessing
submit_combine=True

# nproc_combine - number of processors for postproc
nproc_combine=36

# combine_only - if "True" submit postprocessing only
combine_only=True

# combine_child_run - if "1" postprocessing is submitted as child run of model run, 
#                     else as independent run
combine_child_run=0

RUNNCCP2R=/home/CMIP/prajeesh/iitm-esm/exec/mom4p1/postprocessing/nc_combine/nc_combine.exe


# END OF USER DEFINED PARAMETERS

#--------------------------------------------------------------------------------   
#--------------------------------------------------------------------------------   
#--------------------------------------------------------------------------------   
#--------------------------------------------------------------------------------   
#--------------------------------------------------------------------------------   
#-------------------------------------------------------------------------------- 

STDOUT="stdout"_$JOBNAME

if [ ! "$submit_combine" == "True" ]; then
    combine_only=False
fi

lsf=True
if ! [ -x "$(command -v qsub)" ]; then
	lsf=False
	echo "Error: Cannot find pbs commands"
	exit 1
fi

bypassrunning=False
if [ "$combine_only" == "True" ]; then
	if [ "$combine_child_run" -eq "1" ]; then
		bypassrunning=True
	fi
fi

if [ ! "$bypassrunning" == "True" ];then
if [ "$lsf" == "True" ]; then
	alljobs=$(bjobs -noheader -o 'exec_cwd jobid job_name' 2>/dev/null | grep "$(pwd) ")
    alljobs=$(qstat -f  | grep "PBS_O_WORKDIR=$(pwd),")
	if [ ! -z "$alljobs" ]; then
		echo "Some jobs are already running in this directory!"
	    echo "Please kill these jobs before submitting!"
		exit 1
	fi
fi
fi

line1=$(sed -n '/&atmos_nml/,/\//p' input.nml | \
		sed -n '/layout/,/\//p' | \
		sed 's/=/ /g' | sed 's/,/ /g' | sed -e 's/\(.*\)/\L\1/')

found=0
npes=0
for strng in $line1; do
	if [ "$found" -gt "2" ]; then
		break
	elif [ "$found" -gt "0" ]; then
		found=$((found+1))
		npes=$((npes*strng))
	elif [[ "$strng" == layout ]]; then
		found=1
	fi
done

echo "NPES = "$npes 

if [ "$npes" -eq "1" ]; then
	submit_combine=False
fi

STDOUT=${STDOUT}

ppn=36
nnodes=$((npes/ppn))
rem=$((npes%ppn))
if [ "$rem" -gt "0" ]; then
	nnodes=$((nnodes+1))
fi


tfile=$(mktemp)
echo $tfile
cat <<EOF > $tfile

#!/bin/bash

#PBS -q $queue
#PBS -l nodes=$nnodes:ppn=$ppn
#PBS -l walltime=${WCLOCK}:00:00
#PBS -N $JOBNAME
#PBS -j oe
####PBS -o $STDOUT 


machine=$(cat /home/cccr/shikha/models/spec2d/bin/._machine_)
source /home/cccr/sandeep/ESM/modules
ulimit -c unlimited
set -xu
cd \$PBS_O_WORKDIR
export OMP_NUM_THREADS=1

aprun -n $npes $EXE &> $STDOUT

EOF

if [ "$submit_combine" == "True" ]; then
	if [ ! "$combine_only" == "True" ]; then
		echo "Removing any previous unprocessed output files."
		#rm -f *.nc.????
		find . -name "*.nc.*" -delete
	fi
fi

if [ "$combine_only" == "True" ]; then
	echo "Only combine"
	COND=""
else
	rm -f $STDOUT
  	cat $tfile
	if [ "$lsf" == "True" ]; then
		output=$(qsub < $tfile)
		echo $output
		jobid=$(echo $output | awk -F "." '{print $1}')
		if [ "$jobid" -eq "$jobid" ] 2>/dev/null; then
		  	echo "Job submitted" 
		else
			echo $jobid
		  	echo "Job not submitted" 
		  	exit 1
		fi
		COND="PBS -W depend=after:$jobid"
	else
		bash $tfile
	fi
fi

if [ "$submit_combine" == "True" ]; then

WCLOCK=$((WCLOCK*2))

ppn=36
nnodes=$((nproc_combine/ppn))
rem=$((nproc_combine%ppn))
if [ "$rem" -gt "0" ]; then
	nnodes=$((nnodes+1))
fi

cat <<EOF > ._nccombine.nml
&opts_nml 
removein=1, 
atmpes=$icepes, 
child_run=$combine_child_run, 
startdate=$startdate, 
calendar_type=$calendar_type, 
enddate=$enddate /
EOF

tfile=$(mktemp)
echo $tfile
cat <<EOF > $tfile

#!/bin/bash

#PBS -q $queue
#PBS -l nodes=$nnodes:ppn=$ppn
#PBS -l walltime=${WCLOCK}:00:00
#PBS -N ${JOBNAME}_combine
#PBS -j oe
####PBS -o $STDOUT 
#$COND

source /home/cccr/sandeep/ESM/modules
ulimit -c unlimited
set -xu
cd \$PBS_O_WORKDIR

aprun -n $nproc_combine $RUNNCCP2R &> ${STDOUT}_combine
EOF

rm -f ${STDOUT}_combine

cat $tfile
if [ "$lsf" == "True" ]; then
	qsub < $tfile
else 
	bash $tfile
fi

fi
