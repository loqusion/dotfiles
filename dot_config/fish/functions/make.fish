if command -q gmake

    if not command -q grc
        function make --description 'alias make gmake -j(nproc)'
            command gmake -j(nproc) $argv
        end
        return
    end

    function make --wraps='gmake -j(nproc)' --description 'alias make grc gmake -j(nproc)'
        if string match -q '*qemu*' -- $argv
            command gmake -j(nproc) $argv
        else
            command grc gmake -j(nproc) $argv
        end
    end

else

    if not command -q grc
        function make --description 'alias make make -j(nproc)'
            command make -j(nproc) $argv
        end
        return
    end

    function make --wraps='make -j(nproc)' --description 'alias make grc make -j(nproc)'
        if string match -q '*qemu*' -- $argv
            command make -j(nproc) $argv
        else
            command grc make -j(nproc) $argv
        end
    end

end
