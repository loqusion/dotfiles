if not set -q LOQUSION_SYSTEMD_INHIBIT
    if set -q SSH_CONNECTION
        LOQUSION_SYSTEMD_INHIBIT=true exec systemd-inhibit --who="SSH session" --why="Active user" --what="idle" --mode=block $SHELL
        exit $status
    end
end

if status is-interactive && set -q START_ZELLIJ
    set -gx ZELLIJ_AUTO_START true
    set -gx ZELLIJ_AUTO_EXIT true
    eval (zellij setup --generate-auto-start fish | string collect)
end

set -gx LOCALE_ARCHIVE /usr/lib/locale/locale-archive

set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

set -gx GOPATH $HOME/.go
set -gx CARGO_HOME $HOME/.cargo

fish_add_path $CARGO_HOME/bin
fish_add_path $GOPATH/bin
fish_add_path ~/.bin
fish_add_path ~/.local/bin

set -U fish_greeting ""

set -Ux LESS -rQM
set -Ux MANPAGER "nvim +Man!"

if string match -riq '^wezterm' $TERM_PROGRAM
    alias nvim "TERM=wezterm $(which nvim)"
    alias ssh "TERM=wezterm $(which ssh)"
end

abbr mv "mv -iv"
abbr cp "cp -riv"
abbr rm trash
abbr mkdir "mkdir -vp"
abbr l ll
abbr tree "eza --tree --git-ignore"
abbr b bat

abbr vim nvim
abbr vi nvim
abbr v nvim
abbr vd "cd ~/.config/nvim && $EDITOR"
abbr sv sudoedit
abbr vsudo sudoedit
abbr vup "dotbare commit -v -m 'chore(vim): upgrade' ~/.config/nvim/lazy-lock.json && dotbare push"
abbr vrt "dotbare restore --worktree --staged ~/.config/nvim/lazy-lock.json"
abbr hup "~/.config/home-manager/update.sh && dotbare commit -v -m 'chore(home-manager): upgrade ~/.config/home-manager && dotbare push"

abbr c dotbare
abbr lg lazygit
abbr lgc "lazygit --git-dir=\$DOTBARE_DIR --work-tree=\$DOTBARE_TREE"

abbr df "df -h"
abbr du "du -h"
abbr bc "bc -ql"
abbr caf "caffeinate -d"
abbr tarify "tar czpvf"
abbr untar "tar xvf"
abbr glow "glow -p"
abbr ub unbuffer

abbr zj zellij
abbr zja "zellij attach"

if command -q rtx
    rtx activate fish | source
end
