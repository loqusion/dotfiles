#!/usr/bin/env bash

SLURP_OPTS=${SLURP_OPTS:-"-d -F 'Terminess TTF Nerd Font'"}
slurp="slurp $SLURP_OPTS"

if pkill -INT wf-recorder; then
	notify-send -t 3000 -a 'wf-recorder' -e 'wf-recorder' 'Video Captured'
else
	XDG_VIDEOS_DIR="$(xdg-user-dir VIDEOS)"
	date=$(date +%Y-%m-%d_%H-%M-%S)
	geometry="$($slurp)"
	wf-recorder -c libx264rgb -g "$geometry" -f "$XDG_VIDEOS_DIR/$date.mp4"
fi
