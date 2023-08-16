if status is-interactive
    if not set -q ZELLIJ
        zellij attach -c
        if test $status -eq 0
            kill $fish_pid
        end
    end
end
