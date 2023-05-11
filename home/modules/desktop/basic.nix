{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.desktop.basic;
  inherit (config) configDir;
in {
  options = {
    modules.desktop.basic = {
      enable = mkEnableOption "Basic desktop";
    };
  };

  config = mkIf cfg.enable {
    programs.rofi.enable = true;

    programs.alacritty.enable = true;

    xdg.configFile = {
      "polybar" = {
        source = "${configDir}/polybar";
        recursive = true;
      };
    };
  };
}
