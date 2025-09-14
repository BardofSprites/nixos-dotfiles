{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.bardConfig.git;
in {
  options.bardConfig.git = {
    enable = mkEnableOption "Git and GitHub CLI";
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
}
