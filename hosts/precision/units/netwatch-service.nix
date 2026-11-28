# Paste into configuration.nix (or import it).
# Needs networking.networkmanager.enable = true.
#
# Everything lives in /home/nixlab/netwatch:
#   netwatch (binary), config.toml, discord.sh, .webhook, wifiAuto.sh
{ pkgs, ... }:
{
  systemd.services.netwatch = {
    description = "netwatch: Wi-Fi watchdog and torrent pauser";
    wantedBy = [ "multi-user.target" ];
    # not network-online.target: netwatch exists to cope with being offline
    wants = [ "NetworkManager.service" ];
    after = [ "NetworkManager.service" ];

    # nmcli for Wi-Fi control; bash/coreutils/curl/jq/file for discord.sh;
    # bash also provides the "sh" used to run captive-portal scripts.
    path = with pkgs; [
      networkmanager
      bash
      coreutils
      curl
      jq
      file
    ];

    serviceConfig = {
      ExecStart = "/home/sachin/programs/netwatch/netwatch -config /home/sachin/programs/netwatch/config.toml";
      WorkingDirectory = "/home/sachin/programs/netwatch";

      Restart = "always";
      RestartSec = 5;
      # on SIGTERM netwatch resumes paused torrents (10s timeout) before exiting
      TimeoutStopSec = 20;

      # runs as root so nmcli can connect/rescan without polkit rules
      NoNewPrivileges = true;
      PrivateTmp = true;
      ProtectSystem = "strict";
      # /home is visible but read-only, except the netwatch directory,
      # so a log_file inside it still works
      ProtectHome = "read-only";
      ReadWritePaths = [ "/home/sachin/programs/netwatch" ];
    };
  };
}
