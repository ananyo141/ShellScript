#!/bin/bash

INT=2

if [ -z "$INT" ]; then
	echo "$INT is empty" >&2
	exit 1
elif [ "$INT" -eq 0 ]; then
	echo "$INT is equal to zero"
elif [ "$INT" -lt 0 ]; then
	echo "$INT is negative"
elif [ "$INT" -gt 0 ]; then
	echo "$INT is positive"
fi

if [ $((INT % 2)) -eq 0 ]; then
	echo "$INT is even"
else
	echo "$INT is odd"
fi

