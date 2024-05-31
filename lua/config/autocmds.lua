local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Reload the file when buffer focus was changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("CheckTime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("HighlightYank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Save buff view automatically for real files
vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
  group = augroup("AutoView"),
  callback = function(event)
    if vim.b[event.buf].view_activated then vim.cmd.mkview { mods = { emsg_silent = true } } end
  end,
})

-- Save buffer view automatically for real files
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup("AutoView"),
  callback = function(event)
    if not vim.b[event.buf].view_activated then
      local filetype = vim.bo[event.buf].filetype
      local buftype = vim.bo[event.buf].buftype
      local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }
      if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
        vim.b[event.buf].view_activated = true
        vim.cmd.loadview { mods = { emsg_silent = true } }
      end
    end
  end,
})

-- Close some filetypes with q
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup("CloseWithQ"),
  pattern = {
    "qf",
    "help",
    "notify",
    "nofile",
    "lspinfo",
    "quitckfix",
    "checkhealth",
    "spectre_panel",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<Cmd>close<CR>", {
      desc = "Close window",
      buffer = event.buf,
      silent = true,
      nowait = true,
    })
  end
})

-- Make it easier to close quick fix
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("QuickfixUnlist"),
  pattern = "qf",
  callback = function() vim.opt_local.buflisted = false end,
})

-- Make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("ManUnlist"),
  pattern = "man",
  callback = function(event) vim.bo[event.buf].buflisted = false end,
})

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("WrapSpell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("JsonConceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- Disable line number/fold column/sign column for terminals
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup("TerminalSettins"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.foldcolumn = "0"
    vim.opt_local.signcolumn = "no"
  end,
})

-- Auto create directory when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("AutoCreateDir"),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
