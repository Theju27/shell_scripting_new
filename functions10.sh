#!/bin/bash

Hello(){
	echo " Inside Function"
	echo "Hello!! $1"
	echo "Scriptname : $0"
	echo "Number of args: $#"
	echo "All args are: $@"
}

echo "Before calling function, checking name:$1"
echo "Number of args:$#"
echo "All args are:$@"

Hello $1
