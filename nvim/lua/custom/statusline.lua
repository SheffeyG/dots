STL = {}

STL.get_mode = function()
    local C_S = vim.api.nvim_replace_termcodes("<C-S>", true, true, true)
    local C_V = vim.api.nvim_replace_termcodes("<C-V>", true, true, true)
    -- stylua: ignore
    local modes_info = {
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
    local modes = setmetatable(modes_info, {
        __index = function() return { name = "UNKNOWN", hl = "%#ModeNormal#" } end,
    })

    return modes[vim.fn.mode()]
end

-- click to switch tab
STL.switch_tab = function(tabnr) vim.cmd(tabnr .. "tabnext") end

STL.build = function()
    local current_mode = STL.get_mode()
    local mode = string.format("%s  %s ", current_mode.hl, current_mode.name)
    local perc = string.format("%s %%P ", current_mode.hl)

    local folder = function()
        local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
        local branch = ""
        if handle then
            branch = handle:read("*a"):gsub("^%s*(.-)%s*$", "%1")
            handle:close()
        end
        if branch == "" then return string.format("  %s ", cwd) end
        return string.format("  %s:%s ", cwd, branch)
    end

    local file = function()
        local file = vim.g.is_wide and vim.fn.expand("%:.") or vim.fn.expand("%:t")
        if vim.bo.buftype ~= "" or file == "" then return "" end
        local icon = "󰈙"
        local highlight = "BarBlack"

        local ok, devicons = pcall(require, "nvim-web-devicons")
        if ok then
            local devicon, hl = devicons.get_icon(file, vim.fn.expand("%:e"), { default = true })
            icon = devicon or "󰈙"
            highlight = hl or "BarBlack"
        end

        return string.format(" %%#%s#%s%%#BarBlack# %s", highlight, icon, file)
    end

    local diff = function()
        if not vim.g.is_wide then return "" end
        local res = {}
        -- Get info from gitsigns or mini.diff
        if vim.b.gitsigns_status_dict then
            local s = vim.b.gitsign_status_dict
            if s.added and s.added > 0 then table.insert(res, string.format("%%#Added# %s", s.added)) end
            if s.removed and s.removed > 0 then table.insert(res, string.format("%%#Removed# %s", s.removed)) end
            if s.changed and s.changed > 0 then table.insert(res, string.format("%%#Changed# %s", s.changed)) end
        elseif vim.b.minidiff_summary then
            local s = vim.b.minidiff_summary
            if s.add and s.add > 0 then table.insert(res, string.format("%%#Added# %s", s.add)) end
            if s.delete and s.delete > 0 then table.insert(res, string.format("%%#Removed# %s", s.delete)) end
            if s.change and s.change > 0 then table.insert(res, string.format("%%#Changed# %s", s.change)) end
        else
            return ""
        end
        return #res > 0 and " " .. table.concat(res, " ") or ""
    end

    local diagnostic = function()
        if not vim.g.is_wide then return "" end
        local counts = vim.diagnostic.count(0)
        local levels = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }

        for level, _ in pairs(levels) do
            levels[level] = counts[vim.diagnostic.severity[level]] or 0
        end

        local res = {}
        if levels.ERROR > 0 then table.insert(res, "%#DiagnosticError# " .. levels.ERROR) end
        if levels.WARN > 0 then table.insert(res, "%#DiagnosticWarn# " .. levels.WARN) end
        if levels.INFO > 0 then table.insert(res, "%#DiagnosticInfo# " .. levels.INFO) end
        if levels.HINT > 0 then table.insert(res, "%#DiagnosticHint# " .. levels.HINT) end

        return #res > 0 and table.concat(res, " ") .. " " or ""
    end

    local recording = function()
        local reg = vim.fn.reg_recording()
        if reg == "" then return "" end
        return string.format("%%#TextRed# %s ", reg)
    end

    local selection = function()
        local mode_name = current_mode.name
        local lines = math.abs(vim.fn.line("v") - vim.fn.line(".")) + 1
        local chars = math.abs(vim.fn.col("v") - vim.fn.col(".")) + 1
        if mode_name == "V-BLOCK" then
            return string.format("%%#TextPurple#󰒉 %dx%d ", lines, chars)
        elseif lines > 1 then
            return string.format("%%#TextPurple# %d ", lines)
        elseif mode_name == "VISUAL" then
            return string.format("%%#TextPurple#󰒉 %d ", chars)
        else
            return ""
        end
    end

    local lsp = function()
        local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
        if next(clients) == nil then return "" end
        local client_names = {}
        for _, client in ipairs(clients) do
            if client and client.name ~= "" then table.insert(client_names, client.name) end
        end
        return string.format("%%#TextGreen# %s ", table.concat(client_names, "|"))
    end

    local tab = function()
        local current_tab = vim.fn.tabpagenr()
        local total_tabs = vim.fn.tabpagenr("$")
        if not current_tab or total_tabs <= 1 then return "" end
        local tab_str = ""
        for i = 1, total_tabs do
            if i == current_tab then
                tab_str = tab_str .. string.format("%%#BarTab# %d ", i)
            else
                tab_str = tab_str .. string.format("%%#BarTabDim#%%%d@v:lua.STL.switch_tab@ %d %%T", i, i)
            end
        end
        return tab_str
    end

    local code = function()
        local enc = (vim.bo.fileencoding == "") and vim.go.encoding or vim.bo.fileencoding
        local width = "TAB:" .. vim.bo.tabstop
        if vim.bo.expandtab then width = "SPC:" .. vim.bo.shiftwidth end
        return string.format(" %s | %s ", enc:upper(), width)
    end

    return table.concat({
        mode,

        "%#BarGrey#",
        folder(),

        "%#BarBlack#",
        file(),
        diff(),

        "%=",

        recording(),
        selection(),
        diagnostic(),
        lsp(),
        tab(),

        "%#BarGrey#",
        code(),

        perc,
    })
end

STL.setup = function() vim.go.statusline = "%!v:lua.STL.build()" end

return STL
