{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.lang.lua;
in {
  options = {
    modules.lang.lua = {
      enable = mkEnableOption "Lua";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      sumneko-lua-language-server
      stylua
    ];
  };
}
