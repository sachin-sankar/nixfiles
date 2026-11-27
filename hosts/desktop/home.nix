{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixfiles/hosts/desktop/dotfiles";
in

{
  imports = [
    ./flakes/git.nix
    ./flakes/styling.nix
  ];

  programs.home-manager.enable = true;
  home = {
    shell.enableZshIntegration = true;
    username = "sachin";
    homeDirectory = "/home/sachin";
    stateVersion = "26.05";

    file = {
      ".config/mpv" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/mpv";
        recursive = true;
      };
      ".config/hypr" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/hypr";
        recursive = true;
      };
      ".config/niri" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/niri";
        recursive = true;
      };
      ".config/kitty" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/kitty";
        recursive = true;
      };
      ".config/ly" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/ly";
        recursive = true;
      };
      ".local/state/noctalia/settings.toml" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/noctalia/settings.toml";
      };
      ".config/nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/nvim";
        recursive = true;
      };
      ".config/rclone" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/rclone";
        recursive = true;
      };
      ".config/uwsm" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/uwsm";
        recursive = true;
      };
      ".config/lazygit" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/lazygit";
        recursive = true;
      };
      ".config/starship.toml" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/config/starship.toml";
      };
      ".zshrc" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.zshrc";
      };
      "scripts" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/scripts";
        recursive = true;
      };
      "Pictures/Wallpapers" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/wallpapers";
        recursive = true;
      };
    };
  };
}
