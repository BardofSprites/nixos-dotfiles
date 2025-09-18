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

  buildInputs = [ pkgs.pkgconf pkgs.xorg.libX11 pkgs.xorg.libXft pkgs.xorg.libXinerama pkgs.makeWrapper ];

  buildPhase = ''
    make
  '';

  installPhase = ''
  mkdir -p $out/bin
  # install binaries
  for f in dmenu dmenu_run dmenu_path stest; do
    if [ -f "$f" ]; then
      cp "$f" $out/bin/
      chmod 755 $out/bin/$f
    fi
  done

  # install man pages
  mkdir -p $out/share/man/man1
  if [ -f dmenu.1 ]; then
    sed "s/VERSION/${version}/g" < dmenu.1 > $out/share/man/man1/dmenu.1
    chmod 644 $out/share/man/man1/dmenu.1
  fi
  if [ -f stest.1 ]; then
    sed "s/VERSION/${version}/g" < stest.1 > $out/share/man/man1/stest.1
    chmod 644 $out/share/man/man1/stest.1
  fi
  '';

  meta = with pkgs.lib; {
    description = "Dynamic menu for X11, built from my GitHub fork";
    homepage = "https://github.com/BardofSprites/dmenu";
    license = licenses.mit;
  };
}
