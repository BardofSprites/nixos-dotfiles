{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.bardConfig.xmonad;
in {
  options.bardConfig.xmonad = {
    enable = mkEnableOption "XMonad desktop";
  };

  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true; # enables xmonad-contrib
        extraPackages = haskellPackages: with haskellPackages; [
          xmonad
          xmonad-contrib
          xmobar
        ];
      };
    };

    environment.systemPackages = with pkgs; [
      xmobar
    ];
  };
}
