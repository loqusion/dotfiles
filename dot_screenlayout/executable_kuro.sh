#!/bin/sh
xrandr \
    --output HDMI-0 --off \
    --output DP-0 --primary --mode 3840x2160 --pos 1440x258 --rotate normal --rate 144 \
    --output DP-1 --off \
    --output DP-2 --mode 2560x1440 --pos 0x0 --rotate left --rate 144 \
    --output DP-3 --off \
    --output DP-4 --off \
    --output DP-5 --off
