
CtrlC()
{
	echo "      Well fine be that way"
	exit 1
}

cleanup()
{
	rm -rf $HOME
}

timestamp()
{
for LINE in $SOURCE; do
        DATE=$(date +%Y-%m-%d -r $LINE)
        YEAR=${DATE%%/*}
        DATE=${DATE#*/}
        DAY=${DATE%%/*}
        DATE=${DATE#*/}
        MONTH=$DATE

                if [ ! -d "$HOME/$YEAR/$MONTH/$DAY" ]
                then
                mkdir -p "$HOME/$YEAR/$MONTH/$DAY"
                fi
done
}

check_exif2()
{
exiv2 &>/dev/null
	if [[ ${?} = 127 ]]; then

		logger "Installed Exiv2"
		yum -y install exiv2
		echo "Exiv2 installed"
	
	else 
		logger "Exiv2 was already installed"
		echo "Exiv2 is installed"
fi
}

CheckDir()
{
	if [ ! -d "${HOME}/${YEAR}/${MONTH}/${DAY}" ] ;then
        	mkdir -p "${HOME}/${YEAR}/${MONTH}/${DAY}"
	fi
}

copy()
{
	cp $LINE "${HOME}/${YEAR}/${MONTH}/${DAY}"
}

move()
{
	mv $LINE "${HOME}/${YEAR}/${MONTH}/${DAY}"
}

Camera()
{
	NAME=${File_Name}
	DATE=${Create_Date}
	MODEL=${Camera_Model}
	MAKE=${Camera_Make}

	exiftool -t | grep File | awk '{ print $3 }' | grep .jpg =$File_Name
	exiftool -t | grep "Create\|^Modification Date$" | awk '{ print $3,$4 }' =$Create_Date
	exiftool -t | grep Camera | awk '/Name/{ print $4 }' =$Camera_Model
	exiftool -t | grep Make | awk '{ print $2 }' =$Camera_Make

	if [ ! ${model} ] ;then 
		exiftool '-FileName<${model;} ${CreateDate}' -d %Y-%m-%d_%h.%M.%S%%-c.%%e $HOME/$YEAR/$MONTH/$DAY
	else
	 	exiftool '-FileName<${CreateDate}' -d %Y-%m-%d_%I-%M-%S_UNKNOWN%%-c.%%e $HOME/$YEAR/$MONTH/$DAY
	fi
}

CheckVideo()
{
	NAME=${Video_File_Name}
	DATE=${Video_Date_Time}

 	exiftool -t | grep File | awk '{ print $3 }' | grep '.AVI\|.mts' =$Video_File_Name
 	exiftool -t | grep Date/Time | awk '/Original/{ print $3,$4 }' | sed 's/......$//' =$Video_Date_Time

 	if [ ! ${model} ] ;then
         	exiftool '-FileName<${model;} ${CreateDate}' -d %Y-%m-%d_%I-%M-%S%%-c.%%e $HOME/$YEAR/$MONTH/$DAY
	else
		 exiftool '-FileName<${CreateDate}' -d %Y-%m-%d_%I-%M-%S_UNKNOWN%%-c.%%e $HOME/$YEAR/$MONTH/$DAY
	fi
}
