#!/usr/bin/env bash

if pgrep eww; then
	pkill eww
else
	~/.config/eww/launch.sh "$@"
fi
