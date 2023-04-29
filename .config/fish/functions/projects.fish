set -g myprojects (gh repo list --source --no-archived --json name --jq ".[].name")

function projects
    for p in $myprojects
        set fp ~/repos/$p
        if test ! -d $fp
            echo "[clone] $fp"
            git clone git@github.com:loqusion/$p.git $fp
        end
    end
end

function projects_update
    projects
    for p in $myprojects
        set fp ~/repos/$p
        echo "[$fp]"
        if test -d $fp
            git -C $fp pull
        end
    end
end
