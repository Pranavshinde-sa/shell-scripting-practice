#!/bin/bash

usage=$(df -h / | awk 'NR==2 {print $5}')

echo "DISK USAGE PERCENTAGE : $usage "

numeric_usage=${usage%\%}

if [ "$numeric_usage" -ge 80 ]
then 
	echo "alert : Disk usage high"
else 
	echo "Disk usage normal"
fi

