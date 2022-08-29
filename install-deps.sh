#!/usr/bin/env bash

exists ()
{
  command -v "$@" &>/dev/null
}

install_brew_deps ()
{
  brew bundle --global
}

install_npm_deps ()
{
  if exists npm &>/dev/null && [ -r ~/.npm-packages ]; then
    npm install --global $(cat ~/.npm-packages)
  fi
}

install_pip_deps ()
{
  if exists pip3 && [ -r ~/.requirements.txt ]; then
    pip3 install --requirement ~/.requirements.txt
  fi
}

install_rust ()
{
  if ! exists cargo; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  fi
}

install_rust_deps ()
{
  # todo
}

install_brew_deps
install_npm_deps
install_pip_deps
install_rust && install_rust_deps
