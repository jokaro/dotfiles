return {
  {
    "heilgar/nvim-http-client",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp", -- Optional but recommended for enhanced autocompletion
      "nvim-telescope/telescope.nvim", -- Optional for better environment selection
    },
    event = "VeryLazy",
    ft = { "http", "rest" },
    config = function()
      require("http_client").setup({
        -- Default configuration (works out of the box)
        default_env_file = ".env.json",
        request_timeout = 30000,
        split_direction = "bottom",
        create_keybindings = true,

        -- Profiling (timing metrics for requests)
        profiling = {
          enabled = true,
          show_in_response = true,
          detailed_metrics = true,
        },

        -- Default keybindings (can be customized)
        keybindings = {
          select_env_file = "<leader>hf",
          set_env = "<leader>he",
          run_request = "<leader>hr",
          stop_request = "<leader>hx",
          toggle_verbose = "<leader>hv",
          toggle_profiling = "<leader>hp",
          dry_run = "<leader>hd",
          copy_curl = "<leader>hc",
          save_response = "<leader>hs",
        },
      })

      -- Set up Telescope integration if available
      if pcall(require, "telescope") then
        require("telescope").load_extension("http_client")
      end
    end,
  },
}
