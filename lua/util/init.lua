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
