{ lib, pkgs, config, ... }:

with lib;

let
  cfg = config.bardConfig.xorg-user;

  # suckless packages
  bardDmenu = import ../packages/dmenu.nix { inherit pkgs; };
  bardSt = import ../packages/st.nix { inherit pkgs; };
  bardDwm = import ../packages/dwm.nix { inherit pkgs; };
  bardDwmblocks = import ../packages/dwmblocks.nix { inherit pkgs; };
in
{
  options.bardConfig.xorg-user = {
    enable = mkEnableOption "User packages for X11 ";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      bardDwm
      bardDwmblocks
      bardDmenu
      bardSt
      nsxiv

      rxvt-unicode

      xorg.xmodmap
      xclip
      maim
      xdotool
      picom

    ];
  };
}
