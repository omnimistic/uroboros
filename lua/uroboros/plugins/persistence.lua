return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- only start session tracking when you actually open a file
  opts = {
    -- Automatically saves the session every time you change a buffer
  }
}