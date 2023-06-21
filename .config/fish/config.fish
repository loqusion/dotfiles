set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

set -gx GOPATH $HOME/.go
set -gx CARGO_HOME $HOME/.cargo

set -Ux fish_user_paths
fish_add_path $CARGO_HOME/bin
fish_add_path $GOPATH/bin
fish_add_path ~/.bin

set -U fish_greeting ""

set -Ux LESS -RFQM
set -Ux MANPAGER "nvim +Man!"

abbr mv "mv -iv"
abbr cp "cp -riv"
abbr mkdir "mkdir -vp"
abbr l ll
abbr tree "ls --tree"
abbr icat wezterm imgcat

abbr vim nvim
abbr vi nvim
abbr v nvim
abbr vd "cd ~/.config/nvim; nvim"
abbr sv sudoedit
abbr vsudo sudoedit
abbr vup "dotbare commit -v -m 'chore(vim): upgrade' ~/.config/nvim/lazy-lock.json && dotbare push"

abbr c dotbare
abbr lg lazygit

abbr df "df -h"
abbr du "du -h"
abbr bc "bc -ql"
abbr caf "caffeinate -d"
abbr tarify "tar czpvf"
abbr untar "tar xvf"
abbr glow "glow -p"

abbr rman rusty-man

rtx activate fish | source
