return {
  -- smart split management and navigation
  {
    "mrjones2014/smart-splits.nvim",
    event = "VeryLazy", -- load on very lazy for mux detection
    opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
  },

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

  -- better diagnostics list and others
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
}
