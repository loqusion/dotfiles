#!/usr/bin/env bash

if [ $# -eq 0 ]; then
	echo "Usage: $0 <command>" >&2
	exit 1
fi

APP=${APP:-$(basename "${1:?not defined}")}

output=$("$@" 2>&1)
status=$?
default_message="<No output>\nError code: $status"
if [ $status -ne 0 ]; then
	notify-send --expire-time=5000 --app-name="$APP" --transient "$APP failed" "${output:-$default_message}"
	exit $status
fi
