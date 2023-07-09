#!/usr/bin/env bash

notify() {
	notify-send -t 3000 -a 'wf-recorder' -e 'wf-recorder' "$@"
}

slurp() {
	command slurp -d -F 'Terminess TTF Nerd Font'
}

pkill --euid "$USER" --signal SIGINT wf-recorder && notify 'Saved recording' && exit

XDG_VIDEOS_DIR=${XDG_VIDEOS_DIR:-$(xdg-user-dir VIDEOS)}

# https://github.com/hyprwm/contrib/blob/3126196e7ed609e7c427a39dc126ea067de62a65/grimblast/grimblast#L192-L194
WORKSPACES="$(hyprctl monitors -j | jq -r 'map(.activeWorkspace.id)')"
WINDOWS="$(hyprctl clients -j | jq -r --argjson workspaces "$WORKSPACES" 'map(select([.workspace.id] | inside($workspaces)))')"
geometry=$(echo "$WINDOWS" | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | slurp) || {
	notify 'Cancelled'
	exit 1
}

date=$(date +%Y-%m-%d_%H-%M-%S)

timeout 600 wf-recorder -g "$geometry" -c gif -F fps=30 -f "$XDG_VIDEOS_DIR/$date.gif" || exit 1
