{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    sumneko-lua-language-server
    stylua
  ];
}
