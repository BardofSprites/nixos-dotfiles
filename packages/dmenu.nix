# packages/dmenu.nix
{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "dmenu";
  version = "5.3";

  src = pkgs.fetchFromGitHub {
    owner = "BardofSprites";
    repo = "dmenu";
    rev = "c09deddfe038b8c69fa3815b32ef209fff932bff";
    sha256 = "0dva6x94ik6zfwg4i208s6n78k3jg7kgnkidl7w78facx3xkr9as";
  };

  buildInputs = [ pkgs.pkgconfig pkgs.xorg.libX11 pkgs.xorg.libXft pkgs.makeWrapper ];

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp dmenu $out/bin/
  '';

  meta = with pkgs.stdenv.lib; {
    description = "Dynamic menu for X11, built from my GitHub fork";
    homepage = "https://github.com/BardofSprites/dmenu";
    license = licenses.mit;
  };
}
