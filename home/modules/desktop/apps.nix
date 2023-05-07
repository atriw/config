{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.desktop.apps;
in {
  options = {
    modules.desktop.apps = {
      enable = mkEnableOption "Desktop Applications";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.twdesktop
    ];
  };
}
