return {
  -- colorize active window seperators and animate switching between them
  {
    "nvim-zh/colorful-winsep.nvim",
    event = "WinNew",
    config = true,
    opts = {},
  },

  -- better and fancier vim.ui
  {
    "stevearc/dressing.nvim",
    opts = {
      stages = "static",
      timeout = 3000,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
      on_open = function(win)
        vim.wo[win].spell = false
        vim.wo[win].conceallevel = 3
        vim.api.nvim_win_set_config(win, { zindex = 100 }) 
      end,
    },
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },

  -- fancy, configurable, notification manager
  {
    "rcarriga/nvim-notify",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {},
  },

  -- completely replaces the UI for messages, cmdline and the popupmenu.
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help 
      },
    },
  },

  -- ui components and icons
  { "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
}
