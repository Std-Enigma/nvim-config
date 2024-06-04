local map = vim.keymap.set

-- Improved Up/Down
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Move cursor up", expr = true, silent = true })
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Move cursor down", expr = true, silent = true })

-- Opening splits
map("n", "|", "<Cmd>vsplit<CR>", { desc = "Vertical Split" })
map("n", "\\", "<Cmd>split<CR>", { desc = "Horizontal Split" })

-- Move to split using the <Ctrl> hjkl and \ keys
map("n", "<C-H>", function() require("smart-splits").move_cursor_left() end, { desc = "Go to left split" })
map("n", "<C-J>", function() require("smart-splits").move_cursor_down() end, { desc = "Go to lower split" })
map("n", "<C-K>", function() require("smart-splits").move_cursor_up() end, { desc = "Go to upper split" })
map("n", "<C-L>", function() require("smart-splits").move_cursor_right() end, { desc = "Go to right split" })
map("n", "<C-\\>", function() require("smart-splits").move_cursor_previous() end, { desc = "Go to previous split" })

-- Resize split using <Ctrl> arrow keys
map("n", "<C-Up>", function() require("smart-splits").resize_up() end, { desc = "Resize split up" })
map("n", "<C-Down>", function() require("smart-splits").resize_down() end, { desc = "Resize split down" })
map("n", "<C-Left>", function() require("smart-splits").resize_left() end, { desc = "Resize split left" })
map("n", "<C-Right>", function() require("smart-splits").resize_right() end, { desc = "Resize split right" })

-- Goto resize mode <Alt> + R key
map("n", "<A-r>", function() require("smart-splits").start_resize_mode() end, { desc = "Enter resize mode" })

-- Swap buffers between splits
map("n", "<A-Up>", function() require("smart-splits").swap_buf_up({ move_cursor = true }) end, { desc = "Swap buffer up" })
map("n", "<A-Down>", function() require("smart-splits").swap_buf_down({ move_cursor = true }) end, { desc = "Swap buffer down" })
map("n", "<A-Left>", function() require("smart-splits").swap_buf_left({ move_cursor = true }) end, { desc = "Swap buffer left" })
map("n", "<A-Right>", function() require("smart-splits").swap_buf_right({ move_cursor = true }) end, { desc = "Swap buffer right" })

-- Operations
map("n", "<Leader>w", "<Cmd>w<CR>", { desc = "Save" })
map("n", "<Leader>q", "<Cmd>confirm q<CR>", { desc = "Quit Window" })
map("n", "<Leader>Q", "<Cmd>confirm qall<CR>", { desc = "Exit Neovim" })
map("n", "<Leader>n", "<Cmd>enew<CR>", { desc = "New File" })
map("n", "<C-S>", "<Cmd>silent! update! | redraw<CR>", { desc = "Force write" })
map({ "i", "x" }, "<C-S>", "<Esc><Cmd>silent! update! | redraw<CR>", { desc = "Force write" })
map("n", "<C-Q>", "<Cmd>q!<CR>", { desc = "Force quit" })

-- Commenting
map("n", "<Leader>/", function() return require("Comment.api").call("toggle.linewise." .. (vim.v.count == 0 and "current" or "count_repeat"), "g@$")() end, { expr = true, silent = true, desc = "Toggle comment line" })
map("x", "<Leader>/", "<Esc><Cmd>lua require('Comment.api').locked('toggle.linewise')(vim.fn.visualmode())<CR>", { expr = true, silent = true, desc = "Toggle comment" })

