{ config, pkgs, ... }: {
  programs = {
    nix-ld.enable = true;
    npm.enable = true;
    zoxide.enable = true;
    lazygit.enable = true;
    bat.enable = true;
    starship.enable = true;
    nh.enable = true;
    gamemode.enable = true;

    hyprland = {
      enable = true;
      withUWSM = true;
    };

    localsend = {
      enable = true;
      openFirewall = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    appimage = {
      enable = true;
      binfmt = true;
    };
  };
}
