#!/bin/bash

# Find the longest string in a file

if [ "$#" -lt 1 ]; then
	echo -e "\nUsage: ${0##*/} FILENAME [..]" >&2
	exit 1
fi

while [ -n "$1" ]; do
	if [ -r "$1" ]; then
		longest_word=
		longest_len=0
		for i in $(strings "$1"); do
			current_len="$(echo -n "$i" | wc -c)"
			#current_len="$(wc -c <<< "$i")"			# better performance
			if [ "$current_len"  -gt "$longest_len" ]; then
				longest_word="$i"
				longest_len="$current_len"
			fi
		done
		echo "LONGEST WORD: $longest_word ($longest_len characters)"
	fi
	shift
done

