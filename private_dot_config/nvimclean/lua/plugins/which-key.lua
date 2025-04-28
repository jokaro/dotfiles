return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below

    spec = {
      { '<leader>s', group = '[S]earch' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>b', group = '[B]uffers' },
      { '<leader>g', group = '[G]it' },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
