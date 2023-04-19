#!/usr/bin/env bash

set -u

DEST=${DOT_DEST:-"$HOME/.local/share/dotfiles/"}

if [ -e "${DEST}" ]; then
  printf "$DEST already exists\n" >&2
  exit 1
fi

alias config='/usr/bin/git --git-dir="$DEST" --work-tree=$HOME'
git clone --bare git@github.com:loqusion/dotfiles.git "$DEST"

config config --local core.sparseCheckout true
printf '/*\n!README.md\n!install.sh\n!install-deps.sh\n' > "$DEST/info/sparse-checkout"
config checkout
config config --local status.showUntrackedFiles no
config config --local branch.main.remote origin
config config --local branch.main.merge refs/heads/main
