#!/bin/bash

usage() {
	cat <<- EOF
	Usage: ${0##*/} PRINCIPAL INTEREST MONTHS

	Where:
	PRINCIPAL: amount of loan
	INTEREST:  annual percentage rate (1-100)
	MONTHS:    length of loan's term

	EOF
}

verify() {
	for i; do
		if [[ ! "$i" =~ ^-?[0-9]+.?[0-9]+$ ]]; then
			echo -e "$FUNCNAME Error: Invalid Argument ($i)\n" >&2
			usage >&2
			exit 1
		fi
	done
}

interactive=0
if [[ "$#" -ne 3 ]]; then
	if [[ "$#" -eq 1 && "$1" == '-i' ]]; then
		interactive=1
	else
		usage >&2
		exit 1
	fi
fi

if ((interactive)); then
	read -p 'Enter principal: ' principal
	read -p 'Enter interest:  ' interest
	read -p 'Enter months:    ' months
else
	principal=$1
	interest=$2
	months=$3
fi

verify "$principal" "$interest" "$months"

bc <<- EOF
	scale = 10
	i = $interest/12
	i /= 100
	p = $principal
	n = $months 
	a = p * ((i * ((1 + i) ^ n)) / (((1 + i) ^ n) - 1))
	print "INTEREST per month: $", a, "\n"
	EOF

