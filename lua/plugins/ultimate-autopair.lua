return {
  "altermo/ultimate-autopair.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
  branch = "v0.6",
  opts = {
    extensions = {
      fly = { nofilter = true },
      cond = { cond = function(fn) return not fn.in_node("comment") end }
    },
    config_internal_pairs={
      { '"','"', fly = true },
      { "'", "'", fly = true },
    },
  },
}
