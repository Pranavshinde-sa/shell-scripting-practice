#!/bin/bash
read -p "enter file name : " file_name

if [ -f "$file_name" ]
then 
	echo "file exists "
	info_count=$(grep -c INFO "$file_name")
	error_count=$(grep -c ERROR "$file_name")
	warning_count=$(grep -c WARNING "$file_name")
	echo "INFO : $info_count"
	echo "WARNING : $warning_count"
	echo "ERROR : $error_count"
	total_logs=$(($info_count + $error_count + $warning_count))
	echo "TOTAL LOGS : $total_logs"
	if [ "$total_logs" -gt 0 ] 
	then
		info_percentage=$((($info_count * 100 ) / $total_logs))
		warning_percentage=$((($warning_count * 100 ) / $total_logs))
		error_percentage=$((($error_count * 100 ) / $total_logs))
		echo "INFO PERCENTAGE : $info_percentage "
		echo "ERROR PERCENTAGE : $error_percentage "
		echo "WARNING PERCENTAGE : $warning_percentage "
	else 
		echo "no matching log found"
	fi	
else 
	echo "file does not exist"
fi
