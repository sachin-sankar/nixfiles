# Hardware configuration for the Dell Precision 3581 server.
# Filesystem UUIDs come from nixos-generate-config on this machine.
# Regenerate them if you reinstall or repartition.
{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "usb_storage"
        "sd_mod"
        "rtsx_pci_sdmmc"
      ];
      kernelModules = [ ];
    };
    kernelParams = [ "consoleblank=60" ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/562231fb-e16c-4eff-8478-366e85def150";
    fsType = "ext4";
    options = [ "noatime" ]; # fewer writes on the SSD
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/FEA1-3683";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # ---------------------------------------------------------------- GPU
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.enableRedistributableFirmware = true;
  hardware.graphics.enable = true;

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    nvidiaPersistenced = true;
    powerManagement.enable = false;
    nvidiaSettings = false; # GUI tool, not needed on a server
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
}
