return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { 
        "lua", "vim", "vimdoc", "python", "markdown",
        "markdown_inline", "c", "cpp", "html", "css", "javascript"
      },
      -- sync_install=false allows background installation during normal editing.
      -- Set to true only if startup blocks are acceptable (faster initial setup).
      sync_install = false,
      -- auto_install enables treesitter to download parsers for new languages on first edit.
      -- Useful for exploratory editing but may add latency on first encounter.
      auto_install = true,
      highlight = {
        enable = true,
        -- Disable vim regex fallback for improved performance.
        -- Risk: some edge-case languages may have incomplete treesitter parsers
        -- and will lose syntax highlighting without regex fallback.
        additional_vim_regex_highlighting = false, 
      },
      indent = { enable = true },
    })
  end,
}