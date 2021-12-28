#!/bin/bash

TITLE="System Information Report For host: $HOSTNAME"

CURRENT_TIME="$(date +"%x %r %Z")"
TIMESTAMP="Generated $CURRENT_TIME, by $USER"

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
	if [[ "$(id -u)" -eq 0 ]]; then	# if run as root
		cat <<- _EOF_
				<h2>Home Space Utilization for ($USER)</h2>
				<pre>$(du -sh /home/*)</pre>
				_EOF_
	else
		cat <<- _EOF_
				<h1>Home Space Utilization (All Users)</h1>
				<pre>$(du -sh $HOME)</pre>
				_EOF_
	fi
}

cat << _EOF_
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

