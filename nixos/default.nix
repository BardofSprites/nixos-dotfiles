{ pkgs, config, ouputs, ...}: {
  imports = [
    ./polkit.nix
    ./power.nix
    ./print.nix
    ./syncthing.nix
  ];

  services.displayManager.ly.enable = true;
}  
