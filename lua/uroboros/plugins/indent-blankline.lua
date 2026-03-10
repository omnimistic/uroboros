return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "│" },
    scope = { enabled = false }, -- We turn this off because mini.indentscope handles it better
  },
}