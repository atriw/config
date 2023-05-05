{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config) configDir;
in {
  programs.rofi = {
    enable = true;
  };

  programs.alacritty = {
    enable = true;
  };

  services.polybar = {
    enable = true;
    script = ''
      polybar &
    '';
  };

  xdg.configFile = {
    "sxhkd" = {
      source = "${configDir}/sxhkd";
      recursive = true;
    };
  };
}
