{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    pkgs.go
    pkgs.gcc
    pkgs.typst

    pkgs.ty
    pkgs.ruff
    pkgs.oxfmt
    pkgs.oxlint
    pkgs.templ
    pkgs.gopls
    pkgs.nixfmt
    pkgs.bash-language-server
    pkgs.docker-language-server
    pkgs.docker-compose-language-service
    pkgs.stylua
    pkgs.lua-language-server
    pkgs.tailwindcss-language-server
    pkgs.tinymist
    pkgs.biome
    pkgs.yaml-language-server
    pkgs.taplo
    pkgs.shfmt
    pkgs.typstyle

    pkgs.pnpm
    pkgs.uv
    pkgs.docker
    pkgs.docker-buildx
    pkgs.docker-compose
    pkgs.just
    pkgs.opencode
    pkgs.github-cli
    pkgs.pi-coding-agent
  ];
}
