#!/bin/bash
source /Projects/CS225/functions.sh

#ctrlctrap

CLOCK=0
CSV=$(cat /var/share/CS225/addresses.csv)
OLDIFS="$IFS"
IFS=$'\n'

declare -a FNAME
declare -a LNAME
declare -a COMPANY
declare -a STREET
declare -a CITY
declare -a STATE
declare -a COUNTY
declare -a ZIP
declare -a HPHONE
declare -a WPHONE
declare -a EMAIL
declare -a WEBURL

for VAR in $CSV
do
FNAME[$CLOCK]=${VAR%%\"*}
VAR=${VAR#*,\"}

LNAME[$CLOCK]=${VAR%%\"*}
VAR=${VAR#*,\"}
	
COMPANY[$CLOCK]=${VAR%%\"*}
VAR=${VAR#*,\"}
	
STREET[$CLOCK]=${VAR%%\"*}
VAR=${VAR#*,\"}
	
CITY[$CLOCK]=${VAR%%\"*}
VAR=${VAR#*,\"}
	
STATE[$CLOCK]=${VAR%%\"*}
VAR=${VAR#*,\"}
	
COUNTY[$CLOCK]=${VAR%%\"*}
VAR=${VAR#*,\"}
		
ZIP[$CLOCK]=${VAR%%\"*}
VAR=${VAR#*,\"}

HPHONE[$CLOCK]=${VAR%%\"*}
VAR=${VAR#*,\"}
	
WPHONE[$CLOCK]=${VAR%%\"*}
VAR=${VAR#*,\"}
	
EMAIL[$CLOCK]=${VAR%%\"*}
VAR=${VAR#*,\"}
	
WEBURL[$CLOCK]=${VAR%%\"*}
VAR=${VAR#,\"}
	
echo \""${FNAME[$CLOCK]}"\",\""${LNAME[$CLOCK]}"\",\""${COMPANY[$CLOCK]}"\",\""${STREET[$CLOCK]}"\",\""${CITY[$CLOCK]}"\",\""${COUNTY[$CLOCK]}"\",\""${STATE[$CLOCK]}"\",\""${ZIP[$CLOCK]}"\",\""${HPHONE[$CLOCK]}"\",\""${WPHONE[$CLOCK]}"\",\""${EMAIL[$CLOCK]}"\",\""${WEBURL[$CLOCK]}"\"

((CLOCK++))
done

IFS=$OLDIFS
