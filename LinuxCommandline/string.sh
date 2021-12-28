#!/bin/bash

string=saf

if [ -z "$string" ]; then
	echo "Empty string not allowed" >&2
	exit 1
fi

if [ "$string" == "yes" ]; then
	echo "She said YES!"
elif [ "$string" == "no" ]; then
	echo "I can't do that Dave"
else
	echo "Answer is unknown" >&2
	exit 1
fi

