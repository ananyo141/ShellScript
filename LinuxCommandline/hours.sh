#!/bin/bash

# count the number of files modified at 0-23 hours of day

usage() {
	echo "Usage: ${0##*/} [DIRNAME]" >&2
	exit 1
}

dirname="$1"
if [[ "$#" -gt 1 || ! -d "${dirname:=./}" ]]; then
	usage
fi

# Initialize array
for i in {0..23}; do hours[i]=0; done

# Collect data
for i in $(stat -c %y "$dirname"/* | cut -c 12-13); do
	j=${i#0}   # strip leading zero
	((++hours[j]))
	((++count))
done

# Display data
echo -e "Hour\tFiles\tHour\tFiles"
echo -e "----\t-----\t----\t-----"

for i in {0..11}; do
	j=$((i+12))
	printf "%02d\t%02d\t%02d\t%02d\n" \
			"$i" "${hours[i]}"        \
			"$j" "${hours[j]}"
done

printf "Total files = %d\n" "$count"

