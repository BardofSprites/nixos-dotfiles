{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    libinput.enable = true;
    displayManager.startx.enable = true;
  };
}
