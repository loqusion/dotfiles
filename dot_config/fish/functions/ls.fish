if not command -q eza
    function ls --description 'alias ls ls --color=auto'
        command ls --color=auto $argv
    end
    return
end

function ls --wraps='eza --icons --hyperlink --group-directories-first' --description 'alias ls eza --icons --hyperlink --group-directories-first'
    eza --icons --hyperlink --group-directories-first $argv
end
