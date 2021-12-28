#!/bin/bash

invalid_input() {
	echo "$1" >&2
	exit 1
}

read -p "Enter filename: " filename

# if not entered
[[ -z "$filename" ]] && invalid_input "$filename is invalid"

(( $(wc -w <<< $filename) > 1 )) && invalid_input "Multiple values given"

if [[ ! "$filename" =~ ^[[:alnum:]\._-]+$ ]]; then
	invalid_input "$filename is not a valid filename"
else 
	echo "$filename is a valid filename"
fi

# Analyze filename
if [[ "$filename" =~ ^-?[[:digit:]]*\.[[:digit:]]+$ ]]; then
	echo "$filename is a floating point"
elif [[ "$filename" =~ ^-?[[:digit:]]+$ ]]; then
	echo "$filename is an integer"
fi

if [[ -e "$filename" ]]; then
	echo "And $filename exists"
else
	echo "However, $filename doesn't exist"
fi

