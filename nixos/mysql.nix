{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.bardConfig.mysql;
in {
  options.bardConfig.mysql = {
    enable = mkEnableOption "stumpwm desktop";
  };

  config = mkIf cfg.enable {
      services.mysql = {
          enable = true;
          package = pkgs.mariadb;
      };

      systemd.services.mysql.wantedBy = lib.mkForce [ ];
  };
}
