{
  lib,
  pkgs,
  config,
  ...
}:
with lib; {
  options = with types; {
    configDir = mkOption {
      type = path;
      default = "/config";
    };
    dataDir = mkOption {
      type = path;
      default = "/usr/share";
    };
  };
}
