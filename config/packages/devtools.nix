{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    go
    gcc
    typst

    ty
    ruff
    oxfmt
    oxlint
    templ
    gopls
    nixfmt
    bash-language-server
    docker-language-server
    docker-compose-language-service
    stylua
    lua-language-server
    tailwindcss-language-server
    tinymist
    biome
    yaml-language-server
    taplo
    shfmt
    typstyle
    nixd
    vtsls

    pnpm
    uv
    docker
    docker-buildx
    docker-compose
    just
    opencode
    github-cli
    pi-coding-agent
  ];
}
