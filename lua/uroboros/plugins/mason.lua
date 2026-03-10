return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- 1. Setup Mason itself
    require("mason").setup()

    -- 2. Setup the auto-installer for formatters (and linters if you add them later)
    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",
        "isort",
        "black",
        "clang-format",
        "prettier",
      },
      -- Auto-install on startup
      run_on_start = true, 
    })
  end,
}