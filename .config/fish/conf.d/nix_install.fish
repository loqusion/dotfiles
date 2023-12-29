function install-nixpkgs
    echo "Installing nixpkgs..."
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs; and nix-channel --update
end

function install-home-manager-dotfiles
    dotbare submodule update --init $HOME/.config/home-manager
end

function install-home-manager
    if command -v home-manager &>/dev/null
        echo "home-manager is already installed."
        return
    end

    if not install-nixpkgs
        return
    end

    install-home-manager-dotfiles

    if not nix-shell -p home-manager --run "home-manager switch"
        return
    end
end
