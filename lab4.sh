#!/bin/bash

echo "Please enter a number between 50 and 100"
read NUMBER

if [ $NUMBER -eq $NUMBER 2>/dev/null ] && [ $NUMBER -ge 50] && [ $NUMBER -le 100]
then

	echo "Number is between 50 and 100"
else
	echo "Number is not between 50 and 100"

