local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Tell lazy to load anything inside the "uroboros/plugins" folder
require("lazy").setup({
  spec = {
    { import = "uroboros.plugins" },
  },
  -- Configure the automatic update behavior
  checker = {
    enabled = true,   -- Automatically check for plugin updates
    notify = false,   -- Don't show a notification every time it checks
    frequency = 3600, -- Check once every hour (in seconds)
  },
  change_detection = {
    enabled = true,   -- Automatically reload the config when you save a file
    notify = false,   -- Stop that "Config Change Detected" message
  },
  install = {
    missing = true,    -- Install missing plugins on startup
  },
})