{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nil
    statix
    alejandra
    deadnix
  ];
}
