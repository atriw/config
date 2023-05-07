channels: final: prev: {
  __dontExport = true;

  inherit
    (channels.latest)
    cachix
    neovim-unwrapped
    catppuccin-gtk
    ;
}
