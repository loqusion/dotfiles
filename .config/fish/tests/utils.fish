function __caller_site -a depth
    set -l stack_trace (status stack-trace)
    set -l test_dir (status dirname)

    set -l index (math $depth \* 2 + 2)
    set -l called_on_line $stack_trace[$index]

    function bug_stack_trace_does_not_match_regex \
        --inherit-variable index \
        --inherit-variable called_on_line \
        --inherit-variable stack_trace
        echo "$(set_color yellow)warning$(set_color normal): stack trace line $index doesn't match regex:" >&2
        echo "$called_on_line" >&2
        echo >&2
        echo "Full stack trace:" >&2
        string join \n $stack_trace >&2
        echo >&2
        echo "This is a bug." >&2
    end

    function bug_index_out_of_bounds \
        --inherit-variable index \
        --inherit-variable stack_trace
        echo "$(set_color yellow)warning$(set_color normal): index out of bounds: $index" >&2
        echo "Stack trace:" >&2
        string join \n $stack_trace >&2
        echo >&2
        echo "This is a bug." >&2
    end

    if string length -q $called_on_line
        string match -q --regex 'called on line (?<line>\d+) of file (?<file>.*)' -- "$called_on_line"; or begin
            bug_stack_trace_does_not_match_regex
            return 1
        end
        set file (echo $file | string replace --regex '^~/' $HOME/)
        set normalized_file (realpath --relative-to=$test_dir/.. $file)
        and set file $normalized_file
        echo "$file:$line"
    else
        bug_index_out_of_bounds
        return 1
    end
end

function __print_caller_site -a caller_site
    echo $caller_site
end

function assert_cmd -a msg
    set -l cmd_status $status
    set -l rest_args $argv[2..-1]

    if test $cmd_status -ne 0
        set -l caller_site (__caller_site 3); and __print_caller_site $caller_site

        if string length -q $msg
            printf "assertion failed: $msg\n" $rest_args
        else
            printf "assertion failed: command failed\n"
            echo "  status: $cmd_status"
        end
    end

    return $cmd_status
end

function assert_cmd_fail -a msg
    set -l cmd_status $status
    set -l rest_args $argv[2..-1]

    if test $cmd_status -eq 0
        set -l caller_site (__caller_site 3); and __print_caller_site $caller_site

        if string length -q $msg
            printf "assertion failed: $msg\n" $rest_args
        else
            printf "assertion failed: expected command to fail\n"
        end

        return 1
    else
        return 0
    end
end

function assert_eq -a left -a right -a msg
    set -l rest_args $argv[4..-1]

    if test "$left" != "$right"
        set -l caller_site (__caller_site 3); and __print_caller_site $caller_site

        if string length -q $msg
            printf "assertion `left == right` failed: $msg\n" $argv
        else
            printf "assertion `left == right` failed\n"
        end
        echo "  left: $left"
        echo " right: $right"

        return 1
    end
end

function assert_ne -a left -a right -a msg
    set -l rest_args $argv[4..-1]

    if test "$left" = "$right"
        set -l caller_site (__caller_site 3); and __print_caller_site $caller_site

        if string length -q $msg
            printf "assertion `left != right` failed: $msg\n" $argv
        else
            printf "assertion `left != right` failed\n"
        end
        echo "  left: $left"
        echo " right: $right"

        return 1
    end
end

function __show_diff -a expected -a actual
    if command -q delta
        delta --line-numbers --paging never \
            (echo "$actual" | psub --suffix '.actual') \
            (echo "$expected" | psub --suffix '.expected')
    else
        echo "$(set_color red)actual$(set_color normal) ⟶ $(set_color green)expected$(set_color normal)"
        command diff --color=auto (echo "$actual" | psub) (echo "$expected" | psub)
    end
end

function assert_snapshot -a name -a actual
    set -l test_dir (status dirname)
    set -l snapshot_dir $test_dir/snapshots
    mkdir --parents --mode=755 $snapshot_dir; or return

    set -l snapshot_file $snapshot_dir/$name.snap
    if test -f $snapshot_file
        set -l expected "$(cat $snapshot_file)"; or return
        diff -q (echo "$actual" | psub) (echo "$expected" | psub) &>/dev/null
        set -l snapshot_status $status

        if test $snapshot_status -ne 0
            set -l caller_site (__caller_site 3); and __print_caller_site $caller_site

            echo "snapshot assertion for $name failed"
            __show_diff "$expected" "$actual"
        end

        return $snapshot_status
    else
        echo -n $actual >$snapshot_file; or return
        echo "wrote snapshot to $(realpath --relative-to=$test_dir/.. $snapshot_file)"
    end
end
