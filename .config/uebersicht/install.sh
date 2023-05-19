#!/usr/bin/env bash

set -euo pipefail

SRC_DIR=$(dirname "$0")
DEST_DIR="$HOME/Library/Application Support/Übersicht/widgets"

widgets=('pecan')
for widget in "${widgets[@]}"; do
	if [ -e "$DEST_DIR/$widget" ]; then
		echo "Removing old $widget" >&2
		rm -rf "$DEST_DIR/${widget:?}"
	fi
	echo "Installing $widget" >&2
	cp -rf "$SRC_DIR/$widget" "$DEST_DIR/$widget"
done
