function __complete_unbuffer
    set -l cmd (commandline -o)
    set -e cmd[1]
    if test -n "$cmd"
        complete -C "$cmd"
    else
        __fish_complete_command
    end
end

complete -c unbuffer -a "(__complete_unbuffer)"
