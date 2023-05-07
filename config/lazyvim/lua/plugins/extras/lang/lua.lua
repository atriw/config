local lang = require("lib.lang")

return {
  lang.add_treesitter_install("lua"),
  lang.add_lsp_config("lua_ls"),
  lang.add_null_ls_sources(function(nls)
    return {
      nls.builtins.formatting.stylua
    }
  end),
}
