function __fzf_tldr --description "Search tldr using fzf"
    set -f os (uname)
    if test $os = Linux
        set -f pages linux
        set -f cache ~/.cache
    else if test $os = Darwin
        set -f pages osx
        set -f cache ~/Library/Caches
    end
    fd --print0 --extension md . $cache/tealdeer/tldr-pages/pages/{$pages,common} \
        | sed -z 's/.*\///; s/\.md$//' \
        | fzf --read0 --query=(commandline) --preview 'fish -c "tldr {}"' --preview-window right:75% \
        | read -fz cmd

    if test $status -eq 0
        # trim any surrounding white space
        commandline --replace (echo $cmd | sed -zr "s/^\s+|\s+\$//g")
    end

    commandline --function repaint
end
