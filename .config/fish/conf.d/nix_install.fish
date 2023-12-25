function install-nixpkgs
    echo "Installing nixpkgs..."
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs; and nix-channel --update
end

function install-home-manager-dotfiles
    dotbare submodule update --init $HOME/.config/home-manager
end

function install-home-manager
    if command -v home-manager &>/dev/null
        # return
    end

    if not install-nixpkgs
        return
    end

    echo "Installing home-manager..."
    if not nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager; and nix-channel --update
        return
    end

    install-home-manager-dotfiles

    nix-shell '<home-manager>' -A install
    set -l final_status $status
    echo

    echo
    echo "Done installing home-manager. Please run 'home-manager switch' to activate it."
    echo

    return $final_status
end
