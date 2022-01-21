#!/bin/bash

# find the length of the parameters

for i; do
	printf "%-25s: %3s characters\n" "$i" "${#i}"
done
