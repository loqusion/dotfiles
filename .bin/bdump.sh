#!/usr/bin/env bash
set -e

BOOTSTRAP_DIR=~/.local/share/bootstrap
basename=$(basename "$0")

_git() {
	git -C "$BOOTSTRAP_DIR" "$@"
}

_git stash push --quiet --include-untracked --no-keep-index --message "stash created by $basename"
trap '_git stash pop --index &>/dev/null || true' EXIT

_git pull --rebase
"$BOOTSTRAP_DIR"/dump.sh
_git commit -q -m "chore($(hostname -s)): dump" || true
_git push
