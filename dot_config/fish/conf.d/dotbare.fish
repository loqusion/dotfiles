if test -d ~/.dotbare
    fish_add_path ~/.dotbare
end

set -Ux DOTBARE_DIR ~/.local/share/dotfiles
set -Ux DOTBARE_TREE ~

abbr cs 'dotbare status'
abbr csl 'dotbare status --long'
abbr ca 'dotbare add -v'
abbr crs 'dotbare reset'
abbr crm 'dotbare rm'
abbr crmc 'dotbare rm --cached'
abbr cmv 'dotbare mv'
abbr crt 'dotbare restore'
abbr crt! 'dotbare restore --worktree --staged'
abbr ccm 'dotbare commit'
abbr cpu 'dotbare push'
abbr cpl 'dotbare pull --autostash --rebase'
abbr csm 'dotbare submodule'
abbr csmi 'dotbare submodule update --init --recursive'
abbr csmu 'dotbare submodule update --remote --recursive'
