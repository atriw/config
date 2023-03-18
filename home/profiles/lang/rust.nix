{
  config,
  lib,
  pkgs,
  ...
}:
let
  nightly-rust = pkgs.rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
    extensions = [ "rust-src" "rust-analyzer-preview"];
  });
in
{
  home.packages = with pkgs; [
    nightly-rust
    vscode-extensions.vadimcn.vscode-lldb
  ];
}
