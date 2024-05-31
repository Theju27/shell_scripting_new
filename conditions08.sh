#!/bin/bash

lss -ltr

if [$? -ne 0]; then
	echo "Previous command is failure"
	exit 1
fi

ls -ltr
if [$? -ne 0]; then
	echo "Previous commmand is failure"
	exit 1
fi

echo "Program is success"
