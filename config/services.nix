{ ... }: {
  services = {
    displayManager.ly.enable = true;
    tuned.enable = true;
    upower.enable = true;
    udisks2.enable = true;
    playerctld.enable = true;
    gvfs.enable = true;

    logind = {
      enable = true;
      settings.Login = {
        HandleLidSwitch = "ignore";
        HandleLidSwitchExternalPower = "ignore";
        HandleLidSwitchDocked = "ignore";
      };
    };

    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    syncthing = {
      enable = true;
      systemService = true;
      openDefaultPorts = true;
      overrideFolders = false;
      dataDir = "/home/sachin";
      user = "sachin";
    };

    tailscale = {
      enable = true;
    };
  };

  home-manager.users.sachin.services = {
    gnome-keyring.enable = true;
    udiskie.enable = true;
  };
}
