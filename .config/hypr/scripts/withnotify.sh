#!/usr/bin/env bash

APP=${APP:-$(basename "${1:?not defined}")}

if ! output=$("$@" 2>&1); then
	notify-send -t 5000 -a "$APP" -e "$APP failed" "$output"
fi
