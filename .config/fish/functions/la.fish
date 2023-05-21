function la --wraps='exa --color=always --icons --group-directories-first --all' --description 'alias la exa --color=always --icons --group-directories-first --all'
    if command -q exa
        exa --color=always --icons --group-directories-first --all $argv
    else
        command ls -FA --color=always $argv
    end
end
