{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.lang.nix;
in {
  options = {
    modules.lang.nix = {
      enable = mkEnableOption "Nix";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      nil
      statix
      alejandra
      deadnix
    ];
  };
}
