# packages/slock.nix
{ pkgs }:
pkgs.stdenv.mkDerivation rec {
  pname = "slock";
  version = "1.5";

  src = pkgs.fetchFromGitHub {
    owner = "BardofSprites";
    repo = "slock";
    rev = "d9a140ed78602c5da5c2f5b680a4e77b76566490";
    sha256 = pkgs.lib.fakeHash;
  };

  nativeBuildInputs = [
    pkgs.pkg-config
  ];

  buildInputs = [
    pkgs.xorg.libX11
    pkgs.xorg.libXext
    pkgs.xorg.libXrandr
    pkgs.xorg.libXinerama
    pkgs.pam
  ];

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp slock $out/bin/
    chmod 755 $out/bin/slock

    mkdir -p $out/share/man/man1
    if [ -f slock.1 ]; then
      sed "s/VERSION/${version}/g" < slock.1 > $out/share/man/man1/slock.1
      chmod 644 $out/share/man/man1/slock.1
    fi
  '';

  meta = with pkgs.lib; {
    description = "My fork of suckless screen locker";
    homepage = "https://github.com/BardofSprites/slock";
  };
}
