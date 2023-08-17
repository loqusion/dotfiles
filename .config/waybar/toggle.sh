#!/usr/bin/env bash

if pgrep waybar; then
	pkill waybar
else
	~/.config/waybar/launch.sh "$@"
fi
