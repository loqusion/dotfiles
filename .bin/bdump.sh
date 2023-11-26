#!/usr/bin/env bash
set -e

BOOTSTRAP_DIR=~/.local/share/bootstrap
MAIN_BRANCH=main
basename=$(basename "$0")

_git() {
	git -C "$BOOTSTRAP_DIR" "$@"
}

_git_resolved_head() {
	git symbolic-ref --short --quiet HEAD || git rev-parse HEAD
}

saved_ref=$(_git_resolved_head)
finish() {
	set +e
	_git checkout -q "$saved_ref"
	_git stash pop --index
}
trap finish EXIT
_git stash push -q --include-untracked --no-keep-index --message "stash created by $basename"
_git checkout -q "$MAIN_BRANCH"

_git pull --rebase
"$BOOTSTRAP_DIR"/dump.sh
_git commit -q --message "chore($(hostname -s)): dump" || true
_git push
