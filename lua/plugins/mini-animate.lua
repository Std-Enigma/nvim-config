return {
	"echasnovski/mini.animate",
	event = { "CursorMoved", "WinNew", "WinScrolled" },
	cond = not (vim.g.neovide or vim.g.vscode), -- don't load when using vscode or neovide
  config = function(_, opts)
    require("mini.animate").setup(opts)
    MiniAnimate.config.resize.enable = false -- disable split resizing animations because it breaks persistent resizing
    MiniAnimate.config.cursor.path = MiniAnimate.gen_path.angle()
    MiniAnimate.config.open.winconfig = MiniAnimate.gen_winconfig.wipe()
    MiniAnimate.config.close.winconfig = MiniAnimate.gen_winconfig.center()
  end
}
