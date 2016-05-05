#!/bin/bash

VAR=$(tail -n 1 /var/share/CS225/addresses.csv)

FNAME=${VAR%%,*}
VAR=${VAR#*,}
	echo "FIRST NAME: $FNAME"

LNAME=${VAR%%,*}
VAR=${VAR#*,}
	echo "LAST NAME: $LNAME"

COMPANY=${VAR%%,*}
VAR=${VAR#*,}
	echo "COMPANY: $COMPANY"

STREET=${VAR%%,*}
VAR=${VAR#*,}
	echo "STREET: $STREET"

CITY=${VAR%%,*}
VAR=${VAR#*,}
	echo "CITY: $CITY"

STATE=${VAR%%,*}
VAR=${VAR#*,}
	echo "STATE: $STATE"

COUNTY=${VAR%%,*}
VAR=${VAR#*,}
	
ZIP=${VAR%%,*}
VAR=${VAR#*,}
	echo "ZIP: $ZIP"

HPHONE=${VAR%%,*}
VAR=${VAR#*,}
	echo "HOME PHONE: $HPHONE"

WPHONE=${VAR%%,*}
VAR=${VAR#*,}
	echo "WORK PHONE: $WPHONE"

EMAIL=${VAR%%,*}
VAR=${VAR#*,}
	echo "EMAIL: $EMAIL"

WEBURL=${VAR%%,*}
VAR=${VAR#*,}
	echo "WEBURL: $WEBURL"
