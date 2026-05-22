#!/bin/bash

action="$1"
service="$2"

if [ $# -ne 2 ]
then 
	echo "Usage: ./service_manager.sh <action> <service>"
	exit 1
fi

case "$action" in 
	start)
		if sudo systemctl start "$service"
		then
			echo "service started successfully"
		else 
			echo "failed to start"
		fi
		;;
	stop)
		if sudo systemctl stop "$service"
		then
			echo "service stopped successfully"
		else
		
			echo "failed to stop"
		fi
		;;
	restart)
		if sudo systemctl restart "$service"
		then 
			echo "service restarted successfully"
		else 
			echo "failed to restart"
		fi
		;;
	status)
		systemctl status "$service"
		;;
	*)
		echo "Invalid action. Use: start | stop | restart | status"
		;;
esac
