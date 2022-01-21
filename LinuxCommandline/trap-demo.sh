#!/bin/bash

trap "echo 'Signal Ignored'" SIGINT SIGTERM

for i in {1..5}; do
	echo "Iteration $i of 5"
	sleep 1
done

