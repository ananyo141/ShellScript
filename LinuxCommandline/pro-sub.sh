#!/bin/bash

while read attr links owner group size month date time filename; do
	cat <<- EOF
		Filename :      $filename
		Size:           $size bytes
		Owner:          $owner
		Group:          $group
		Modified:       $month $date $time
		Links:          $links
		Attributes:     $attr

		EOF
done < <(ls -l | tail -n +2)

