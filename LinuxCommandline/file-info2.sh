#!/bin/bash

usage() {
	echo -e "\nUsage: ${0##*/} FILENAME" >&2
	exit 1
}

file_info() {
	if [ ! -e "$1" ]; then
		echo "$FUNCNAME error: File $1 doesn't exist" >&2
		return 1
	fi

	echo -e "FileType:"
	file "$1"

	echo -e "\nStats:"
	stat "$1"
}

if [ "$#" -ne 1 ]; then
	usage
fi

file_info "$1" || exit 1

