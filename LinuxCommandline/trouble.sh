#!/bin/bash

a=1 b=1 c=3

PS4='$LINENO: '
set -x 

if [ "$a" -lt "$b" ]; then
	echo "nice"
elif [ "$b" -gt "$c" ]; then
	echo "then"
else
	echo "ok"
fi

set +x

