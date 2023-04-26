function fzp --wraps='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"' --description 'alias fzp fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
  fzf --preview "bat --color=always --style=numbers --line-range=:500 {}" $argv
        
end
