{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
  };

  services.libinput.enable = true;

}
