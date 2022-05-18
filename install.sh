#!/usr/bin/env sh

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo '.cfg' >> .gitignore
git clone --bare git@github.com:loqusion/dotfiles.git $HOME/.cfg
config config --local core.sparseCheckout true
echo -e '/*\n!README.md\n!installer.sh' > $HOME/.cfg/info/sparse-checkout
config checkout
config config --local status.showUntrackedFiles no
