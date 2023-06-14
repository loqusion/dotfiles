#!/usr/bin/env bash

notify() {
	notify-send -t 3000 -a 'wf-recorder' -e 'wf-recorder' "$@"
}

pkill --euid "$USER" --signal SIGINT wf-recorder && notify 'Saved recording' && exit

XDG_VIDEOS_DIR=${XDG_VIDEOS_DIR:-$(xdg-user-dir VIDEOS)}
SLURP_OPTS=${SLURP_OPTS:-"-d -F 'Terminess TTF Nerd Font'"}

slurp="slurp $SLURP_OPTS"
geometry="$($slurp)" || {
	notify 'Cancelled'
	exit 1
}
date=$(date +%Y-%m-%d_%H-%M-%S)

timeout 600 wf-recorder -g "$geometry" -c gif -F fps=30 -f "$XDG_VIDEOS_DIR/$date.gif" || exit 1
