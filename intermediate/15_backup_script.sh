#!/bin/bash
mkdir -p backups

read -p "Enter file name : " file_name 

if [ -z "$file_name" ]
then
	echo "input cannot be empty"
	exit 1
fi
if [ -e "$file_name" ]
then
	timestamp=$(date +%Y-%m-%d_%H_%M_%S)

	tar -czf "./backups/backup_$timestamp.tar.gz" "$file_name"

	echo "backup created succesfully"
else 
	echo "file/directory not found"
fi
