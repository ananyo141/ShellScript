#!/bin/bash

# Test if the entered character is:
# Upper Case
# Lower Case
# Alphabetic
# Digit
# Visible Character
# Punctuation
# Whitespace
# Hexadecimal

read -p 'Enter symbol: ' inp

echo
case "$inp" in
	[[:upper:]])  echo "'$inp' is uppercase" ;;&
	[[:lower:]])  echo "'$inp' is lowercase" ;;&
	[[:alpha:]])  echo "'$inp' is alphabet"  ;;&
	[[:digit:]])  echo "'$inp' is digit"     ;;&
	[[:graph:]])  echo "'$inp' is visible character" ;;&
	[[:punct:]])  echo "'$inp' is punctuation" ;;&
	[[:space:]])  echo "'$inp' is space"   	 ;;&
	[[:xdigit:]]) echo "'$inp' is hexadecimal" ;;
	*) echo "undefined"
	   exit 1 
	   ;;
esac

