# packages/dwm.nix
{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "dwm";
  version = "6.4";

  src = pkgs.fetchFromGitHub {
    owner = "BardofSprites";
    repo = "dwm";
    rev = "0cfe898edcccdbaf4577f3d292aa6e845e50dc83";
    sha256 = "0bf7hpa59bnc9s7lcf9bwf6ff9ih5x18mb1b0sw3bmrn3pxl4d8n";
  };

  buildInputs = [ 
    pkgs.pkgconf
    pkgs.xorg.libX11
    pkgs.xorg.libXft
    pkgs.xorg.libXinerama
    pkgs.xorg.xcbutil.dev
    pkgs.makeWrapper
  ];

  buildPhase = ''
    make
  '';

  installPhase = ''
  mkdir -p $out/bin
  # install binaries
  cp dwm $out/bin/
  chmod 755 $out/bin/dwm

  # install man pages
  mkdir -p $out/share/man/man1
  if [ -f dwm.1 ]; then
    sed "s/VERSION/${version}/g" < dwm.1 > $out/share/man/man1/dwm.1
    chmod 644 $out/share/man/man1/dwm.1
  fi
  '';

  meta = with pkgs.lib; {
    description = "The suckless dynamic window manager";
    homepage = "https://github.com/BardofSprites/dwm";
    license = licenses.mit;
  };
}
