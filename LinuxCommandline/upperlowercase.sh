#!/bin/bash

declare -u upper   # variable only stores uppercase
declare -l lower   # variable only stores lowercase

read -p 'Enter name: ' fname lname
upper="$fname"
lower="$fname"
echo "Your first name in upper: $upper"
echo "Your first name in lower: $lower"

echo "Your last name in upper: ${lname^^}"
echo "Your last name in lower: ${lname,,}"

echo "Your name in title: ${fname^} ${lname^}"

