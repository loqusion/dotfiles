function ll --wraps='exa --color=always --icons --group-directories-first --all --long' --description 'alias ll exa --color=always --icons --group-directories-first --all --long'
    if isatty 1 && command -q exa
        exa --color=always --icons --group-directories-first --all --long $argv
    else
        command ls -lA --color=always $argv
    end

end
