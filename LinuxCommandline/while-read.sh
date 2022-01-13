#!/bin/bash

# Incorrect invocation handler
usage () {
	echo -e "\nUsage: ${0##*/} [file]" >&2
	exit 1
}

# Take filepath interactive
if [ "${#}" -lt 1 ]; then
	read -p 'Enter distros filepath: ' filepath
elif [ "${#}" -eq 1 ]; then	 # or via argument if given
	filepath="${1}"
else
	usage
fi

if [ ! -f "$filepath" ]; then
	usage 
fi

while read distro version release; do
	if [ -z "$distro" ]; then
		continue 
	fi
	printf "Distro: %s\tVer: %s  \tReleased: %s\n" \
			"$distro" "$version" "$release"
done < "$filepath"

