#!/bin/bash

FILE=/usr/bin/bash

if [ -e "$FILE" ]; then
	if [ -f "$FILE" ]; then
		echo "$FILE is a regular file"
	elif [ -d "$FILE"]; then
		echo "$FILE is a directory"
	fi
	if [ -r "$FILE" ]; then
		echo "$FILE is readable"
	fi
	if [ -w "$FILE" ]; then
		echo "$FILE is writable"
	fi
	if [ -x "$FILE" ]; then
		echo "$FILE is executable/searchable(directory)"
	fi
else
	echo "$FILE doesn't exist"
	exit 1
fi

