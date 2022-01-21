#!/bin/bash

# loop that creates square and cube

finished=0
a=0

printf "a\ta**2\ta**3\n"
printf "=\t====\t====\n"

until ((finished)); do
	printf "%d\t%d\t%d\n" "$a" "$((a**2))" "$((a**3))"
	((a < 10 ? a++ : (finished=1)))
done

