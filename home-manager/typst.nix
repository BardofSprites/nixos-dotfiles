{ lib, pkgs, config, inputs, ... }:
with lib;
let
  cfg = config.bardConfig.typst;
in {
  options.bardConfig.typst = {
    enable = mkEnableOption "Typst and related packages";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      typst
      tinymist
      (pkgs.tree-sitter.withPlugins (p: [
        p.tree-sitter-typst
      ]))
    ]
    ;
  };
}
