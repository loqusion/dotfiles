function __fzf_tldr --description "Search tldr using fzf"
    fd --print0 --extension md . ~/Library/Caches/tealdeer/tldr-pages/pages/{osx,common} \
        | gsed -z 's/.*\///; s/\.md$//' \
        | fzf --read0 --query=(commandline) --preview 'fish -c "tldr {}"' --preview-window right:75% \
        | read -lz cmd

    if test $status -eq 0
        # trim any surrounding white space
        commandline --replace (echo $cmd | gsed -zr "s/^\s+|\s+\$//g")
    end

    commandline --function repaint
end
