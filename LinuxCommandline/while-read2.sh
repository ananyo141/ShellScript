#!/bin/bash

filename=distros.txt

[ -f "$filename" ] || exit 1

sort -k 1,1 -k 2n "$filename" | while read distro ver release; do
	if [ -z "$distro" ]; then
		continue 
	fi
	printf "Distro: %s\tVer: %s  \tReleased: %s\n" \
			"$distro" "$ver" "$release"
done

