{ pkgs, ... }:

{
  security = {
    pam.services.ly.enableGnomeKeyring = true;
    polkit.enable = true;
    rtkit.enable = true;
  };

  services = {
    dbus.packages = [ pkgs.gcr_4 ];
    gnome = {
      gnome-keyring.enable = true;
      gcr-ssh-agent.enable = true;
    };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
}
