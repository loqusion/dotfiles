#!/usr/bin/bash

# shellcheck disable=SC1090

case $(hostname -s | tr '[:upper:]' '[:lower:]') in
kuro)
	[[ -f ~/.screenlayout/kuro.sh ]] && . ~/.screenlayout/kuro.sh
	;;
esac

[[ -f ~/.Xresources ]] && xrdb -merge -I"$HOME" ~/.Xresources

exec /usr/bin/i3
