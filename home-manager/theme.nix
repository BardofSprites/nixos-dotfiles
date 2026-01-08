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

    home.packages = with pkgs; [
      dconf
      (pkgs.gruvbox-plus-icons.override { folder-color = "orange"; })
    ];

    gtk = {
      enable = true;

      theme = {
        name = "Gruvbox-Material-Dark";
        package = pkgs.gruvbox-material-gtk-theme;
      };

      iconTheme = {
        name = "gruvbox-dark";
        package = pkgs.gruvbox-dark-icons-gtk;
      };

      # iconTheme = {
      #   name = "Papirus-Dark";
      #   package = pkgs.papirus-icon-theme;
      # };

      cursorTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
      };
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
