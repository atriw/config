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
    extraLuaConfig = ''
      vim.opt.runtimepath:append('${neovimPrivateDir}')
    '' + builtins.readFile "${neovimPrivateDir}/init.lua";
  };
}

