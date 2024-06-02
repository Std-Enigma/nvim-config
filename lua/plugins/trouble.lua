return {
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      keys = {
        ["q"] = "close",
        ["<Esc>"] = "close",
        ["<C-E>"] = "close",
      },
    },
  },

  {
    "catppuccin/nvim",
    optional = true,
		opts = { integrations = { lsp_trouble = true } },
  },
}
