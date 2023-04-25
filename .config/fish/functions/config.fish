function config --wraps='git --git-dir="$HOME/.local/share/dotfiles" --work-tree="$HOME"' --description 'alias config git --git-dir="$HOME/.local/share/dotfiles" --work-tree="$HOME"'
  git --git-dir="$HOME/.local/share/dotfiles" --work-tree="$HOME" $argv
        
end
