return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- 1. Animated Battery Function
    local function animated_battery()
      local animated = { "󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹" }
      -- Cycle through the battery icons based on the current second
      local sec = tonumber(os.date("%S"))
      local index = (math.floor(sec / 6) % #animated) + 1
      return animated[index]
    end

    -- 2. Harpoon Indicator
    local function harpoon_status()
      local ok, harpoon = pcall(require, "harpoon")
      if not ok then return "" end
      local list = harpoon:list()
      local current_file = vim.api.nvim_buf_get_name(0)

      for i, item in ipairs(list.items) do
        if item and item.value and string.find(current_file, item.value, 1, true) then
          return "󱡁 " .. i -- Shows the Harpoon icon and the mark number
        end
      end
      return ""
    end

    -- 3. Visual Mode Selection Counter
    local function selection_count()
      local mode = vim.fn.mode()
      if mode:match("[vV\x16]") then
        local lines = math.abs(vim.fn.line('.') - vim.fn.line('v')) + 1
        local chars = vim.fn.wordcount().visual_chars
        return string.format("󰒰 %d lines, %d chars", lines, chars)
      end
      return ""
    end

    -- 4. Alternate File Name
    local function alt_file()
      local alt = vim.fn.expand('#:t')
      if alt ~= "" then
        return "󰁯 " .. alt
      end
      return ""
    end

    -- 5. LSP Progress (Upgraded for Neovim 0.11+)
    local function custom_lsp_progress()
      local status = vim.lsp.status()
      if status == "" then return "" end -- Hide when not loading

      local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
      -- vim.uv is the modern replacement for vim.loop
      local ms = vim.uv.hrtime() / 1000000
      local frame = math.floor(ms / 120) % #spinners
      return spinners[frame + 1] .. " " .. status
    end

    -- Setup Lualine
    require("lualine").setup({
      options = {
        theme = "auto",
        globalstatus = true,
        -- Flame emojis (e0c0, e0c1, e0c2, e0c3)
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
      },
      sections = {
        -- Left Side
        lualine_a = { 
          { 'mode', icon = '∞' },
          { animated_battery },
        },
        lualine_b = { 
          'branch', 
          'diff', 
          'diagnostics' 
        },
        lualine_c = { 
          { 'filename', path = 1 },
          { harpoon_status, color = { fg = "#00f5d4", gui = "bold" } }, -- Cosmic cyan!
          { alt_file, color = { fg = "#5c6370" } },
        },
        
        -- Right Side
        lualine_x = { 
          { selection_count, color = { fg = "#ff9e64" } },
          { custom_lsp_progress, color = { fg = "#39ff14" } }, -- Venom green!
        },
        lualine_y = { 
          'filetype',
          'progress' 
        },
        lualine_z = { 
          'location',
          { 'os.date("%H:%M")', icon = '' }, -- Clock
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}