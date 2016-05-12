#!/bin/bash

cleanup()
{
	rm -rf /tmp/tmp.*
}

trap "echo Don\'t do that" SIGINT

OSFILES=$(find /)
TMPFILE=$(mktemp)

for LINE in $OSFILES; do
	echo "$LINE" >> "$TMPFILE"
	echo "FILE $i, $LINE"
		(( i++ ))
done

trap cleanup exit 1
