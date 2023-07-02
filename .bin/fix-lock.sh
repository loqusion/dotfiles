#!/usr/bin/env bash

export WAYLAND_DISPLAY=wayland-1
nohup swaylock -f &>/dev/null &
echo "$!"
disown
