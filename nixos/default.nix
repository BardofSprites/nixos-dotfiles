{ pkgs, config, ouputs, ...}: {
  imports = [
    ./polkit.nix
    ./laptop.nix
    ./print.nix
    ./syncthing.nix
    ./i3.nix
    ./fvwm3.nix
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

  # xdg.desktopEntries.org-protocol = {
	# name = "org-protocol";
	# comment = "Intercept calls from emacsclient to trigger custom actions";
	# categories = [ "Other" ];
	# keywords = [ "org-protocol" ];
	# icon = "emacs";
	# type = "Application";
	# exec = "emacsclient -- %u";
	# terminal = false;
	# startupWMClass = "Emacs";
	# mimeType = [ "x-scheme-handler/org-protocol" ];
  # };
}  

