#!/bin/bash

read -p "Enter name of directory : " directory_name

mkdir "$directory_name" && echo "Directory created" || echo "failed to create directory"
