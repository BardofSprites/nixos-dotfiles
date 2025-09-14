{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.bardConfig.syncthing;
in {
  options.bardConfig.syncthing = {
    enable = mkEnableOption "Syncthing";
  };

  config = mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      user = "bard";
      dataDir = "/home/bard/Sync/";
      configDir = "/home/bard/.config/syncthing";
    };
  };
}
