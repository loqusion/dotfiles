#!/usr/bin/env bash

if swaylock --help |& grep -q -- '--grace\b'; then
	exec swaylock -f --grace 10 "$@"
	exit 0
fi

exec swaylock -f "$@"
