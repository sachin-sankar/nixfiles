{ config, pkgs, ... }: {
  programs = {
    nix-ld.enable = true;
    npm.enable = true;

    hyprland = {
      enable = true;
      withUWSM = true;
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
  };
}
