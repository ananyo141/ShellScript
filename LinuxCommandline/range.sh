#!/bin/bash

# Find if the input number is between a certain range
echo -n "Enter number: "
read number
echo -n "Enter min range: "
read min_range
echo -n "Enter max range: "
read max_range

regex='^-?[0-9]+$'
if [[ ! ($min_range =~ $regex) ||
	  ! ($number    =~ $regex) ||
	  ! ($max_range =~ $regex) ]]; then
	  echo "Invalid range" >&2
	  exit 1
fi

if [[ "$min_range" -le "$number" && "$max_range" -ge "$number" ]]; then
	echo "$number is between $min_range and $max_range"
else 
	echo "$number is not in between $min_range and $max_range"
fi

