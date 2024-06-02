return {
  {
    "nvim-zh/colorful-winsep.nvim",
    event = "WinNew",
    opts = {},
  },

  {
    "catppuccin",
    optional = true,
    opts = { integrations = { colorful_winsep = { enabled = false } } }, -- TODO: enable whenever the bug was fixed.
  },
}
