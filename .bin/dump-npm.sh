#!/usr/bin/env bash

cmd=(npm)
nvm_dir="${NVM_DIR:-${HOME}/.config/nvm}"

if ! type nvm >/dev/null 2>&1 && [ -r "${nvm_dir}/nvm.sh" ]; then
  . "${nvm_dir}/nvm.sh"
fi

if type nvm >/dev/null 2>&1 && [ "$(nvm version current)" != "$(nvm version node)" ]; then
  cmd=(nvm exec node npm)
fi

{
  "${cmd[@]}" list -g --depth=0 --parseable |
  sed -E -e '1d' -e "s,${nvm_dir}/versions/node/.*/lib/node_modules/,," -e '/^corepack$/d'
} >~/.npm-packages
