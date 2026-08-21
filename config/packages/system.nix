{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [

    # CLI
    kitty
    fzf
    mediainfo
    lsd
    rclone
    rsync
    btop-rocm
    fastfetch
    glow
    jq
    ouch-rar
    restic
    ripgrep
    protonup-rs
    gum
    mkvtoolnix-cli
    wget
    miktex
    skills
    markitdown
    gallery-dl
    yt-dlp

    # GUI
    kdePackages.dolphin
    rclone-browser
    bulky
    fladder
    losslesscut
    mpv
    nomacs
    obsidian
    qbittorrent
    libreoffice-fresh
    lutris
    noctalia
    pass
    proton-vpn
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    gnome-disk-utility
    chromium
    arduino

    # LIB
    kdePackages.ffmpegthumbs
    kdePackages.kio-extras
    ffmpeg
    cliphist
    tesseract
    mesa
    vulkan-loader
    libGL
    libGLU
    wl-clipboard
    ntfs3g
    mangohud
  ];
}
