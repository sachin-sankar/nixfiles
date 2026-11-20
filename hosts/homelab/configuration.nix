# Headless laptop server (Dell Precision 3581, Intel iGPU + NVIDIA RTX A1000 6GB)

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./units/netwatch-service.nix
    ./containers.nix
    ./packages.nix
    ./services.nix
  ];

  # ------------------------------------------------------------- network
  networking.hostName = "nixlab";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = false;
    allowedTCPPorts = [ 22 ];
  };

  # ---------------------------------------------------------- locale/time
  time.timeZone = "Asia/Kolkata";
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
  console.keyMap = "sv-latin1";

  # ---------------------------------------------------------------- nix
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nixpkgs.config.allowUnfree = true; # required for the NVIDIA driver

  # --------------------------------------------------------------- users
  users.users."sachin" = {
    isNormalUser = true;
    description = "sachin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID5GbRgWQOo79vZ5FWsSXhUGLHcLxNq8SCQqmlYBcBpO sachin@nixos"
    ];
  };

  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    "hybrid-sleep".enable = false;
  };

  zramSwap.enable = true;

  programs.nh = {
    enable = true;
    flake = "/home/sachin/nixlab";
  };

  system.stateVersion = "26.05";
}
