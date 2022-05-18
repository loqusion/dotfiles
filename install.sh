#!/usr/bin/env sh

set -u

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo '.cfg' >> .gitignore
git clone --bare git@github.com:loqusion/dotfiles.git $HOME/.cfg

config config --local core.sparseCheckout true
echo -e '/*\n!README.md\n!installer.sh' > $HOME/.cfg/info/sparse-checkout
config checkout
config config --local status.showUntrackedFiles no

if ! which brew >/dev/null 2>&1; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install from ~/.Brewfile
/opt/homebrew/bin/brew bundle --global

# TODO: Also install with npm, pip, etc
