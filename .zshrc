##################
#### antigen #####
##################

ulimit -S -n 2048

source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh
# antigen bundle nvm
antigen bundle git
antigen bundle rust
antigen bundle yarn
antigen bundle pip

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle lukechilds/zsh-nvm
antigen bundle lukechilds/zsh-better-npm-completion
antigen bundle buonomo/yarn-completion

antigen apply


###################
###### utils ######
###################

[ -f ~/.config/shell/rc-utils.sh ] && . ~/.config/shell/rc-utils.sh


###################
##### install #####
###################

# key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] || $(brew --prefix)/opt/fzf/install


##################
##### config #####
##################

bindkey -e
setopt EXTENDED_GLOB


##################
### completion ###
##################

fpath+=~/.zfunc
if _rc_exists brew; then
  fpath+="$(brew --prefix)/share/zsh/site-functions"
fi

autoload -Uz bashcompinit && bashcompinit -i
autoload -Uz compinit && compinit

# aws completion
complete -C '/usr/local/bin/aws_completer' aws

# nvm completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# iTerm2 shell integration
[ -e "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"

# Angular CLI autocompletion
_rc_exists ng && source <(ng completion script)

# pipx completion
eval "$(register-python-argcomplete pipx)"


#####################
### Aliases & env ###
#####################

alias vim=nvim
export PTPYTHON_CONFIG_HOME="$HOME/.config/ptpython"

source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases.sh"

if [[ -o rcs ]]; then
    [ -x "${HOME}/.zshenv.local" ] && source "$HOME/.zshenv.local"
fi

# This is scuffed
# # https://egeek.me/2020/04/18/enabling-locate-on-osx/
# if which glocate > /dev/null; then
#   alias locate='glocate -d "${HOME}/.local/share/locate.database"'
#
#   # Using cache_list requires `LOCATE_PATH` environment var to exist in session.
#   # trouble shoot: `echo $LOCATE_PATH` needs to return db path.
#   [[ -f "${HOME}/.local/share/locate.database" ]] && export LOCATE_PATH="${HOME}/.local/share/locate.database"
# fi
#
# alias loaddb='gupdatedb --localpaths="$REPOS" --prunepaths="/Volumes" --output=${HOME}/.local/share/locate.database'


###########
### etc ###
###########

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"
nvm use --lts &>/dev/null


####################
##### Starship #####
## (must be last) ##
####################

eval "$(starship init zsh)"
