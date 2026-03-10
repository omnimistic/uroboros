return {
  "mawkler/modicator.nvim",
  init = function()
    -- Modicator requires these settings to be true to work
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  opts = {}
}