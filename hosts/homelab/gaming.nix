{
  config,
  pkgs,
  lib,
  ...
}:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ]; # loads the driver, also needed for Wayland

  boot.kernelParams = [ "nvidia-drm.fbdev=1" ];

  # Stable colon-free symlinks so sway can be told which GPU to render on.
  # Check PCI addresses with: lspci | grep -E "VGA|3D"
  # Adjust 0000:01:00.0 (A1000) and 0000:00:02.0 (iGPU) to match.
  services.udev.extraRules = ''
    SUBSYSTEM=="drm", KERNEL=="card[0-9]*", SUBSYSTEMS=="pci", KERNELS=="0000:01:00.0", SYMLINK+="dri/dgpu"
    SUBSYSTEM=="drm", KERNEL=="card[0-9]*", SUBSYSTEMS=="pci", KERNELS=="0000:00:02.0", SYMLINK+="dri/igpu"
  '';

  environment.sessionVariables = {
    WLR_DRM_DEVICES = "/dev/dri/dgpu:/dev/dri/igpu"; # render on the A1000 first
    NIXOS_OZONE_WL = "1";
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraOptions = [ "--unsupported-gpu" ];
  };

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
      user = "greeter";
    };
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    (lutris.override {
      extraPkgs = p: [
        p.winetricks
        p.gamemode
      ];
    })
    protontricks
    winetricks
    vulkan-tools
    mesa-demos
    wl-clipboard
    foot
    wmenu
  ];
}
