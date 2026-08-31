{ config, pkgs, zen-browser, ...}:
let
  bardCoomer = import ../packages/coomer.nix { inherit pkgs; };
in
{
  imports = [
    ./git.nix
    ./development.nix
    ./vim.nix
    ./dunst.nix
    ./heavy-applications.nix
    ./latex.nix
    ./typst.nix
    # ./uni.nix
    ./theme.nix
    ./xorg-user.nix
    ./wayland-user.nix
  ];
  home.username = "bard";
  home.homeDirectory = "/home/bard";
  home.stateVersion = "25.11";

  home.sessionPath = [
    "$HOME/.local/bin/scripts"
  ];

  home.sessionVariables = {
    PATH = "$HOME/.local/bin/scripts:$PATH";
  };

  home.packages = with pkgs; [
    # nixos related packages
    home-manager

    # the real OS
    emacs-pgtk
    # emacs spellcheck
    hunspell
    hunspellDicts.en_US
    hunspellDicts.ru_RU

    # www
    (zen-browser.packages.${pkgs.stdenv.system}.default)

    # files
    pcmanfm
    gparted
    baobab

    # terminal
    btop
    pass

    # suckless utilities


    # media
    mpv
    yt-dlp
    pavucontrol
    alsa-utils
    playerctl
    feh
    anki-bin
    zip
    unzip

    # xorg related
    bardCoomer

    # fonts
    nerd-fonts.iosevka
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    corefonts

    # icons
    material-design-icons
  ];

  # make fonts work
  fonts.fontconfig.enable = true;

  # enable modules
  bardConfig = {
    git.enable = true;
    theme.enable = true;
    dunst.enable = true;
    heavy.enable = true;
    latex.enable = true;
    typst.enable = true;
    xorg-user.enable = false;
    wayland-user.enable = true;
    # uni.enable = true;
  };
}
