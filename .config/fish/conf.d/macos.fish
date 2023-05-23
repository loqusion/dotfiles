if test (uname) = Darwin
    /opt/homebrew/bin/brew shellenv | source

    # Increase file limit
    ulimit -n 200000
    ulimit -u 2048

    set -Ux CC (which clang)
    set -Ux LDFLAGS -L/opt/homebrew/opt/llvm/lib
    set -Ux CPPFLAGS -I/opt/homebrew/opt/llvm/include
end
