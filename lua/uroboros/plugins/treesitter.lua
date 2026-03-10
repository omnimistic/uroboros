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
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false, 
      },
      indent = { enable = true },
    })
  end,
}