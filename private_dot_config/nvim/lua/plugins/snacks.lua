return {
  {
    "snacks.nvim",
    opts = {
      picker = {
        layouts = {
          default = {
            layout = {
              box = "vertical",
              { win = "input", border = "rounded", height = 1 },
              { win = "list", border = "rounded" },
              { win = "preview", border = "rounded" },
            },
          },
        },
      },
    },
  },
}
