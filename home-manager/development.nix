{ pkgs, inputs, ...}:

{
  home.packages = with pkgs; [
    # langs
    python3

    # cli tools
    neovim
    fzf
    imagemagick
    ffmpeg-full
    curl
    wget
    devenv
    stow
    ripgrep
    fd
    tree
    jq
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

}
