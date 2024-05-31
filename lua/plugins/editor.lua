return {
  -- which-key helps you remember key bindings by showing a popup
  -- with the active keybindings of the command you started typing.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      icons = { group = "", separator = "-" },
      disable = { filetypes = { "TelescopePrompt" } },
    },
  },
}
