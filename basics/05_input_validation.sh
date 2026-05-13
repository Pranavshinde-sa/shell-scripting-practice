#!/bin/bash

read -p "Enter your age : " age 

if [[ "$age" =~ ^[0-9]+$ ]]
then
	if [ $age -ge 60 ]
	then 
		echo "senior citizen"
	elif [ $age -ge 18 ]
	then 
		echo "adult"
	else 
		echo "minor"
	fi
else 
	echo "invalid input"
fi
