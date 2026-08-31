{ lib, pkgs, config, ... }:

with lib;

let
  cfg = config.bardConfig.wayland-user;
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
