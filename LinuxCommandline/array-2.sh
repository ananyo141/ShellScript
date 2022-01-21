#!/bin/bash

# Use arrays to tally file owners

drawsep() {
	echo
	for i in {0..65}; do
		echo -n '-'
	done
	echo -en '\n\n'
}

dirname="$1"
if [[ "$#" -gt 1 || ! -d "${dirname:=.}" ]]; then
	echo "Usage: ${0##*/} [DIR]" >&2
	exit 1
fi

declare -A owner_files group_files

# print the file owners and groups and keep a tally
echo "Listing:"
for i in "$dirname"/*; do
	owner="$(stat -c %U "$i")"
	group="$(stat -c %G "$i")"
	((++owner_files[$owner]))
	((++group_files[$group]))
	printf "%-40s %7s %7s\n" "$i" "$owner" "$group"
done
drawsep

# print the file owners
echo "File Owners:"
{ for i in "${!owner_files[@]}"; do
	printf "%-20s: %3d file(s)\n" "$i" "${owner_files["$i"]}"
done } | sort
drawsep
	
# print the file groups
echo "File group owners:"
{ for i in "${!group_files[@]}"; do
	printf "%-20s: %3d file(s)\n" "$i" "${group_files["$i"]}"
done } | sort
drawsep

