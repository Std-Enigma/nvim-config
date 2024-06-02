return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePost" },
		cmd = { "IBLEnable", "IBLDisable", "IBLToggle", "IBLEnableScope", "IBLDisableScope", "IBLToggleScope" },
		main = "ibl",
		opts = {
			indent = { char = "│", tab_char = "│" },
			scope = { show_start = false, show_end = false },
			exclude = {
				buftypes = {
					"nofile",
					"prompt",
					"quickfix",
					"terminal",
				},
				filetypes = {
					"aerial",
					"alpha",
					"help",
					"lazy",
					"mason",
					"neo-tree",
					"notify",
					"toggleterm",
					"Trouble",
				},
			},
		},
	},

	{
		"catppuccin",
		optional = true,
		opts = { integrations = { indent_blankline = { scope_color = "lavender" } } },
	},
}