-- Move lines
map("n", "<A-j>", "<Cmd>m .+1<CR>==", { silent = true, desc = "Move current line down" })
map("n", "<A-k>", "<Cmd>m .-2<CR>==", { silent = true, desc = "Move current line up" })
map("i", "<A-j>", "<Esc><Cmd>m .+1<CR>==gi", { silent = true, desc = "Move line down" })
map("i", "<A-k>", "<Esc><Cmd>m .-2<CR>==gi", { silent = true, desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selected lines down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selected lines up" })

-- Tab navigation
map("n", "]t", function() vim.cmd.tabnext() end, { desc = "Next tab" })
map("n", "[t", function() vim.cmd.tabprev() end, { desc = "Previous tab" })

-- Buffer navigation
map("n", "]b", "<Cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "[b", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<S-L>", "<Cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-H>", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Better indenting
map("v", ">", ">gv")
map("v", "<", "<gv")
map("v", "<Tab>", ">")
map("v", "<S-Tab>", "<")

-- Terminal mappings
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Enter Normal mode" })
map("t", "<C-H>", "<Cmd>wincmd h<CR>", { desc = "Go to Left Window" })
map("t", "<C-J>", "<Cmd>wincmd j<CR>", { desc = "Go to Lower Window" })
map("t", "<C-K>", "<Cmd>wincmd k<CR>", { desc = "Go to Upper Window" })
map("t", "<C-L>", "<Cmd>wincmd l<CR>", { desc = "Go to Right Window" })

-- Clear search with <Esc>
map({ "i", "n" }, "<Esc>", "<Cmd>noh<CR><Esc>", { desc = "Escape and Clear hlsearch" })

-- Consistent searching behavaior
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Previous search result" })
map({ "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map({ "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Previous search result" })

-- Plugin manager mappings
map("n", "<Leader>pi", function() require("lazy").install() end, { desc = "Plugins Install" })
map("n", "<Leader>ps", function() require("lazy").home() end, { desc = "Plugins Status" })
map("n", "<Leader>pS", function() require("lazy").sync() end, { desc = "Plugins Sync" })
map("n", "<Leader>pu", function() require("lazy").check() end, { desc = "Plugins Check Updates" })
map("n", "<Leader>pU", function() require("lazy").update() end, { desc = "Plugins Update" })

-- Diagnostic mappings
map("n", "gl", function() vim.diagnostic.open_float() end, { desc = "Hover diagnostics" })
map("n", "<Leader>ld", function() vim.diagnostic.open_float() end, { desc = "Hover diagnostics" })

-- Toggle mappings
map("n", "<Leader>ub", function() require("util.toggles").background() end, { desc = "Toggle background" })
map("n", "<Leader>ug", function() require("util.toggles").signcolumn() end, { desc = "Toggle signcolumn" })
map("n", "<Leader>u>", function() require("util.toggles").foldcolumn() end, { desc = "Toggle foldcolumn" })
map("n", "<Leader>ui", function() require("util.toggles").indent() end, { desc = "Change indent setting" })
map("n", "<Leader>ul", function() require("util.toggles").statusline() end, { desc = "Toggle statusline" })
map("n", "<Leader>un", function() require("util.toggles").number() end, { desc = "Change line numbering" })
map("n", "<Leader>up", function() require("util.toggles").paste() end, { desc = "Toggle paste mode" })
map("n", "<Leader>us", function() require("util.toggles").spell() end, { desc = "Toggle spellcheck" })
map("n", "<Leader>uS", function() require("util.toggles").conceal() end, { desc = "Toggle conceal" })
map("n", "<Leader>ut", function() require("util.toggles").tabline() end, { desc = "Toggle tabline" })
map("n", "<Leader>uw", function() require("util.toggles").wrap() end, { desc = "Toggle wrap" })
map("n", "<Leader>uy", function() require("util.toggles").buffer_syntax() end, { desc = "Toggle syntax highlight" })

-- Plugin mappings

--- nvim-notify
map("n", "<Leader>uD", function() require("notify").dismiss { pending = true, silent = true } end, { desc = "Dismiss notifications" })

--- noice.nvim
map("n", "<Leader>Na", function() require("noice").cmd("all") end, { desc = "Noice all" })
map("n", "<Leader>Nd", function() require("noice").cmd("dismiss") end, { desc = "Dismiss all" })
map("n", "<Leader>Nh", function() require("noice").cmd("history") end, { desc = "Noice history" })
map("n", "<Leader>Nl", function() require("noice").cmd("last") end, { desc = "Noice Last message" })
map("n", "<Leader>Nt", function() require("noice").cmd("telescope") end, { desc = "Noice telescope" })
map("c", "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, { desc = "Redirect cmdline" })
map({"i", "n", "s"}, "<C-F>", function() if not require("noice.lsp").scroll(4) then return "<C-F>" end end, { silent = true, expr = true, desc = "Scroll Forward" })
map({"i", "n", "s"}, "<C-B>", function() if not require("noice.lsp").scroll(-4) then return "<C-B>" end end, { silent = true, expr = true, desc = "Scroll Backward" })

--- trouble.nvim
map("n", "<Leader>xl", "<Cmd>Trouble loclist toggle<CR>", { desc = "Location list" })
map("n", "<Leader>xq", "<Cmd>Trouble quickfix toggle<CR>", { desc = "Quickfix list" })
map("n", "<Leader>xt", "<Cmd>Trouble todo<CR>", { desc = "Todo list" })
map("n", "<Leader>xT", "<Cmd>Trouble todo filter={tag={TODO,FIX,FIXME}}<CR>", desc = "Todo/Fix/Fixme list" })
map("n", "<Leader>xX", "<Cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (global)" })
map("n", "<Leader>xx", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Diagnostics (buffer)" })
map("n", "]q", function()
  if require("trouble").is_open() then
    require("trouble").next({ skip_groups = true, jump = true })
  else
    local ok, err = pcall(vim.cmd.cprev)
    if not ok then
      vim.notify(err, vim.log.levels.ERROR)
    end
  end
end, { desc = "Next Trouble/Quickfix Item" })
map("n", "[q", function()
  if require("trouble").is_open() then
    require("trouble").prev({ skip_groups = true, jump = true })
  else
    local ok, err = pcall(vim.cmd.cprev)
    if not ok then
      vim.notify(err, vim.log.levels.ERROR)
    end
  end
end, { desc = "Previous Trouble/Quickfix Item" })

--- indent-blankline.nvim
map("n", "<Leader>u|", "<Cmd>IBLToggle<CR>", { desc = "Toggle indent guides" })

--- vim-illuminate
map("n", "]r", function() require("illuminate")["goto_next_reference"](false) end, { desc = "Next reference" })
map("n", "[r", function() require("illuminate")["goto_prev_reference"](false) end, { desc = "Pervious reference" })
map("n", "<Leader>ur", function() require("illuminate").toggle_buf() end, { desc = "Toggle reference highlighting (buffer)" })
map("n", "<Leader>uR", function() require("illuminate").toggle() end, { desc = "Toggle reference highlighting (global)" })

--- treesj
map("n", "gj", "<Cmd>TSJJoin<CR>", { desc = "Join code block" })
map("n", "gs", "<Cmd>TSJSplit<CR>", { desc = "Split code block" })
map("n", "gm", "<Cmd>TSJToggle<CR>", { desc = "Split/Join code block" })

--- nvim-highlight-colors
map("n", "<Leader>uz", function() require("nvim-highlight-colors").toggle() end)

--- gitsigns.nvim
map("n", "]g", function() require("gitsigns").next_hunk() end, { desc = "Next Git hunk" })
map("n", "[g", function() require("gitsigns").prev_hunk() end, { desc = "Previous Git hunk" })
map("n", "<Leader>gl", function() require("gitsigns").blame_line() end, { desc = "View Git blame" })
map("n", "<Leader>gL", function() require("gitsigns").blame_line { full = true } end, { desc = "View full Git blame" })
map("n", "<Leader>gp", function() require("gitsigns").preview_hunk_inline() end, { desc = "Preview Git hunk" })
map("n", "<Leader>gh", function() require("gitsigns").reset_hunk() end, { desc = "Reset Git hunk" })
map("n", "<Leader>gr", function() require("gitsigns").reset_buffer() end, { desc = "Reset Git buffer" })
map("n", "<Leader>gs", function() require("gitsigns").stage_hunk() end, { desc = "Stage Git hunk" })
map("n", "<Leader>gS", function() require("gitsigns").stage_buffer() end, { desc = "Stage Git buffer" })
map("n", "<Leader>gu", function() require("gitsigns").undo_stage_hunk() end, { desc = "Unstage Git hunk" })
map("n", "<Leader>gd", function() require("gitsigns").diffthis() end, { desc = "View Git diff" })

--- aerial.nvim
map("n", "<Leader>lS", function() require("aerial").toggle() end, { desc = "Symbols outline" })

--- toggleterm.nvim
local util = require "util"
if vim.fn.executable "git" == 1 and vim.fn.executable "lazygit" == 1 then
  local lazygit = {
    callback = function()
      local worktree = util.file_worktree()
      local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir)
      or ""
      util.toggle_term_cmd("lazygit " .. flags)
    end,
    desc = "ToggleTerm lazygit",
  }
  map("n", "<Leader>gg", lazygit.callback, { desc = lazygit.desc })
  map("n", "<Leader>tl", lazygit.callback, { desc = lazygit.desc })
end
if vim.fn.executable "node" == 1 then
  map("n", "<Leader>tn", function() util.toggle_term_cmd "node" end, { desc = "ToggleTerm node" })
end
local gdu = vim.fn.has "mac" == 1 and "gdu-go" or "gdu"
if vim.fn.has "win32" == 1 and vim.fn.executable(gdu) ~= 1 then gdu = "gdu_windows_amd64.exe" end
if vim.fn.executable(gdu) == 1 then
  map("n", "<Leader>tu", function() util.toggle_term_cmd(gdu) end, { desc = "ToggleTerm gdu" })
end
if vim.fn.executable "btm" == 1 then
  map("n", "<Leader>tt", function() util.toggle_term_cmd "btm" end, { desc = "ToggleTerm btm" })
end
local python = vim.fn.executable "python" == 1 and "python" or vim.fn.executable "python3" == 1 and "python3"
if python then
  map("n", "<Leader>tp", function() util.toggle_term_cmd(python) end, { desc = "ToggleTerm python" })
end
map("n", "<Leader>tf", "<Cmd>ToggleTerm direction=float<CR>", { desc = "ToggleTerm float" })
map("n", "<Leader>th", "<Cmd>ToggleTerm size=15 direction=horizontal<CR>", { desc = "ToggleTerm horizontal split" })
map("n", "<Leader>tv", "<Cmd>ToggleTerm size=50 direction=vertical<CR>", { desc = "ToggleTerm vertical split" })
map("n", "<F7>", '<Cmd>execute v:count . "ToggleTerm"<CR>', { desc = "Toggle terminal" })
map("t", "<F7>", "<Cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("i", "<F7>", "<Esc><Cmd>ToggleTerm<CR>", { desc = "Toggle terminl" })
map("n", "<C-'>", '<Cmd>execute v:count . "ToggleTerm"<CR>', { desc = "Toggle terminal" }) -- requires terminal that supports binding <C-'>
map("n", "<C-'>", "<Cmd>ToggleTerm<CR>", { desc = "Toggle terminal" }) -- requires terminal that supports binding <C-'>
map("n", "<C-'>", "<Esc><Cmd>ToggleTerm<CR>", { desc = "Toggle terminl" }) -- requires terminal that supports binding <C-'>

--- telescope.nvim
local is_available = util.is_available
if vim.fn.executable("git") == 1 then
  map("n", "<Leader>gb", function() require("telescope.builtin").git_branches({ use_file_path = true }) end, { desc = "Git branches" })
  map("n", "<Leader>gc", function() require("telescope.builtin").git_commits({ use_file_path = true }) end, { desc = "Git commits (repository)" })
  map("n", "<Leader>gC", function() require("telescope.builtin").git_bcommits({ use_file_path = true }) end, { desc = "Git commits (current file)" })
  map("n", "<Leader>gt", function() require("telescope.builtin").git_status({ use_file_path = true }) end, { desc = "Git status" })
end
map("n", "<Leader>f<CR>", function() require("telescope.builtin").resume() end, { desc = "Resume previous search" })
map("n", "<Leader>f'", function() require("telescope.builtin").marks() end, { desc = "Find marks" })
map("n", "<Leader>f/", function() require("telescope.builtin").current_buffer_fuzzy_find() end, { desc = "Find words in current buffer" })
map("n", "<Leader>fa", function()
  require("telescope.builtin").find_files({
    prompt_title = "Config Files",
    cwd = vim.fn.stdpath("config"),
    follow = true,
  })
end, { desc = "Find Neovim config files" })
map("n", "<Leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Find buffers" })
map("n", "<Leader>fc", function() require("telescope.builtin").grep_string() end, { desc = "Find word under cursor" })
map("n", "<Leader>fC", function() require("telescope.builtin").commands() end, { desc = "Find commands" })
map("n", "<Leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Find files" })
map("n", "<Leader>fF", function() require("telescope.builtin").find_files({ hidden = true, no_ignore = true }) end, { desc = "Find all files" })
map("n", "<Leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "Find help" })
map("n", "<Leader>fk", function() require("telescope.builtin").keymaps() end, { desc = "Find keymaps" })
map("n", "<Leader>fm", function() require("telescope.builtin").man_pages() end, { desc = "Find man" })
if is_available("nvim-notify") then
  map("n", "<Leader>fn", function() require("telescope").extensions.notify.notify() end, { desc = "Find notifications" })
end
map("n", "<Leader>fo", function() require("telescope.builtin").oldfiles() end, { desc = "Find history" })
map("n", "<Leader>fr", function() require("telescope.builtin").registers() end, { desc = "Find registers" })
map("n", "<Leader>ft", function() require("telescope.builtin").colorscheme({ enable_preview = true }) end, { desc = "Find themes" })
if vim.fn.executable("rg") == 1 then
  map("n", "<Leader>fw", function() require("telescope.builtin").live_grep() end, { desc = "Find words" })
  map("n", "<Leader>fW", function()
    require("telescope.builtin").live_grep({
      additional_args = function(args)
        return vim.list_extend(args, { "--hidden", "--no-ignore" })
      end,
    })
  end, { desc = "Find words in all files" })
end
map("n", "<Leader>ls", function()
  if is_available("aerial.nvim") then
    require("telescope").extensions.aerial.aerial()
  else
    require("telescope.builtin").lsp_document_symbols()
  end
end, { desc = "Search symbols" })
map("n", "<Leader>fT", "<Cmd>TodoTelescope<CR>", { desc = "Find TODOs" })

--- todo-comments.nvim
map("n", "]T", function() require("todo-comments").jump_next() end, { desc = "Next TODO comment" })
map("n", "[T", function() require("todo-comments").jump_prev() end, { desc = "Previous TODO comment" })
