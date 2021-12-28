#!/bin/bash

echo -n "Enter num: "
read int

if [[ ! ("$int" =~ ^-?[0-9]+$) ]]; then
	echo "Invalid input"
	exit 1
fi

if [ "$int" -lt 0 ]; then
	echo "$int is negative"
elif [ "$int" -eq 0 ]; then
	echo "$int is equal to 0"
elif [ "$int" -gt 0 ]; then
	echo "$int is positive"
fi

if [ "$((int % 2))" -eq 0 ]; then
	echo "$int is even"
else
	echo "$int is odd"
fi

