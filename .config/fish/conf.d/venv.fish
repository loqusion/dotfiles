# Based on https://gist.github.com/bastibe/c0950e463ffdfdfada7adf149ae77c6f
# and https://gist.github.com/tommyip/cf9099fa6053e30247e5d0318de2fb9e

function __venv_echo
    echo "venv: $argv" >&2
end

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
        if test -e $venv_dir/bin/activate.fish
            echo $venv_dir
            return
        end
    end

    return
end

function __serialize_path -a path
    string replace -a / "%" $path
end

function __venv_consent_file -a venv_dir
    set xdg_state_home $XDG_STATE_HOME
    if test -z $xdg_state_home
        set xdg_state_home $HOME/.local/state
    end
    set consent_dir $xdg_state_home/loqusion-venv
    set consent_file $consent_dir/(__serialize_path $venv_dir)

    mkdir -p $consent_dir
    echo $consent_file
end

function __venv_get_consent_from_file -a consent_file
    if ! test -r $consent_file
        return
    end
    cat $consent_file
end

function __venv_set_consent -a consent_file -a consent
    echo $consent >$consent_file
end

function __venv_allow -a venv_dir -a consent_file
    if test -z "$venv_dir"
        set venv_dir (__get_venv_dir)
    end
    if test -z "$consent_file"
        set consent_file (__venv_consent_file $venv_dir)
    end

    __venv_set_consent $consent_file allow
end

function __venv_deny -a venv_dir -a consent_file
    if test -z "$venv_dir"
        set venv_dir (__get_venv_dir)
    end
    if test -z "$consent_file"
        set consent_file (__venv_consent_file $venv_dir)
    end

    __venv_set_consent $consent_file deny
end

function __venv_consent_get_response -a venv_dir
    while read --nchars 1 -l response --prompt-str="Allow activation of $venv_dir? [y/n]"
        or return 1
        switch $response
            case y Y
                echo allow
                break
            case n N
                echo deny
                break
            case '*'
                echo "Invalid response. Please enter 'y' or 'n'." >&2
                continue
        end
    end
end

function __venv_acquire_consent -a venv_dir -a consent_file
    if not set response (__venv_consent_get_response $venv_dir)
        return 1
    end

    __venv_set_consent $consent_file $response

    echo $response
end

function __venv_consent -a venv_dir
    set consent_file (__venv_consent_file $venv_dir)

    set consent (__venv_get_consent_from_file $consent_file)
    if test -z "$consent"
        if not set consent (__venv_acquire_consent $venv_dir $consent_file)
            return 1
        end
    end

    switch $consent
        case allow
            return 0
        case deny
            return 1
        case '*'
            __venv_echo "Invalid contents of $consent_file: $consent"
            return 1
    end
end

function __auto_source_venv --on-variable PWD --description "Activate/Deactivate virtualenv on directory change"
    if status --is-command-substitution
        return
    end

    set venv_dir (__get_venv_dir)

    if test -n "$VIRTUAL_ENV" -a "$VIRTUAL_ENV" != "$venv_dir"
        __venv_echo "deactivating $VIRTUAL_ENV"
        deactivate
    end

    if test -n "$venv_dir" -a "$VIRTUAL_ENV" != "$venv_dir"
        and test -e $venv_dir/bin/activate.fish
        and __venv_consent $venv_dir
        __venv_echo "activating $venv_dir"
        source $venv_dir/bin/activate.fish
    end
end

__auto_source_venv
