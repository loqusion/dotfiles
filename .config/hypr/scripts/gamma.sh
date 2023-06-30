#!/usr/bin/env bash

BLUE_LIGHT_FILTER=~/.config/hypr/shaders/blue-light-filter.glsl
EMPTY_STR="[[EMPTY]]"

on() {
	hyprctl keyword decoration:screen_shader "$BLUE_LIGHT_FILTER"
}

off() {
	hyprctl keyword decoration:screen_shader "$EMPTY_STR"
}

case "$1" in
"auto")
	currenttime=$(date +%H)
	if [ "$currenttime" -ge 18 ] || [ "$currenttime" -lt 6 ]; then
		on
	else
		off
	fi
	;;
"toggle")
	screen_shader=$(hyprctl -j getoption decoration:screen_shader | jq -r '.str')
	if [ "$screen_shader" = "$EMPTY_STR" ]; then
		on
	else
		off
	fi
	;;
"on") on ;;
"off") off ;;
*) ;;
esac
