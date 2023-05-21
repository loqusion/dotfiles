function ls --wraps='exa --color=always --icons --group-directories-first' --description 'alias ls exa --color=always --icons --group-directories-first'
    if command -q exa
        exa --color=always --icons --group-directories-first $argv
    else
        command ls -F --color=always $argv
    end
end
