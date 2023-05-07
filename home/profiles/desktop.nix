{
  config,
  lib,
  pkgs,
  ...
}: {
  modules = {
    desktop = {
      basic.enable = true;
      theme.enable = true;
      apps.enable = true;
    };
  };
}
