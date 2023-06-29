if command -q sccache
    set -gx RUSTC_WRAPPER (which sccache)
end
