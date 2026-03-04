return {
  "echasnovski/mini.indentscope",
  version = false, 
  opts = {
    symbol = "▎", -- Matches the IBL character for perfect overlap
    draw = {
      delay = 100,
      priority = 2,
    },
  },
  config = function(_, opts)
    require("mini.indentscope").setup(opts)
    
    -- Link the animated symbol to your theme's active accent color
    vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { link = "IndentScopeGlow" })
  end,
}