set basename (status basename)
set dirname (realpath (status dirname))
set test_file $argv[1]
set test_file_basename (basename $test_file)
if test -z (string trim $test_file)
    echo "$basename: must provide an argument" >&2
    return 1
end

source $dirname/tests/utils.fish
source $test_file

set functions (functions --names)
set unfiltered_tests (string join0 $functions | grep -z '^test_' | string split0)
set before_all (string join0 $functions | grep -z '^before_all$' | string split0)
set before_each (string join0 $functions | grep -z '^before_each$' | string split0)
set after_all (string join0 $functions | grep -z '^after_all$' | string split0)
set after_each (string join0 $functions | grep -z '^after_each$' | string split0)

echo "$(set_color green)Running$(set_color normal) $test_file_basename" >&2

function __hook_exists -a hook_name \
    --inherit-variable before_all \
    --inherit-variable before_each \
    --inherit-variable after_all \
    --inherit-variable after_each
    switch $hook_name
        case before_all
            string length -q $before_all
        case before_each
            string length -q $before_each
        case after_all
            string length -q $after_all
        case after_each
            string length -q $after_each
        case '*'
            echo "$(set_color yellow)WARNING$(set_color normal): invalid hook name: $hook_name" >&2
            echo 'This is a bug.' >&2
            false
    end
end

function __try_hook -a hook_name -a error_fmt
    set -l rest_args $argv[3..-1]

    if not __hook_exists $hook_name
        return 0
    end

    eval $hook_name
    set -l hook_status $status

    if test $hook_status -ne 0
        printf $error_fmt $hook_status $rest_args >&2
        return $hook_status
    end
end

if not set -q TEST_FILTER
    set -gx TEST_FILTER '.'
end
set tests (string join0 $unfiltered_tests | grep -zE "$TEST_FILTER" | string split0)

if test (count $tests) -eq 0
    echo 'No tests matched environment variable TEST_FILTER' >&2
    return 0
end

__try_hook before_all \
    "$(set_color red)FAILED$(set_color normal): before_all failed with exit code %d\n"
or begin
    set before_all_status $status
    __try_hook after_all "after_all failed with exit code %d\n"
    return $before_all_status
end

set result 0
for test in $tests
    __try_hook before_each \
        "test $test ... $(set_color red)FAILED$(set_color normal): before_each failed with exit code %d\n"
    or begin
        set result 1
        __try_hook after_each "after_each failed with exit code %d\n"
        continue
    end

    begin
        eval $test
        set test_status $status
    end &| read --null test_output

    __try_hook after_each \
        "test $test ... $(set_color red)FAILED$(set_color normal): after_each failed with exit code %d\n"
    or begin
        set result 1
        continue
    end

    if test $test_status -eq 0
        echo "test $test ... $(set_color green)ok$(set_color normal)"
    else
        set result 1
        echo "test $test ... $(set_color red)FAILED$(set_color normal)"
    end

    if set -q TEST_NOCAPTURE; and string length -q $test_output
        echo $test_output
    end
end

__try_hook after_all \
    "$(set_color red)FAILED$(set_color normal): after_all failed with exit code %d\n"
or set result 1

return $result
