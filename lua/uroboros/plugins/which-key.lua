return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern", -- Matches the sleek look in your screenshot
    delay = 300,        -- Delay before the menu pops up
    win = {
      border = "rounded", -- Adds that nice rounded frame
      -- We leave position out so it stays at the bottom naturally
      wo = {
        winblend = 10,    -- Slight transparency to match your theme
      },
    },
    layout = {
      spacing = 3,        -- Space between key columns
      align = "left",     -- Traditional left-aligned columns
    },
    spec = {
      { "<leader>f", group = "find/file" },
      { "<leader>e", desc = "Toggle Neo-tree" }, -- Labels your explorer key
    },
  },
}