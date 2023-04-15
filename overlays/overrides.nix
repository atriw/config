channels: final: prev: {
  __dontExport = true;

  inherit
    (channels.latest)
    cachix
    neovim-unwrapped
    elixir
    erlang
    elixir_ls
    ;
}
