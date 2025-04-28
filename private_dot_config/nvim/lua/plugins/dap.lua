return {
  -- {
  --   "leoluz/nvim-dap-go",
  --   enabled = false,
  -- },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        gofmt = "goimport",
        trouble = true,
        on_stdout = function(_, _, data)
          if data then
            vim.schedule(function()
              vim.notify(table.concat(data, "\n"), vim.log.levels.INFO)
            end)
          end
        end,
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
