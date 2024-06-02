return {
	"echasnovski/mini.animate",
	event = "CursorMoved",
	cond = not (vim.g.neovide or vim.g.vscode), -- don't load when using vscode or neovide
	opts = {
		resize = { enable = false }, -- disable split resizing animations because it breaks persistent resizing
		scroll = { enable = false }, -- disable vertical scrolling animations because vim-smoothie already does it
	},
}
