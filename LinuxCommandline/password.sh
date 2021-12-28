#!/bin/bash

if read -t 10 -sp 'Enter secret code -> ' secret_pass; then
	echo -e "\nPassword entered: $secret_pass"
else
	echo -e "\nPassword not entered" >&2
	exit 1
fi

