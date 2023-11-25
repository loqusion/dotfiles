#!/usr/bin/env bash

GRIMBLAST_TARGET=$1
GRIMBLAST_COMMAND=copysave

APP=grimblast

SILENT_OUTPUT=(
	"selection cancelled"
)

is_silent() {
	local output

	for output in "${SILENT_OUTPUT[@]}"; do
		if echo "$1" | grep -q "$output"; then
			return 0
		fi
	done
	return 1
}

notify() {
	notify-send -t 3000 -a "$APP" -e "$APP" "$@"
}

transform_output() {
	local output=$1
	local target

	case "$GRIMBLAST_TARGET" in
	active)
		target="window"
		;;
	area)
		target="selection"
		;;
	output)
		target="screen"
		;;
	screen)
		target="all screens"
		;;
	*) ;;
	esac

	case "$GRIMBLAST_COMMAND" in
	copysave | save)
		echo "${target^} saved to $output"
		;;
	copy)
		echo "${target^} copied to clipboard"
		;;
	*) ;;
	esac
}

with_feedback() {
	local output status

	output=$("$@" 2>&1)
	status=$?
	if [ $status -ne 0 ]; then
		if ! is_silent "$output"; then
			notify "${output^}"
		fi
		return 1
	else
		notify "$(transform_output "$output")"
	fi
}

case "$GRIMBLAST_TARGET" in
output)
	with_feedback grimblast "$GRIMBLAST_COMMAND" output
	;;
area)
	with_feedback grimblast "$GRIMBLAST_COMMAND" area
	;;
*)
	echo "Usage: $0 <output|area>"
	exit 1
	;;
esac
