#! /bin/bash

# xmonad-like workspace management for multi-monitors in Hyprland.

monitors_json=$(hyprctl monitors -j)

workspace=${1:-$(jq -r '.[] | select(.focused == false) | .activeWorkspace.id' <<<"$monitors_json")}
active_monitor=$(jq -r '.[] | select(.focused == true) | .id' <<<"$monitors_json")
passive_monitor=$(jq -r --argjson WORKSPACE "$workspace" '.[] | select(.activeWorkspace.id == $WORKSPACE) | .id' <<<"$monitors_json")
active_workspace=$(jq -r --argjson MONITOR "$active_monitor" '.[] | select(.id == $MONITOR) | .activeWorkspace.id' <<<"$monitors_json")
passive_workspace=$(jq -r --argjson MONITOR "$passive_monitor" '.[] | select(.id == $MONITOR) | .activeWorkspace.id' <<<"$monitors_json")

if [[ $workspace -eq $passive_workspace ]] && [[ $active_monitor != "$passive_monitor" ]]; then
	hyprctl dispatch swapactiveworkspaces "$active_monitor" "$passive_monitor"
else
	hyprctl dispatch moveworkspacetomonitor "$workspace $active_monitor" && hyprctl dispatch workspace "$workspace"
fi
