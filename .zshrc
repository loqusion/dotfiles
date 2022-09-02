##################
#### antigen #####
##################

source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh
# antigen bundle nvm
antigen bundle git
antigen bundle rust
antigen bundle yarn

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle lukechilds/zsh-nvm
antigen bundle lukechilds/zsh-better-npm-completion
antigen bundle buonomo/yarn-completion

antigen apply

###################
##### install #####
###################

# key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] || $(brew --prefix)/opt/fzf/install


##################
##### config #####
##################

bindkey -e


##################
### completion ###
##################

if hash brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz bashcompinit && bashcompinit -i
autoload -Uz compinit && compinit

# aws completion
complete -C '/usr/local/bin/aws_completer' aws

# nvm completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Angular CLI autocompletion
hash ng &>/dev/null && source <(ng completion script)


#####################
### Aliases & env ###
#####################

alias vim=nvim
export PTPYTHON_CONFIG_HOME="$HOME/.config/ptpython"

source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases.sh"

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
