return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim", -- The UI library Noice needs to draw the floating boxes
  },
  opts = {
    lsp = {
      -- Override markdown rendering so hover docs and signatures look beautiful with Treesitter
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
      signature = { enabled = true }, -- Pops up function arguments as you type them
    },
    presets = {
      bottom_search = false,        -- Makes your search (/) float in the middle of the screen
      command_palette = true,       -- Centers the command line (:) like a macOS Spotlight search
      long_message_to_split = true, -- Sends massive error logs to a split window so they don't cover your screen
      lsp_doc_border = true,        -- Adds a clean border to your hover documentation
    },
    -- We disable Noice's notification router because your Snacks.nvim is already handling that perfectly
    notify = {
      enabled = false,
    },
  },
}