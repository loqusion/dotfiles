#!/usr/bin/env bash

THEME=${1:-"default"}
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/eww/$THEME"

killall -q eww
while pgrep -x eww >/dev/null; do sleep 1; done

if ! pgrep -x eww; then
	eww --config "$CONFIG_DIR" daemon
	sleep 1
fi

eww --config "$CONFIG_DIR" open "sidebar0"

## Open standard widgets and bar
mapfile -t NB_MONITORS < <(hyprctl monitors -j | jq -r '.[] | .id')
for id in "${NB_MONITORS[@]}"; do
	bar="bar$id"
	hyprctl dispatch focusmonitor "$id"
	eww --config "$CONFIG_DIR" open "$bar"
done

# focusmon=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .id')
# hyprctl dispatch focusmonitor "$focusmon"

# primary display id
# source "$HOME"/.config/hypr/scripts/variables/load_envs

# Open widgets for primary display
# use this for notifications : ${EWW} open-many "sidebar$PRIMARY_MONITOR_ID" "notifications$PRIMARY_MONITOR_ID"
# ${EWW} open "sidebar$PRIMARY_MONITOR_ID"
