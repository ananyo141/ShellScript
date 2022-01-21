#!/bin/bash

upperlmt="$1"

for ((i=0; i <= ${upperlmt:=30}; i++)); do
	if ((i % 5 == 0)); then
		echo -n "<$i> "
	else
		echo -n "$i "
	fi
done

echo

