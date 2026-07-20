#!/usr/bin/env bash

if pgrep waybar &>/dev/null; then
	pkill waybar
else
	exec ~/.config/waybar/launch.sh "$@"
fi
