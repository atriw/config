{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    python3
    poetry
    python3Packages.python-lsp-server
    ruff
    black
  ];
}
