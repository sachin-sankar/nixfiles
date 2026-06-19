{ config, pkgs, ... }:

{
  imports = [
    ./flakes/dev/git.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sachin";
  home.homeDirectory = "/home/sachin";

  # This value determines the Home Manager release that your configuration is
  # compatible with.
  home.stateVersion = "26.05"; 

  # The home.packages option allows you to install Nix packages into your environment.
  home.packages = [
    # Git packages have been moved to git.nix
  ];

  # Home Manager is pretty good at managing dotfiles.
  home.file = {
    # Custom file mappings go here
  };

  # Home Manager can also manage your environment variables.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  home.shell.enableZshIntegration = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    hyprcursor.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  services.gnome-keyring.enable = true;

  programs = {
  	yazi = {
		enable = true;
		settings = {
		  mgr = {
		    show_hidden = false;
		  };
		};
	};
  };
}
