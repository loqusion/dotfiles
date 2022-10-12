#!/usr/bin/env bash

exists ()
{
  command -v "$@" &>/dev/null
}

install_brew ()
{
  if ! exists brew; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

install_brew_deps ()
{
  brew bundle --global
}

install_npm_deps ()
{
  if exists npm && [ -r ~/.npm-packages ]; then
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
  :
}

install_ghcup ()
{
  if ! exists ghcup; then
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
  fi
}

install_ghcup_deps ()
{
  if exists ghcup; then
    for tool in ghc cabal hls stack; do
      ghcup install "${tool}"
    done
  fi
}

install_brew && install_brew_deps
install_npm_deps
install_pip_deps
install_rust && install_rust_deps
install_ghcup && install_ghcup_deps
