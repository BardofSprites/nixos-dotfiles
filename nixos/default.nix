{ pkgs, config, ouputs, ...}: {
  imports = [
    ./polkit.nix
    ./laptop.nix
    ./print.nix
    ./syncthing.nix
    ./i3.nix
    ./stumpwm.nix
    ./xmonad.nix
    ./audio.nix
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

  environment.systemPackages = with pkgs; [
    nix-prefetch-git
  ];
}  
