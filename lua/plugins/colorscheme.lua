return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			style = "night",
			transparent = true,
			dim_inactive = true,
		},
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = true,
		opts = {
			term_colors = true,
			show_end_of_buffer = true,
			transparent_background = true,
			dim_inactive = { enabled = true },
			integrations = {
				hop = true,
				mason = true,
				noice = true,
				notify = true,
				aerial = true,
				harpoon = true,
				neotree = true,
				overseer = true,
				which_key = true,
				lsp_trouble = true,
				illuminate = { lsp = true },
				telescope = { style = "nvchad" },
				colorful_winsep = { enabled = true },
				indent_blankline = { scope_color = "lavender" },
			},
		},
	},
}
