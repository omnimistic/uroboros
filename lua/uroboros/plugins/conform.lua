return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  keys = {
    {
      "<leader>cf",
      function() require("conform").format({ async = true, lsp_fallback = true }) end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      -- Language-to-formatter mappings.
      -- If a file type has multiple formatters listed (e.g., python: isort, black),
      -- they run sequentially in order (isort organizes imports, then black formats code).
      lua = { "stylua" },
      python = { "isort", "black" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      javascript = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
    },
  },
}