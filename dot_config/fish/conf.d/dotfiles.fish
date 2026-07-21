abbr c chezmoi
abbr cs 'chezmoi status'
abbr ca 'chezmoi add'
abbr cr 'chezmoi re-add'
abbr cv 'chezmoi edit --apply'
abbr cvn 'chezmoi edit'
abbr cdd 'chezmoi diff | delta'
abbr cap 'chezmoi apply'
abbr cu 'chezmoi update'

abbr cg 'chezmoi git'
abbr cgs 'chezmoi git status'

abbr lgc "lazygit --work-tree=(chezmoi source-path)"

function __dotfiles_push -a message file
    chezmoi add $file
    and chezmoi git -- commit -v -m "$message" -- (chezmoi source-path $file)
    and chezmoi git -- push
end

if false
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
end
