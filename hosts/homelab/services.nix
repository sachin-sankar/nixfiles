{ pkgs, lib, ... }: {
  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };

    logind.settings.Login = {
      HandleLidSwitch = "ignore";
      HandleLidSwitchExternalPower = "ignore";
      HandleLidSwitchDocked = "ignore";
    };

    tailscale.enable = true;
    bootvine.enable = true;

    thermald.enable = true;

    syncthing = {
      enable = true;
      user = "sachin";
      group = "users";
      dataDir = "/home/sachin";
      configDir = "/home/sachin/.config/syncthing";
      guiAddress = "0.0.0.0:8384";
    };

    qbittorrent = {
      enable = true;
      user = "sachin";
      group = "users";
    };

    miniflux = {
      enable = true;
      adminCredentialsFile = "/etc/miniflux/admin";
      config = {
        LISTEN_ADDR = "0.0.0.0:8081";
        BASE_URL = "http://100.88.73.86:8081";
        POLLING_FREQUENCY = 30;
        BATCH_SIZE = 50;
      };
    };

    hermes-agent = {
      enable = true;
      environmentFiles = [ "/var/lib/hermes/env" ];
      addToSystemPackages = true;
    };

    ollama = {
      enable = true;
      package = pkgs.ollama-cuda;
      host = "0.0.0.0";
      port = 11434;
      openFirewall = true;
      environmentVariables = {
        OLLAMA_ORIGINS = "*";
        OLLAMA_FLASH_ATTENTION = "1";
      };
    };

  };
  systemd.services.qbittorrent.serviceConfig.ProtectHome = lib.mkForce false;
}
