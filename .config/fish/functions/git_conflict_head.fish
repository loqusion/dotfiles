function git_conflict_head -d 'Detect conflict pseudoref'
    command git rev-parse --git-dir &>/dev/null; or return
    for ref in {MERGE_HEAD,CHERRY_PICK_HEAD,REVERT_HEAD,REBASE_HEAD}
        if command git show-ref --quiet --verify $ref
            echo $ref
            return
        end
    end
    echo 'no conflict base found' >&2
    return 1
end
