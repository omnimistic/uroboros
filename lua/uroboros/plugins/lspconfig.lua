return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp", 
  },
  config = function()
    -- The list of servers for the languages you requested
    local servers = { 
      "lua_ls", 
      "pyright", -- Python
      "clangd",  -- C and C++
      "html",    -- HTML
      "cssls",   -- CSS
      "ts_ls"    -- JavaScript/TypeScript
    }

    -- 1. Tell Mason to auto-install these servers
    require("mason-lspconfig").setup({
      ensure_installed = servers,
    })
    
    -- 2. Grab the capabilities from Blink.cmp for autocomplete
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    
    -- 3. Loop through the list and set them all up using the Neovim 0.11+ API
    for _, server in ipairs(servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
      })
      vim.lsp.enable(server)
    end
  end,
}