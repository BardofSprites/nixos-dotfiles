# packages/dwm.nix
{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "dwm";
  version = "6.4";

  src = pkgs.fetchFromGitHub {
    owner = "BardofSprites";
    repo = "dwm";
    rev = "dad8545fc4a97199e997e0da452c970cd8ea9e7e";
    sha256 = "0p3ad1khb1y0ymfsm0scqf0y975kij33cx87ypgwphdxqj7r67qa";
  };

  patches = [ ../patches/dwm-laptop.patch ];

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
