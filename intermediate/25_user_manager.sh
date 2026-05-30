#!/bin/bash
action=$1
username=$2

if [ $# -ne 2 ]
then
        echo "Usage : ./script.sh <action> <username>"
        exit 1
fi

case "$action" in
        create)
                if id  "$username" > /dev/null 2>&1
                then 
			echo "User already exist"
			exit 1
		else 
                        if sudo useradd "$username" > /dev/null 2>&1
                        then
                                echo "Successfully added user"
                                sudo passwd "$username"
			else 
				echo "Failed to create user"
				exit 1
                        fi
                fi
                ;;
        delete)
                if id "$username" > /dev/null 2>&1
                then
                        if sudo userdel "$username" > /dev/null 2>&1
                        then
                                echo "User deleted successfully"
			else 
				echo "Failed to delete user"
				exit 1
                        fi
                else
                        echo "User does not exist"
			exit 1
                fi
                ;;
        lock)
                if ! id "$username" > /dev/null 2>&1
		then 
			echo "User does not exist"
			exit 1
		else
			if sudo passwd -l "$username" > /dev/null 2>&1
                	then
                        	echo "User locked successfully"
                	else
                	        echo "Failed to lock user"
				exit 1
			fi
                fi
                ;;
        unlock)
                if ! id "$username" > /dev/null 2>&1
		then 
			echo "User does not exist"
			exit 1
		else
			if sudo passwd -u "$username" > /dev/null 2>&1
    	            	then
        	                echo "User unlocked successfully"
                	else
                      		echo "Failed to unlock user"
				exit 1
			fi
                fi
                ;;
        check)
                if id "$username" > /dev/null 2>&1
                then
                        echo "User exist"
                else
                        echo "User does not exist"
			exit 1
                fi
                ;;
        *)
                echo "Usage : ./script.sh < create | delete | lock | unlock | check >"
                exit 1

esac
