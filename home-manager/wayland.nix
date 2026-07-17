{ lib, pkgs, config, ... }:

with lib;

let
  cfg = config.bardConfig.xorg-user;
in
{
  options.bardConfig.wayland-user = {
    enable = mkEnableOption "User packages for Wayland";
  };
  config = mkIf cfg.enable {
    programs.swaylock = {
      enable = true;
    };
  };
}
