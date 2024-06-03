return {
  {
	  "stevearc/aerial.nvim",
	  dependencies = "nvim-tree/nvim-web-devicons",
	  opts = {
		  attach_mode = "global",
		  backends = { "lsp", "treesitter", "markdown", "man" },
		  layout = { min_width = 20 },
		  show_guides = true,
		  filter_kind = false,
		  guides = {
			  mid_item = "├ ",
			  last_item = "└ ",
			  nested_top = "│ ",
			  whitespace = "  ",
		  },
		  keymaps = {
			  ["[y"] = "actions.prev",
			  ["]y"] = "actions.next",
			  ["[Y"] = "actions.prev_up",
			  ["]Y"] = "actions.next_up",
			  ["{"] = false,
			  ["}"] = false,
			  ["[["] = false,
			  ["]]"] = false,
		  },
	  },
	  config = function(_, opts)
		  require("aerial").setup(opts)
		  require("telescope").load_extension("aerial")
	  end,
  },

  {
    "catppuccin",
    optional = true,
    opts = { integrations = { aerial = true } }
  },
}
