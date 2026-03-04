return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs")

    -- 1. Setup the plugin
    autopairs.setup({
      check_ts = true, -- Uses treesitter to avoid adding pairs inside comments/strings
    })

    -- 2. Wire it up to nvim-cmp!
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    
    -- When you press Enter on a function in the cmp menu, it auto-adds the ()
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}