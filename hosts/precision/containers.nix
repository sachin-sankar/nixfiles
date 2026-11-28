{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;

  virtualisation.oci-containers = {
    backend = "docker";
    containers.omniroute = {
      image = "cheaperinference/omniroute:latest";
      autoStart = true;
      environment = {
        OMNIROUTE_MEMORY_MB = "8192";
      };
      ports = [ "0.0.0.0:20128:20128" ];
      volumes = [ "omniroute-data:/app/data" ];
      extraOptions = [
        "--memory=12g"
        "--stop-timeout=40"
      ];
    };
  };
}
