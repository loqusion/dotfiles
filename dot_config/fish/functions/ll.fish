if not command -q eza
    function ll --wraps='ls --color=auto -lAh' --description 'alias ls ls --color=auto -lAh'
        command ls --color=auto -lAh $argv
    end
    return
end

function ll --wraps='eza --icons --hyperlink --group-directories-first --all --long --git' --description 'alias ll eza --icons --hyperlink --group-directories-first --all --long --git'
    eza --icons --hyperlink --group-directories-first --all --long --git $argv
end
