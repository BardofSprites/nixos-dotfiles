{ pkgs, inputs, ...}:

{
  home.packages = with pkgs; [
    # langs
    python3

    # cli tools
    fzf
    imagemagick
    ffmpeg-full
    curl
    wget
    direnv
    devenv
    stow

  ];

}
