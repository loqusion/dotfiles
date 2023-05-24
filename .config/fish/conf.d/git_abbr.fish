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
abbr gbda 'git branch --no-color --merged | grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | xargs git branch --delete 2>/dev/null'
abbr gbD 'git branch --delete --force'
function gbg -d 'gone branches???'
    git branch -vv | grep ": gone\]"
end
abbr gbg 'git branch -vv | grep ": gone\]"'
alias gbgd "set res (gbg | awk '{print \$1}') && test -n \$res && echo \$res | xargs git branch -d"
alias gbgD "set res (gbg | awk '{print \$1}') && test -n \$res && echo \$res | xargs git branch -D"
abbr gbnm 'git branch --no-merged'
abbr gbr 'git branch --remote'

abbr gbl 'git blame -w'

abbr gbs 'git bisect'
abbr gbsb 'git bisect bad'
abbr gbsg 'git bisect good'
abbr gbsr 'git bisect reset'
abbr gbss 'git bisect start'

abbr gc 'git commit -v'
abbr gc! 'git commit -v --amend'
abbr gcn! 'git commit -v --amend --no-edit'
abbr gca 'git commit -v --all'
abbr gca! 'git commit -v --all --amend'
abbr gcan! 'git commit -v --all --no-edit --amend'
abbr gcans! 'git commit -v --all --signoff --no-edit --amend'
abbr gcam 'git commit --all --message'
abbr gcsm 'git commit --signoff --message'
abbr gcas 'git commit --all --signoff'
abbr gcasm 'git commit --all --signoff --message'

abbr gcf 'git config --list'

abbr gcl 'git clone --recurse-submodules'
abbr gclean 'git clean --interactive -d'
abbr gpristine 'git reset --hard && git clean -dffx'
abbr gcm 'git checkout (git_main_branch)'
abbr gcd 'git checkout (git_develop_branch)'
abbr gcmsg 'git commit --message'

abbr gco 'git checkout'
abbr gcor 'git checkout --recurse-submodules'

abbr gcs 'git commit --gpg-sign'
abbr gcss 'git commit --gpg-sign --signoff'
abbr gcssm 'git commit --gpg-sign --signoff --message'
abbr gci "git commit -v --allow-empty --message 'Make it so.'"

abbr gcount 'git shortlog -sn'

abbr gcp 'git cherry-pick'
abbr gcpa 'git cherry-pick --abort'
abbr gcpc 'git cherry-pick --continue'

abbr gd 'git diff'
abbr gdca 'git diff --cached'
abbr gdcw 'git diff --cached --word-diff'
abbr gds 'git diff --staged'
abbr gdt 'git diff-tree --no-commit-id --name-only -r'
abbr gdup 'git diff @{upstream}'
abbr gdw 'git diff --word-diff'

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

abbr gm 'git merge'
abbr gmom 'git merge origin/(git_main_branch)'
abbr gmum 'git merge upstream/(git_main_branch)'
abbr gma 'git merge --abort'
abbr gms 'git merge --squash'

abbr gmtl 'git mergetool --no-prompt'

abbr gp 'git push'
abbr gpd 'git push --dry-run'
abbr gpf 'git push --force-with-lease --force-if-includes'
abbr gpf! 'git push --force'
abbr gpt 'git push --tags'
abbr gptf 'git push --tags --force-with-lease'
abbr gptf! 'git push --tags --force'
abbr gpoat 'git push origin --all && git push origin --tags'
abbr gpoatf! 'git push origin --all --force-with-lease && git push origin --tags --force-with-lease'
abbr gpoatf! 'git push origin --all --force && git push origin --tags --force'
abbr gpod 'git push origin --delete'
abbr gpu 'git push upstream'
abbr gpv 'git push --verbose'

abbr gl 'git pull'
abbr gpl 'git pull'
abbr gplo 'git pull origin'
abbr gplom 'git pull origin master'
abbr gplu 'git pull upstream'
abbr gplum 'git pull upstream master'
abbr gpr 'git pull --rebase'

abbr gr 'git remote'
abbr gra 'git remote add'
abbr grau 'git remote add upstream'
abbr grmv 'git remote rename'
abbr grrm 'git remote remove'
abbr grset 'git remote set-url'
abbr gru 'git remote update'
abbr grv 'git remote -v'
abbr grvv 'git remote -vvv'

abbr grb 'git rebase'
abbr grba 'git rebase --abort'
abbr grbc 'git rebase --continue'
abbr grbd 'git rebase (git_develop_branch)'
abbr grbi 'git rebase --interactive'
abbr grbm 'git rebase (git_main_branch)'
abbr grbom 'git rebase origin/(git_main_branch)'
abbr grbo 'git rebase --onto'
abbr grbs 'git rebase --skip'

abbr grev 'git revert'

abbr grs 'git reset'
abbr grs! 'git reset --hard'
abbr grso 'git reset origin/(git_current_branch)'
abbr grso! 'git reset origin/(git_current_branch) --hard'
abbr grs- 'git reset --'

abbr grm 'git rm'
abbr grmc 'git rm --cached'

abbr grt 'git restore'
abbr grts 'git restore --source'
abbr grtst 'git restore --staged'
abbr grt! 'git restore --worktree --staged'

abbr groot 'cd (git rev-parse --show-toplevel || echo .)'

abbr gs 'git status'
abbr gss 'git status --short'
abbr gsb 'git status --short --branch'

abbr gsh 'git show'
abbr gsps 'git show --pretty=short --show-signature'

abbr gst 'git stash push'
abbr gsta 'git stash apply'
abbr gstc 'git stash clear'
abbr gstd 'git stash drop'
abbr gstl 'git stash list'
abbr gstp 'git stash pop'
abbr gsts 'git stash show --text'
abbr gstu 'git stash push --include-untracked'
abbr gstall 'git stash --all'

abbr gsi 'git submodule init'
abbr gsu 'git submodule update'
abbr gsui 'git submodule update --init'

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
abbr gupa 'git pull --rebase --autostash'
abbr gupav 'git pull --rebase --autostash --verbose'
abbr gupom 'git pull --rebase origin (git_main_branch)'
abbr gupomi 'git pull --rebase=interactive origin (git_main_branch)'
abbr glum 'git pull upstream (git_main_branch)'
abbr gluc 'git pull upstream (git_current_branch)'

abbr gwch 'git whatchanged -p --abbrev-commit --pretty=medium'

abbr gwip 'git add -A; git rm (git ls-files --deleted) 2>/dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
abbr gunwip 'git log --max-count=1 | grep -q -c "\--wip--" && git reset HEAD~1'

abbr gwt 'git worktree'
abbr gwta 'git worktree add'
abbr gwtls 'git worktree list'
abbr gwtmv 'git worktree move'
abbr gwtrm 'git worktree remove'

abbr gam 'git am'
abbr gamc 'git am --continue'
abbr gams 'git am --skip'
abbr gama 'git am --abort'
abbr gamscp 'git am --show-current-patch'
