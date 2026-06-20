{ config, ... }: {
  services = {
    displayManager.ly.enable = true;
    tuned.enable = true;
    upower.enable = true;
    udisks2.enable = true;

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
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };
}
