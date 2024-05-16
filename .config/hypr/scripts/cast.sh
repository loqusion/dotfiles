#!/usr/bin/env bash
set -euo pipefail

SCREENCAST_DIR=${SCREENCAST_DIR:-${XDG_VIDEOS_DIR:-$(xdg-user-dir VIDEOS)}/Screencast}

DATE_COMMAND=${DATE_COMMAND:-"date -Ins"}
CODEC="gif"
EXTENSION="gif"
MIME_TYPE="image/gif"
FPS=30
SCALE_WIDTH=480
SCALE_HEIGHT=-2
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

record_and_process() {
	local output=$1
	local region=$2

	# local tmp_output="$scratch/output.${EXTENSION}"
	# local tmp_palette="$scratch/gif_palette.png"

	with_timeout wf-recorder --geometry "$region" --codec "$CODEC" --filter fps="$FPS" -f "$output"
	# with_timeout wf-recorder --geometry "$region" --codec "$CODEC" --filter fps="$FPS" -f "$tmp_output"

	runHook postCast

	# TODO: implement some automatic processing
	# ffmpeg -y -i "$tmp_output" -filter_complex "fps=${FPS},scale=${SCALE_WIDTH}:${SCALE_HEIGHT},palettegen=stats_mode=full" "$tmp_palette"
	# ffmpeg -y -i "$tmp_output" -i "$tmp_palette" -filter_complex "[0]fps=${FPS},scale=${SCALE_WIDTH}:${SCALE_HEIGHT}[scaled];[scaled][1]paletteuse=dither=sierra2_4a" "$output"
}

main() {
	local file region
	file="${SCREENCAST_DIR}/$($DATE_COMMAND).${EXTENSION}"
	mkdir -p "$(dirname "$file")"
	if ! region=$(get_region); then
		return 0
	fi

	record_and_process "$file" "$region"
	wl-copy --type "$MIME_TYPE" <"$file"

	notify_success "$file"
}

# WARNING: This makes the assumption that only one wf-recorder is running
if pkill --euid "$USER" --signal SIGINT wf-recorder; then
	exit
fi

. "$(dirname "$0")/hooks"
runHook preCast
# trap "runHook postCast" EXIT

scratch=$(mktemp -d -t cast.sh.XXXXXXXXXX)
finish() {
	rm -rf "$scratch"
	runHook postCast
}
trap finish EXIT

main
