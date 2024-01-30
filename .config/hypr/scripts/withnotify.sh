#!/usr/bin/env bash

APP=${APP:-$(basename "${1:?not defined}")}

if ! output=$("$@" 2>&1); then
	notify-send --expire-time=5000 --app-name="$APP" --transient "$APP failed" "$output"
fi
