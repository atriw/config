{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.lang.js;
in {
  options = {
    modules.lang.js = {
      enable = mkEnableOption "JavaScript";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      nodejs
    ];
  };
}
