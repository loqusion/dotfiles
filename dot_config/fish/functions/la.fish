if not command -q eza
    function la --wraps='ls --color=auto -A' --description 'alias ls ls --color=auto -A'
        command ls --color=auto -A $argv
    end
    return
end

function la --wraps='eza --icons --hyperlink --group-directories-first --all' --description 'alias la eza --icons --hyperlink --group-directories-first --all'
    eza --icons --hyperlink --group-directories-first --all $argv
end
