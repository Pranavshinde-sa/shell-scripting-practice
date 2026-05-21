#!/bin/bash
read -p "Enter file name : " file_name
if [ -f "$file_name" ]
then
	echo "file exists"
else 
	echo "file not found"
	echo "creating file ..."
	touch "$file_name"
	
	if [ $? -eq 0 ]
	then 
		echo "file created succesfully"
	else 
		echo "failed to create file"
	fi
fi
