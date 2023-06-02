if test (uname) = Darwin
    /opt/homebrew/bin/brew shellenv | source

    # Increase file limit
    ulimit -n 200000
    ulimit -u 2048

    set -gx CC (which clang)
    set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
    set -gx CPPFLAGS -I/opt/homebrew/opt/llvm/include

    set HB_CNF_HANDLER (brew --repository)"/Library/Taps/homebrew/homebrew-command-not-found/handler.fish"
    if test -f $HB_CNF_HANDLER
        source $HB_CNF_HANDLER
    end
end
