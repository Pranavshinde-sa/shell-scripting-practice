#!/bin/bash
check_process() {
	process=$1
	if [ -z "$process" ]
	then
		echo "Process name cannot be empty"
		return 1
	fi
	pid=$(pgrep -x "$process")
	if [ -n "$pid" ]
	then 
		echo "Process is running"
		echo -e "Process IDs : \n$pid"

	else
		echo "Process is not running"
	fi
}	
