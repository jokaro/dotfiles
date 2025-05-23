return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'
      local mason_registry = require 'mason-registry'

      vim.keymap.set('n', '<F10>', '<cmd>lua require"dap".step_into()<CR>', { desc = 'DAP step into' })
      vim.keymap.set('n', '<F11>', '<cmd>lua require"dap".step_over()<CR>', { desc = 'DAP step over' })
      vim.keymap.set('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>', { desc = 'DAP step out' })
      vim.keymap.set('n', '<F5>', function()
        -- if vim.fn.filereadable '.vscode/launch.json' == 1 then
        --   require('dap.ext.vscode').load_launchjs()
        -- end

        require('dap').continue()
      end, { desc = 'DAP continue' })

      vim.keymap.set('n', '<leader>du', '<cmd>lua require"dapui".toggle()<CR>', { desc = 'DAP toggle UI' })

      -- reset dap ui
      vim.keymap.set('n', '<leader>dr', function()
        local dapui = require 'dapui'
        dapui.close()
        dapui.open { reset = true }
      end, { desc = 'DAP reset UI' })

      vim.keymap.set('n', '<leader>de', '<cmd>lua require"dapui".eval()<CR>', { desc = 'DAP eval' })

      vim.keymap.set('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { desc = 'DAP toggle breakpoint' })
      vim.keymap.set('n', '<leader>dc', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', {
        desc = 'DAP set breakpoint with condition',
      })

      vim.api.nvim_create_user_command('DapDisconnect', function()
        require('dap').disconnect()
        require('dapui').close()
      end, {})

      -- local node_debug_path = mason_registry.get_package('node-debug2-adapter'):get_install_path() .. '/out/src/nodeDebug.js'
      --
      -- dap.adapters.node2 = {
      --   type = 'executable',
      --   command = 'node',
      --   args = {
      --     node_debug_path,
      --   },
      -- }
      --
      -- dap.configurations.typescript = {
      --   {
      --     name = 'attach to typescript',
      --     type = 'node2',
      --     request = 'attach',
      --     port = function()
      --       return tonumber(vim.fn.input('Debug Port: ', '9229'))
      --     end,
      --     cwd = vim.fn.getcwd(),
      --     sourceMaps = true,
      --     skipFiles = { '<node_internals>/**', 'node_modules/**' },
      --   },
      -- }
      --
      -- dap.adapters.godot = {
      --   type = 'server',
      --   host = '127.0.0.1',
      --   port = 6006,
      -- }
      --
      -- dap.configurations.gdscript = {
      --   {
      --     type = 'godot',
      --     request = 'launch',
      --     name = 'launch main scene',
      --     project = '${workspaceFolder}',
      --   },
      -- }
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      dapui.setup {
        layouts = {
          {
            elements = {
              {
                id = 'scopes',
                size = 0.25,
              },
              {
                id = 'breakpoints',
                size = 0.25,
              },
              {
                id = 'stacks',
                size = 0.25,
              },
              {
                id = 'watches',
                size = 0.25,
              },
            },
            position = 'left',
            size = 40,
          },
          {
            elements = {
              {
                id = 'console',
                size = 1.0,
              },
            },
            position = 'bottom',
            size = 10,
          },
          {
            elements = {
              {
                id = 'repl',
                size = 1.0,
              },
            },
            position = 'bottom',
            size = 10,
          },
        },
      }

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
    end,
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function()
      require('mason-nvim-dap').setup {
        ensure_installed = {
          -- "python",   -- debugpy
          'delve', -- golang
          -- "codelldb", -- rust, c, c++
        },
      }
    end,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('nvim-dap-virtual-text').setup()
    end,
  },
}
