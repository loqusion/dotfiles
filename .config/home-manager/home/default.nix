{ config, pkgs, ... }: {
  imports = [ ./programs ];
  home = rec {
    username = "loqusion";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    packages = [ pkgs.discord pkgs.obsidian pkgs.taplo ];
  };

  programs.home-manager = { enable = true; };

  # programs.taplo = { enable = true; };

  # nix = {
  #   package = pkgs.nix;
  #   settings.experimental-features = [ "nix-command" "flakes" ];
  # };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-25.9.0" ];
  };
}
