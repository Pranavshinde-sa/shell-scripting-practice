#!/bin/bash
mkdir -p backups
file_name="$1"

if [ -z "$file_name" ]
then
	echo "input cannot be empty"
	exit 1
fi
if [ -e "$file_name" ]
then
	timestamp=$(date +%Y-%m-%d_%H_%M_%S)

	if tar -czf "./backups/backup_$timestamp.tar.gz" "$file_name"
	then 
		echo "backup created succesfully"
	else 
		echo "backup failed"
	fi
else 
	echo "file/directory not found"
fi
