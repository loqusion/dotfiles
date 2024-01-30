#!/usr/bin/env bash

# XXX: This is non-standard to my knowledge, but grimblast uses it so 🤷
# https://github.com/hyprwm/contrib/blob/16884001b26e6955ff4b88b4dfe4c8986e20f153/grimblast/grimblast#L25
export XDG_SCREENSHOTS_DIR=${SCREENSHOTS_DIR:-${XDG_PICTURES_DIR:-$HOME/Pictures}/Screenshots}
mkdir -p "$XDG_SCREENSHOTS_DIR"

GRIMBLAST_TARGET=$1
GRIMBLAST_COMMAND=copysave

APP=grimblast
EDIT_APP=gimp

SILENT_OUTPUT=(
	"selection cancelled"
)

ACTION_VIEW="view"
ACTION_EDIT="edit"

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
	# -A "${ACTION_VIEW}=View" -A "${ACTION_EDIT}=Edit" \
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

	action=$(notify_success "$output")
	case "$action" in
	"$ACTION_VIEW")
		xdg-open "$output"
		;;
	"$ACTION_EDIT")
		nohup "$EDIT_APP" "$output" >/dev/null 2>&1 &
		disown
		;;
	*)
		echo "Unknown action: $action" >&2
		return 1
		;;
	esac
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
	echo "Usage: $0 <output|area>" >&2
	exit 1
	;;
esac
