#!/bin/bash

usage()
{
  echo "Usage: $0 -n | --name <EXPERIMENT NAME>
                [ -p | --path <path to create experiment directory> ]
                [ -f | --force ]
        "
  exit 2
}

error()
{
    echo "Error: $1"
    exit 1
}

EXP_NAME=''
FORCE=false
WORKPATH='work'

VALID_ARGS=$(getopt -o fp:n: --long name:,path:,force -- "$@")
if [[ $? -ne 0 ]]; then
    usage;
fi

eval set -- "$VALID_ARGS"
while [ : ]; do
  case "$1" in
    -f | --force)
        FORCE=true
        shift
        ;;
    -n | --name)
        EXP_NAME=$2
        shift 2
        ;;
    -p | --path)
        WORKPATH=$2
        shift 2
        ;;
    --) shift; 
        break 
        ;;
  esac
done

[[ -z "$EXP_NAME" ]] && usage

ROOTDIR=$(pwd)
EXPDIR="$WORKPATH/$EXP_NAME"

if [ -f "$EXPDIR" ]; then
    error "A file $EXPDIR already exist. Can't create experiment directory with is path!!"
fi

if [ -e "$EXPDIR" ]; then
    if [ "$FORCE" != "true" ]; then
        error "Path $EXPDIR already exist.!!"
    fi
else
    mkdir -p $EXPDIR
fi

. $ROOTDIR/.exec_path

. $ROOTDIR/scripts/submit_main.pbs > $EXPDIR/submit_main.pbs || error "Error while creating submit_main.pbs"
. $ROOTDIR/scripts/submit_plevel.pbs > $EXPDIR/submit_plevel.pbs || error "Error while creating submit_plevel.pbs"
mkdir -p $EXPDIR/INPUT || error "Could not make dir $EXPDIR/INPUT "
mkdir -p $EXPDIR/RESTART || error "Could not make dir $EXPDIR/RESTART "





