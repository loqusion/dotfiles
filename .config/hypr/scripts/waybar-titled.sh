#!/usr/bin/env bash

# Change waybar title

signal() {
	if [[ ${1:0:12} == "activewindow" && ${1:0:14} != "activewindowv2" ]]; then
		pkill -RTMIN+9 waybar
	fi
}

SOCKET="UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

socat -u "$SOCKET" - | while read -r event; do
	signal "$event"
done
