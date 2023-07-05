# Based on https://gist.github.com/bastibe/c0950e463ffdfdfada7adf149ae77c6f
# and https://gist.github.com/tommyip/cf9099fa6053e30247e5d0318de2fb9e

function __get_venv_dir
    set root_dir (git rev-parse --show-toplevel 2>/dev/null)
    if test $status -ne 0
        set root_dir $PWD
    end

    if test -e "$root_dir/poetry.lock"
        poetry env info -p
        return
    end

    set VENV_DIR_NAMES venv .venv env .env
    set -l venv_dir
    for venv_dir in $root_dir/$VENV_DIR_NAMES
        if test -e "$venv_dir/bin/activate.fish"
            echo $venv_dir
            return
        end
    end

    return
end

function __auto_source_venv --on-variable PWD --description "Activate/Deactivate virtualenv on directory change"
    if status --is-command-substitution
        return
    end

    set venv_dir (__get_venv_dir)

    if test "$VIRTUAL_ENV" != "$venv_dir" -a -e "$venv_dir/bin/activate.fish"
        source $venv_dir/bin/activate.fish
    else if not test -z "$VIRTUAL_ENV" -o -e "$venv_dir"
        deactivate
    end
end

__auto_source_venv
