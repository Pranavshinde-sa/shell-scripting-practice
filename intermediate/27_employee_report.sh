#!/bin/bash

file="$1"
count=0
DevOps=0
Backend=0
Frontend=0
QA=0

if [ $# -ne 1 ]
then 
	echo "Usage : ./Script.sh <File name>"
	exit 1
fi

if [ ! -f "$file" ]
then 
	echo "File does not exist"
	exit 1
fi

while IFS=: read -r Employee_ID Name Role
do
	if [[ "$Employee_ID" == \#* ]]
	then
	continue
	fi

	if [ -z "$Employee_ID" ]
	then
	continue
	fi

	echo "Employee ID : $Employee_ID"
	echo "Name : $Name"
	echo "Role : $Role"
	echo "--------------------------"
	((count++))

	case "$Role" in 
		
		DevOps)
			DevOps=$((DevOps + 1))
			;;
		Backend)
			Backend=$((Backend + 1))
			;;
		Frontend)
			Frontend=$((Frontend + 1))
			;;
		QA)
			QA=$((QA + 1))
			;;
		*)
			continue
			;;
	esac									
done < "$file"

echo "Total employee count : $count"
echo "DevOps : $DevOps"
echo "Backend : $Backend"
echo "Frontend : $Frontend"
echo "QA : $QA"
