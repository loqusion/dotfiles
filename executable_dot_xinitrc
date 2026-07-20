#!/usr/bin/bash

# shellcheck disable=SC1090

session=${1:-i3}

case $(hostname -s | tr '[:upper:]' '[:lower:]') in
kuro)
	[[ -f ~/.screenlayout/kuro.sh ]] && . ~/.screenlayout/kuro.sh
	;;
esac

[[ -f ~/.Xresources ]] && xrdb -merge -I"$HOME" ~/.Xresources

case "$session" in
i3 | i3wm) exec i3 ;;
awesome) exec awesome ;;
*) exec $1 ;;
esac
