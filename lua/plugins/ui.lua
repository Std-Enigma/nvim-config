return {
  -- colorize active window seperators and animate switching between them
  {
    "nvim-zh/colorful-winsep.nvim",
    event = "WinNew",
    config = true,
    opts = {},
  },

  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },

  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
