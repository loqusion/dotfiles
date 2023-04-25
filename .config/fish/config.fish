set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

set -Ux fish_user_paths
fish_add_path ~/.cargo/bin

set -Ux LESS -RFQM
set -Ux MANPAGER "nvim +Man!"

abbr mv "mv -iv"
abbr cp "cp -riv"
abbr mkdir "mkdir -vp"
alias -s ls "exa --color=always --icons --group-directories-first"
alias -s la 'exa --color=always --icons --group-directories-first --all'
alias -s ll 'exa --color=always --icons --group-directories-first --all --long'
abbr l ll

abbr vim nvim
abbr vi nvim
abbr v nvim
abbr vd "cd ~/.config/nvim; nvim"
abbr sv sudoedit
abbr vsudo sudoedit

alias -s config 'git --git-dir="$HOME/.local/share/dotfiles" --work-tree="$HOME"'
abbr c config
abbr lg lazygit

abbr df "grc /bin/df -h"
abbr caf 'caffeinate -d'
abbr tarify "tar czpvf"
abbr untar "tar xvf"
alias -s define 'curl dict://dict.org/d:$1 | less'
