{ pkgs, ... }:

let
  cursorSize = 22;
  cursorName = "Bibata-Modern-Classic";
  cursorPackage = pkgs.bibata-cursors;
in
{
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    hyprcursor.enable = true;
    package = cursorPackage;
    name = cursorName;
    size = cursorSize;
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = cursorName;
      package = cursorPackage;
      size = cursorSize; # Updated to match your variable!
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    colorScheme = "dark";
    font = {
      name = "DejaVu Sans";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };
}
