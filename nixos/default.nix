{ pkgs, config, ouputs, ...}: {
  imports = [
    ./polkit.nix
    ./power.nix
    ./print.nix
    ./syncthing.nix
    ./i3.nix
  ];

  services.displayManager.ly.enable = true;
}  
