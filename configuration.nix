{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users."sachin" = {
    isNormalUser = true;
    description = "Sachin";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
  };

  users.defaultUserShell = pkgs.zsh;

  nixpkgs.config.allowUnfree = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # Fixes OpenURI and cursor themes in flatpaks
    config = {
      # example with hyprland
      hyprland.preferred = [
        "hyprland"
        "gtk"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    pkgs.neovim
    pkgs.kitty
    pkgs.kdePackages.dolphin

    pkgs.adwaita-icon-theme
    pkgs.nwg-look

    pkgs.starship
    pkgs.fzf
    pkgs.zoxide
    pkgs.pnpm
    pkgs.lsd

    pkgs.lazygit
    pkgs.stow

    pkgs.rclone
    pkgs.rsync
    pkgs.rclone-browser
    pkgs.bat
    pkgs.btop
    pkgs.bulky
    pkgs.cliphist
    pkgs.docker
    pkgs.docker-buildx
    pkgs.docker-compose
    pkgs.fastfetch
    pkgs.fladder
    pkgs.glow
    pkgs.hyprshot
    pkgs.jq
    pkgs.just
    pkgs.localsend
    pkgs.losslesscut
    pkgs.mpv
    pkgs.nomacs
    pkgs.ntfs3g
    pkgs.obsidian
    pkgs.ollama
    pkgs.opencode
    pkgs.ouch
    pkgs.qbittorrent
    pkgs.restic
    pkgs.ripgrep
    pkgs.syncthing
    pkgs.tailscale
    pkgs.typst
    pkgs.uv
    pkgs.wl-clipboard

    pkgs.nerd-fonts.jetbrains-mono
    pkgs.noctalia-shell
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  services.displayManager.ly.enable = true;

  services.tuned.enable = true;
  services.upower.enable = true;
  services.udisks2.enable = true;

  security.polkit.enable = true;
  security.soteria.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
  programs.npm.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;

    pinentryPackage = pkgs.pinentry-gnome3;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "sachin" = import ./home.nix;
    };
  };

  system.stateVersion = "26.05";
}
