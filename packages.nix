{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    pkgs.neovim
    pkgs.kitty
    pkgs.kdePackages.dolphin

    pkgs.adwaita-icon-theme
    pkgs.nwg-look

    pkgs.starship
    pkgs.fzf
    pkgs.zoxide
    pkgs.pnpm
    pkgs.lsd

    pkgs.lazygit
    pkgs.stow

    pkgs.rclone
    pkgs.rsync
    pkgs.rclone-browser
    pkgs.bat
    pkgs.btop
    pkgs.bulky
    pkgs.cliphist
    pkgs.docker
    pkgs.docker-buildx
    pkgs.docker-compose
    pkgs.fastfetch
    pkgs.fladder
    pkgs.glow
    pkgs.hyprshot
    pkgs.jq
    pkgs.just
    pkgs.localsend
    pkgs.losslesscut
    pkgs.mpv
    pkgs.nomacs
    pkgs.ntfs3g
    pkgs.obsidian
    pkgs.ollama
    pkgs.opencode
    pkgs.ouch
    pkgs.qbittorrent
    pkgs.restic
    pkgs.ripgrep
    pkgs.syncthing
    pkgs.tailscale
    pkgs.typst
    pkgs.uv
    pkgs.wl-clipboard

    pkgs.lutris
    pkgs.protonup-rs

    pkgs.noctalia-shell
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
