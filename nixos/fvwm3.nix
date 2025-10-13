{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.bardConfig.fvwm;
in {
  options.bardConfig.i3 = {
    enable = mkEnableOption "fvwm desktop";
  };

  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };
      
      windowManager.fvwm3 = {
        enable = true;
        extraPackages = with pkgs; [
          rxvt-unicode # terminal
        ];
      };
    };
  };
}
