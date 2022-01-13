#!/bin/bash

# Case Version of the read-menu script

while true; do

	cat <<- _EOF_

		Please Select:
		
		A. Display System Information
		B. Display Disk Space
		C. Display Home Space Utilization
		D. Quit
		_EOF_

	read -p 'Enter Command -> ' choice
	clear

	case "$choice" in 
		a|A) cat <<- _EOF_
					Host: $HOSTNAME
					User: $USER
					_EOF_
					uptime -p
					;;

		b|B) df -h
			 ;;

		c|C) echo "Calculating..."
			 if [[ "$(id -u)" -eq 0 ]]; then
				du -sh /home/*
			 else
			 	du -sh "$HOME"
			 fi
			 ;;

		d|D) echo "Bye!"
			 break
			 ;;

		*) echo 'Invalid Option' >&2
			 ;;

	esac
done

