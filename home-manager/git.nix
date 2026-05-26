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
		settings = {
      		user = {
        		name  = "BardofSprites";
        		email = "develop.bard@gmail.com";
      		};
      	init.defaultBranch = "master";
    	};
    };

    programs.gh.enable = true;
  }; 
}
