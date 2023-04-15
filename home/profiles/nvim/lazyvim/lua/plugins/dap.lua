return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-dap.nvim",
      config = function()
        require("telescope").load_extension("dap")
      end,
    },
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      {
        "theHamsta/nvim-dap-virtual-text",
        config = true,
      },
    },
    config = function(_, opts)
      local dap = require("dap")
      if opts.adapters then
        dap.adapters = vim.tbl_deep_extend("keep", dap.adapters, opts.adapters)
      end
      if opts.configurations then
        dap.configurations = vim.tbl_deep_extend("keep", dap.configurations, opts.configurations)
      end
      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })
      require("dap").defaults.fallback.terminal_win_cmd = "enew"
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dap-repl",
        callback = function()
          require("dap.ext.autocompl").attach()
        end,
      })
      require("which-key").register({
        ["<leader>d"] = { name = "+debug" },
        ["<leader>db"] = { name = "+breakpoints" },
        ["<leader>ds"] = { name = "+steps" },
        ["<leader>dv"] = { name = "+views" },
      })
    end,
    keys = {
      {
        "<leader>dbc",
        '<CMD>lua require("dap").set_breakpoint(vim.ui.input("Breakpoint condition: "))<CR>',
        desc = "conditional breakpoint",
      },
      {
        "<leader>dbl",
        '<CMD>lua require("dap").set_breakpoint(nil, nil, vim.ui.input("Log point message: "))<CR>',
        desc = "logpoint",
      },
      { "<leader>dbr", '<CMD>lua require("dap.breakpoints").clear()<CR>', desc = "remove all" },
      { "<leader>dbs", "<CMD>Telescope dap list_breakpoints<CR>", desc = "show all" },
      { "<leader>dbt", '<CMD>lua require("dap").toggle_breakpoint()<CR>', desc = "toggle breakpoint" },
      { "<F9>", '<CMD>lua require("dap").toggle_breakpoint()<CR>', desc = "toggle breakpoint" },
      { "<leader>dc", '<CMD>lua require("dap").continue()<CR>', desc = "continue" },
      { "<F5>", '<CMD>lua require("dap").continue()<CR>', desc = "continue" },
      {
        "<leader>de",
        '<CMD>lua require("dap.ui.widgets").hover(nil, { border = "none" })<CR>',
        desc = "expression",
        mode = { "n", "v" },
      },
      { "<leader>dp", '<CMD>lua require("dap").pause()<CR>', desc = "pause" },
      { "<leader>dr", "<CMD>Telescope dap configurations<CR>", desc = "run" },
      { "<leader>dR", '<CMD>lua require("dap").restart()<CR>', desc = "restart" },
      { "<leader>dsb", '<CMD>lua require("dap").step_back()<CR>', desc = "step back" },
      { "<leader>dsc", '<CMD>lua require("dap").run_to_cursor()<CR>', desc = "step to cursor" },
      { "<leader>dsi", '<CMD>lua require("dap").step_into()<CR>', desc = "step into" },
      { "<F11>", '<CMD>lua require("dap").step_into()<CR>', desc = "step into" },
      { "<leader>dso", '<CMD>lua require("dap").step_over()<CR>', desc = "step over" },
      { "<F10>", '<CMD>lua require("dap").step_over()<CR>', desc = "step over" },
      { "<leader>dsx", '<CMD>lua require("dap").step_out()<CR>', desc = "step out" },
      { "<F12>", '<CMD>lua require("dap").step_out()<CR>', desc = "step out" },
      { "<leader>df", '<CMD>lua require("dap").focus_frame()<CR>', desc = "focus frame" },
      { "<leader>du", '<CMD>lua require("dap").up()<CR>', desc = "up" },
      { "<F6>", '<CMD>lua require("dap").up()<CR>', desc = "up" },
      { "<leader>dd", '<CMD>lua require("dap").down()<CR>', desc = "down" },
      { "<F7>", '<CMD>lua require("dap").down()<CR>', desc = "down" },
      { "<leader>dx", '<CMD>lua require("dap").terminate()<CR>', desc = "terminate" },
      {
        "<leader>dvf",
        '<CMD>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames, { border = "none" })<CR>',
        desc = "show frames",
      },
      {
        "<F8>",
        '<CMD>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames, { border = "none" })<CR>',
        desc = "show frames",
      },
      {
        "<leader>dvs",
        '<CMD>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes, { border = "none" })<CR>',
        desc = "show scopes",
      },
      {
        "<leader>dvt",
        '<CMD>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").threads, { border = "none" })<CR>',
        desc = "show threads",
      },
    },
  },
}
