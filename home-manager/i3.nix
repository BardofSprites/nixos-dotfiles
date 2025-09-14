{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.bardConfig.i3;
in {
  options.bardConfig.i3 = {
    enable = mkEnableOption "i3 window manager";
  };

  services.xserver = {
    enable = true;
    
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3blocks #if you are planning on using i3blocks over i3status
      ];
    };
  };
}
