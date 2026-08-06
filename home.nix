{ config, pkgs, ... }:

{
  imports = [
    ./flakes/git.nix
  ];

  home.username = "sachin";
  home.homeDirectory = "/home/sachin";

  home.stateVersion = "26.05";

  home.file = {
    ".config/mpv" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/sachin/nixfiles/dotfiles/config/mpv";
      recursive = true;
    };
    ".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/sachin/nixfiles/dotfiles/config/hypr";
      recursive = true;
    };
    ".config/kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/sachin/nixfiles/dotfiles/config/kitty";
      recursive = true;
    };
    ".config/ly" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/sachin/nixfiles/dotfiles/config/ly";
      recursive = true;
    };
    ".config/noctalia" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/sachin/nixfiles/dotfiles/config/noctalia/";
      recursive = true;
    };
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/sachin/nixfiles/dotfiles/config/nvim";
      recursive = true;
    };
    ".config/rclone" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/sachin/nixfiles/dotfiles/config/rclone";
      recursive = true;
    };
    ".config/uwsm" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/sachin/nixfiles/dotfiles/config/uwsm";
      recursive = true;
    };
    ".config/starship.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/sachin/nixfiles/dotfiles/config/starship.toml";
    };
    ".zshrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/sachin/nixfiles/dotfiles/.zshrc";
    };
    "scripts" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/sachin/nixfiles/dotfiles/scripts";
      recursive = true;
    };

  };
  home.shell.enableZshIntegration = true;
  programs.home-manager.enable = true;

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    hyprcursor.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 22;
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

  services.gnome-keyring.enable = true;

  programs = {
    yazi = {
      enable = true;
      settings = {
        mgr = {
          show_hidden = true;
        };
      };
    };
  };
}
