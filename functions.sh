#!/bin/bash

#traps ^C
ctrlctrap()
{
	trap "echo Don\'t do that" SIGINT
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

