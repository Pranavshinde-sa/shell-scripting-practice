#!/bin/bash

read -p "Enter your age : " age
if [ $age -ge 60 ]
then 
	echo "senior citizen"
elif [ $age -ge 18 ]
then 
	echo "adult"
else 
	echo "minor"

fi
