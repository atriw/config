{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [erlang elixir elixir_ls];
}
