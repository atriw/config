local lang = require("lib.lang")

return {
  lang.add_treesitter_install("python"),
  lang.add_lsp_config("pylsp"),
  lang.add_null_ls_sources(function(nls)
    return {
      nls.builtins.diagnostics.ruff,
      nls.builtins.formatting.black,
    }
  end),
}
