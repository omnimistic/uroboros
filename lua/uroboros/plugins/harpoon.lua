return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
    -- Add current file to harpoon list. Multiple calls on same file are idempotent.
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon Add" })
    -- Toggle quick menu shows the list of marked files with keyboard navigation.
    -- Passing harpoon:list() ensures menu operates on the active list instance.
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })
  end,
}