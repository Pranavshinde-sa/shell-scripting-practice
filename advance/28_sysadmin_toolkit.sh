#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$DIR/../intermediate/17_process_monitor.sh"
source "$DIR/../intermediate/16_disk_usage_monitor.sh"
source "$DIR/../intermediate/15_backup_script.sh"
source "$DIR/../intermediate/24_backup_cleanup.sh"

while true 
do
	clear
	echo "===== SYSADMIN TOOLKIT ====="
	echo "1. Check Process and ID"
	echo "2. Check Disk Usage"
	echo "3. Backup file"
	echo "4. delete backup"
	echo "5. Exit"
	echo "--------------------------"
	read -p "Enter a number : " tool
	case "$tool" in
		1)
			read -p "Enter process name : " process
			check_process "$process"
			read -p "Press enter to continue..."
			;;
		2)
			check_disk_usage
			read -p "Press enter to continue..."
			;;
		3)
			read -p "Enter file name : " file_name
		        create_backup "$file_name"
			read -p "Press enter to continue..."	
			;;
		4)	read -p "Enter directory name : " dir_name
			read -p "Enter age of file : " age
			delete_backup "$dir_name" "$age"
			read -p "Press enter to continue..."
			;;
		5)
			echo "Exiting..."
			break
			;;
		*)
			echo "Invalid option. Please select 1-5."
			;;
	esac
done


			
