function gh-remote -a repo --description 'Add origin for an existing GitHub repo'
    argparse -N1 -X1 -- $argv; or return
    set -l url (gh repo view $repo --json sshUrl -q .sshUrl); or return
    git remote add origin $url
end
