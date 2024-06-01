return {
  {
    "nvim-zh/colorful-winsep.nvim",
    event = "WinNew",
    opts = {},
  },

  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { colorful_winsep = { enabled = true } } },
  },
}
