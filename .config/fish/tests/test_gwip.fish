source $FISH_CONFIG_DIR/conf.d/fish/gwip.fish

function before_each
    set -g tmp_dir (mktemp -dt 'fish_test-XXXXXXXXXX')
    pushd $tmp_dir
end

function after_each
    popd
    rm -rf $tmp_dir
end

function __init
    git init --object-format=sha1; or return
    echo init >init.txt; or return
    git add .; or return
    git commit --message 'initial commit'; or return
end

function test_smoke
    __init
    assert_cmd; or return

    git log | string length -q
    assert_cmd 'log message should not be empty'
end

function test_gwip_creates_wip_commit
    __init
    assert_cmd; or return

    echo wip >wip.txt; or return
    gwip
    assert_cmd; or return

    test (git ls-files --others --exclude-standard | count) -eq 0
    assert_cmd 'expected no untracked files'; or return
    test "$(git rev-list --max-count=1 --grep='^--wip--' HEAD)" = "$(git rev-parse --verify HEAD)"
    assert_cmd 'expected matching commit message to be HEAD'; or return
    assert_snapshot gwip_difftree \
        "$(git diff-tree --no-commit-id --patch HEAD |
            grep -vE '^index [[:alnum:]]*\.\.[[:alnum:]]*$' |
            grep -vE '^new file mode [[:digit:]]*$')" \
        'expected commit to only include WIP changes'; or return
end

function test_gwip_ignores_clean_working_tree
    __init
    assert_cmd; or return

    gwip
    assert_cmd; or return

    test "$(git rev-list --max-count=1 --no-commit-header --pretty='format:%s' HEAD)" \
        = "initial commit"
    assert_cmd 'expected HEAD to be initial commit'; or return
end

function test_gwip_amends_previous_wip_commit
    __init
    assert_cmd; or return

    echo wip >wip.txt; or return
    gwip
    assert_cmd; or return

    echo hi >hi.txt; or return
    gwip
    assert_cmd; or return

    test (git ls-files --others --exclude-standard | count) -eq 0
    assert_cmd 'expected no untracked files'; or return
    test "$(git rev-list --max-count=1 --grep='^--wip--' HEAD)" = "$(git rev-parse --verify HEAD)"
    assert_cmd 'expected matching commit message to be HEAD'; or return
    test "$(git rev-list --count --grep='^--wip--' HEAD)" -eq 1
    assert_cmd 'expected only 1 WIP commit'; or return
    assert_snapshot gwip_amend_difftree \
        "$(git diff-tree --no-commit-id --patch HEAD |
            grep -vE '^index [[:alnum:]]*\.\.[[:alnum:]]*$' |
            grep -vE '^new file mode [[:digit:]]*$')" \
        'expected commit to include old and new WIP changes'; or return
end

function test_gwip_removes_previous_wip_commit_if_empty
    __init
    assert_cmd; or return

    echo wip >wip.txt; or return
    gwip
    assert_cmd; or return

    rm wip.txt; or return
    gwip
    assert_cmd; or return

    test "$(git rev-list --count --grep='^--wip--' HEAD)" -eq 0
    assert_cmd 'expected no WIP commits'; or return
    test "$(git rev-list --max-count=1 --no-commit-header --pretty='format:%s' HEAD)" \
        = "initial commit"
    assert_cmd 'expected HEAD to be initial commit'; or return
    test (git diff-index --cached --name-only HEAD | count) -eq 0
    assert_cmd 'expected index to be identical to HEAD'; or return
    test (git diff-files --name-only | count) -eq 0
    assert_cmd 'expected index to be identical to working tree'; or return
end

function test_gunwip_resets_wip_commit
    __init
    assert_cmd; or return

    gunwip
    assert_cmd_fail 'expected gunwip to fail when there is no WIP commit'; or return
    test "$(git rev-list --max-count=1 --no-commit-header --pretty='format:%s' HEAD)" \
        = "initial commit"
    assert_cmd 'expected HEAD to be initial commit'; or return

    echo wip >wip.txt; or return
    gwip
    assert_cmd; or return

    gunwip
    assert_cmd; or return

    test "$(git rev-list --count --grep='^--wip--' HEAD)" -eq 0
    assert_cmd 'expected no WIP commits'
    test "$(git rev-list --max-count=1 --no-commit-header --pretty='format:%s' HEAD)" \
        = "initial commit"
    assert_cmd 'expected HEAD to be initial commit'; or return
    test "$(git ls-files --others --exclude-standard)" = "wip.txt"
    assert_cmd 'expected untracked files to only consist of wip.txt'; or return
    test (git diff-index --cached --name-only HEAD | count) -eq 0
    assert_cmd 'expected index to be identical to HEAD'; or return
end

function test_gunwip_fails_when_no_commits
    git init --object-format=sha1
    assert_cmd; or return

    gunwip
    assert_cmd_fail 'expected gunwip to fail when there are no commits'; or return

    git rev-parse --quiet --verify HEAD
    assert_cmd_fail 'expected no HEAD'; or return
end
