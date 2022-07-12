. "$HOME/.cargo/env"
. "$HOME/.nvm/nvm.sh"
eval "$(/opt/homebrew/bin/brew shellenv)"

#---- Environment variables ------------#
export EDITOR=nvim
export FCEDIT=nvim
export PAGER=less
export LESS='-RQM'
export GZIP='-v9N'
export SHELL=zsh
export MANPAGER='NVIM_DISABLE_YABAI_TOGGLE=true nvim ++Man\!'
export GOPATH="$HOME/.go"
export LC_ALL='en_US.UTF-8'
HOMEBREW_PREFIX='/opt/homebrew'
export PATH="${HOME}/bin:${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin:${HOME}/.yarn/bin:${PATH}:${HOMEBREW_PREFIX}/opt/ruby/bin:${PATH}:${HOMEBREW_PREFIX}/lib/ruby/gems/3.1.0/bin:${HOME}/.luarocks/bin:${PATH}"
export NVM_DIR="$HOME/.nvm"
export XDG_CONFIG_HOME=$HOME/.config
export CC=$(which clang)
export REPOS="${HOME}/repos"

#---- SVN -----------------#
export SVN_EDITOR="vim"

#---- accept-line-with-url ---#
export DOWNLOADER="wget -S"

#--------- fzf -------------------#
export FZF_DEFAULT_COMMAND=fd
