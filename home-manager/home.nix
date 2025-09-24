{ config, pkgs, zen-browser, ...}:
let
  bardDmenu = import ../packages/dmenu.nix { inherit pkgs; };
  bardSt = import ../packages/st.nix { inherit pkgs; };
  bardCoomer = import ../packages/coomer.nix { inherit pkgs; };
in
{
  imports = [
    ./git.nix
    ./development.nix
    ./vim.nix
    ./dunst.nix
    ./heavy-applications.nix
    # ./uni.nix
    ./theme.nix
  ];
  home.username = "bard";
  home.homeDirectory = "/home/bard";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    # home manager
    home-manager

    # the real OS
    emacs-gtk

    # www
    librewolf
    firefox
    (zen-browser.packages.${pkgs.stdenv.system}.default)

    # files
    pcmanfm
    gparted
    baobab

    # terminal
    rxvt-unicode
    btop
    pass

    # suckless utilities
    bardDmenu
    bardSt
    nsxiv

    # media
    mpv
    yt-dlp
    pavucontrol
    alsa-utils
    feh
    anki-bin
    zip
    unzip

    # xorg related
    xorg.xmodmap
    xclip
    maim
    picom
    bardCoomer

    # fonts
    nerd-fonts.ubuntu-mono
    nerd-fonts.iosevka
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    noto-fonts-extra
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
    # uni.enable = true;
  };
}
