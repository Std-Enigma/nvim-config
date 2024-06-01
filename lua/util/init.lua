---Utilities
---
---Various utility functions to use.
---
---This module can be loaded with `local util = require "util"`
---
---Code from AstroCore
---https://github.com/AstroNvim/astrocore
---@class util
local M = {}


--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
---@param plugin string The plugin to search for
---@return boolean available # Whether the plugin is available
function M.is_available(plugin) return M.get_plugin(plugin) ~= nil end

--- Run a shell command and capture the output and if the command succeeded or failed
---@param cmd string|string[] The terminal command to execute
---@param show_error? boolean Whether or not to show an unsuccessful command as an error to the user
---@return string|nil # The result of a successfully executed command or nil
function M.cmd(cmd, show_error)
  if type(cmd) == "string" then cmd = { cmd } end
  if vim.fn.has "win32" == 1 then cmd = vim.list_extend({ "cmd.exe", "/C" }, cmd) end
  local result = vim.fn.system(cmd)
  local success = vim.api.nvim_get_vvar "shell_error" == 0
  if not success and (show_error == nil or show_error) then
    vim.api.nvim_err_writeln(("Error running command %s\nError message:\n%s"):format(table.concat(cmd, " "), result))
  end
  return success and assert(result):gsub("[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", "") or nil
end

--- Trigger an Neovim user event
---@param event string|vim.api.keyset_exec_autocmds The event pattern or full autocmd options (pattern always prepended with "Neo")
---@param instant boolean? Whether or not to execute instantly or schedule
function M.event(event, instant)
  if type(event) == "string" then event = { pattern = event } end
  event = M.extend_tbl({ modeline = false }, event)
  event.pattern = "Neo" .. event.pattern
  if instant then
    vim.api.nvim_exec_autocmds("User", event)
  else
    vim.schedule(function() vim.api.nvim_exec_autocmds("User", event) end)
  end
end

--- Get the first worktree that a file belongs to
---@param file string? the file to check, defaults to the current file
---@param worktrees table<string, string>[]? an array like table of worktrees with entries `toplevel` and `gitdir`, default retrieves from `vim.g.git_worktrees`
---@return table<string, string>|nil # a table specifying the `toplevel` and `gitdir` of a worktree or nil if not found
function M.file_worktree(file, worktrees)
  worktrees = worktrees or M.config.git_worktrees
  if not worktrees then return end
  file = file or vim.fn.expand "%" --[[@as string]]
  for _, worktree in ipairs(worktrees) do
    if
      M.cmd({
        "git",
        "--work-tree",
        worktree.toplevel,
        "--git-dir",
        worktree.gitdir,
        "ls-files",
        "--error-unmatch",
        file,
      }, false)
      then
        return worktree
      end
    end
  end

--- Merge extended options with a default table of options
---@param default? table The default table that you want to merge into
---@param opts? table The new options that should be merged with the default table
---@return table # The merged table
function M.extend_tbl(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

--- Serve a notification with a title of Neovim
---@param msg string The notification body
---@param type integer|nil The type of the notification (:help vim.log.levels)
---@param opts? table The nvim-notify options to use (:help notify-options)
function M.notify(msg, type, opts)
  vim.schedule(function() vim.notify(msg, type, M.extend_tbl({ title = "Neovim" }, opts)) end)
end

--- A helper function to wrap a module function to require a plugin before running
---@param plugin string The plugin to call `require("lazy").load` with
---@param module table The system module where the functions live (e.g. `vim.ui`)
---@param funcs string|string[] The functions to wrap in the given module (e.g. `"ui", "select"`)
function M.load_plugin_with_func(plugin, module, funcs)
  if type(funcs) == "string" then funcs = { funcs } end
  for _, func in ipairs(funcs) do
    local old_func = module[func]
    module[func] = function(...)
      module[func] = old_func
      require("lazy").load { plugins = { plugin } }
      module[func](...)
    end
  end
end

return M
