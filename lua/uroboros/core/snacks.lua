return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    -- Terminal
    { "<C-/>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
    -- <C-_> is the Ctrl+/ keystroke on some terminals (quirk of terminal emulation).
    -- Maps to same function but marked which_key_ignore so it doesn't clutter help menu.
    { "<C-_>", function() Snacks.terminal() end, desc = "which_key_ignore" },
    
    -- Snacks Picker (Telescope alternative)
    { "<leader><space>", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Live Grep" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    
    -- Snacks Explorer (Neo-tree alternative)
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
  },
  opts = {
    -- Core Modules
    explorer = { enabled = true },
    picker = { 
      enabled = true,
      sources = {
        projects = {
          -- vcwd() sets the search path to the current working directory,
          -- allowing picker to find projects relative to where nvim was launched.
          dev = { vim.fn.getcwd() },
          -- Patterns list acts as project markers: finder stops at directory containing any of these.
          -- Includes version control (.git, .hg, etc.) and language-specific files (package.json, Makefile).
          patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "lua" },
        },
      },
    },
    scroll = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    terminal = {
      win = { style = "terminal", border = "rounded" },
    },
    
    -- Dashboard
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "g", desc = "Live Grep", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = "󰉋 ", key = "p", desc = "Projects", action = ":lua Snacks.dashboard.pick('projects')" },
          { icon = "󰁯 ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load()" },
          -- The cwd parameter scopes file picker to stdpath('config'), so 'c' key opens config files,
          -- not all files in the current project. This is useful for quick access to nvim settings.
          { icon = " ", key = "c", desc = "Uroboros Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        {
          section = "terminal",
          -- Runs anim.lua as a headless script to generate ASCII art output for dashboard display.
          -- Headless mode suppresses UI, so only stdout (the animation) is captured and shown.
          cmd = "nvim --headless -l " .. vim.fn.stdpath("config") .. "/lua/uroboros/core/anim.lua",
          height = 24,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
    styles = { notification = { wo = { wrap = true } } }
  },
}