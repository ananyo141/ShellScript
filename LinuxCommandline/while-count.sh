#!/bin/bash

# Sleep for a given time

read -p 'Enter time to sleep: ' sleep_time

if [[ ! "$sleep_time" =~ ^[0-9]+$ ]]; then
	echo -e "\nUsage: ${0##*/} sleep_time" >&2
	exit 1
fi

while (( sleep_time )); do
	echo -e "Counting $((sleep_time--))..."
	sleep 1
done

echo -e '\nFinished'

