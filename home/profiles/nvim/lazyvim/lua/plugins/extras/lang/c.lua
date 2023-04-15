local lang = require("lib.lang")

return {
  lang.add_treesitter_install("c"),
  {
    "neovim/nvim-lspconfig",
    dependencies = { "p00f/clangd_extensions.nvim" },
    opts = {
      servers = {
        clangd = { mason = false },
      },
      setup = {
        clangd = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer) end)
          require("clangd_extensions").setup()
          return true
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    opts = {
      adapters = {
        c_codelldb = lang.get_codelldb_adapter(),
      },
      configurations = {
        c = {
          {
            name = "Launch file",
            type = "c_codelldb",
            request = "launch",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
          },
        },
      },
    },
  },
}
