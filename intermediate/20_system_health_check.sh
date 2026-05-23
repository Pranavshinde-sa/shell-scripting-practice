#!/bin/bash

check_disk_usage() {
	threshold=80
	disk_usage=$(df -h / | awk 'NR==2 {print $5}')
	echo "disk usage : $disk_usage"
	numric_usage=${disk_usage%\%}
	if [ "$numric_usage" -ge "$threshold" ]
	then
		echo "warning : high disk usage "
	fi
}


check_process() {
	process="$1"
	if pgrep -x "$process" > /dev/null
	then 
		echo "$process is running"
	else 
		echo "$process is not running"
	fi
}


check_service() {
	service="$1"
	if systemctl is-active --quiet "$service"
	then 
		echo "$service is active "
	else 
		echo "$service is not active"
	fi	
}


check_disk_usage

check_service ssh

check_process nginx

