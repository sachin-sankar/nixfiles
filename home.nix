{ config, ... }:

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
  };
}
