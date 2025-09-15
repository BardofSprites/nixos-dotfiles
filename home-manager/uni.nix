{ lib, pkgs, config, inputs, ... }:

with lib;

let 
  cfg = config.bardConfig.uni;
in {
  options.bardConfig.uni = {
    enable = mkEnableOption "University networking and printing";
  };

  config = mkIf cfg.enable {
    home.eduroam = {
      enable = true;
      institution = "University of Louisville";
      username = "pass show uofl/email";
      passwordCommand = "pass show uofl/eduroam";
      forceWPA = false;
    };
  };
}
