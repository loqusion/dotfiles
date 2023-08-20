#!/usr/bin/env bash

THEME=${1:-"default"}
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/eww/$THEME"
EWW_CMD="eww --config $CONFIG_DIR"

primary_monitor_id() {
	local primary_monitor_name
	primary_monitor_name=$(xrandr --listmonitors | grep '\*' | awk -F' ' '{print $NF}')
	hyprctl monitors -j |
		jq -r \
			--arg PRIMARY_MONITOR_NAME "$primary_monitor_name" \
			'.[] | select(.name == $PRIMARY_MONITOR_NAME) | .id'
}

killall -q eww
while pgrep -x eww >/dev/null; do sleep 1; done

${EWW_CMD} daemon && sleep 1

PRIMARY_MONITOR_ID=$(primary_monitor_id)
if [ -n "$PRIMARY_MONITOR_ID" ]; then
	${EWW_CMD} open "sidebar$PRIMARY_MONITOR_ID"
else
	notify-send "eww" "No primary monitor found"
fi

for id in $(hyprctl monitors -j | jq -r '.[] | .id'); do
	${EWW_CMD} open --screen "$id" "bar$id"
done

# use this for notifications : ${EWW} open-many "sidebar$PRIMARY_MONITOR_ID" "notifications$PRIMARY_MONITOR_ID"
