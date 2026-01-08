{ lib, pkgs, config, inputs, ... }:
with lib;
let
  cfg = config.bardConfig.latex;
in {
  options.bardConfig.latex = {
    enable = mkEnableOption "LaTeX and related packages";
  };

  config = mkIf cfg.enable {
    home.packages = [
      (pkgs.texlive.combine {
        inherit (pkgs.texlive)
          scheme-medium   # base installation with xetex, luatex, beamer
          wrapfig         # wrapfig.sty
          placeins        # placeins.sty
          mhchem          # chem formulas
          siunitx         # physics/units
          babel           # language support
          polyglossia     # better multilingual (Russian, Greek, etc.)
          tabu
          titlesec
          capt-of
          savetrees
          dvipng;         # DVI → PNG tool
      })
    ];
  };
}
