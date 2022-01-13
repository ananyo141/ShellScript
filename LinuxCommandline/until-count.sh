#!/bin/bash

read -p 'Enter sleep time: ' sleep_time

if [[ ! "$sleep_time" =~ ^[0-9]+$ ]]; then
	echo "Usage: ${0##*/} sleep_time" >&2
	exit 1
fi

until [ "$sleep_time" -le 0 ]; do
	echo "Counting... $sleep_time"
	sleep_time=$((sleep_time-1))
	sleep 1
done

echo -e '\nFinished'

