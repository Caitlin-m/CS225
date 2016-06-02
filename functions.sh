#!/bin/bash

#traps ^C
ctrlctrap()
{
	echo "       Well fine be that way"
	exit 
}

#cleans up temp files
cleanup()
{
	rm -rf /tmp/tmp.*
}

#timestamp seperated in year, month, and day
timestamp()
{
	DATE=$(date +%D -r $LINE)
        YEAR=${DATE%%/*}
        DATE=${DATE#*/}
        DAY=${DATE%%/*}
        DATE=${DATE#*/}
        MONTH=$DATE
}

#checks directory
directory()
{
	 if [ ! -d "$HOME/$YEAR/$MONTH/$DAY" ]
         then
         mkdir -p "$HOME/$YEAR/$MONTH/$DAY"
	 fi
}

#copies files
copy()
{
	cp $LINE "$HOME/$YEAR/$MONTH/$DAY"
}

#moves files
move()
{
	mv $LINE "$HOME/$YEAR/$MONTH/$DAY"
}

#ip address
check_ip()
{
        if [[ $INFO =~ ^(25[0-5]|2[0-4][0-9]|[01]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[01]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[01]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[01]?[0-9]?[0-9]) ]]
        then
                return 0
        else
                return 1
        fi
}

#social security number
check_ssn()
{
        if [[ $INFO =~ ^([0-9][0-9][0-9])-([0-9][0-9])-([0-9][0-9][0-9][0-9]) ]]
        then
                return 0
        else
                return 1
        fi
}

#phone number
check_pn()
{
        if [[ $INFO =~ ^([1-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]) ]]
        then
                return 0
        else
                return 1
        fi
}

#credit card number
check_ccn()
{
        if [[ $INFO =~ ^([0-9][0-9][0-9][0-9])([0-9][0-9][0-9][0-9])([0-9][0-9][0-9][0-9])([0-9][0-9][0-9][0-9]) ]]
        then
                return 0
        else
                return 1
        fi
}

