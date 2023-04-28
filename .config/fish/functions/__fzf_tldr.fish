function __fzf_tldr --description "Search tldr using fzf"
    set -l os (uname)
    if test $os = Linux
        set -l pages linux
    else if test $os = Darwin
        set -l pages osx
    end
    fd --print0 --extension md . ~/Library/Caches/tealdeer/tldr-pages/pages/{$pages,common} \
        | sed -z 's/.*\///; s/\.md$//' \
        | fzf --read0 --query=(commandline) --preview 'fish -c "tldr {}"' --preview-window right:75% \
        | read -lz cmd

    if test $status -eq 0
        # trim any surrounding white space
        commandline --replace (echo $cmd | sed -zr "s/^\s+|\s+\$//g")
    end

    commandline --function repaint
end
