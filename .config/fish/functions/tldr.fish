function tldr --wraps='tldr'
    if test (count $argv) -gt 1 || string match -q -- '*-*' $argv
        command tldr $argv
        return $status
    end

    # make sure env has colors
    set -l nl 0
    command tldr -r $argv \
        | sed -r "s/^#[^\n]+\n//" \
        | sed -r 's/^`/..command../; s/`$//; s/\{\{//g; s/}}//g; s/^> (.*)$/_\1_/' | mdcat | while read -l line
        if test $line = ""
            set nl 1
            continue
        end
        set -l m (string match -r "\.\.command\.\.(.*)" $line)
        if test $status -eq 0
            echo -n "    "
            echo $m[2] | fish_indent_ansi
        else
            [ $nl -eq 1 ] && echo && set nl 0
            echo $line
        end
    end
end
