return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		term_colors = true,
		show_end_of_buffer = true,
		-- transparent_background = not vim.g.neovide, -- turn off transparency when using neovide because it doesn't work
		dim_inactive = { enabled = true },
		integrations = {
			hop = true,
			mason = true,
			aerial = true,
			harpoon = true,
			neotree = true,
			overseer = true,
			illuminate = { lsp = true },
			telescope = { style = "nvchad" },
			indent_blankline = { scope_color = "lavender" },
		},
	},
}
