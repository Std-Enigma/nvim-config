return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      icons = { group = "", separator = "-" },
      disable = { filetypes = { "TelescopePrompt" } },
    },
  },

  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { which_key = true } },
  },
}
