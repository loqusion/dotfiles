#!/usr/bin/env sh

set -u

alias config='/usr/bin/git --git-dir=$HOME/.local/share/dotfiles/ --work-tree=$HOME'
git clone --bare git@github.com:loqusion/dotfiles.git "$HOME/.local/share/dotfiles"

config config --local core.sparseCheckout true
echo -e '/*\n!README.md\n!installer.sh' > $HOME/.local/share/dotfiles/info/sparse-checkout
config checkout
config config --local status.showUntrackedFiles no

if ! which brew >/dev/null 2>&1; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install from ~/.Brewfile
brew bundle --global

# TODO: Also install with npm, pip, etc
