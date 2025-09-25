{ lib, pkgs, config, inputs, ... }:
with lib;
let
  cfg = config.bardConfig.latex;
in {
  options.bardConfig.latex = {
    enable = mkEnableOption "Latex and related packages";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # medium installation
      texlive.combined.scheme-medium

      # specified packages
      texlivePackages.wrapfig
    ];
  };
}
