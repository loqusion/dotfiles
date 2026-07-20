#!/usr/bin/env bash

pkill hyprpaper
nohup hyprpaper &>/dev/null &
echo "$!"
disown
