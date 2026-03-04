return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "pyright" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- 1. Grab the capabilities from nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      -- 2. Define your servers in a list
      local servers = { "lua_ls", "clangd", "pyright" }
      
      -- 3. Use the NEW Neovim 0.11+ native API to configure and enable them
      for _, server in ipairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities })
        vim.lsp.enable(server)
      end
      
      -- Your keymaps
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation" })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
    end,
  }
}