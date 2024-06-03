return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    cmd = "Telescope",
    opts = function(_, opts)
      local actions = require "telescope.actions"
      opts.defaults = {
        git_worktrees = { toplevel = vim.env.HOME, gitdir = vim.env.HOME .. "/.dotfiles" },
        path_display = { "truncate" },
        layout_config = {
          horizontal = { preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.85,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-N>"] = actions.cycle_history_next,
            ["<C-P>"] = actions.cycle_history_prev,
            ["<C-J>"] = actions.move_selection_next,
            ["<C-K>"] = actions.move_selection_previous,
          },
          n = { q = actions.close },
        },
      }
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    enabled = vim.fn.executable("make") == 1,
    build = "make",
    config = function(_, _) require("telescope").load_extension("fzf") end,
  },

  {
    "catppuccin",
    optional = true,
    opts = { integrations = { telescope = { style = "nvchad" } } }
  },
}
