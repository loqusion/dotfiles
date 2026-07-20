#!/usr/bin/env bash

# Change waybar title

signal() {
	local event
	event=$(cut -d'>' -f1 <<<"$1")

	case $event in
	activewindow | closewindow)
		pkill -RTMIN+9 waybar
		;;
	esac
}

SOCKET="UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

socat -u "$SOCKET" - | while read -r event; do
	signal "$event"
done
