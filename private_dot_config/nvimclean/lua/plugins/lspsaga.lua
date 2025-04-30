return {
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      ---@type LspsagaConfig
      local settings = {
        lightbulb = {
          sign = false,
        },
        ui = {
          code_action = '',
        },
      }

      require('lspsaga').setup(settings)

      vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons', -- optional
    },
  },
}
