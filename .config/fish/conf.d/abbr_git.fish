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
    abbr gcn! 'git commit --amend --no-edit'
    abbr gca 'git commit -v --all'
    abbr gca! 'git commit -v --all --amend'
    abbr gcan! 'git commit --all --amend --no-edit'
    abbr gcm 'git commit --message'
    abbr gcam 'git commit --all --message'
    abbr gci "git commit --allow-empty --message 'initial commit'"

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
    abbr gcfeg 'git config edit --global' # Open an editor to modify the global config file

    abbr gcl 'git clone' # Clone a repository into a new directory
    abbr gclr 'git clone --recurse-submodules' # Clone, then initialize and clone submodules

    abbr gclean 'git clean --interactive -d' # Interactively clean untracked files
    abbr gcleanx 'git clean --interactive -x -d' # Interactively clean untracked and ignored files
    abbr gexpunge "git reset --hard && git clean -dff ':/'" # Reset working directory and index to HEAD, and remove all untracked files
    abbr gpristine "git reset --hard && git clean -dffx ':/'" # Reset working directory and index to HEAD, and remove all untracked and ignored files

    abbr gco 'git checkout' # Switch branches or restore working tree files

    abbr gcp 'git cherry-pick' # Apply the changes introduced by some existing commits
    abbr gcpc 'git cherry-pick --continue' # Continue in-progress cherry-pick operation
    abbr gcps 'git cherry-pick --skip' # Skip the current commit for in-progress cherry-pick operation
    abbr gcpa 'git cherry-pick --abort' # Abort in-progress cherry-pick operation
    abbr gcpn 'git cherry-pick --no-commit' # Apply changes to working tree and index, without making a commit

    # git diff [<path>...] - View changes to working tree relative to the index
    # git diff --no-index <path> <path> - Compare two paths on the filesystem
    # git diff --cached [--merge-base] [<commit>] [<path>...] - View changes to index relative to <commit> | [merge-base <commit> HEAD] <INDEX>
    # git diff [--merge-base] <commit> [<path>...] - View changes to working tree relative to <commit> | [merge-base <commit> HEAD] <WORKING TREE>
    # git diff [--merge-base] <commitA> <commitB> [<path>...] - View changes to <commitB> relative to <commitA> | [merge-base <commitA> <commitB>] <commitB>
    # git diff <mergeCommit> <mergeCommitParent1>... <mergeCommitParentN> [<path>...] - View the results of a merge commit (can use ^@ and ^!, e.g. git diff A A^@, git diff A A^!)
    # git diff <commitA>..<commitB> [<path>...] - View changes to <commitB> relative to <commitA> (omit <commit> on one side to use HEAD instead, e.g. HEAD^.., ..<commit>)
    # git diff <commitA>...<commitB> [<path>...] - View changes on the branch containing and up to <commitB> starting at a common ancestor of <commitA> and <commitB> (omit <commit> on one side to use HEAD instead)
    # git diff <blobA> <blobB> - View changes to <blobB> relative to <blobA>
    #
    # For more ways to spell <commit>, see `git help revisions`.
    # See also: `git help diffcore`.
    abbr gd 'git diff' # Show changes between commits, commit and working tree, etc
    abbr gdw 'git diff --word-diff=color' # Show the specific words that changed in a line
    abbr gdc 'git diff --cached' # View changes to index relative to a commit
    abbr gdcw 'git diff --cached --word-diff=color' # View changes to index relative to a commit (word diff)
    abbr gdh 'git diff HEAD --' # View changes to working tree relative to HEAD
    abbr gdup 'git diff @{upstream}' # View changes to working tree relative to upstream branch
    abbr gdm 'git diff AUTO_MERGE' # When in conflict resolution mode, show what changes you've made so far to resolve textual conflicts
    abbr gds 'git diff --stat' # View diffstat summarizing changes
    abbr gdsp 'git diff --stat --patch' # View diffstat + patch
    alias gdnolock "git diff $argv ':!package-lock.json' ':!*.lock'" # Show diff excluding lockfiles

    # TODO: `git describe` abbrs
    # abbr gde 'git describe' # Give an object a human readable name based on an available ref
    # abbr gdet 'git describe --tags' # Describe a commit using any tag, instead of only annotated tags
    # abbr gdea 'git describe --all' # Describe a commit using any ref found in refs/, instead of only annotated tags
    # abbr ? 'git describe --abbrev=0' # Find the closest tagname without any suffix

    abbr gf 'git fetch' # Download objects and refs from another repository
    abbr gfu 'git fetch upstream' # Fetch from upstream repository
    abbr gfp 'git fetch --prune' # Fetch and prune any remote-tracking references that no longer exist on the remote
    abbr gfa 'git fetch --all --tags' # Fetch branches and tags from all remotes
    abbr gfap 'git fetch --all --tags --prune' # Fetch and prune from all remotes

    abbr ghh 'git help' # Display help information about Git
    abbr ghha 'git help --all' # Print a list of all available commands
    abbr ghhg 'git help --guides' # Print a list of the Git concept guides

    abbr gi 'git init' # Create an empty Git repository

    abbr glg 'git log --stat' # Show logs with diffstat
    abbr glgp 'git log --patch --stat' # Show logs with patch and diffstat
    abbr glgg 'git log --graph' # Draw a text-based graphical representation of the commit history
    abbr glgga 'git log --graph --all' # Show graph with all refs in refs/
    abbr glo 'git log --oneline' # Show compact logs
    abbr glog 'git log --oneline --graph' # Show graph with compact text
    abbr gloga 'git log --oneline --graph --all' # Show compact graph with all refs in refs/
    abbr glm 'git log --merge --patch --stat' # Show relevant commits when resolving conflicts
    # These commands show a graph with extra information
    abbr glol "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
    abbr glols "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
    abbr glola "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
    abbr glod "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
    abbr glods "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"

    abbr gls 'git ls-files' # Show information about files in the index and the working tree
    abbr glss 'git ls-files --stage' # Show staged contents' mode bits, object name, and stage number
    abbr glsu 'git ls-files --unmerged' # Show information about unmerged files
    abbr glsr 'git ls-files --resolve-undo' # Show files with resolve-undo information (can recreate conflicted merge)
    abbr glso 'git ls-files --others --exclude-standard' # Show untracked files (excluding ignored)
    abbr glsO 'git ls-files --others' # Show untracked files (including ignored)

    abbr gm 'git merge' # Join two or more development histories together
    abbr gm! 'git merge --autostash' # Merge, stashing local changes and applying after the operation ends
    abbr gma 'git merge --abort' # Abort conflict resolution and reconstruct pre-merge state
    abbr gms 'git merge --squash' # Merge into a single commit
    abbr gmom 'git merge origin/(git_main_branch)' # Merge remote-tracking main branch for origin
    abbr gmum 'git merge upstream/(git_main_branch)' # Merge remote-tracking main branch for upstream

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

    abbr gl 'git pull' # Fetch from and integrate with another repository or local branch
    abbr gpl 'git pull' # Alias for `gl`
    abbr gpl! 'git pull --autostash' # Pull, stashing local changes and applying after the operation ends
    abbr gplsu 'git pull --set-upstream' # Pull, adding upstream branch for subsequent argument-less `git pull`
    abbr gplo 'git pull origin' # Pull from origin
    abbr gplom 'git pull origin (git_main_branch)' # Pull main branch from origin into current branch
    abbr gploc 'git pull origin (git_current_branch)' # Pull current branch from origin
    abbr gplu 'git pull upstream' # Pull from upstream
    abbr gplum 'git pull upstream (git_main_branch)' # Pull main branch from upstream into current branch
    abbr gpluc 'git pull upstream (git_current_branch)' # Pull current branch from upstream

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

    # TODO: More git reflog abbrs
    abbr grl 'git reflog' # Manage reflog information

    abbr grm 'git rm' # Remove files from the working tree and index
    abbr grmc 'git rm --cached' # Only remove files from index

    abbr grs 'git reset' # Copy entries to the index, or reset current branch head
    abbr grss 'git reset --soft' # Reset current branch head, don't touch index or working tree
    abbr grsk 'git reset --keep' # Reset current branch head and index; keep working tree changes or abort
    abbr grs! 'git reset --hard' # Reset current branch head, index, and working tree
    # TODO: `git reset @{upstream}` instead?
    # abbr grso 'git reset origin/(git_current_branch)' # Reset to origin branch corresponding to current
    # abbr grso! 'git reset origin/(git_current_branch) --hard' # Hard reset to origin branch corresponding to current

    abbr grt 'git restore' # Restore working tree from index
    abbr grts 'git restore --staged' # Restore index from HEAD
    abbr grt! 'git restore --worktree --staged' # Restore working tree & index from HEAD
    # TODO: It feels like there should be a better way to do this.
    # abbr grtb 'git restore --source=(git merge-base HEAD (git_conflict_head))' # Restore from stage #1 (base)
    # abbr grtb git_restore_base # Restore from stage #1 (base)
    # abbr grtb 'git checkout-index --stage=1' # Restore from stage #1 (base)
    abbr grto 'git restore --ours' # Restore from stage #2 (ours)
    abbr grtt 'git restore --theirs' # Restore from stage #3 (theirs)
    abbr grtm 'git restore --merge' # Recreate conflicted merge
    abbr grtp 'git restore --patch' # Interactively restore hunks

    abbr groot 'cd (git rev-parse --show-toplevel || echo .)' # Change working directory to root

    abbr gs 'git status' # Show the working tree status
    abbr gsl 'git status --long' # Status in the long-format
    abbr gsb 'git status --short --branch' # Also show branch and tracking info

    abbr gsh 'git show' # Show various types of objects
    abbr gshlt 'git show (git describe --abbrev=0)' # Show latest tag
    abbr gshb --set-cursor 'git show :1:%' # Show blob stage 1 (base)
    abbr gsho --set-cursor 'git show :2:%' # Show blob stage 2 (ours)
    abbr gsht --set-cursor 'git show :3:%' # Show blob stage 3 (theirs)

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
    abbr gsmfr 'git submodule foreach --recursive' # Evaluate an arbitrary shell command in each checked out submodule (recursive)
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

    abbr gt 'git tag' # Create, list, or delete a tag object
    abbr gta 'git tag --annotate' # Make an annotated tag object
    abbr gts 'git tag --sign' # Make a GPG-signed tag
    abbr gtl 'git tag --list -n1 --sort=-version:refname' # List tags (optionally matching a given pattern)

    abbr gw 'git worktree' # Manage multiple working trees
    abbr gwa 'git worktree add' # Create a worktree
    abbr gwl 'git worktree list' # List details of each worktree
    abbr gwmv 'git worktree move' # Move a worktree to a new location
    abbr gwrm 'git worktree remove' # Remove a worktree
    abbr gwrm! 'git worktree remove --force' # Remove a worktree (force)

    # Requires git-absorb to be installed
    abbr gx 'git absorb'
    abbr gxr 'git absorb --and-rebase'
end
