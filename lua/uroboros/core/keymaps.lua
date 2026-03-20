-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Custom Uroboros keymaps here

-- Clear search highlights silently on Esc
-- Using expr=true allows the function to return the actual Escape keystroke
-- so it still performs normal Esc behavior (exit insert mode, etc.) after clearing highlights.
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

-- Save file with Ctrl + S in Normal, Insert, and Visual modes
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Close current tab (buffer)
-- Tries snacks.bufdelete first (handles last-buffer edge case gracefully with notification).
-- Falls back to vim.cmd("bdelete") if snacks is not available, though bdelete errors on last buffer.
-- This conditional approach allows the config to work even if snacks plugin is disabled.
vim.keymap.set("n", "<C-w>", function()
  local bd = require("snacks").bufdelete
  if bd then
    bd()
  else
    vim.cmd("bdelete")
  end
end, { desc = "Close Tab (Smart)" })

-- Stop Space from moving the cursor in Normal and Visual modes
-- Space is the leader key; must be remapped to <Nop> to prevent default spacebar behavior (forward search).
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Return to the Dashboard (Main Menu)
vim.keymap.set("n", "<leader>mm", function() Snacks.dashboard.open() end, { desc = "Go to Main Menu" })