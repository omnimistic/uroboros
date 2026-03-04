return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },    -- New lines
      change = { text = "▎" }, -- Modified lines
      delete = { text = "" }, -- Deleted lines
    },
  },
}