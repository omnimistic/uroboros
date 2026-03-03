local M = {}

-- 1. Define ALL your Uroboros Palettes
M.palettes = {
    -- The Alchemical Vibe
    classic = {
        bg = "#2A1B3D",          -- Deep midnight purple
        bg_alt = "#1E132D",      -- Darker purple for popups
        fg = "#EDE4D9",          -- Pale ash text
        accent = "#B8975E",      -- Aged gold / metallic bronze
        accent_alt = "#952F3F",  -- Dark blood crimson (Strings/Errors)
        comment = "#8B628C",     -- Muted plum for comments
        border = "#422B5E",      -- Lighter purple for window dividers
    },
    -- The Deep Space Vibe
    cosmic = {
        bg = "#0F0E17",          -- Deep space black
        bg_alt = "#171522",      -- Slightly lighter void for popups
        fg = "#F0F4FF",          -- Pale silver text
        accent = "#00F5D4",      -- Cyan starlight
        accent_alt = "#C71585",  -- Cosmic magenta
        comment = "#5A6B92",     -- Muted nebula blue for comments
        border = "#26233A",      -- Dark border lines
    },
    -- The Ancient Vibe
    earthy = {
        bg = "#1A3C34",          -- Ancient forest green
        bg_alt = "#122A24",      -- Deep shadows
        fg = "#F5E8C7",          -- Cream parchment text
        accent = "#6B9E78",      -- Moss / emerald
        accent_alt = "#CC7722",  -- Burnt orange / autumn gold
        comment = "#8BA888",     -- Faded leaf for comments
        border = "#4A2C1F",      -- Rich soil brown for borders
    },
    -- The Hacker Vibe
    monochrome = {
        bg = "#000000",
        bg_alt = "#1E1E1E",
        fg = "#E0E0E0",
        accent = "#39FF14",      -- Neon Venom Green
        accent_alt = "#FF0033",
        comment = "#555555",
        border = "#333333",
    }
}

-- 2. The Engine that applies the colors
function M.setup(theme_name)
    -- Default to classic if nothing is typed
    theme_name = theme_name or "classic"
    local c = M.palettes[theme_name]

    -- Reset default highlights
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
    vim.o.termguicolors = true
    vim.g.colors_name = "uroboros_" .. theme_name

    -- Helper function to keep things clean
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

    -- PLUGINS
    -- Telescope (Fuzzy Finder)
    set_hl("TelescopeBorder", { fg = c.border, bg = c.bg })
    set_hl("TelescopePromptBorder", { fg = c.accent, bg = c.bg })
    set_hl("TelescopeMatching", { fg = c.accent, bold = true })
    set_hl("TelescopeSelection", { fg = c.accent, bg = c.bg_alt, bold = true })

    -- Neo-tree
    set_hl("NeoTreeDirectoryName", { fg = c.fg, bold = true })
    set_hl("NeoTreeDirectoryIcon", { fg = c.accent })
    set_hl("NeoTreeFileName", { fg = c.fg })
    set_hl("NeoTreeGitModified", { fg = c.accent })

    -- Mini Indentscope (The jumping line)
    set_hl("MiniIndentscopeSymbol", { fg = c.border })
    set_hl("MiniIndentscopeSymbolOff", { fg = c.accent })

    -- SYNTAX (Treesitter & Base)
    set_hl("Comment", { fg = c.comment, italic = true })
    set_hl("String", { fg = c.accent_alt })
    set_hl("Keyword", { fg = c.accent, bold = true })
    set_hl("Function", { fg = c.fg, bold = true })
    set_hl("Identifier", { fg = c.fg })
    set_hl("Operator", { fg = c.accent })
    set_hl("Type", { fg = c.accent_alt })
end

return M