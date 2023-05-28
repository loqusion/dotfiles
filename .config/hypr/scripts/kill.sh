#!/usr/bin/env bash

# http://wiki.hyprland.org/Configuring/Uncommon-tips--tricks/#minimize-steam-instead-of-killing
if [ "$(hyprctl activewindow -j | jq -r ".class")" = "Steam" ]; then
	xdotool getactivewindow windowunmap
else
	hyprctl dispatch killactive ""
fi
