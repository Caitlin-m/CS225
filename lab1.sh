#!/bin/bash
##Checks to see if a number is less than, equil or greater than 5

echo " Enter a number, please"
read NUMBER

if [[ "$NUMBER" -lt 5 ]] ;then

	echo "Number is less than 5"
else
	echo "Number is 5 or greater"

fi
