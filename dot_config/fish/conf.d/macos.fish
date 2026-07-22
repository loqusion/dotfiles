if test (uname) = Darwin
    /opt/homebrew/bin/brew shellenv | source

    # Increase file limit
    ulimit -n 200000
    ulimit -u 2048

    set -gx CC (which clang)
    set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
    set -gx CPPFLAGS -I/opt/homebrew/opt/llvm/include

    set HOMEBREW_COMMAND_NOT_FOUND_HANDLER (brew --repository)/Library/Homebrew/command-not-found/handler.fish
    if test -f $HOMEBREW_COMMAND_NOT_FOUND_HANDLER
        source $HOMEBREW_COMMAND_NOT_FOUND_HANDLER
    end

    fish_add_path (brew --prefix rustup)/bin

    # Added by OrbStack: command-line tools and integration
    # This won't be added again if you remove it.
    source ~/.orbstack/shell/init2.fish 2>/dev/null || :
end
