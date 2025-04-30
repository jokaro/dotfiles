return {
  {
    'mxsdev/nvim-dap-vscode-js',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    config = function()
      require('dap-vscode-js').setup {
        adapters = { 'pwa-node', 'pwa-chrome', 'node-terminal', 'pwa-extensionHost' },
      }

      local dap = require 'dap'
      dap.configurations.typescript = {
        {
          name = 'launch chrome',
          type = 'pwa-chrome',
          request = 'launch',
          url = 'http://localhost:9090',
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
        },
      }
      dap.configurations.typescriptreact = {
        {
          name = 'launch chrome',
          type = 'pwa-chrome',
          request = 'launch',
          url = 'http://localhost:9090',
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
        },
      }
    end,
  },
}
