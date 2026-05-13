#!/bin/bash
read -p "Enter your name : " name

greet() {
	echo "hello $1"
}
greet $name
