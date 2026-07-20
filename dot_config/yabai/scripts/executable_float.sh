#!/usr/bin/env bash

progname="$(basename "$0")"
cmd="${1:-toggle}"

is_floating() {
	local f
	f=$(yabai -m query --windows --window | jq '.["is-floating"]')
	[ "$f" = true ]
	return $?
}

is_iterm() {
	local app
	local saved_nocasematch
	app=$(yabai -m query --windows --window | jq '.app')
	saved_nocasematch="$(shopt -p nocasematch)"
	shopt -s nocasematch
	[[ "$app" =~ 'iTerm2' ]]
	ret=$?
	eval "$saved_nocasematch"
	return "$ret"
}

yabai_set_grid() {
	if is_iterm; then
		yabai -m window --grid 23:23:6:6:11:11
	else
		yabai -m window --grid 4:5:1:0:3:4
	fi
}

case "$cmd" in
toggle)
	yabai -m window --toggle float
	yabai_set_grid >/dev/null 2>&1
	;;
on)
	if ! is_floating; then
		yabai -m window --toggle float
		yabai_set_grid
	fi
	;;
off)
	if is_floating; then
		yabai -m window --toggle float
	fi
	;;
*)
	echo "${progname}: Invalid subcommand '$1'" >&2
	exit 1
	;;
esac >/dev/null
