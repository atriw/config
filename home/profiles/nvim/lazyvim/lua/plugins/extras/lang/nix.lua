local lang = require("lib.lang")

return {
  lang.add_treesitter_install("nix"),
  lang.add_lsp_config("nil_ls"),
  lang.add_null_ls_sources(function(nls)
    return {
      nls.builtins.code_actions.statix,
      nls.builtins.diagnostics.deadnix,
      nls.builtins.diagnostics.statix,
      nls.builtins.formatting.alejandra,
    }
  end),
}
