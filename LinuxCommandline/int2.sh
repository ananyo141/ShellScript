#!/bin/bash

echo -n "Enter integer: "
read int

# Input Validation
if [[ "$int" =~ ^-?[0-9]+$ ]]; then
	echo "Entered int: $int"
	# Test if:
	if [[ "$int" -eq 0 ]]; then
		echo "$int is 0" 	# Equal to Zero
	elif [[ "$int" -gt 0 ]]; then
		echo "$int > 0"  	# Positive
	elif [[ "$int" -lt 0 ]]; then
		echo "$int < 0"	 	# Negative
	fi
	if [[ $((int % 2)) -eq 0 ]]; then
		echo "$int is even" # Even 
	else
		echo "$int is odd"  # Odd
	fi
else 
	echo "$int is not a number" >&2
	exit 1
fi

