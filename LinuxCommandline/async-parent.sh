#!/bin/bash

sighandler() {
	for i; do
		echo "Killing Child: "$i""
		kill -SIGKILL "$i"
	done
}


# spawn two child scripts and wait for them to finish
echo "Parent ($$) starting..."
echo "Spawning children..."

./async-child.sh &
child1="$!"
echo "Child Spawned: PID ($child1)"

./async-child.sh &
child2="$!"
echo "Child Spawned: PID ($child2)"

# Register handler to clean up spawned processes in case of
# premature termination of parent
trap "sighandler "$child1" "$child2"" SIGINT SIGTERM SIGKILL

echo "Waiting for children to finish"

wait "$child1" "$child2"
echo "Parent exiting..."

