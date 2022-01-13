#!/bin/bash

# Print the Parameters given
print_params() {
	cat <<- _EOF_
	\$# = $#
	\$1 = $1
	\$2 = $2
	\$3 = $3
	\$4 = $4
	\$5 = $5
	\$6 = $6
	\$7 = $7
	_EOF_
}

pass_params() {
	echo -e "\n" '$*'  ; print_params $*
	echo -e "\n" '"$*"'; print_params "$*"
	echo -e "\n" '$@'  ; print_params $@
	echo -e "\n" '"$@"'; print_params "$@"
}

pass_params "a quick" brown 'fox jumps over'

