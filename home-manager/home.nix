{ config, pkgs, ...}:

{
  home.username = "bard";
  home.homeDirectory = "/home/bard";
  home.stateVersion = "25.05";

  programs.bash = {
    enable = true;
    shellAliases = {
      flex = "echo alias config is working";
    };
  };
  programs.git = {
	  enable = true;
	  userName = "BardofSprites";
	  userEmail = "bard";
	  extraConfig = {
	    init = { defaultBranch = "master"; };
    };
  };

  programs.gh.enable = true;

  home.packages = with pkgs; [
	  emacs
  ];
}
