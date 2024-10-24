function ll --wraps='eza --color=always --icons --group-directories-first --all --long --git' --description 'alias ll eza --color=always --icons --group-directories-first --all --long'
    if isatty 1 && command -q eza
        eza --color=always --icons --group-directories-first --all --long --git $argv
    else
        command ls -lA --color=always $argv
    end

end
