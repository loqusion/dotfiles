function ll --wraps='exa --color=always --icons --group-directories-first --all --long' --description 'alias ll exa --color=always --icons --group-directories-first --all --long'
    if command -q exa
        exa --color=always --icons --group-directories-first --all --long $argv
    else
        command ls -lFA --color=always $argv
    end

end
