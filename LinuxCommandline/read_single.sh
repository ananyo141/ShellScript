#!/bin/bash

read -d ';' -p 'Enter directory: ' -ei "$HOME" dirname
echo $dirname

read -sp 'Enter password: ' pass
echo "$pass"

