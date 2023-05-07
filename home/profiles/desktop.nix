{
  config,
  lib,
  pkgs,
  ...
}: {
  modules = {
    desktop = {
      basic = true;
      theme = true;
      apps = true;
    };
  };
}
