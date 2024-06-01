return {
  {
    "nvim-zh/colorful-winsep.nvim",
    event = "WinNew",
    config = true,
    opts = {},
  },

  {
    "catppuccin/nvim",
    opts = { integrations = { colorful_winsep = { enabled = true } } },
    optional = true,
  },
}
