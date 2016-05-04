#!/bin/bash

shopt -s extglob; echo "${VAR%%+(/)}"

if [[ -z $1 ]]
then
	echo "please try basename, it almost definitely works better than this"
		exit 1
fi

if [[ $1 == / ]]
then
	echo "/"
		exit 1
fi

VAR=$1
VAR=${VAR%/}

echo ${VAR##*/}
