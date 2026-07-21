function la --wraps='eza --color=always --icons --group-directories-first --all' --description 'alias la eza --color=always --icons --group-directories-first --all'
    if isatty 1 && command -q eza
        eza --color=always --icons --group-directories-first --all $argv
    else
        command ls -A --color=auto $argv
    end
end
