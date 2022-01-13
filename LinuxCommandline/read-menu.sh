#!/bin/bash

while true; do

	echo "
	Please Select:

	1. Display System Information
	2. Display Disk Space
	3. Display Home Space Utilization
	4. Quit
	"
	read -p "Command -> " choice
	clear

	if [[ ! $choice =~ ^[1-4]$ ]]; then
		echo "Invalid choice" >&2
		continue
	fi
	
	if (( choice == 1 )); then
		cat <<- _EOF_
		Host: $HOSTNAME
		User: $USER
		_EOF_
		uptime
	elif (( choice == 2 )); then
		df -h
	elif (( choice == 3 )); then
		if [[ "$(id -u)" -eq 0 ]]; then
			du -sh /home/*
		else
			du -sh "$HOME"
		fi
	elif (( choice == 4 )); then
		break
	fi
done

echo -e "\nExit"

