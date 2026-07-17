{ config, lib, pkgs, ... }:
with lib;
let cfg = config.bardConfig.wayland;
in {
  options.bardConfig.wayland = {
    enable = mkEnableOption "Wayland packages and services";
  };

  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];
      config.niri = {
        default = [ "gnome" "gtk" ];
      };
    };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
          user    = "greeter";
        };
      };
    };

    services.xserver.enable = lib.mkDefault false;

    security.polkit.enable = true;
    services.gnome.gnome-keyring.enable = true;

    environment.systemPackages = with pkgs; [
      wayland-utils
      wl-clipboard
      cliphist
      grim
      slurp
      swappy
      wf-recorder
      fuzzel
      waybar
      libnotify
      swayidle
      swaylock
      swww
      kanshi
      wdisplays
      gsettings-desktop-schemas
      glib
      brightnessctl
      playerctl
      foot
      nsxiv # image viewer from x11
      xwayland-satellite
    ];

    environment.sessionVariables = {
      NIXOS_OZONE_WL                      = "1";
      MOZ_ENABLE_WAYLAND                  = "1";
      QT_QPA_PLATFORM                     = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER                     = "wayland";
      CLUTTER_BACKEND                     = "wayland";
      GDK_BACKEND                         = "wayland,x11";
      XDG_CURRENT_DESKTOP                 = "niri";
      XDG_SESSION_TYPE                    = "wayland";
    };

    hardware.graphics = {
      enable      = true;
      enable32Bit = true;
    };

    services.logind = {
      lidSwitch   = "suspend";
    };
  };
}
