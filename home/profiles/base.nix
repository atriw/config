{
  config,
  lib,
  pkgs,
  ...
}: {
  modules = {
    lazyvim.enable = true;
    doomemacs.enable = true;
    shell = {
      zsh.enable = true;
      tools.enable = true;
    };
    lang = {
      c.enable = true;
      js.enable = true;
      lua.enable = true;
      nix.enable = true;
      python.enable = true;
      rust.enable = true;
    };
  };
}
