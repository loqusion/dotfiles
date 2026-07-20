#!/usr/bin/env bash
set -euo pipefail

BASH_COMPLETION_DIR=~/.local/share/bash-completion/completions
ZSH_COMPLETION_DIR=~/.zfunc
FISH_COMPLETION_DIR=~/.config/fish/completions

mkdir -p "$BASH_COMPLETION_DIR"
mkdir -p "$ZSH_COMPLETION_DIR"
mkdir -p "$FISH_COMPLETION_DIR"

rye self completion -s bash >"$BASH_COMPLETION_DIR/rye.bash"
rye self completion -s zsh >"$ZSH_COMPLETION_DIR/_rye"
if [[ $(basename "$SHELL") = "zsh" ]]; then
	echo "Make sure ~/.zfunc is added to fpath, before compinit." >&2
fi
rye self completion -s fish >"$FISH_COMPLETION_DIR/rye.fish"
