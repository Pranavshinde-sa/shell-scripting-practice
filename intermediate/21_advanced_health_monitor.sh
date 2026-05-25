#!/bin/bash

if [ $# -eq 0 ]
then 
	echo "Usage: ./script.sh -p <process> -s <service> -t <threshold>"
	exit 1
fi


check_disk_usage() {

	threshold=$1

	if [[ ! "$threshold" =~ ^[0-9]+$ ]]
	then 
		echo "Threshold must be numeric"
		return 1
	fi

        disk_usage=$(df -h / | awk 'NR==2 {print $5}')
        echo "disk usage : $disk_usage"
        numeric_usage=${disk_usage%\%}
        if [ "$numeric_usage" -ge "$threshold" ]
        then
                echo "warning : high disk usage "
	else 
		echo "disk usage is normal"
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


while getopts "p:s:t:" opt 
do 
	case $opt in
		p)
			process="$OPTARG"
			;;
		s)
		       	service="$OPTARG"
			;;
		t)
			threshold="$OPTARG"
			;;
		\?)
			echo "Invalid option"
			exit 1
			;;
	esac
done
	    
if [ -n "$process" ]
then 
	check_process "$process"
fi	

if [ -n "$service" ]
then
	check_service "$service"
fi

if [ -n "$threshold" ]
then
	check_disk_usage "$threshold"
fi
					
