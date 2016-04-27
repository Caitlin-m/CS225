#!/bin/bash

# Checks UID if root says it's insucre to run this script, if not displays size of home directory

#checks if it's run by root, if true exits
if [[ "$(id -u)" = "0" ]]
then

	echo "It is not secure to run this script as root, please log in as regular user"
		exit 1
fi

#checks if UID is less than 500, if true exits
if [[ "$(id -u)" -lt "500" ]]
then

	echo "UID less than 500, please log in as a regular user to run script"
		exit 1
fi

#check if UID equils or is greater than 500, if true displays size of home directory
if [[ "$(id -u)" -ge "500" ]]

then

	[[ -f "/etc/passwd.txt" ]] && [[ -r "/etc/passwd.txt" ]]
	
	echo "the size of your home directory is:"

	grep `whoami` /etc/passwd | awk /home/* | du -sh

fi
