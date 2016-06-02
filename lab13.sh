#!/bin/bash
source /Projects/CS225/functions.sh

trap ctrlctrap SIGINT

echo "Please enter you informantion:"
read INFO

if [[ -z $INFO ]]
	then
	echo "Try entering something next time."
	exit
fi

if check_ip $INFO
then
	echo "Valid: IP"
else
	:
fi

if check_ssn $INFO
then
	echo "Valid: SSN"
else
	:
fi

if check_pn $INFO
then
	echo "Valid: PHONE NUMBER"
else
	:
fi

if check_ccn $INFO
then
	echo "Valid: CREDIT CARD NUMBER"
else
	:
fi
