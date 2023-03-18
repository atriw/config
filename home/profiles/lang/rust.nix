{
  config,
  lib,
  pkgs,
  ...
}:
let
  nightly-rust = pkgs.rust-bin.selectLatestNightlyWith (toolchain: toolchain.default);
in
{
  home.packages = with pkgs; [
    nightly-rust
  ];
}
