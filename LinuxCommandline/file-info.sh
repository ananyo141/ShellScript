#!/bin/bash

# get the file info of the filename given in the cmd arg

usage() {
	echo -e "\nUsage: ${0##*/} FILENAME" >&2
	exit 1
}

if [ "$#" -ne 1 ]; then
	usage
fi

if [ -e "$1" ]; then
	echo -e "FileType:"
	file "$1"

	echo -e "\nStats:"
	stat "$1"
else
	echo "File $1 doesn't exist" >&2
fi

