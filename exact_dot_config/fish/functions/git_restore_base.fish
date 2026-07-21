function git_restore_base -d 'Restore from stage #1 (base)'
    set -l conflict_head (git_conflict_head); or return
    set -l merge_base (git merge-base HEAD $conflict_head); or return
    git restore --source=$merge_base $argv
end
