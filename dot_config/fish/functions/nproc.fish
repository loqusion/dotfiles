function nproc
    if command -q nproc
        command nproc
    else if command -q sysctl
        command sysctl -n hw.physicalcpu
    else
        echo "nproc and sysctl not available on this system" >&2
        return 1
    end
end
