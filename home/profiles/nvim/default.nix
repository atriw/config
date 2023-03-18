{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.neovim = let
    neovimPrivateDir = ./lazyvim;
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
}
