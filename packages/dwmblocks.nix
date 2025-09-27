# packages/dwmblocks.nix
{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "dwmblocks";
  version = "1.0";

  src = pkgs.fetchFromGitHub {
    owner = "BardofSprites";
    repo = "dwmblocks";
    rev = "6403a9dc361e810a6ba0e0a8d8a97d91778df82f";
    sha256 = "0hqnj7fkdgivviwl0f26zpfd3pjxmpjp39gmzi4cpbjrrb1g9j5z";
  };

  buildInputs = [ 
    pkgs.pkgconf
    pkgs.xorg.libX11
    pkgs.makeWrapper
  ];

  buildPhase = ''
    make
  '';

  installPhase = ''
  mkdir -p $out/bin
  # install binaries
  cp dwmblocks $out/bin/
  chmod 755 $out/bin/dwmblocks
  '';

  meta = with pkgs.lib; {
    description = "Block based, script managed, status bar for dwm";
    homepage = "https://github.com/BardofSprites/dwmblocks";
    license = licenses.mit;
  };
}
