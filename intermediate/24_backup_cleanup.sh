#!/bin/bash
delete_backup() {	
	backup_dir=$1
	file_age=$2
	if [ $# -ne 2 ]
	then 
		echo "Usage : ./srcipt.sh <Directory> <File age>"
		return 1
	fi

	if [[ ! "$file_age" =~ ^[0-9]+$ ]]
	then 
		echo "File age must be numeric" 
		return 1
	fi	

	if [ ! -d "$backup_dir" ]
	then 
		echo "Directory does not exist"
		return 1
	fi

	files=$( find "$backup_dir" -type f -mtime +"$file_age" )

	if [ -n "$files" ]
	then 
		echo -e "Old backup files : \n$files"
	else 
		echo "No old backup files found"
		return 0
	fi

	read -p "Enter CONFIRM to delete file : " confirm

	if [[ "$confirm" == "CONFIRM" ]]
	then 
		echo "Deleting old files"
	else 
		echo "Deletion cancelled"
		return 1
	fi

	if find "$backup_dir" -type f -mtime +"$file_age" -delete 
	then 
		echo "Old backup files deleted successfully"
	else 
		echo "Failed to delete old backup files"
		return 1
	fi
}



