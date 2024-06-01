return {
  "echasnovski/mini.animate",
  event = "CursorMoved",
  cond = not (vim.g.neovide or vim.g.vscode), -- don't load when using vscode or neovide
  opts = {
    open = { enable = false }, -- disable window openning animations because of a glitch in terminal
    close = { enable = false }, -- disable window closing animations because of a glitch in terminal
    resize = { enable = false }, -- disable split resizing animations because it breaks persistent resizing
    scroll = { enable = false }, -- disable vertical scrolling animations because neoscroll already does it
  },
}
