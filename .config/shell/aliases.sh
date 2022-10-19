# shellcheck disable=all

alias config='git --git-dir="$HOME/.local/share/dotfiles" --work-tree="$HOME"'
alias c=config
alias zshrc='$EDITOR "$HOME/.zshrc"'

alias fzp='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'

alias rustdoc='rustup doc --toolchain=stable-x86_64-apple-darwin'

# <command> --help | viman
alias viman='NVIM_DISABLE_YABAI_TOGGLE=true nvim -c Man\!'
alias neovide='NEOVIDE_MULTIGRID=1 neovide'
alias nvide='NVIM_DISABLE_YABAI_TOGGLE=true neovide'
alias org='(cd ~ && NVIM_DISABLE_YABAI_TOGGLE=true nvim -c "packadd neorg | Neorg workspace main")'
alias gtd='(cd ~ && NVIM_DISABLE_YABAI_TOGGLE=true nvim -c "packadd neorg | Neorg workspace gtd")'
alias todo='gtd'
alias orgj='(cd ~ && NVIM_DISABLE_YABAI_TOGGLE=true nvim -c "packadd neorg | Neorg journal")'
alias crows='nvim -c CrowsResync'

alias lg='lazygit'

alias caf='caffeinate -d'
function linecount() {
    find "${1:-.}" -name "*.*" -print | xargs wc -l
}

function dict() {
    curl "dict://dict.org/d:$1" | eval "${PAGER:-less}"
}

alias tarify='tar czpvf'
alias untar='tar xvf'
