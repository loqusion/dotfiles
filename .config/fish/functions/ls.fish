function ls --wraps='exa --color=always --icons --group-directories-first' --description 'alias ls exa --color=always --icons --group-directories-first'
    exa --color=always --icons --group-directories-first $argv || ls -F --color=always $argv

end
