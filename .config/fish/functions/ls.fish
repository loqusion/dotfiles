function ls --wraps='eza --color=always --icons --group-directories-first' --description 'alias ls eza --color=always --icons --group-directories-first'
    if isatty 1 && command -q eza
        eza --color=always --icons --group-directories-first $argv
    else
        command ls --color=auto $argv
    end
end
