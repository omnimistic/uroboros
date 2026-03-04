return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local uroboros_theme = {
      normal = {
        a = { fg = "#000000", bg = "#00F5D4", gui = "bold" },
        b = { fg = "#00F5D4", bg = "#1a1b26" },
        c = { fg = "#00F5D4", bg = "#1a1b26" },
      },
      insert = {
        a = { fg = "#000000", bg = "#39FF14", gui = "bold" },
      },
      visual = {
        a = { fg = "#000000", bg = "#FF007C", gui = "bold" },
      },
    }

    require("lualine").setup({
      options = {
        theme = uroboros_theme,
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", icon = "∞" } },
        lualine_b = { "branch" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "diagnostics", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}