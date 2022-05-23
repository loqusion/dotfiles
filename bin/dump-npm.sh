#!/usr/bin/env sh

npm list -g --depth=0 --parseable |
  sed 's/\/Users\/rasnauf\/.nvm\/versions\/node\/v18.1.0\/lib\/node_modules\///g' |
  sed 1d >~/.npm-packages
