{ pkgs, inputs, ...}:

{
  home.packages = with pkgs; [
    # langs
    python3

    # cli tools
    imagemagick
    ffmpeg-full
    curl
    wget

    direnv
    devenv
    
    stow
  ];

}
