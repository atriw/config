return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "nix" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nil_ls = { mason = false },
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = {
      sources = {
        require("null-ls").builtins.code_actions.statix,
        require("null-ls").builtins.diagnostics.deadnix,
        require("null-ls").builtins.diagnostics.statix,
        require("null-ls").builtins.formatting.alejandra,
      },
    },
  },
}
