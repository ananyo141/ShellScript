#!/bin/bash

# process all the commandline args

echo "Num args: $#"

count=0
while [ "$#" -gt 0 ]; do
	echo "Arg $(( ++count )): $1"
	shift
done

