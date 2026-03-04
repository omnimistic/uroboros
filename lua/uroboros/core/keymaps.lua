-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Custom Uroboros keymaps here
-- Clear search highlights silently on Esc
vim.keymap.set("n", "<Esc>", function()
    vim.cmd("noh")             -- Clears the highlights
    return "<Esc>"             -- Sends the actual Escape key
end, { expr = true, silent = true, desc = "Clean Escape" })
-- Navigate between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Tab (Buffer) navigation
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Tab" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Tab" })

-- Close current tab (buffer)
-- Using a silent call to handle the last-buffer edge case
vim.keymap.set("n", "<C-w>", function()
  local bd = require("snacks").bufdelete
  if bd then
    bd()
  else
    vim.cmd("bdelete")
  end
end, { desc = "Close Tab (Smart)" })