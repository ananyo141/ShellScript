#!/bin/bash

foo=jpg.jpg

# replace first match
echo "${foo/jpg/JPG}"

# replace all matches
echo "${foo//jpg/JPG}"

# match occurs at beginning
echo "${foo/#jpg/JPG}"

# match occurs at end
echo "${foo/%jpg/JPG}"

