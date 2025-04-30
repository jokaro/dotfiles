return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.ai').setup()
      require('mini.surround').setup()
      require('mini.statusline').setup { use_icons = true }
      require('mini.icons').setup {
        default = {
          -- Override default glyph for "file" category (reuse highlight group)
          --   file = { glyph = '󰈤' },
        },
        extension = {
          -- Override highlight group (not necessary from 'mini.icons')
          -- lua = { hl = 'Special' },
          --
          -- Add icons for custom extension. This will also be used in
          -- 'file' category for input like 'file.my.ext'.
          -- ['my.ext'] = { glyph = '󰻲', hl = 'MiniIconsRed' },
        },
        lsp = {
          ['snippets'] = { glyph = '', hl = 'MiniIconsRed' },
        },
      }
    end,
  },
}
