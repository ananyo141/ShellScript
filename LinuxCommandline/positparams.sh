#!/bin/bash

# print the args given

num_args="$#"

echo -e "Number of arguments: $#"

cat <<- _EOF_
		\$1 = $1
		\$2 = $2
		\$3 = $3
		\$4 = $4
		\$5 = $5
		\$6 = $6
		\$7 = $7
		\$8 = $8
		\$9 = $9
		_EOF_

