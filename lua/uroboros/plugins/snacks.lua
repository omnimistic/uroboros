return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<C-/>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
    { "<C-_>", function() Snacks.terminal() end, desc = "which_key_ignore" },
  },
  opts = {
    picker = {
      projects = {
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      },
    },
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "g", desc = "Live Grep", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = "󰉋 ", key = "p", desc = "Projects", action = ":lua Snacks.dashboard.pick('projects')" },
          { icon = "󰁯 ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load()" },
          { icon = " ", key = "c", desc = "Uroboros Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        {
          section = "terminal",
          cmd = "nvim --headless -l " .. vim.fn.stdpath("config") .. "/lua/uroboros/core/anim.lua",
          height = 24,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
    terminal = {
      win = {
        style = "terminal",
        border = "rounded",
      },
    },
    input = { enabled = true },
    notifier = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true } 
      }
    }
  },
}