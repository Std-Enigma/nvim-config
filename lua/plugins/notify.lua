return {
  {
    "rcarriga/nvim-notify",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      stages = "fade_in_slide_out",
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
        vim.wo[win].spell = false
        vim.wo[win].conceallevel = 3
      end,
    },
  },

  {
    "catppuccin",
    optional = true,
    opts = { integrations = { notify = true } },
  },
}
