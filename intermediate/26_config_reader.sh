#!/bin/bash
file=$1

if [ $# -ne 1 ]
then 
	echo "Usage : ./script.sh <file name>"
	exit 1
fi 

if [ ! -f "$file" ]
then 
	echo "File does not exist"
	exit 1
fi

while read -r line 
do 
	if [ -z "$line" ]
	then 
		continue
	fi 
	
	if [[ "$line" == \#* ]]
	then 
		continue
	fi
	if [[ "$line" != *=* ]]
	then
		continue
	fi

	key=${line%=*}
	value=${line#*=}

	declare "$key=$value"
done < "$file"

echo "Application Name : $APP_NAME"
echo "Port : $PORT"
echo "Environment : $ENV"
echo "Log Level : $LOG_LEVEL"


