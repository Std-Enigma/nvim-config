return {
	"folke/tokyonight.nvim",
	priority = 1000,
	opts = {
		style = "night",
		dim_inactive = true,
		transparent = not vim.g.neovide, -- turn off transparency when using neovide because it doesn't work
	},
}
