#!/bin/bash

for i; do
	if [ -r "$1" ]; then
		longest_word=
		longest_len=0
		for j in $(strings "$i"); do
			word_len="${#j}"
			if [ "$word_len" -gt "$longest_len" ]; then
				longest_len="$word_len"
				longest_word="$j"
			fi
		done
		echo "Longest: $longest_word ($longest_len characters)"
	fi
done

