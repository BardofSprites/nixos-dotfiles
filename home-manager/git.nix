{ lib, pkgs, config, inputs, ... }:
with lib;
let
  cfg = config.bardConfig.git;
in {
  options.bardConfig.git = {
    enable = mkEnableOption "Git and GitHub CLI";
  };

  config = mkIf cfg.enable { 
    programs.git = {
	    enable = true;
	    userName = "BardofSprites";
	    userEmail = "bard";
	    extraConfig = {
	      init = { defaultBranch = "master"; };
      };
    };

    programs.gh.enable = true;
  }; 
}
