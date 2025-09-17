{ lib, pkgs, config, inputs, ... }:

with lib;

let 
  cfg = config.bardConfig.uni;
in {
  options.bardConfig.uni = {
    enable = mkEnableOption "University printing";
  };

  config = mkIf cfg.enable {
  };
}
