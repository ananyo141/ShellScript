#!/bin/bash

invalid_input() {
	echo -e "$1" >&2
	exit 1
}

read -p "Enter a single item: " filename

[ -z "$filename" ] && invalid_input "Empty input"
[ "$(echo "$filename" | wc -w)" -gt 1 ] && invalid_input "More than one filename"

if [ "$(echo "$filename" | grep -E '^[[:alnum:]\._-]+$')" ]; then
	echo "$filename is valid filename"
	if [ -e "$filename" ]; then
		echo "$filename exists"
	else
		echo "$filename doesn't exist"
	fi

	if [ "$(echo "$filename" | grep -E '^-?[[:digit:]]*\.[[:digit:]]+$')" ]; then
		echo "$filename is a float"
	elif [ "$(echo "$filename" | grep -E '^-?[[:digit:]]+$')" ]; then
		echo "$filename is an integer"
	fi

else
	echo "$filename is not a valid filename"
fi

