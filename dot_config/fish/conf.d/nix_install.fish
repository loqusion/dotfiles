function install-nixpkgs
    echo "Installing nixpkgs..."
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs; and nix-channel --update
end

function install-home-manager-channel
    echo "Installing home-manager channel..."
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager; and nix-channel --update
end

function install-home-manager
    if command -v home-manager &>/dev/null
        echo "home-manager is already installed."
        return
    end

    if not install-nixpkgs
        return
    end
    if not install-home-manager-channel
        return
    end

    if not test -e ~/.config/home-manager
        dotbare submodule update --init ~/.config/home-manager
    end

    nix-shell -I ~/.local/state/nix/defexpr/channels -I ~/.nix-defexpr '<home-manager>' -A install
    nix-shell -I ~/.local/state/nix/defexpr/channels -I ~/.nix-defexpr -p home-manager --run "home-manager switch"
end

function uninstall-home-manager
    nix-shell -I ~/.local/state/nix/defexpr/channels -I ~/.nix-defexpr -p home-manager --run "home-manager uninstall"
end
