#!/bin/bash

read -p 'Enter your name: ' -ei "$USER " username

if [ -z "$username" ]; then
	echo "Username can't be empty" >&2
	exit 1
fi

echo "Hello there, "$username"!"

