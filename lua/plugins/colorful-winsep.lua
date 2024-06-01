return {
  {
    "nvim-zh/colorful-winsep.nvim",
    event = "WinNew",
    config = true,
    opts = {},
  },

  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { colorful_winsep = { enabled = true } } },
  },
}
