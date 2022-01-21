#!/bin/bash

str='A quick brown fox jumps over the lazy dog'

echo "${str:8:9}"     # brown fox
echo "${str: -8:8}"   # lazy dog

