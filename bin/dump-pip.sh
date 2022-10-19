#!/usr/bin/env bash

if ! hash pipx &>/dev/null; then
  echo "pipx does not exist. Make sure it's installed with \"brew install pipx\"."
  exit 1
fi

pipx list --short | awk '{ print $1 }' >~/.pip-requirements
