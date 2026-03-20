return {
  "folke/trouble.nvim",
  -- cmd = "Trouble" enables lazy loading: plugin only loads when :Trouble command is first invoked.
  -- This reduces startup time since trouble is typically only used when debugging diagnostics.
  cmd = "Trouble",
  keys = {
    -- Keymap also triggers lazy loading if plugin not already loaded.
    -- toggle variant shows/hides diagnostics panel without full restart.
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
  },
}