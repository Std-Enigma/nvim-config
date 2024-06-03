return {
  "brenoprata10/nvim-highlight-colors",
  event = { "BufReadPost", "BufNewFile", "BufWritePost", "InsertEnter" },
  cmd = "HighlightColors",
  opts = { enabled_named_colors = false },
}
