{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config) configDir;
in {
  home.packages = [
    pkgs.twdesktop
  ];

  programs.rofi = {
    enable = true;
    theme = "purple";
    font = "Iosevka 18";
  };

  programs.alacritty = {
    enable = true;
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

  xdg.configFile = {
    "sxhkd" = {
      source = "${configDir}/sxhkd";
      recursive = true;
    };
    "bspwm" = {
      source = "${configDir}/bspwm";
      recursive = true;
    };
    "bspwm/rc.d/99-polybar".source = "${configDir}/polybar/launch.sh";
    "polybar" = {
      source = "${configDir}/polybar";
      recursive = true;
    };
  };
}
