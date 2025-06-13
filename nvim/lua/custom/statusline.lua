-- https://github.com/neovim/neovim/discussions/34420

STL = {}

STL.getMode = function()
    local C_S = vim.api.nvim_replace_termcodes("<C-S>", true, true, true)
    local C_V = vim.api.nvim_replace_termcodes("<C-V>", true, true, true)
    -- stylua: ignore
    local modesTable = {
        ["n"] = { name = "NORMAL",   hl = "%#ModeNormal#" },
        ["v"] = { name = "VISUAL",   hl = "%#ModeVisual#" },
        ["V"] = { name = "V-LINE",   hl = "%#ModeVisual#" },
        [C_V] = { name = "V-BLOCK",  hl = "%#ModeVisual#" },
        ["s"] = { name = "SELECT",   hl = "%#ModeVisual#" },
        ["S"] = { name = "S-LINE",   hl = "%#ModeVisual#" },
        [C_S] = { name = "S-BLOCK",  hl = "%#ModeVisual#" },
        ["i"] = { name = "INSERT",   hl = "%#ModeInsert#" },
        ["R"] = { name = "REPLACE",  hl = "%#ModeReplace#" },
        ["c"] = { name = "COMMAND",  hl = "%#ModeCommand#" },
        ["r"] = { name = "PROMPT",   hl = "%#ModeTerminal#" },
        ["!"] = { name = "SHELL",    hl = "%#ModeTerminal#" },
        ["t"] = { name = "TERMINAL", hl = "%#ModeTerminal#" },
    }

    -- set a default option via metatable
    local modes = setmetatable(modesTable, {
        __index = function() return { name = "UNKNOWN", hl = "%#ModeNormal#" } end,
    })

    return modes[vim.fn.mode()]
end

STL.build = function()
    local modeInfo = STL.getMode()

    local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

    local file = (vim.bo.buftype == "") and "  %f %m%r " or ""

    -- local eol = vim.bo.fileformat
    local enc = (vim.bo.fileencoding == "") and vim.go.encoding or vim.bo.fileencoding

    local width = "TAB:" .. vim.bo.tabstop
    if vim.bo.expandtab then width = "SPC:" .. vim.bo.shiftwidth end

    -- local location = " %l/%L:%2v/%-2{virtcol('$') - 1} "

    return table.concat({
        modeInfo.hl,
        "  ",
        modeInfo.name,
        " ",

        "%#BarGrey#",
        "  ",
        cwd,
        " %<", --> truncation point

        "%#BarBlack#",
        file,

        "%=", --> spacer

        "%#BarGrey#",
        " ",
        enc:upper(),
        " | ",
        width,
        " ",

        modeInfo.hl,
        " %P ",
    })
end

STL.setup = function() vim.go.statusline = "%!v:lua.STL.build()" end

return STL
