switch-desktop:
  nh os switch -H nixos

switch-homelab:
  nh os switch -H nixlab --build-host homelab --target-host homelab

update-desktop:
  nh os switch -H nixos -u --refresh

update-homelab:
  nh os switch -H nixlab --build-host homelab --target-host homelab -u --refresh
