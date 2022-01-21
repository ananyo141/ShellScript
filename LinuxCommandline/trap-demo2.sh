#!/bin/bash

sigint_handler() {
	echo "SIGINT received" 2>&1
	exit 0
}

sigterm_handler() {
	echo "SIGTERM received" 2>&1
	exit 0
}

trap sigterm_handler SIGTERM
trap sigint_handler  SIGINT

for i in {1..5}; do
	echo "Iteration $i of 5"
	sleep 5
done

