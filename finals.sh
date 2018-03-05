#!/bin/bash
source /Projects/CS225/finalsfunctions.sh

trap CtrlC SIGNIT

SOURCE=$(find /home/finalfiles)
CLOCK=0
HOME=/home/finals

while getopts :fdh: OPT; do
	case $OPT in
		f)echo "FORCE is now turned on"
			FORCE='true';;
		d)set -x;;
		h)echo "FINALS.SH OPTIONS:
			-d	turns on debugging
			-f	moves files
			-h	displays syntax options";;
		/?)echo "The last option you used was unknown, use -h for syntax options";;
	esac
done

	shift $(($OPTIND -1))

for LINE in $SOURCE; do
	if [ -d $LINE ]; then
		timestamp
		CheckDir
	
			if [ -z $FORCE ]; then
				copy
			else
				move
			fi
	fi
Camera
done


