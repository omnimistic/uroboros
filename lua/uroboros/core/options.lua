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