return {
  "mfussenegger/nvim-jdtls",
  opts = {
    jdtls = function(opts)
      opts.settings = {
        java = {
          format = {
            enabled = true,
            settings = {
              url = vim.fn.expand("~/.config/nvim/extras/java-code-style.xml"),
              profile = "fortnoxStyle",
            },
          },
          inlayHints = {
            parameterNames = {
              enabled = "all",
            },
          },
        },
      }

      return opts
    end,
  },
}
