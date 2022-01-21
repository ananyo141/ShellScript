#!/bin/bash

# sort an array contents

arr=(f e d c b a)

echo "Original array: ${arr[@]}"
sorted=($(for i in "${arr[@]}"; do echo "$i"; done | sort))
echo "Sorted Array: ${sorted[@]}"

