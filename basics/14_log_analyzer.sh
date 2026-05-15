#!/bin/bash
read -p "enter file name : " file_name

if [ -f "$file_name" ]
then 
	echo "file exist"
	info_count=$(grep -c INFO "$file_name")
	error_count=$(grep -c ERROR "$file_name")
	warning_count=$(grep -c WARNING "$file_name")
	echo "INFO : $info_count"
	echo "WARNING : $warning_count"
	echo "ERROR : $error_count" 
else 
	echo "file doesnt exist"
fi
