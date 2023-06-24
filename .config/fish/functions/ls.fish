function ls --wraps='exa --color=always --icons --group-directories-first' --description 'alias ls exa --color=always --icons --group-directories-first'
    if isatty 1 && command -q exa
        exa --color=always --icons --group-directories-first $argv
    else
        command ls --color=auto $argv
    end
end
