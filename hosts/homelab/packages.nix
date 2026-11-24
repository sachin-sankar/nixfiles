{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    git
    curl
    wget
    btop-cuda
    nvtopPackages.nvidia
    yazi
    lazygit
    jq
    dix
    pnpm
    uv
    ntfs3g
  ];
}
