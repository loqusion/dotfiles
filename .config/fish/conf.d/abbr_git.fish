if status --is-interactive
    source (status dirname)/fish/gwip.fish

    abbr g git

    abbr ga 'git add -v' # Add file contents to the index
    abbr ga! 'git add -v --force' # Allow adding otherwise ignored files
    abbr gapa 'git add -v --patch' # Interactively choose hunks and add them to the index
    abbr gae 'git add -v --edit' # Edit the patch before applying it
    abbr gau 'git add -v --update' # Update the index just with tracked files
    abbr gaa 'git add -v --all' # Update the index to match the working tree

    abbr gap 'git apply -v ' # Apply a patch to files
    abbr gaps 'git apply --stat' # Output diffstat without applying
    abbr gapc 'git apply -v --check' # Check if the patch is applicable without applying
    abbr gap3 'git apply -v --3way' # 3-way merge, implies --index

    abbr gb 'git branch' # Branch operations
    abbr gbd 'git branch --delete' # Delete a branch
    abbr gbd! 'git branch --delete --force' # Delete a branch (force)
    abbr gbm 'git branch --move' # Move/rename a branch
    abbr gbm! 'git branch --move --force' # Move/rename a branch (force)
    abbr gbc 'git branch --copy' # Copy a branch
    abbr gbc! 'git branch --copy --force' # Copy a branch (force)
    abbr gbl 'git branch -vv --list' # List branches
    abbr gbla 'git branch -vv --all --list' # List both remote-tracking branches and local branches
    # abbr gbda 'git branch --merged | grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*\$)" | xargs git branch --delete 2>/dev/null'
    # FIXME: These are too naive
    # function gbg -d 'Git: Print local branches whose upstream branch no longer exists'
    #     git branch -vv | grep ": gone\]"
    # end
    # abbr gbg 'git branch -vv | grep ": gone\]"'
    # alias gbgd "set res (gbg | awk '{print \$1}') && test -n \$res && echo \$res | xargs git branch -d"
    # alias gbgD "set res (gbg | awk '{print \$1}') && test -n \$res && echo \$res | xargs git branch -D"

    abbr gbs 'git bisect' # Use binary search to find the commit that introduced a changed property (e.g. a bug)
    abbr gbss 'git bisect start' # Start a bisect session
    abbr gbsb 'git bisect bad' # Mark a commit as 'bad'
    abbr gbsn 'git bisect new' # Mark a commit as 'new' (same as 'bad')
    abbr gbsg 'git bisect good' # Mark a commit as 'good'
    abbr gbso 'git bisect old' # Mark a commit as 'old' (same as 'good')
    abbr gbsl 'git bisect log' # Show what has been done so far
    abbr gbsp 'git bisect replay' # Replay bisect actions from a logfile
    abbr gbsr 'git bisect reset' # Clean up bisect state and return to original HEAD

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

    abbr gcs 'git commit --gpg-sign'
    abbr gcss 'git commit --gpg-sign --signoff'
    abbr gcssm 'git commit --gpg-sign --signoff --message'

    abbr gcf 'git config' # Query/set/replace/unset repository or global options
    abbr gcfl 'git config list' # List all variables set in config file, along with their values
    abbr gcfg 'git config get' # Emit the value of the specified key
    abbr gcfga 'git config get --all' # Emits all values associated with the specified key
    abbr gcfs 'git config set' # Set value for a config option
    abbr gcfsa 'git config set --append' # Add a new line to a config option
    abbr gcfsA 'git config set --all' # Replace a multi-valued config option with a new value
    abbr gcfu 'git config unset' # Unset a config option
    abbr gcfuA 'git config unset --all' # Unset a multi-valued config option
    abbr gcfe 'git config edit' # Open an editor to modify the config file

    abbr gcl 'git clone' # Clone a repository into a new directory
    abbr gclr 'git clone --recurse-submodules' # Clone, then initialize and clone submodules

    abbr gclean 'git clean --interactive -d'
    abbr gpristine 'git reset --hard && git clean -dffx'

    abbr gco 'git checkout'
    abbr gcoo 'git checkout --ours'
    abbr gcor 'git checkout --recurse-submodules'
    abbr gcot 'git checkout --theirs'

    abbr gcount 'git shortlog -sn'

    abbr gcp 'git cherry-pick'
    abbr gcpa 'git cherry-pick --abort'
    abbr gcpc 'git cherry-pick --continue'

    abbr gd 'git diff'
    abbr gdw 'git diff --word-diff'
    abbr gds 'git diff --staged'
    abbr gdt 'git diff-tree --no-commit-id --name-only -r'
    abbr gdup 'git diff @{upstream}'
    alias gdnolock 'git diff $argv ":(exclude)package-lock.json" ":(exclude)*.lock"'

    abbr gdct 'git describe --tags (git rev-list --tags --max-count 1)'

    abbr gf 'git fetch'
    abbr gfa 'git fetch --all --prune --jobs=10'
    abbr gfo 'git fetch origin'

    abbr ghh 'git help' # Display help information about Git
    abbr ghha 'git help --all' # Print a list of all available commands
    abbr ghhg 'git help --guides' # Print a list of the Git concept guides

    abbr gi 'git init' # Create an empty Git repository

    abbr gfg 'git ls-files | grep'

    function _git_log_prettily
        if not test -z $argv[1]
            git log --pretty=$argv[1]
        end
    end

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
    abbr gptf 'git push --tags --force-with-lease --force-if-includes' # Force push tags
    abbr gptf! 'git push --tags --force' # Force push tags (really mean it)
    abbr gpoat 'git push origin --all && git push origin --tags' # Push all branches and tags to origin
    abbr gpoatf 'git push origin --all --force-with-lease --force-if-includes && git push origin --tags --force-with-lease --force-if-includes' # Force push all
    abbr gpoatf! 'git push origin --all --force && git push origin --tags --force' # Force push all (really mean it)
    abbr gpod 'git push origin --delete' # Remove listed refs in origin
    abbr gpop 'git push origin --prune' # Remove remote branches in origin without a local counterpart

    # TODO: Expand git pull abbrs
    abbr gl 'git pull' # Fetch from and integrate with another repository or local branch
    abbr gpl 'git pull'
    abbr gplo 'git pull origin' # Pull from origin
    abbr gplom 'git pull origin (git_main_branch)' # Pull main branch from origin
    abbr gploc 'git pull origin (git_current_branch)' # Pull current branch from origin
    abbr gplu 'git pull upstream' # Pull from upstream
    abbr gplum 'git pull upstream (git_main_branch)' # Pull main branch from upstream
    abbr gpluc 'git pull upstream (git_current_branch)' # Pull current branch from upstream
    abbr gup 'git pull --rebase'
    abbr gupv 'git pull --rebase --verbose'
    abbr gupa 'git pull --rebase --autostash --verbose'
    abbr gupom 'git pull --rebase origin (git_main_branch)'
    abbr gupomi 'git pull --rebase=interactive origin (git_main_branch)'

    abbr gr 'git remote -v' # Manage set of tracked repositories
    abbr gra 'git remote add' # Add a remote
    abbr grau 'git remote add upstream' # Add a remote named upstream
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

    abbr grm 'git rm' # Remove files from the working tree and index
    abbr grmc 'git rm --cached' # Only remove files from index

    abbr grs 'git reset' # Copy entries to the index, or reset current branch head
    abbr grss 'git reset --soft' # Reset current branch head, don't touch index or working tree
    abbr grs! 'git reset --hard' # Reset current branch head, index, and working tree
    abbr grso 'git reset origin/(git_current_branch)' # Reset to origin branch corresponding to current
    abbr grso! 'git reset origin/(git_current_branch) --hard' # Hard reset to origin branch corresponding to current

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

    abbr gsm 'git submodule' # Initialize, update, or inspect submodules
    abbr gsma 'git submodule add' # Add a repository as a submodule
    abbr gsmi 'git submodule update --init --recursive' # Initialize submodules, then update working tree with what the superproject expects
    abbr gsmd 'git submodule deinit' # Unregister submodules by removing from .git/config and worktree
    abbr gsmd! 'git submodule deinit --force' # Unregister submodules (force)
    abbr gsmda 'git submodule deinit --all' # Unregister all submodules
    abbr gsmda! 'git submodule deinit --all --force' # Unregister all submodules (force)
    abbr gsmu 'git submodule update --remote' # Integrate changes from upstream project
    abbr gsmsb 'git submodule set-branch --branch' # Set remote tracking branch for submodule
    abbr gsmsd 'git submodule set-branch --default' # Set remote tracking branch for submodule to remote HEAD
    abbr gsms 'git submodule summary' # Summary of commits made in working tree since a commit (default: HEAD)
    abbr gsmsc 'git submodule summary --cached' # Summary of commits made in index since a commit (default: HEAD)
    abbr gsmsf 'git submodule summary --files' # Summary of commits made in working tree since index
    abbr gsmf 'git submodule foreach' # Evaluate an arbitrary shell command in each checked out submodule
    abbr gsmf 'git submodule foreach --recursive' # Evaluate an arbitrary shell command in each checked out submodule (recursive)
    abbr gsmabs 'git submodule absorbgitdirs' # Convert cloned subdirectories into submodules

    abbr gst 'git stash' # Stash the changes in a dirty working directory
    abbr gstu 'git stash push --include-untracked' # All untracked files are also stashed
    abbr gstuo 'git stash push; git stash push --include-untracked; git stash pop stash@{1}' # Stash only untracked files
    abbr gstall 'git stash push --all' # All ignored and untracked files are also stashed
    abbr gstl 'git stash list' # List stash entries
    abbr gsts 'git stash show --text' # Show the changes recorded in a stash entry
    abbr gstp 'git stash pop' # Remove a stash entry and apply it
    abbr gsta 'git stash apply' # Apply a stash entry without removing it
    abbr gstb 'git stash branch' # Create and switch to a branch, popping a stash entry
    abbr gstd 'git stash drop' # Remove a single stash entry

    abbr gsw 'git switch' # Switch branches
    abbr gswc 'git switch --create' # Create a new branch and switch to it
    abbr gswc! 'git switch --force-create' # If branch exists, it will be reset to start point
    abbr gswm 'git switch (git_main_branch)' # Switch to main branch
    abbr gswd 'git switch (git_develop_branch)' # Switch to dev branch
    abbr gswd 'git switch --detach' # Switch to a commit for inspection and discardable experiments
    abbr gswr 'git switch --recurse-submodules' # Update the content of all active submodules

    abbr gt 'git tag'
    abbr gts 'git tag --sign'
    abbr gtv 'git tag | sort -V'
    abbr gta 'git tag --annotate'
    abbr gtas 'git tag --annotate --sign'
    function gtl -d 'List tags matching a pattern'
        git tag --sort=-v:refname -n --list "$argv[1]*"
    end

    abbr gwch 'git whatchanged -p --abbrev-commit --pretty=medium'

    abbr gwt 'git worktree'
    abbr gwta 'git worktree add'
    abbr gwtl 'git worktree list'
    abbr gwtmv 'git worktree move'
    abbr gwtrm 'git worktree remove'

    abbr gx 'git absorb'
    abbr gxr 'git absorb --and-rebase'
end
