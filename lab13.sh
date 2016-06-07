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
	echo "VALID: IP"
else
	echo "INVALID: IP"
fi

if check_ssn $INFO
then
	echo "VALID: SSN"
else
	echo "INVALID: SSN"
fi

if check_pn $INFO
then
	echo "VALID: PHONE NUMBER"
else
	echo "INVALID: PHONE NUMBER"
fi

if check_ccn $INFO
then
	echo "VALID: CREDIT CARD NUMBER"
else
	echo "INVALID: CREDIT CARD NUMBER"
fi
