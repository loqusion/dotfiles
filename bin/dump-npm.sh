#!/usr/bin/env sh

escaped_home=$(echo "$HOME" | sed 's/\//\\\//g')
npm list -g --depth=0 --parseable |
  sed -E "s/${escaped_home}\/\.nvm\/versions\/node\/.*\/lib\/node_modules\///g" |
  sed 1d >~/.npm-packages
