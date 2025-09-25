{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.bardConfig.stumpwm;
in {
  options.bardConfig.stumpwm = {
    enable = mkEnableOption "stumpwm desktop";
  };

  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };
      
      windowManager.stumpwm = {
        enable = true;
        extraPackages = with pkgs; [
          polybar # status bar
        ];
      };
    };
  };
}
