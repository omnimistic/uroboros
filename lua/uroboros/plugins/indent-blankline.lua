return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "▎", -- A solid vertical bar for a cleaner look
      highlight = "IndentLineMuted", -- Pulls the muted color from your engine
    },
    scope = { 
      enabled = false, -- Disable IBL scope to avoid fighting with mini.indentscope
    },
    exclude = {
      filetypes = { "help", "dashboard", "neo-tree", "lazy", "mason" },
    },
  },
}