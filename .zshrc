source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle cargo
antigen bundle git
antigen bundle nvm
antigen bundle rust
antigen bundle rustup
antigen bundle yarn

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

if hash brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz bashcompinit && bashcompinit -i
autoload -Uz compinit && compinit

# aws completion
complete -C '/usr/local/bin/aws_completer' aws

# Need this for emacs bindings in VSCode
bindkey -e

alias vim=nvim
# <command> --help | viman
alias viman='nvim ++Man\!'
alias neovide='NEOVIDE_MULTIGRID=1 neovide'
alias nvide='neovide'
alias lg='lazygit'
alias config='git --git-dir="$HOME/.local/share/dotfiles" --work-tree="$HOME"'
alias c=config
alias rustdoc='rustup doc --toolchain=stable-x86_64-apple-darwin'
alias zshrc='$EDITOR "$HOME/.zshrc"'
alias caf='caffeinate -d'
function linecount() { find "${1:-.}" -name "*.*" -print | xargs wc -l }

export PTPYTHON_CONFIG_HOME="$HOME/.config/ptpython"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use --lts &>/dev/null

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
