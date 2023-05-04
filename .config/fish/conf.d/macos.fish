if test (uname) = Darwin
    /opt/homebrew/bin/brew shellenv | source

    # Increase file limit
    ulimit -n 200000
    ulimit -u 2048
end
