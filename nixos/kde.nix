{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.bardConfig.kde;
in {
  options.bardConfig.kde = {
    enable = mkEnableOption "KDE desktop";
  };

  config = mkIf cfg.enable {
    services.desktopManager.plasma6.enable = true;

    services.displayManager.plasma-login-manager = {
      enable = true;
    };
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      konsole
      elisa
    ];
  };
}
