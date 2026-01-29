{ config, pkgs, ... }:

{
  home.username = "bard";
  home.homeDirectory = "/home/bard";

  # Match your NixOS version
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  # Import your Vim config module
  imports = [
    ./vim.nix
    ./git.nix
  ];

  bardConfig = {
    git.enable = true;
  };
}

