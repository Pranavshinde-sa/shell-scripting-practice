#!/bin/bash
read -p "Enter service name : " service
if [ -z "$service" ]
then 
	echo "Input cant be empty"
	exit 1
fi

if systemctl is-active --quiet "$service"
then 
	echo "service is active "
else 
	echo "service is not active"
	echo "activating service..."
	sudo systemctl start "$service"

	if systemctl is-active --quiet "$service"
	then 
		echo "service started successfully"
	else 
		echo "failed to start service"
	fi
fi
