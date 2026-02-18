return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio', -- required by dap-ui
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup()

      dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end

      dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end

      dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

      -- Rust Debug Config
      dap.adapters.codelldb = {
        type = 'server',
        port = '${port}',
        executable = {
          command = vim.fn.stdpath 'data' .. '/mason/bin/codelldb',
          args = { '--port', '${port}' },
        },
      }

      dap.configurations.rust = {
        {
          name = 'Launch Rust Program',
          type = 'codelldb',
          request = 'launch',
          program = function() return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file') end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }
    end,
  },
}
