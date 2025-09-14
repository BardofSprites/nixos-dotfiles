{ config, pkgs, lib }:
with lib;

let cfg = bardConfig.desktop;
in {
  options.desktop = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable desktop environment and related settings";
    };
  };

  config = mkIf cfg.enable {
    nixpkgs.config.pulseaudio = true;

    services.xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };
    };

    services.displayManager.ly.enable = true;
    services.displayManager.defaultSession = "xfce";

    fonts.packages = with pkgs; [
        nerd-fonts.ubuntu-mono
    ];
  };
}
