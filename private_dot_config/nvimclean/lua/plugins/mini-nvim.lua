return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.ai').setup()
      require('mini.surround').setup()
      require('mini.statusline').setup { use_icons = true }
      require('mini.icons').setup()
    end,
  },
}
