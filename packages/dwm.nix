# packages/dwm.nix
{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "dwm";
  version = "6.4";

  src = pkgs.fetchFromGitHub {
    owner = "BardofSprites";
    repo = "dwm";
    rev = "90edc90a09b1fbb7a1cf3811454b070e4995741b";
    sha256 = "1rzh259z61rr63w79a4an9gdbv9rra1s00ghmcvp14byzcmlfimm";
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
