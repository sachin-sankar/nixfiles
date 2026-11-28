{ pkgs, ... }:

{
  home.packages = [
    pkgs.git-credential-manager
  ];

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      fetch.prune = true;
      user = {
        name = "Sachin Sankar";
        email = "mail.sachinsankar@gmail.com";
        signingkey = "9A94D74DAEBEF6984BD8EEF06DB07F269480470F";
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
