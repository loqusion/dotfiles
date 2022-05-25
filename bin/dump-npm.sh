#!/usr/bin/env sh

npm list -g --depth=0 --parseable |
  sed -E 's/\/Users\/rasnauf\/\.nvm\/versions\/node\/.*\/lib\/node_modules\///g' |
  sed 1d >~/.npm-packages
