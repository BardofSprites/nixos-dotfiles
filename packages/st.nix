# packages/st.nix
{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "st";
  version = "0.8.5";

  src = pkgs.fetchFromGitHub {
    owner = "BardofSprites";
    repo = "st";
    rev = "ecb9b69f89a76b5871ca1b458e7ebfb02f0a5d3a";
    sha256 = "0hwcpk9z1kcf776210jap6zxxd6f31l4cwxgkwqnzinnbmzi078c";
  };


  nativeBuildInputs = [
    pkgs.pkg-config
    pkgs.ncurses
  ];

  buildInputs = [ 
    pkgs.xorg.libX11
    pkgs.xorg.libXft
    pkgs.xorg.libXrender
    pkgs.freetype
    pkgs.fontconfig
    pkgs.harfbuzz
  ];

  buildPhase = ''
    make
  '';

  installPhase = ''
  mkdir -p $out/bin
  # install binaries
  for f in st st-copyout st-urlhandler; do
    if [ -f "$f" ]; then
      cp "$f" $out/bin/
      chmod 755 $out/bin/$f
    fi
  done

  # install man pages
  mkdir -p $out/share/man/man1
  if [ -f st.1 ]; then
    sed "s/VERSION/${version}/g" < st.1 > $out/share/man/man1/st.1
    chmod 644 $out/share/man/man1/st.1
  fi

  # install terminfo
  mkdir -p $out/share/terminfo
  tic -sx -o $out/share/terminfo st.info
'';


  meta = with pkgs.lib; {
    description = "My fork of suckless terminal";
    homepage = "https://github.com/BardofSprites/st";
    license = licenses.mit;
  };
}
