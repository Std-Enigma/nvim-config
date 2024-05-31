local map = vim.keymap.set

-- Improved Up/Down
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Move cursor up", expr = true, silent = true })
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Move cursor down", expr = true, silent = true })

-- Opening splits
map("n", "|", "<Cmd>vsplit<CR>", { desc = "Vertical Split" })
map("n", "\\", "<Cmd>split<CR>", { desc = "Horizontal Split" })

-- Move to split using the <Ctrl> hjkl keys
map("n", "<C-H>", "<C-w>h", { desc = "Go to left split" })
map("n", "<C-J>", "<C-w>j", { desc = "Go to lower split" })
map("n", "<C-K>", "<C-w>k", { desc = "Go to upper split" })
map("n", "<C-L>", "<C-w>l", { desc = "Go to right split" })

-- Resize split using <Ctrl> arrow keys
map("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Resize split up" })
map("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Resize split down" })
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Resize split left" })
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Resize split right" })

-- Operations
map("n", "<Leader>w", "<Cmd>w<CR>", { desc = "Save" })
map("n", "<Leader>q", "<Cmd>confirm q<CR>", { desc = "Quit Window" })
map("n", "<Leader>Q", "<Cmd>confirm qall<CR>", { desc = "Exit Neovim" })
map("n", "<Leader>n", "<Cmd>enew<CR>", { desc = "New File" })
map("n", "<C-S>", "<Cmd>silent! update! | redraw<CR>", { desc = "Force write" })
map({ "i", "x" }, "<C-S>", "<Esc><Cmd>silent! update! | redraw<CR>", { desc = "Force write" })
map("n", "<C-Q>", "<Cmd>q!<CR>", { desc = "Force quit" })

-- Commenting
map("x", "<Leader>/", "gc", { remap = true, desc = "Toggle comment" })
map("n", "<Leader>/", "gcc", { remap = true, desc = "Toggle comment line" })

-- Move lines
Map("n", "<A-J>", "<Cmd>m .+1<CR>==", { desc = "Move current line down" })
map("n", "<A-K>", "<Cmd>m .-2<CR>==", { desc = "Move current line up" })
map("i", "<A-J>", "<esc><Cmd>m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<A-K>", "<esc><Cmd>m .-2<CR>==gi", { desc = "Move line up" })
map("v", "<A-J>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "<A-K>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Tab navigation
map("n", "]t", function() vim.cmd.tabnext() end, { desc = "Next tab" })
map("n", "[t", function() vim.cmd.tabnext() end, { desc = "Previous tab" })

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
