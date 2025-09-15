{ config, pkgs, ...}:

{
  imports = [
    ./git.nix
    ./development.nix
    ./theme.nix
  ];
  home.username = "bard";
  home.homeDirectory = "/home/bard";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    # home manager
    home-manager

    # the real OS
	emacs

    # www
    librewolf
    firefox

    # files
    pcmanfm

    # terminal
    rxvt-unicode

    # media
    mpv
    yt-dlp
    pavucontrol
    alsa-utils

    # xorg related
    dmenu
    xorg.xmodmap

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

  # enable modules
  bardConfig = {
    git.enable = true;
    theme.enable = true;
  };
}
