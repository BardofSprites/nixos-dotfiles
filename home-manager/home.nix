{ config, pkgs, ...}:

{
  imports = [
    ./git.nix
    ./development.nix
    ./i3.nix
  ];
  home.username = "bard";
  home.homeDirectory = "/home/bard";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    # the real OS
	  emacs

    # www
    librewolf
    firefox

    # files
    pcmanfm

    # media
    mpv
    yt-dlp
    pavucontrol

    # fonts
    nerd-fonts.ubuntu-mono
    nerd-fonts.iosevka
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    noto-fonts-extra
    
  ];

  # make fonts work
  fonts.fontconfig.enable = true;

  # audio
  nixpkgs.config.pulseaudio = true;
}
