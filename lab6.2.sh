#!/bin/bash

MEDIALAB=$(ls -1 /home/medialab)
MEDIAXML=$(cat /home/medialab/media.xml)
XML=$(grep "filename" /home/medialab/media.xml | awk -F '>' '{print $2}' | awk -F '<' '{print $1}')
	

echo "files not found in media.xml:"
for ITEM in $MEDIALAB
do
	if ! grep -q $ITEM /home/medialab/media.xml
	then
		echo "$ITEM"
		(( FILECounter++ ))
	fi
done



echo "files not in medialab:"
for LINE in $XML
do
	if [[ -e /home/medialab/$LINE ]]
	then
		echo "$LINE"
		(( LINECounter++ ))
	fi
done

echo "$FILECounter files in medialab that are not in media.xml"
echo "$LINECounter files in media.xml that are not in medialab"

