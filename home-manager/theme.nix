{ lib, pkgs, config, ... }:

with lib;

let
  cfg = config.bardConfig.theme;
in
{
  options.bardConfig.theme = {
    enable = mkEnableOption "Settings for GTK, cursor, and QT themes";
  };

  config = mkIf cfg.enable {
    gtk = {
      enable = true;

      theme = {
        name = "Materia-dark";
        package = pkgs.materia-theme;
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

      cursorTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
      };

      # Default font
      # font = {
      #   name = "Iosevka Nerd Font";
      # };
    };

    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style.name = "gtk2";
    };


    home.sessionVariables = {
      GTK_THEME = "Materia-dark";
    };
  };
}
