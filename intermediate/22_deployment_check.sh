#!/bin/bash

overall_status=0

if systemctl is-active --quiet nginx
then 
	echo "Nginx is running"
else 
	echo "Nginx is not running"
	overall_status=1
fi


threshold=80
disk_usage=$(df -h / | awk 'NR==2 {print $5}')
echo "Disk Usage : $disk_usage"
numeric_usage=${disk_usage%\%}

if [ "$numeric_usage" -ge "$threshold" ]
then
       echo "Warning : High disk usage"
       overall_status=1 
else 
	echo "Normal disk usage"
fi

 
exit $overall_status

