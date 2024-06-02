return {
  "RRethy/vim-illuminate",
  event = { "BufReadPre", "BufNewFile", "BufReadPost" },
  opts = {
    delay = 200,
    min_count_to_highlight = 2,
    large_file_cutoff = 10000,
    large_file_overrides = { providers = { "lsp" } },
    should_enable = function(bufnr) return require("util.buffer").is_valid(bufnr) end,
  },
  config = function(_, opts) require("illuminate").configure(opts) end,
}
