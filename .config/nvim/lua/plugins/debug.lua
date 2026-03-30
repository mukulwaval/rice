return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'mason-org/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },

  keys = {
    { '<F5>',      function() require('dap').continue() end,          desc = 'Debug: Start/Continue' },
    { '<F1>',      function() require('dap').step_into() end,         desc = 'Debug: Step Into' },
    { '<F2>',      function() require('dap').step_over() end,         desc = 'Debug: Step Over' },
    { '<F3>',      function() require('dap').step_out() end,          desc = 'Debug: Step Out' },
    { '<leader>b', function() require('dap').toggle_breakpoint() end, desc = 'Debug: Toggle Breakpoint' },
    { '<F7>',      function() require('dapui').toggle() end,          desc = 'Debug UI Toggle' },
  },

  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    dapui.setup({
      floating = { border = "rounded",            -- try: single, double, solid
      }
    })

    require("mason-nvim-dap").setup({
      automatic_installation = true,
      ensure_installed = { "codelldb" },

      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })
    -- UI auto open/close
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    -- Rust + C++ share codelldb
    dap.configurations.rust = {
      {
        name = 'Launch',
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vim.fn.input(
            'Path to executable: ',
            vim.fn.getcwd() .. '/target/debug/',
            'file'
          )
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }

    dap.configurations.cpp = {
      {
        name = 'Launch',
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vim.fn.input(
            'Path to executable: ',
            vim.fn.getcwd() .. '/',
            'file'
          )
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }

    -- C uses same config as C++
    dap.configurations.c = dap.configurations.cpp
  end,
}
