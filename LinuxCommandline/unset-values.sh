#!/bin/bash

foo=
bar=
spam=set
notset=

echo "${foo:-"foo is unset"}"
echo "${bar:="bar is unset and set"}"
echo "${spam:+"spam is set"}"
echo "${notset:?"Not set and sent to stderr and exit"}"

