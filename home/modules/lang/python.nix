{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.lang.python;
in {
  options = {
    modules.lang.python = {
      enable = mkEnableOption "Python";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      python3
      poetry
      python3Packages.python-lsp-server
      ruff
      black
    ];
  };
}
