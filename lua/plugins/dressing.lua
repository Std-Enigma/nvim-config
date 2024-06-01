return {
  "stevearc/dressing.nvim",
  init = function() require("util").load_plugin_with_func("dressing.nvim", vim.ui, { "input", "select" }) end,
  opts = { select = { backend = { "telescope", "builtin" } } },
}
