#!/bin/bash
#Prompts the user for a number, ensure it's a number and check to see if it's an even or odd number.

echo "Enter a number, please"
read NUMBER

#cleans number if it's has leading zeros
CLEAN_NUMBER=$(echo $NUMBER | sed 's/^0*//' | sed 's/[.].*$//')

#checks if it's a number
if [ $CLEAN_NUMBER -eq $CLEAN_NUMBER 2>/dev/null ]
then
#if it is it checks if it's even or add
	if [ "$(( CLEAN_NUMBER % 2 ))" -ne 0 ]
	then

   		echo "$CLEAN_NUMBER is an odd number."

	else

   		echo "$CLEAN_NUMBER is an even number."
	
	fi
#if it's not a number
else
	echo "Please enter a valid number"

fi
