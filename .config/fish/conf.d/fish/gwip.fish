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
        else if set -l parent_hash (git rev-parse --quiet --verify 'HEAD^')
            echo 'WIP commit is empty; resetting to parent' >&2
            git reset $parent_hash
        end
    else
        # Either git log failed (no commits), or grep failed (last commit didn't match)
        git commit --no-verify --no-gpg-sign --message '--wip-- [skip ci]'
    end
end

function gunwip --description 'Reset current HEAD to commit before WIP'
    # Using `set commit_subject (...)` here prevents stderr redirection from
    # working correctly
    begin
        git log --max-count=1 --pretty='format:%s'; or return
    end | read --function commit_subject

    if echo $commit_subject | grep --quiet --count '^--wip--'
        if set -l parent_hash (git rev-parse --quiet --verify 'HEAD^')
            git reset $parent_hash
        else
            echo 'warning: refusing to delete root commit, amending it to blank state (working tree will remain intact)' >&2
            # `git ls-files -z ... | git rm ... --pathspec-from-file='-' --pathspec-file-nul`
            # doesn't work for some reason
            git ls-files -z --cached --deduplicate ':/' |
                xargs -0 --no-run-if-empty -- git rm --quiet --cached --; or return
            git commit --no-verify --no-gpg-sign --amend --no-edit --allow-empty
        end
    else
        echo 'error: no WIP commit found' >&2
        return 169
    end
end
