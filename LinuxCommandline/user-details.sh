#!/bin/bash

# Get the user details from the passwd file

FILE=/etc/passwd

read -p 'Enter username: ' -ei "$USER " username

if [ -z "$username" -o -z "$FILE" ]; then
	echo "Invalid username or incorrect file configuration" >&2
	exit 1
fi

# get the details from the file
user_details="$(grep "^$username" "$FILE")"
if [ -n "$user_details" ]; then # if found (i.e user exists)
	# temporarily change the IFS value; use a here string to send data to read
	# for parsing
	IFS=':' read user pw uid gid name home shell <<< "$user_details"
	echo -e "User:	$user"
	echo -e "UID:	$uid"
	echo -e "GID:	$gid"
	echo -e "NAME:	$name"
	echo -e "HOME:	$home"
	echo -e "SHELL:	$shell"
else
	echo "User '$username' not found" >&2
	exit 1
fi

