return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Gets suggestions from LSP
    "hrsh7th/cmp-buffer",   -- Gets suggestions from words in your current file
    "hrsh7th/cmp-path",     -- Gets suggestions from your file system paths
    "L3MON4D3/LuaSnip",     -- The snippet engine
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Ctrl+k to go UP the menu
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Ctrl+j to go DOWN the menu
        ["<C-Space>"] = cmp.mapping.complete(),     -- Force the menu to open
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to confirm selection
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, 
        { name = "luasnip" },  
        { name = "buffer" },   
        { name = "path" },     
      }),
    })
  end,
}