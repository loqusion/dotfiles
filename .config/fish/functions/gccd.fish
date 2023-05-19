function gccd -d 'Clone and cd'
    command git clone --recurse-submodules $argv
    if test -d $argv[-1]
        cd $argv[-1]
    else
        cd (path basename $argv[-1] | path change-extension '')
    end
end
