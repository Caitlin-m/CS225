#!/bin/bash

while getopts :dvhn:l: OPT ;do
	case $OPT in
		d) set -x;;
		v) echo "VERBOSE variable is now set to true" 
				vision=true;;
		h) echo "LAB9.SH OPTIONS:
			-d 	turns on debugging
			-v 	sets verbose to true
			-h 	prints help message
			-n 	takes name argument and prints message
			-l 	lists directory using for loop (asks Y/N)";;
		n)NAME=$OPTARG
			echo "$NAME";;
		l)DIRNAME=$OPTARG
			if [[ -z $DIRNAME ]]
				then
				echo "Please enter a directory name"
			fi
			echo "Would you like to loop through $DIRNAME (Y/N?)"
				read RESPONSE
			if echo $RESPONSE | grep -qi "^y"
			then
				ls $DIRNAME
			else
				exit 1
			fi;;
		\?) echo "The last option you used was unknown. Use -h for help";;
	esac
done
shift $(($OPTIND -1))

