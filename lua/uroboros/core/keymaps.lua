-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Custom Uroboros keymaps here
keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })