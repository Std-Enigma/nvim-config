return {
  "karb94/neoscroll.nvim",
  event = "WinScrolled",
  cond = not (vim.g.neovide or vim.g.vscode), -- don't load when using vscode or neovide
  opts = {},
}
