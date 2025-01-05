if status --is-interactive
    set -g __git_abbr_version 0.1.0

    function _git_log_prettily
        if not test -z $argv[1]
            git log --pretty=$argv[1]
        end
    end

    abbr g git

    abbr ga 'git add --verbose'
    abbr gaa 'git add --all --verbose'
    abbr gapa 'git add --patch --verbose'
    abbr gau 'git add --update --verbose'

    abbr gap 'git apply'
    abbr gapt 'git apply --3way'

    abbr gb 'git branch'
    abbr gba 'git branch --all'
    abbr gbd 'git branch --delete'
    abbr gbD 'git branch --delete --force'
    abbr gbda 'git branch --no-color --merged | grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*\$)" | xargs git branch --delete 2>/dev/null'
    function gbg -d 'gone branches???'
        git branch -vv | grep ": gone\]"
    end
    abbr gbg 'git branch -vv | grep ": gone\]"'
    alias gbgd "set res (gbg | awk '{print \$1}') && test -n \$res && echo \$res | xargs git branch -d"
    alias gbgD "set res (gbg | awk '{print \$1}') && test -n \$res && echo \$res | xargs git branch -D"
    abbr gbnm 'git branch --no-merged'
    abbr gbr 'git branch --remote'
    abbr gbdr 'git branch --delete --remote'

    abbr gbl 'git blame -w'

    abbr gbs 'git bisect'
    abbr gbss 'git bisect start'
    abbr gbsb 'git bisect bad'
    abbr gbsg 'git bisect good'
    abbr gbsr 'git bisect reset'

    abbr gc 'git commit -v'
    abbr gc! 'git commit -v --amend'
    abbr gcn! 'git commit -v --amend --no-edit'
    abbr gca 'git commit -v --all'
    abbr gca! 'git commit -v --all --amend'
    abbr gcan! 'git commit -v --all --no-edit --amend'
    abbr gcm 'git commit -v --message'
    abbr gcam 'git commit --all --message'
    abbr gci "git commit -v --allow-empty --message 'Make it so.'"

    abbr gcsm 'git commit --signoff --message'
    abbr gcas 'git commit --all --signoff'
    abbr gcasm 'git commit --all --signoff --message'
    abbr gcans! 'git commit -v --all --signoff --no-edit --amend'

    abbr gcf 'git config --list'

    abbr gcl 'git clone --recurse-submodules'
    abbr gclean 'git clean --interactive -d'
    abbr gpristine 'git reset --hard && git clean -dffx'

    abbr gco 'git checkout'
    abbr gcoo 'git checkout --ours'
    abbr gcor 'git checkout --recurse-submodules'
    abbr gcot 'git checkout --theirs'

    abbr gcs 'git commit --gpg-sign'
    abbr gcss 'git commit --gpg-sign --signoff'
    abbr gcssm 'git commit --gpg-sign --signoff --message'

    abbr gcount 'git shortlog -sn'

    abbr gcp 'git cherry-pick'
    abbr gcpa 'git cherry-pick --abort'
    abbr gcpc 'git cherry-pick --continue'

    abbr gd 'git diff'
    abbr gdw 'git diff --word-diff'
    abbr gds 'git diff --staged'
    abbr gds 'git diff --staged --word-diff'
    abbr gdt 'git diff-tree --no-commit-id --name-only -r'
    abbr gdup 'git diff @{upstream}'

    abbr gdct 'git describe --tags (git rev-list --tags --max-count 1)'

    alias gdnolock 'git diff $argv ":(exclude)package-lock.json" ":(exclude)*.lock"'

    abbr gf 'git fetch'
    abbr gfa 'git fetch --all --prune --jobs=10'
    abbr gfo 'git fetch origin'

    # ggf
    # ggfl
    # ggl
    # ggp
    # ggpnp
    # ggpull
    # ggpur
    # ggpush
    # ggsup
    # ggu
    # gpsup

    abbr ghh 'git help'

    abbr gi 'git init'

    abbr gignore 'git update-index --assume-unchanged'
    abbr gunignore 'git update-index --no-assume-unchanged'
    abbr gignored "git ls-files -v | grep '^[[:lower:]]' | awk '{print \$2}'"

    abbr gfg 'git ls-files | grep'

    abbr glg 'git log --stat'
    abbr glgp 'git log --stat --patch'
    abbr glgg 'git log --graph'
    abbr glgga 'git log --graph --decorate --all'
    abbr glgm 'git log --graph --max-count=10'
    abbr glo 'git log --oneline --decorate'
    abbr glol "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
    abbr glols "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
    abbr glod "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
    abbr glods "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
    abbr glola "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
    abbr glog 'git log --oneline --decorate --graph'
    abbr gloga 'git log --oneline --decorate --graph --all'
    abbr glp _git_log_prettily

    abbr gm 'git merge' # Join two or more development histories together
    abbr gmom 'git merge origin/(git_main_branch)'
    abbr gmum 'git merge upstream/(git_main_branch)'
    abbr gma 'git merge --abort'
    abbr gms 'git merge --squash'

    abbr gmtl 'git mergetool --no-prompt' # Run merge conflict resolution tools to resolve merge conflicts

    abbr gp 'git push' # Update remote refs along with associated objects
    abbr gpd 'git push --dry-run' # Do everything except actually send the updates
    abbr gpf 'git push --force-with-lease --force-if-includes' # Safe --force
    abbr gpf! 'git push --force' # Force remote repository to lose commits if remote ref is not an ancestor of local ref
    abbr gpt 'git push --tags' # Push tags
    abbr gptf 'git push --tags --force-with-lease --force-if-includes'
    abbr gptf! 'git push --tags --force'
    abbr gpoat 'git push origin --all && git push origin --tags' # Push all branches and tags to origin
    abbr gpoatf 'git push origin --all --force-with-lease --force-if-includes && git push origin --tags --force-with-lease --force-if-includes'
    abbr gpoatf! 'git push origin --all --force && git push origin --tags --force'
    abbr gpod 'git push origin --delete' # Remove listed refs in origin
    abbr gpop 'git push origin --prune' # Remove remote branches in origin without a local counterpart

    abbr gl 'git pull' # Fetch from and integrate with another repository or local branch
    abbr gpl 'git pull'
    abbr gplo 'git pull origin'
    abbr gplom 'git pull origin (git_main_branch)'
    abbr gploc 'git pull origin (git_current_branch)'
    abbr gplu 'git pull upstream'
    abbr gplum 'git pull upstream (git_main_branch)'
    abbr gpluc 'git pull upstream (git_current_branch)'

    abbr gr 'git remote -v' # Manage set of tracked repositories
    abbr gra 'git remote add' # Add a remote
    abbr grau 'git remote add upstream'
    abbr grrn 'git remote rename' # Rename a remote
    abbr grrm 'git remote remove' # Remove a remote
    abbr gru 'git remote update' # Fetch updates for remotes in the repository
    abbr grssh 'git remote set-url origin (gh repo view --json sshUrl -q .sshUrl)' # Set origin to SSH URL
    abbr grhttp 'git remote set-url origin (gh repo view --json url -q .url)' # Set origin to HTTPS URL

    abbr grb 'git rebase' # Reapply commits on top of another base tip
    abbr grbi 'git rebase --interactive' # Make an editable list of commits about to be rebased
    abbr grbc 'git rebase --continue' # Continue in-progress rebasing process
    abbr grbs 'git rebase --skip' # Skip the current patch in the in-progress rebasing process
    abbr grba 'git rebase --abort' # Abort in-progress rebase operation
    abbr grbe 'git rebase --edit-todo' # Edit todo list during interactive rebase
    abbr grbo 'git rebase --onto' # Reset to <newbase> before applying commits
    abbr grbm 'git rebase (git_main_branch)' # Rebase on main branch
    abbr grbd 'git rebase (git_develop_branch)' # Rebase on dev branch
    abbr grbom 'git rebase origin/(git_main_branch)' # Rebase on origin main branch

    abbr grev 'git revert' # Revert commit changes, and record some new commits that record them

    abbr grs 'git reset' # Copy entries to the index, or reset current branch head
    abbr grss 'git reset --soft' # Reset current branch head, don't touch index or working tree
    abbr grs! 'git reset --hard' # Reset current branch head, index, and working tree
    abbr grso 'git reset origin/(git_current_branch)' # Reset to origin branch corresponding to current
    abbr grso! 'git reset origin/(git_current_branch) --hard' # Hard reset to origin branch corresponding to current

    abbr grm 'git rm' # Remove files from the working tree and index
    abbr grmc 'git rm --cached' # Only remove files from index

    abbr grt 'git restore' # Restore working tree from index
    abbr grts 'git restore --staged' # Restore index from HEAD
    abbr grt! 'git restore --worktree --staged' # Restore working tree & index from HEAD
    abbr grto 'git restore --ours' # Restore from stage #2 (ours)
    abbr grtt 'git restore --theirs' # Restore from stage #3 (theirs)
    abbr grtm 'git restore --merge' # Recreate conflicted merge

    abbr groot 'cd (git rev-parse --show-toplevel || echo .)' # Change working directory to root

    abbr gs 'git status' # Show the working tree status
    abbr gsl 'git status --long' # Status in the long-format
    abbr gsb 'git status --short --branch' # Also show branch and tracking info

    abbr gsh 'git show' # Show various types of objects

    abbr gst 'git stash push' # Stash the changes in a dirty working directory
    abbr gstu 'git stash push --include-untracked' # All untracked files are also stashed
    abbr gstuo 'git stash push; git stash push --include-untracked; git stash pop stash@{1}' # Stash only untracked files
    abbr gstall 'git stash push --all' # All ignored and untracked files are also stashed
    abbr gstl 'git stash list' # List stash entries
    abbr gsts 'git stash show --text' # Show the changes recorded in a stash entry
    abbr gstp 'git stash pop' # Remove a stash entry and apply it
    abbr gsta 'git stash apply' # Apply a stash entry without removing it
    abbr gstb 'git stash branch' # Create and switch to a branch, popping a stash entry
    abbr gstd 'git stash drop' # Remove a single stash entry

    abbr gsba 'git submodule add'
    abbr gsbi 'git submodule init'
    abbr gsbu 'git submodule update'
    abbr gsbui 'git submodule update --init'
    abbr gsbur 'git submodule update --remote'

    abbr gsw 'git switch'
    abbr gswc 'git switch --create'
    abbr gswm 'git switch (git_main_branch)'
    abbr gswd 'git switch (git_develop_branch)'

    abbr gt 'git tag'
    abbr gts 'git tag --sign'
    abbr gtv 'git tag | sort -V'
    abbr gta 'git tag --annotate'
    abbr gtas 'git tag --annotate --sign'
    function gtl -d 'List tags matching a pattern'
        git tag --sort=-v:refname -n --list "$argv[1]*"
    end

    abbr gup 'git pull --rebase'
    abbr gupv 'git pull --rebase --verbose'
    abbr gupa 'git pull --rebase --autostash --verbose'
    abbr gupom 'git pull --rebase origin (git_main_branch)'
    abbr gupomi 'git pull --rebase=interactive origin (git_main_branch)'

    abbr gwch 'git whatchanged -p --abbrev-commit --pretty=medium'

    abbr gwip 'git add -A; git rm (git ls-files --deleted) 2>/dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
    abbr gunwip 'git log --max-count=1 | grep -q -c "\--wip--" && git reset HEAD~1'

    abbr gwt 'git worktree'
    abbr gwta 'git worktree add'
    abbr gwtl 'git worktree list'
    abbr gwtmv 'git worktree move'
    abbr gwtrm 'git worktree remove'

    abbr gam 'git am'
    abbr gamc 'git am --continue'
    abbr gams 'git am --skip'
    abbr gama 'git am --abort'
    abbr gamscp 'git am --show-current-patch'

    abbr gx 'git absorb'
    abbr gxr 'git absorb --and-rebase'
end
