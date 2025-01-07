function __git_abbr_reset_or_delete_head
    if set -l parent_hash (git rev-parse --quiet --verify 'HEAD^')
        git reset $parent_hash
    else
        # WARN: This makes recovery using HEAD@{n} temporarily impossible. Find an alternative?
        git update-ref -d HEAD
        git reset
        # echo 'warning: TODO' >&2
        # git commit --no-verify --no-gpg-sign --amend --no-edit --allow-empty --message 'empty commit'
    end
end

function gwip --description 'Create or update WIP commit containing working tree changes'
    git add --all; or return
    if git rev-parse --quiet --verify HEAD >/dev/null
        and git diff --quiet --exit-code --cached HEAD
        return 0
    end

    if git log --max-count=1 --pretty='format:%s' 2>/dev/null | grep --quiet --count '^--wip--'
        set -l commit_output \
            (git commit --no-verify --no-gpg-sign --amend --no-edit --allow-empty); or return

        if git diff-tree -r --root --no-commit-id --name-only HEAD | grep --quiet --count '.'
            echo $commit_output
        else
            echo 'WIP commit is empty; removing' >&2
            __git_abbr_reset_or_delete_head
        end
    else
        # Either git log failed (no commits), or grep failed (last commit didn't match)
        git commit --no-verify --no-gpg-sign --message '--wip-- [skip ci]'
    end
end

function gunwip --description 'Reset current HEAD to commit before WIP'
    set -l commit_subject (git log --max-count=1 --pretty='format:%s'); or return
    if echo $commit_subject | grep --quiet --count '^--wip--'
        __git_abbr_reset_or_delete_head
    else
        echo 'error: no WIP commit found' >&2
        return 169
    end
end
