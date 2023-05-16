set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

set -Ux fish_user_paths
fish_add_path ~/.cargo/bin
fish_add_path ~/.bin

set -U fish_greeting ""

set -Ux LESS -RFQM
set -Ux MANPAGER "nvim +Man!"

set -Ux CC (which clang)

abbr mv "mv -iv"
abbr cp "cp -riv"
abbr mkdir "mkdir -vp"
abbr l ll
abbr grep rg
abbr icat wezterm imgcat

abbr vim nvim
abbr vi nvim
abbr v nvim
abbr vd "cd ~/.config/nvim; nvim"
abbr sv sudoedit
abbr vsudo sudoedit

abbr c dotbare
abbr lg lazygit

abbr df "df -h"
abbr caf 'caffeinate -d'
abbr tarify "tar czpvf"
abbr untar "tar xvf"

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
