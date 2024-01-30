#!/usr/bin/env bash
set -euo pipefail

SCREENSHOTS_DIR=${SCREENSHOTS_DIR:-${XDG_PICTURES_DIR:-$(xdg-user-dir PICTURES)}/Screenshots}

DATE_COMMAND=${DATE_COMMAND:-"date -Ins"}
EXTENSION="png"
MIME_TYPE="image/png"

TARGET=${1:-}

APP=screenshot.sh
EDIT_APP=gimp

ACTION_VIEW="view"
ACTION_EDIT="edit"

notify() {
	notify-send -t 3000 -a "$APP" -e "$APP" "$@"
}

notify_success() {
	local file=$1

	notify \
		-i "$file" "${TARGET^} saved to ${file}"
	# TODO: this isn't working properly; see https://gitlab.gnome.org/GNOME/libnotify/-/issues/37
	# -A "${ACTION_VIEW}=View" -A "${ACTION_EDIT}=Edit" \
}

run_action() {
	local action=$1
	local file=$2

	case "$action" in
	"$ACTION_VIEW")
		xdg-open "$file"
		;;
	"$ACTION_EDIT")
		nohup "$EDIT_APP" "$file" >/dev/null 2>&1 &
		disown
		;;
	*)
		echo "Unknown action: $action" >&2
		return 1
		;;
	esac
}

get_region() {
	local windows workspaces rectangles
	workspaces=$(hyprctl monitors -j | jq -r 'map(.activeWorkspace.id)')
	windows=$(hyprctl clients -j | jq -r --argjson workspaces "$workspaces" 'map(select([.workspace.id] | inside($workspaces)))')
	rectangles=$(echo "$windows" | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')

	echo "$rectangles" | slurp
}

get_current_output() {
	hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name'
}

with_copysave() {
	local file=$1
	shift

	"$@" | tee "$file" | wl-copy --type "$MIME_TYPE"
}

main() {
	local action file region

	case "$TARGET" in
	screen)
		file="${SCREENSHOTS_DIR}/$($DATE_COMMAND).${EXTENSION}"
		mkdir -p "$(dirname "$file")"
		with_copysave "$file" grim -o "$(get_current_output)" -
		;;
	selection)
		file="${SCREENSHOTS_DIR}/$($DATE_COMMAND).${EXTENSION}"
		mkdir -p "$(dirname "$file")"
		if ! region=$(get_region); then
			return 0
		fi
		with_copysave "$file" grim -g "$region" -
		;;
	*)
		echo "Usage: $0 <screen|selection>" >&2
		return 1
		;;
	esac

	action=$(notify_success "$file")
	if [ -n "$action" ]; then
		run_action "$action" "$file"
	fi
}

. "$(dirname "$0")/hooks"
runHook preScreenshot
trap "runHook postScreenshot" EXIT
main
