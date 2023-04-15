{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    clang
    clang-tools
    lldb
    gnumake
    bear
    vscode-extensions.vadimcn.vscode-lldb
  ];
}
