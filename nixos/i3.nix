{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.bardConfig.i3;
in {
  options.bardConfig.i3 = {
    enable = mkEnableOption "i3wm desktop";
  };

  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };
      
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          i3status # default i3 status bar
          rxvt-unicode # terminal
        ];
      };
    };
  };
}
