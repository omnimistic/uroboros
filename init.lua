vim.opt.showmode = false
vim.opt.cmdheight = 0 
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
require("uroboros.core.keymaps")
require("uroboros.lazy")