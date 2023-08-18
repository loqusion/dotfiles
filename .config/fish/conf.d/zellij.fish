if status is-interactive && set -q START_ZELLIJ
    if not set -q ZELLIJ
        zellij attach -c
        if test $status -eq 0
            kill $fish_pid
        end
    end
end
