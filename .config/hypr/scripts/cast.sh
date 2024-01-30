#!/usr/bin/env bash

notify() {
	notify-send -t 3000 -a 'wf-recorder' -e 'wf-recorder' "$@"
}

if pkill --euid "$USER" --signal SIGINT wf-recorder; then
	notify 'Saved recording'
	exit
fi

. "$(dirname "$0")/hooks"
runHook preCast
trap "runHook postCast" EXIT

XDG_VIDEOS_DIR=${XDG_VIDEOS_DIR:-$(xdg-user-dir VIDEOS)}

# https://github.com/hyprwm/contrib/blob/3126196e7ed609e7c427a39dc126ea067de62a65/grimblast/grimblast#L192-L194
workspaces="$(hyprctl monitors -j | jq -r 'map(.activeWorkspace.id)')"
windows="$(hyprctl clients -j | jq -r --argjson workspaces "$workspaces" 'map(select([.workspace.id] | inside($workspaces)))')"
rectangles=$(echo "$windows" | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
region=$(echo "$rectangles" | slurp) || {
	notify 'Cancelled'
	exit 1
}

date=$(date +%Y-%m-%d_%H-%M-%S)

timeout 600 wf-recorder -g "$region" -c gif -F fps=30 -f "$XDG_VIDEOS_DIR/$date.gif" || exit 1
