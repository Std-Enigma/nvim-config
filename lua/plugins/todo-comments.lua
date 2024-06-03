return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
  event = { "BufReadPost", "BufNewFile", "BufWritePost" },
  dependencies = "nvim-lua/plenary.nvim",
  opts = {},
}
