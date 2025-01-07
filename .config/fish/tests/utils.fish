function assert_cmd -a msg
    set cmd_status $status
    set -l rest_args $argv[2..-1]

    if test $cmd_status -ne 0
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
    set cmd_status $status
    set -l rest_args $argv[2..-1]

    if test $cmd_status -eq 0
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
        set expected "$(cat $snapshot_file)"; or return
        diff -q (echo "$actual" | psub) (echo "$expected" | psub) &>/dev/null
        set snapshot_status $status

        if test $snapshot_status -ne 0
            echo "snapshot assertion for $name failed"
            __show_diff "$expected" "$actual"
        end

        return $snapshot_status
    else
        echo -n $actual >$snapshot_file
        echo "wrote snapshot to $(realpath --relative-to=$test_dir/.. $snapshot_file)"
    end
end
