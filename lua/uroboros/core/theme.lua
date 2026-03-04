local M = {}

-- 1. Define ALL your Uroboros Palettes
M.palettes = {
    classic = {
        bg = "#2A1B3D",
        bg_alt = "#1E132D",
        fg = "#EDE4D9",
        accent = "#B8975E",
        accent_alt = "#952F3F",
        comment = "#8B628C",
        border = "#422B5E",
        muted = "#422B5E",
    },
    cosmic = {
        bg = "#0F0E17",
        bg_alt = "#171522",
        fg = "#F0F4FF",
        accent = "#00F5D4",
        accent_alt = "#C71585",
        comment = "#5A6B92",
        border = "#26233A",
        muted = "#1E2030",
    },
    earthy = {
        bg = "#1A3C34",
        bg_alt = "#122A24",
        fg = "#F5E8C7",
        accent = "#6B9E78",
        accent_alt = "#CC7722",
        comment = "#8BA888",
        border = "#4A2C1F",
        muted = "#2A3C34",
    },
    monochrome = {
        bg = "#000000",
        bg_alt = "#1E1E1E",
        fg = "#E0E0E0",
        accent = "#39FF14",
        accent_alt = "#FF0033",
        comment = "#555555",
        border = "#333333",
        muted = "#222222",
    }
}

function M.setup(theme_name)
    theme_name = theme_name or "classic"
    local c = M.palettes[theme_name]

    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
    vim.o.termguicolors = true
    vim.g.colors_name = "uroboros_" .. theme_name

    local set_hl = function(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- EDITOR UI
    set_hl("Normal", { fg = c.fg, bg = c.bg })
    set_hl("NormalFloat", { fg = c.fg, bg = c.bg_alt })
    set_hl("FloatBorder", { fg = c.border, bg = c.bg_alt })
    set_hl("CursorLine", { bg = c.bg_alt })
    set_hl("CursorLineNr", { fg = c.accent, bold = true })
    set_hl("LineNr", { fg = c.comment })
    set_hl("WinSeparator", { fg = c.border })
    set_hl("VertSplit", { fg = c.border })

    -- INDENT LINE HIGHLIGHTS
    set_hl("IndentLineMuted", { fg = c.muted }) 
    set_hl("IndentScopeGlow", { fg = c.accent, bold = true }) 

    -- PLUGINS
    set_hl("TelescopeBorder", { fg = c.border, bg = c.bg })
    set_hl("TelescopePromptBorder", { fg = c.accent, bg = c.bg })
    set_hl("TelescopeMatching", { fg = c.accent, bold = true })
    set_hl("TelescopeSelection", { fg = c.accent, bg = c.bg_alt, bold = true })

    set_hl("NeoTreeDirectoryName", { fg = c.fg, bold = true })
    set_hl("NeoTreeDirectoryIcon", { fg = c.accent })
    set_hl("NeoTreeFileName", { fg = c.fg })
    set_hl("NeoTreeGitModified", { fg = c.accent })

    -- SYNTAX
    set_hl("Comment", { fg = c.comment, italic = true })
    set_hl("String", { fg = c.accent_alt })
    set_hl("Keyword", { fg = c.accent, bold = true })
    set_hl("Function", { fg = c.fg, bold = true })
    set_hl("Identifier", { fg = c.fg })
    set_hl("Operator", { fg = c.accent })
    set_hl("Type", { fg = c.accent_alt })
end

-- Create the command
vim.api.nvim_create_user_command("Uroboros", function(opts)
    local theme = opts.args
    if M.palettes[theme] then
        M.setup(theme)
        print("Uroboros theme set to: " .. theme)
    else
        print("Theme '" .. theme .. "' not found.")
    end
end, {
    nargs = 1,
    complete = function()
        return vim.tbl_keys(M.palettes) 
    end,
})


return M