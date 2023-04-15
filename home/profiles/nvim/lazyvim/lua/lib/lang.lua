local M = {}

function M.add_treesitter_install(lang)
  return {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { lang })
    end,
  }
end

function M.add_lsp_config(lsp, opts)
  opts = opts or {}
  return {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        [lsp] = vim.tbl_deep_extend("keep", { mason = false }, opts),
      },
    },
  }
end

function M.add_null_ls_sources(get_sources_fn)
  return {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      local sources = get_sources_fn(nls)
      vim.list_extend(opts.sources, sources)
    end,
  }
end

return M
