{ config, ... }: {
  virtualisation.docker.enable = true;
  services = {
    displayManager.ly.enable = true;
    tuned.enable = true;
    upower.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
    playerctld.enable = true;

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

    ollama = {
      enable = true;
      openFirewall = true;
      host = "0.0.0.0";
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
      openFirewall = true;
    };
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };
}
