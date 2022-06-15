alias config='git --git-dir="$HOME/.local/share/dotfiles" --work-tree="$HOME"'
alias c=config
alias zshrc='$EDITOR "$HOME/.zshrc"'

alias rustdoc='rustup doc --toolchain=stable-x86_64-apple-darwin'

# <command> --help | viman
alias viman='nvim ++Man\!'
alias neovide='NEOVIDE_MULTIGRID=1 neovide'
alias nvide='neovide'

alias lg='lazygit'

alias caf='caffeinate -d'
function linecount() {
    find "${1:-.}" -name "*.*" -print | xargs wc -l
}
