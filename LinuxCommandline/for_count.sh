#!/bin/bash

# Sleep upto a number of seconds specified by the user

read -p 'Enter sleep time: ' sleep_time

if [[ ! "$sleep_time" =~ ^[0-9]+$ ]]; then
	echo -e "\nUsage: $(basename ${0}) time_in_seconds" >&2
	exit 1
fi

for ((i=0; i < sleep_time; i++)); do
	echo "Counting: $((i+1))..."
	sleep 1
done

echo -e "\nFinished"

