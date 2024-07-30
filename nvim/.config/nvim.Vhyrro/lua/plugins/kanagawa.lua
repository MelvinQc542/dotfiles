return {
    "rebelot/kanagawa.nvim",
    config = function()
      local kanagawa = require("kanagawa")
      kanagawa.setup()
      vim.cmd.colorscheme("kanagawa-wave")
    end,
  }
