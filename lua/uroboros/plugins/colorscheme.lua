return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local kanagawa = require("kanagawa")
    
    kanagawa.setup({
      transparent = false, -- Start solid by default
      theme = "wave",
    })

    vim.cmd("colorscheme kanagawa")

    -- Define the groups we want to strip backgrounds from
    local groups = {
      "Normal", "NormalNC", "LineNr", "CursorLine", "CursorLineNr",
      "SignColumn", "StatusLine", "StatusLineNC", "EndOfBuffer",
      "MsgArea", "NormalFloat", "FloatBorder",
    }

    -- Create the Toggle Function
    _G.toggle_transparency = function()
      if vim.g.transparent_enabled then
        -- SWITCH TO SOLID
        vim.cmd("colorscheme kanagawa")
        vim.g.transparent_enabled = false
        print("Transparency Off")
      else
        -- SWITCH TO TRANSPARENT
        for _, group in ipairs(groups) do
          vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
        end
        vim.g.transparent_enabled = true
        print("Transparency On")
      end
    end

    -- Set the initial state
    vim.g.transparent_enabled = false

    -- Set the Keymap
    vim.keymap.set("n", "<leader>ut", function() _G.toggle_transparency() end, { desc = "Toggle Transparency" })
  end,
}