local opt = vim.opt

-- Default behvaior options
opt.timeoutlen = 300 -- shorten key timeout length a little bit for which-key

opt.title = true -- set terminal title to the filename and path
opt.undofile = true -- enable persistent undo
opt.writebackup = false -- disable making a backup before overwriting a file

opt.mouse = "a" -- enable mouse support
opt.virtualedit = "block" -- allow going past end of line in visual block mode
opt.clipboard = "unnamedplus" -- connection to the system clipboard

opt.backspace = vim.list_extend(vim.opt.backspace:get(), { "nostop" }) -- don't stop backspace at insert
opt.shortmess = vim.tbl_deep_extend("force", vim.opt.shortmess:get(), { s = true, I = true }) -- disable search count wrap and startup messages
opt.diffopt = vim.list_extend(vim.opt.diffopt:get(), { "algorithm:histogram", "linematch:60" }) -- enable linematch diff algorithm

-- Folding options
opt.foldenable = true -- enable fold for nvim-ufo
opt.foldlevel = 99 -- set high foldlevel for nvim-ufo
opt.foldlevelstart = 99 -- start with all code unfolded

-- Search options
opt.ignorecase = true -- case insensitive searching
opt.smartcase = true -- case sensitive searching

-- Completion options
opt.pumheight = 10 -- height of the pop up menu
opt.infercase = true -- infer cases in keyword completion
opt.completeopt = { "menu", "menuone", "noselect" } -- Options for insert mode completion

-- Text wrapping options
opt.wrap = false -- disable wrapping of lines longer than the width of window
opt.linebreak = true -- wrap lines at 'breakat'

-- Number line options
opt.number = true -- show numberline
opt.relativenumber = true -- show relative numberline

-- Indentation optinos
opt.tabstop = 2 -- number of space in a tab
opt.shiftwidth = 0 -- number of space inserted for indentation; when zero the 'tabstop' value will be used
opt.expandtab = true -- enable the use of space in tab
opt.copyindent = true -- copy the previous indentation on autoindenting
opt.breakindent = true -- wrap indent to match  line start
opt.preserveindent = true -- preserve indent structure as much as possible

-- Split options
opt.splitright = true -- splitting a new window at the right of the current one
opt.splitbelow = true -- splitting a new window below the current one

-- Data saving options
opt.updatetime = 300 -- length of time to wait before triggering the plugin
opt.viewoptions = vim.tbl_filter(function(val) return val ~= "curdir" end, vim.opt.viewoptions:get())

-- Interface options
opt.cmdheight = 0 -- hide command line unless needed
opt.laststatus = 3 -- global statusline
opt.foldcolumn = "1" -- show foldcolumn
opt.signcolumn = "yes" -- always show the sign column
opt.fillchars = { eob = " " } -- disable `~` on nonexistent lines

opt.confirm = true -- raise a dialog asking if you wish to save the current file(s)
opt.showmode = false -- disable showing modes in command line
opt.cursorline = true -- highlight the text line of the cursor
opt.termguicolors = true -- enable 24-bit RGB color in the TUI

if not vim.t.bufs then vim.t.bufs = vim.api.nvim_list_bufs() end -- initialize buffer list
vim.t = { bufs = vim.t.bufs }

-- Leader keys
 vim.g.mapleader = " "
 vim.g.localmapleader = ","

 -- Markdown options
 vim.g.markdown_recommended_style = 0 -- Fix markdown indentation settings
