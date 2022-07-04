#!/usr/bin/env sh

cmd='npm'
nvm_path="${HOME}/.nvm"

if ! type nvm >/dev/null 2>&1 && [ -r "${nvm_path}/nvm.sh" ]; then
  . "${nvm_path}/nvm.sh"
fi

if type nvm >/dev/null 2>&1 && [ "$(nvm version current)" != "$(nvm version node)" ]; then
  cmd='nvm exec node npm'
fi

escaped_home=$(echo "$HOME" | sed 's/\//\\\//g')
{
  ${cmd} list -g --depth=0 --parseable |
  sed -E '1d' |
  sed -E "s/${escaped_home}\/\.nvm\/versions\/node\/.*\/lib\/node_modules\///" |
  sed -E '/^corepack$/d'
} >~/.npm-packages
