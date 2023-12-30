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

    # don't show annoying notification
    nix-shell -p home-manager --run "home-manager news >/dev/null 2>&1"

    nix-shell -p home-manager --run "home-manager switch"
    set -l final_status $status


    # I'm so tired

    function delete_if_exist -a paths
        if test (count $paths) -gt 0
            rm -rf $paths
        end
    end

    set -l xdg_state_home $XDG_STATE_HOME
    test -z $xdg_state_home; and set xdg_state_home ~/.local/state
    set -l nix_profile_xdg $xdg_state_home/nix/profile
    set -l nix_profile ~/nix-profile

    delete_if_exist (path filter $nix_profile_xdg/bin/man*)
    delete_if_exist (path filter $nix_profile_xdg/bin/apropos)
    delete_if_exist (path filter $nix_profile/bin/man*)
    delete_if_exist (path filter $nix_profile/bin/apropos)

    return $final_status
end

function uninstall-home-manager
    yes | nix-shell -p home-manager --run "home-manager uninstall 2>/dev/null"
end
