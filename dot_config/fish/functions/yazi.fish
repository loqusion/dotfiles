# In Yazi, press `q` to quit and change CWD; press `Q` to quit without changing CWD.
function yazi --description 'Yazi File Manager'
    set -l tmp (mktemp -t 'yazi-cwd.XXXXXX'); or return

    command yazi $argv --cwd-file="$tmp"

    if set -l cwd (command cat -- "$tmp")
        and test -n "$cwd"
        and test "$cwd" != "$PWD"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end
