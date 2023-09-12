#!/usr/bin/env bash

WAYBAR_DIR="$HOME/.config/waybar"
THEME=${1:-"default"}

killall -q waybar
while pgrep -x waybar >/dev/null; do sleep 1; done

if ! pgrep --full hypr/scripts/waybar-titled.sh; then
	nohup ~/.config/hypr/scripts/waybar-titled.sh &>/dev/null &
	disown
fi

exec waybar --config "$WAYBAR_DIR/$THEME/config.jsonc" --style "$WAYBAR_DIR/$THEME/style.css"
