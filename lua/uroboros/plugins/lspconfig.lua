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
    -- Mason handles downloading and managing LSP server binaries across platforms.
    require("mason-lspconfig").setup({
      ensure_installed = servers,
    })
    
    -- 2. Grab the capabilities from Blink.cmp for autocomplete
    -- LSP servers send capabilities to the client; blink.cmp extends them with completion support.
    -- Passing capabilities to servers enables snippet hints, resolve behavior, and other LSP features.
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    
    -- 3. Loop through the list and set them all up using the Neovim 0.11+ API
    -- vim.lsp.config() registers server config without starting it.
    -- vim.lsp.enable() starts the server immediately (replaces old require('lspconfig').server.setup()).
    -- This pattern allows dynamic server management and cleaner configuration.
    for _, server in ipairs(servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
      })
      vim.lsp.enable(server)
    end
  end,
}