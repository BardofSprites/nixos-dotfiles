# packages/boomer.nix
{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "boomer";
  version = "1.0"; # adjust to actual date or commit

  src = pkgs.fetchFromGitHub {
    owner = "tsoding";
    repo = "boomer";
    rev = "dfd4e1f5514e2a9d7c7a6429c1c0642c2021e792"; # replace with desired commit
    sha256 = "sha256-o65/VVxttriA5Qqt35lLKkWIZYS7T4VBBuYdAIGUmx8="; # fill in with nix-prefetch
  };

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [
    pkgs.gcc
    pkgs.gdb
    pkgs.nim
    pkgs.xorg.libX11
    pkgs.xorg.libXrandr
    pkgs.xorg.libXext
    pkgs.libGL
    pkgs.libGLU
    pkgs.freeglut
  ];

  buildPhase = ''
    nim c -d:release src/boomer.nim
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp src/boomer $out/bin/
    chmod 755 $out/bin/boomer
  '';

  meta = with pkgs.lib; {
    description = "Boomer — tsoding’s open-source project (Nim + OpenGL)";
    homepage = "https://github.com/tsoding/boomer";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    platforms = platforms.linux;
  };
}
