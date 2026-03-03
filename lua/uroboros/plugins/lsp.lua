return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- We use pcall to prevent the 'module not found' from freezing Neovim
    local status, configs = pcall(require, "nvim-treesitter.configs")
    if not status then 
      return 
    end

    configs.setup({
      -- A list of parser names to install automatically
      ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "css", "python" },
      
      -- Enable syntax highlighting
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      
      -- Enable better indentation
      indent = {
        enable = true,
      },
    })
  end,
}