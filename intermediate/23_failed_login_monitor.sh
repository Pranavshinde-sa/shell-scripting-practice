#!/bin/bash
threshold=$1
filename=$2

if [ $# -ne 2 ]
then 
	echo "Usage : ./script.sh <threshold> <filename>"
	exit 1
fi

if [[ ! "$threshold" =~ ^[0-9]+$ ]]
then 
	echo "Input must be numeric"
	exit 1
fi

if [ ! -f "$filename" ]
then 
	echo "File does not exist"
	exit 1
fi

fail_counts=$(grep -c "FAILED LOGIN" "$filename")

if [ "$fail_counts" -ge "$threshold" ]
then 
	echo "ALERT : Suspicious activity detected"
	echo "Failed login attempts : $fail_counts"
else
	echo "Failed login attempts : $fail_counts"
	echo "System is healthy"

fi
