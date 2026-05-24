-- lua/plugins/dap.lua
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",          -- required by dap-ui
      "jay-babu/mason-nvim-dap.nvim",   -- auto-installs codelldb
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" },
        automatic_installation = true,
      })

      -- codelldb adapter (works for C++ on Linux/Mac/Windows)
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close

      -- keymaps
      vim.keymap.set("n", "<F5>",  dap.continue,          { desc = "DAP Continue" })
      vim.keymap.set("n", "<F10>", dap.step_over,         { desc = "DAP Step Over" })
      vim.keymap.set("n", "<F11>", dap.step_into,         { desc = "DAP Step Into" })
      vim.keymap.set("n", "<F12>", dap.step_out,          { desc = "DAP Step Out" })
      vim.keymap.set("n", "<leader>b",  dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>du", dapui.toggle,         { desc = "DAP UI Toggle" })
    end,
  },
}
