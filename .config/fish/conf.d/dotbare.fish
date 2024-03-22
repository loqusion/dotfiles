if test -d ~/.dotbare
    fish_add_path ~/.dotbare
end

set -Ux DOTBARE_DIR "$HOME/.local/share/dotfiles"
set -Ux DOTBARE_TREE $HOME

abbr cs "dotbare status"
abbr ca "dotbare add -v"
abbr crs "dotbare reset"
abbr crm "dotbare rm"
abbr cmv "dotbare mv"
abbr crt "dotbare restore"
abbr crt! "dotbare restore --worktree --staged"
abbr ccm "dotbare commit -v"
abbr cpu "dotbare push -v"
abbr cpl "dotbare pull -v --autostash --rebase"
abbr csus "dotbare submodule status --recursive"
abbr csuu "dotbare submodule update --progress -j (nproc) --single-branch --init --remote --recursive --rebase"
