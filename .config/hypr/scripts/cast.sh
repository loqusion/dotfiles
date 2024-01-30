#!/usr/bin/env bash
set -euo pipefail

SCREENCAST_DIR=${SCREENCAST_DIR:-${XDG_VIDEOS_DIR:-$(xdg-user-dir VIDEOS)}/Screencast}

DATE_COMMAND=${DATE_COMMAND:-"date -Ins"}
CODEC="gif"
EXTENSION="gif"
FPS=30
TIMEOUT=600

notify() {
	notify-send --expire-time=3000 --app-name="cast.sh" --transient "Screencast" "$@"
}

notify_success() {
	local file=$1
	notify --icon="$file" "Saved to ${file}"
}

get_region() {
	local windows workspaces rectangles
	workspaces="$(hyprctl monitors -j | jq -r 'map(.activeWorkspace.id)')"
	windows="$(hyprctl clients -j | jq -r --argjson workspaces "$workspaces" 'map(select([.workspace.id] | inside($workspaces)))')"
	rectangles=$(echo "$windows" | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')

	echo "$rectangles" | slurp
}

with_timeout() {
	timeout --preserve-status "$TIMEOUT" "$@"
}

main() {
	file="${SCREENCAST_DIR}/$($DATE_COMMAND).${EXTENSION}"
	mkdir -p "$(dirname "$file")"
	if ! region=$(get_region); then
		return 0
	fi

	with_timeout wf-recorder --geometry "$region" --codec "$CODEC" --filter fps="$FPS" -f "$file"

	notify_success "$file"
}

if pkill --euid "$USER" --signal SIGINT wf-recorder; then
	exit
fi

. "$(dirname "$0")/hooks"
runHook preCast
trap "runHook postCast" EXIT

main
