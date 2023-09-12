function git_tag_remove_v -d "Remove all tags prefixed with v and ensure a corresponding tag sans v is created"
    set -l commit (git rev-parse HEAD)
    for vtag in (git tag --list 'v*')
        set -l tag (echo $vtag | sed 's/^v//')
        git checkout $vtag
        git tag --annotate --message="$tag" $tag
        git tag --delete $vtag
    end
    git checkout $commit
    if test (git describe $commit) = (git describe main)
        git checkout main
    end
end
