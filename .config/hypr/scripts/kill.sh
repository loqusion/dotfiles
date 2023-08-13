#!/usr/bin/env bash

should_unmap() {
	[[ "$(hyprctl activewindow -j | jq -r ".class")" =~ Steam|MEGAsync ]]
}

# http://wiki.hyprland.org/Configuring/Uncommon-tips--tricks/#minimize-steam-instead-of-killing
if should_unmap; then
	xdotool getactivewindow windowunmap
else
	hyprctl dispatch killactive ""
fi
