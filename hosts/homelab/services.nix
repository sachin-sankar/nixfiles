{ ... }: {
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

    thermald.enable = true;

    nfs.server = {
      enable = true;
      exports = ''
        /home/sachin 100.64.0.0/10(rw,sync,no_subtree_check) 192.168.1.0/24(rw,sync,no_subtree_check)
      '';
    };
  };
}
