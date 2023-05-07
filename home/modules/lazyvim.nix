{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.modules.lazyvim;
  inherit (config) configDir;
in {
  options = {
    modules.lazyvim = {
      enable = mkEnableOption "Lazyvim";
    };
  };

  config = mkIf cfg.enable {
    programs.neovim = let
      neovimPrivateDir = "${configDir}/lazyvim";
    in {
      enable = true;
      vimAlias = true;
      extraConfig =
        ''
          lua << EOF
          vim.opt.runtimepath:append('${neovimPrivateDir}')
          vim.g.codelldb_path = '${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/'
        ''
        + builtins.readFile "${neovimPrivateDir}/init.lua"
        + "EOF";
    };
  };
}
