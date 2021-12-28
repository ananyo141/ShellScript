#!/bin/bash

echo -n "Enter num: "
read int

if [[ "$int" =~ ^-?[0-9]+$ ]]; then
	if ((int == 0)); then
		echo "$int is 0";
	elif ((int > 0)); then
		echo "$int is positive"
	elif ((int < 0)); then
		echo "$int is negative"
	fi

	if  (( $((int % 2)) == 0 )); then
		echo "$int is even"
	else
		echo "$int is odd"
	fi
else
	echo "$int is not number" >&2
	exit 1
fi

