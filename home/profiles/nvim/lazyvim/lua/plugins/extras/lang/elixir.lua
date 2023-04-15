local lang = require("lib.lang")

return {
  lang.add_treesitter_install("elixir"),
  lang.add_lsp_config("elixirls", { cmd = { "elixir-ls" } }),
  lang.add_null_ls_sources(function(nls)
    return {
      nls.builtins.diagnostics.credo,
      nls.builtins.formatting.mix,
      nls.builtins.formatting.surface,
    }
  end),
}
