{ pkgs, config, ouputs, ...}: {
  imports = [
    ./polkit.nix
    ./power.nix
    ./print.nix
    ./syncthing.nix
    ./i3.nix
  ];

  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "doom";
    };
  };

  
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
}  
