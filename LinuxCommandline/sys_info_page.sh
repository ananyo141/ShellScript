#!/bin/bash

PROGNAME="${0##*/}"
TITLE="System Information Report For host: $HOSTNAME"
CURRENT_TIME="$(date +"%x %r %Z")"
TIMESTAMP="Generated $CURRENT_TIME, by $USER"

usage() {
	echo -e "\nUsage: $PROGNAME [-f file | -i]"
}

report_uptime() {
	cat <<- _EOF_
			<h2>System Uptime</h2>
			<pre>$(uptime)</pre>
			_EOF_
}

report_disk_space() {
	cat <<- _EOF_
			<h2>Disk Space Usage</h2>
			<pre>$(df -h)</pre>
			_EOF_
}

report_home_space() {
	local format="%8s%10s%10s\n"
	local i dir_list total_files total_dirs total_size user_name
	if [ "$(id -u)" -eq 0 ]; then
		dir_list=/home/*
		user_name="All Users"
	else
		dir_list="$HOME"
		user_name="$USER"
	fi

	for i in $dir_list; do
		total_files="$(find "$i" -type f | wc -l)"
		total_dirs="$(find "$i" -type d | wc -l)"
		total_size="$(du -sh "$i" | cut -f 1)"

		echo "<h3>$i</h3>"
		echo "<pre>"
		printf "$format" "Dirs" "Files" "Size"
		printf "$format" "----" "-----" "----"
		printf "$format" "$total_dirs" "$total_files" "$total_size"
		echo "</pre>"
	done
}

write_html() {
	cat <<- _EOF_
	<html>
		<head>
			<title>$TITLE</title>
		</head>
		<body>
			<h1>$TITLE</h1>
			<p>$TIMESTAMP</p>
			<p>$(report_uptime)</p>
			<p>$(report_disk_space)</p>
			<p>$(report_home_space)</p>
		</body>
	</html>
	_EOF_
}

filename=
interactive=

# Process the arguments given 
while [ -n "$1" ]; do
	case "$1" in
		-f | --filename)		shift
								filename="$1"
								;;
		-i | --interactive)		interactive=1
								;;
		-h | --help)			usage
								exit
								;;
		*) 						usage >&2
								exit 1
								;;
	esac
	shift
done

# interactive mode, get the filename interactively
if [ -n "$interactive" ]; then
	while true; do
		read -p 'Enter filename: ' filename
		# if already exists
		if [ -f "$filename" ]; then
			read -p "$filename exists. Overwrite? [y/n/q] " choice
			case "$choice" in
				y|Y) 		break    ;;
				q|Q)		exit     ;;
				*)			continue ;;
			esac
		# if filename not given
		elif [ -z "$filename" ]; then
			continue
		else
			break
		fi

	done
fi

# if file is mentioned,
if [ -n "$filename" ]; then
	# create and verify file and write
	if touch "$filename" && [ -f "$filename" ]; then
		write_html > "$filename"
	else
		echo "$PROGNAME: Unable to write to $filename" >&2
		exit 1
	fi
# else write to stdout
else
	write_html
fi

