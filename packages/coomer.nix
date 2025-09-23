# packages/coomer.nix
{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "coomer";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "junaire";
    repo = "coomer";
    rev = "c1b8b2709d20c153b282104d08c190f9829f2b6c";
    sha256 = "02ycj8a53xykzy5yr4bzc3rk21d683w8yxz0pa3srdvj7k2wbqij";
  };

  nativeBuildInputs = [ pkgs.gcc ];

  buildInputs = with pkgs; [
    libGL
    libGLU
    freeglut
    xorg.libX11
    xorg.libXext
    xorg.libXrandr
  ];

  buildPhase = ''
    mkdir -p build
    g++ $src -o build/coomer \
      -lGL -lGLU -lX11 -lXrandr -lXext
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp build/coomer $out/bin/
  '';

  meta = with pkgs.lib; {
    description = " Yet another zoomer application for Linux";
    platforms = platforms.linux;
  };
}
