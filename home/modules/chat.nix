{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.programs.chat;
  inherit (config) configDir;
in {
  options = {
    programs.chat = {
      enable = mkEnableOption "Chat";
    };
  };
  config = mkIf cfg.enable {
    home.packages = [pkgs.chat];
    xdg.configFile = {
      "chatty/prompts" = {
        source = "${configDir}/chatty/prompts";
        recursive = true;
      };
      "chatty/profiles" = {
        source = "${configDir}/chatty/profiles";
        recursive = true;
      };
    };
  };
}
