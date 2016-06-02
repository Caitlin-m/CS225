#!/bin/bash
source /Projects/CS225/functions.sh

trap crtlctrap SIGINT

echo "Please enter you informantion:"
read INFO

if [[ -z $INFO ]]
then
echo "Try entering something next time."
exit
fi

#ip address
check_ip()
{
	if [[ $INFO =~ ^(25[0-5]|2[0-4][0-9]|[01]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[01]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[01]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[01]?[0-9]?[0-9]) ]]
	then
		return "0"
	else 
		return "1"
	fi
}

#social security number
check_ssn()
{
	if [[ $INFO =~ ^([0-9]|[0-9]|[0-9])\-([0-9]|[0-9])\-([0-9]|[0-9]|[0-9]|[0-9]) ]]
	then
		return "0"
	else
		return "1"
	fi
}

#phone number
check_pn()
{
	if [[ $INFO =~ ^([1-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]) ]]
	then
		return "0"
	else 
		return "1"
	fi
}

#credit card number
check_ccn()
{
	if [[ $INFO =~ ^([0-9][0-9][0-9][0-9])[[:blank:]]([0-9][0-9][0-9][0-9])[[:blank:]]([0-9][0-9][0-9][0-9]) ]]
	then
		return "0"
	else
		return "1"
	fi
}

