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
    extraConfig = ''
      lua << EOF
      vim.opt.runtimepath:append('${neovimPrivateDir}')
    '' + builtins.readFile "${neovimPrivateDir}/init.lua" + "EOF";
  };
}

