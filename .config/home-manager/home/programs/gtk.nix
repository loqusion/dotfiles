{ pkgs, ... }:
let cursorThemeName = "Catppuccin-Mocha-Dark-Cursors";
in {
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors;
    name = cursorThemeName;
    size = 24;
    gtk.enable = true;
  };
}
