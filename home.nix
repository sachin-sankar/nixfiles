{ config, pkgs, ... }:

{
  imports = [
    ./flakes/dev/git.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sachin";
  home.homeDirectory = "/home/sachin";

  # This value determines the Home Manager release that your configuration is
  # compatible with.
  home.stateVersion = "26.05";

  # The home.packages option allows you to install Nix packages into your environment.
  home.packages = [
    # Git packages have been moved to git.nix
  ];

  # Home Manager is pretty good at managing dotfiles.
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

  # Home Manager can also manage your environment variables.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  home.shell.enableZshIntegration = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.pointerCursor = {
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
