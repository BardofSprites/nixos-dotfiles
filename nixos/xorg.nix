{ config, lib, pkgs, ... }:
with lib;
let cfg = config.bardConfig.xorg;
in {
  options.bardConfig.xorg = {
    enable = mkEnableOption "X11 packages and services";
  };

  config = lib.mkIf cfg.enable {

    services.xserver = {
      enable = true;
      displayManager.startx.enable = true;
    };

    services.libinput.enable = true;

    services.displayManager.ly = {
      enable = true;
      settings = {
        animation = "doom";
      };
    };
  };
}
