local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- System clipboard
opt.clipboard:append("unnamedplus")

vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#00F5D4" })
vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#39FF14", bold = true })
vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#00F5D4" })
vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#00F5D4" })
vim.api.nvim_set_hl(0, "LualineModeNormal", { fg = "#000000", bg = "#00F5D4", bold = true })

-- Hide the default mode text
vim.opt.showmode = false
-- Reduce the time Neovim waits for a mapped sequence to complete
-- This makes Esc feel snappier and reduces the "flash" window
vim.opt.timeoutlen = 300

opt.ch = 0

-- Disable all visual diagnostic markers
vim.diagnostic.config({
  virtual_text = false, -- Removes ghost text at the end of lines
  signs = false,        -- Removes 'E' from the gutter
  underline = false,    -- Removes squiggly lines
  update_in_insert = false,
  severity_sort = false,
})