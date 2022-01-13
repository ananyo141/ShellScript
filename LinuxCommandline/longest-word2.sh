#!/bin/bash

# longest word in file using for

for i; do
	if [ -r "$i" ]; then
		longest_word=
		longest_len=0
		for j in $(strings "$i"); do
			word_len="$(echo -n "$j" | wc -c)"
			if [ "$word_len" -gt "$longest_len" ]; then
				longest_word="$j"
				longest_len="$word_len"
			fi
		done
		echo "Longest: $longest_word ($longest_len characters)"
	fi
done

