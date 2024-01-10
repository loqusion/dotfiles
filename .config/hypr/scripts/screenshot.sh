#!/usr/bin/env bash

GRIMBLAST_TARGET=$1
GRIMBLAST_COMMAND=copysave

APP=grimblast

SILENT_OUTPUT=(
	"selection cancelled"
)

shader=""

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

notify_success() {
	local output=$1
	notify \
		-i "$output" "$(transform_output "$output")"
	# TODO: this isn't working properly; see https://gitlab.gnome.org/GNOME/libnotify/-/issues/37
	# -A view="View" -A edit="Edit" \
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
	restore_shader
	if [ $status -ne 0 ]; then
		if ! is_silent "$output"; then
			notify "${output^}"
		fi
		return $status
	fi

	# TODO: once the above issue is fixed, execute the action
	action=$(notify_success "$output")
}

restore_shader() {
	if [ -n "$shader" ]; then
		hyprshade on "$shader"
	fi
}

save_shader() {
	shader=$(hyprshade current)
	hyprshade off
	trap restore_shader EXIT
}

case "$GRIMBLAST_TARGET" in
output)
	save_shader
	with_feedback grimblast "$GRIMBLAST_COMMAND" output
	;;
area)
	save_shader
	with_feedback grimblast "$GRIMBLAST_COMMAND" area
	;;
*)
	echo "Usage: $0 <output|area>"
	exit 1
	;;
esac
