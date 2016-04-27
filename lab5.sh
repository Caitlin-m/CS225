#!/bin/bash
#Loops through medialist.txt  and check whick files exist in medialab, if it does the it pipes it to foundfiles.txt, if it's lost then lostfiles.txt


rm -f /home/foundfiles.txt
rm -f /home/lostfiles.txt

MEDIALIST=$(cat /home/medialab/medialist.txt)

for LINE in $MEDIALIST
	do
		if [[ -e /home/medialab/"$LINE" ]]
			then
				echo "$LINE Exists" >>/home/foundfiles.txt
			else
				echo "$LINE Does Not Exist" >>/home/lostfiles.txt
		fi
done
		

