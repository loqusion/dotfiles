#!/usr/bin/env bash

HYPRGAMEMODE=$(hyprctl -j getoption animations:enabled | jq -r '.int')

if [ "$HYPRGAMEMODE" = 1 ]; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
else
    hyprctl reload
fi
