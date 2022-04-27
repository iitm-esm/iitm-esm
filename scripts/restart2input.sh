#!/bin/bash
set -e

skipfiles="coupler.intermediate.res ocean_tracer.res run_timestamp"

if [ -z "$1" ]; then
	timestamp=""
else
  timestamp="${1}."
fi

echo $timestamp

if [ ! -e ._restart_file_list ]; then

	cd RESTART
	allfilelist=$(ls *)
	cd -
	
	tmplist=""
	for file in $allfilelist; do
		if [ "${file:0:2}" -eq "${file:0:2}" ] 2> /dev/null
		then
			file=${file:16}
	  fi
	  if [[ ${skipfiles/$file} != ${skipfiles} ]]; then
			continue
		fi
		tmplist="$tmplist ${file}"
	done
	
	filelist=$(echo $tmplist | xargs -n1 | sort -u)
else
  echo "restart_file_list file exist!"	
	filelist=$(cat ._restart_file_list)

fi

for i in $filelist
do
	if [ -e RESTART/$timestamp$i ]; then
		echo RESTART/$timestamp$i INPUT/$i
		cp -f RESTART/$timestamp$i INPUT/$i
  else
    echo "Error file no found: " RESTART/$timestamp.$i
		exit 1
  fi
done

if [ ! -e ._restart_file_list ]; then
	for i in $filelist
	do
		echo $i >> ._restart_file_list
	done
fi


