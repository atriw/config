{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.desktop.theme;
  inherit (config) configDir dataDir;
in {
  options = {
    modules.desktop.theme = {
      enable = mkEnableOption "Desktop theme";
    };
  };

  config = mkIf cfg.enable {
    xdg.configFile = {
      "rofi" = {
        source = "${configDir}/rofi/";
        recursive = true;
      };
      "alacritty" = {
        source = "${configDir}/alacritty/";
        recursive = true;
      };
    };

    xdg.dataFile = {
      "rofi" = {
        source = "${dataDir}/rofi/";
        recursive = true;
      };
    };

    home.file.".background-image" = {
      source = "${configDir}/wallpaper/default.jpeg";
      target = ".background-image";
    };

    gtk = {
      enable = true;
      theme = {
        name = "Catppuccin-Macchiato-Compact-Pink-Dark";
        package = pkgs.catppuccin-gtk.override {
          accents = ["pink"];
          size = "compact";
          tweaks = ["rimless" "black"];
          variant = "macchiato";
        };
      };
    };

    qt = {
      enable = true;
      platformTheme = "gtk";
    };
  };
}
