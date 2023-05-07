{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.lang.rust;
in {
  options = {
    modules.lang.rust = {
      enable = mkEnableOption "Rust";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; let
      nightly-rust = pkgs.rust-bin.selectLatestNightlyWith (toolchain:
        toolchain.default.override {
          extensions = ["rust-src" "rust-analyzer-preview"];
        });
    in [
      nightly-rust
      vscode-extensions.vadimcn.vscode-lldb
      taplo # toml lsp
    ];
  };
}
