{ lib, pkgs, config, inputs, ... }:
with lib;
let
  cfg = config.bardConfig.heavy;
in {
  options.bardConfig.heavy = {
    enable = mkEnableOption "Applications like word processor and video editor";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}

