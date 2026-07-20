#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# cd by just typing the directory name
shopt -s autocd

if [[ -r /usr/share/doc/pkgfile/command-not-found.bash ]]; then
	. /usr/share/doc/pkgfile/command-not-found.bash
fi
