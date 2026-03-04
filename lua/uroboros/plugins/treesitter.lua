return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local status, configs = pcall(require, "nvim-treesitter.configs")
    if not status then return end

    require('nvim-treesitter.install').compilers = { "zig", "g++", "gcc", "clang", "cl" }

    configs.setup({
      ensure_installed = { 
        "lua", 
        "vim", 
        "vimdoc", 
        "python", 
        "markdown", 
        "c", 
        "cpp", 
        "html", 
        "css",
        "javascript"
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