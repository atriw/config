{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.lang.c;
in {
  options = {
    modules.lang.c = {
      enable = mkEnableOption "C";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      clang
      clang-tools
      lldb
      gnumake
      bear
      vscode-extensions.vadimcn.vscode-lldb
    ];
  };
}
