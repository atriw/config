{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.desktop.theme;
  inherit (config) configDir;
in {
  options = {
    modules.desktop.theme = {
      enable = mkEnableOption "Desktop theme";
    };
  };

  config = mkIf cfg.enable {
    programs.rofi = {
      theme = "purple";
      font = "Inter 18";
    };

    programs.alacritty = {
      settings = {
        font = {
          normal = {family = "FiraCode Nerd Font";};
          size = 20.0;
        };
      };
    };

    home.file.".background-image" = {
      source = "${configDir}/wallpaper/default.jpeg";
      target = ".background-image";
    };

    gtk = {
      enable = true;
      theme = {
        name = "Layan";
        package = pkgs.layan-gtk-theme;
      };
    };

    qt = {
      enable = true;
      platformTheme = "gtk";
    };
  };
}
