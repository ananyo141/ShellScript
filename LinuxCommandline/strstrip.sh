#!/bin/bash

filename=foo.txt.zip

# lstrip
echo "${filename#*.}"    # shortest match
echo "${filename##*.}"   # largest match

# rstrip
echo "${filename%.*}"    # shortest match
echo "${filename%%.*}"   # largest match

