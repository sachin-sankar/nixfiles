{ pkgs, ... }:

{
  home.packages = [
    pkgs.git-credential-manager
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Sachin Sankar";
        email = "mail.sachinsankar@gmail.com";
        signingkey = "A7133E6085607D4DCB104920A54C24582E00C607";
      };
      commit.gpgsign = true;
      tag.gpgsign = true;
      credential = {
        helper = "manager";
        credentialStore = "gpg";
        "https://github.com".username = "sachin-sankar";
      };
    };
  };
}
