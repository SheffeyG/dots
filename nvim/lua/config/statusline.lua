STL = {}

--- Click Actions --------------------------------
STL.switch_tab = function(tabnr) vim.cmd(tabnr .. "tabnext") end

--- Statusline Components ------------------------
local C_S = vim.api.nvim_replace_termcodes("<C-S>", true, true, true)
local C_V = vim.api.nvim_replace_termcodes("<C-V>", true, true, true)

---@param current_mode string
---@return string
STL.mode_component = function(current_mode)
    -- stylua: ignore
    local modes = {
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

    local mode_info = modes[current_mode] or { name = "UNKNOWN", hl = "%#ModeNormal#" }
    return string.format("%s  %s ", mode_info.hl, mode_info.name)
end

---@return string
STL.folder_component = function()
    local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
    local branch = ""
    if handle then
        branch = handle:read("*a"):gsub("^%s*(.-)%s*$", "%1")
        handle:close()
    end
    if branch == "" then return string.format("  %s ", cwd) end
    return string.format("  %s:%s ", cwd, branch)
end

---@param truncate boolean
---@return string
STL.file_component = function(truncate)
    local file = truncate and vim.fn.expand("%:t") or vim.fn.expand("%:.")
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

---@param truncate boolean
---@return string
STL.diff_component = function(truncate)
    if truncate then return "" end

    local s = vim.b.minidiff_summary
    -- local s = vim.b.gitsigns_status_dict
    if not s then return "" end

    local keys = { "add", "delete", "change" } -- minidiff
    -- local keys = { "added", "removed", "changed" } -- gitsigns
    local hls = { "Added", "Removed", "Changed" }
    local icons = { "", "", "" }
    local res = {}

    for i = 1, 3 do
        local key = keys[i]
        if s[key] and s[key] > 0 then --
            table.insert(res, string.format("%%#%s#%s %s", hls[i], icons[i], s[key]))
        end
    end

    return #res > 0 and " " .. table.concat(res, " ") or ""
end

---@param truncate boolean
---@return string
STL.diagnostic_component = function(truncate)
    if truncate then return "" end
    local counts = vim.diagnostic.count(0)
    local res = {}
    local severities = {
        { name = "Error", icon = " " },
        { name = "Warn", icon = " " },
        { name = "Hint", icon = " " },
        { name = "Info", icon = " " },
    }

    for i, s in ipairs(severities) do
        local count = counts[i]
        if count and count > 0 then --
            table.insert(res, string.format("%%#Diagnostic%s#%s%d", s.name, s.icon, count))
        end
    end

    return #res > 0 and table.concat(res, " ") .. " " or ""
end

---@return string
STL.recording_compoenent = function()
    local reg = vim.fn.reg_recording()
    if reg == "" then return "" end
    return string.format("%%#TextRed# %s ", reg)
end

---@param mode string
---@return string
STL.selection_component = function(mode)
    local lines = math.abs(vim.fn.line("v") - vim.fn.line(".")) + 1
    local chars = math.abs(vim.fn.col("v") - vim.fn.col(".")) + 1
    if mode == C_V then
        return string.format("%%#TextPurple#󰒉 %dx%d ", lines, chars)
    elseif lines > 1 then
        return string.format("%%#TextPurple# %d ", lines)
    elseif mode == "v" then
        return string.format("%%#TextPurple#󰒉 %d ", chars)
    else
        return ""
    end
end

---@return string
STL.lsp_compoenent = function()
    local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
    if next(clients) == nil then return "" end
    local client_names = {}
    for _, client in ipairs(clients) do
        if client and client.name ~= "" then table.insert(client_names, client.name) end
    end
    return string.format("%%#TextGreen# %s ", table.concat(client_names, "|"))
end

---@return string
STL.tab_component = function()
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

---@param truncate boolean
---@return string
STL.code_component = function(truncate)
    local col = vim.fn.virtcol(".")
    local rule = string.format("%03d", col)
    local res = { rule }

    if not truncate then
        local enc = (vim.bo.fileencoding == "") and vim.go.encoding or vim.bo.fileencoding
        local width = "TAB:" .. vim.bo.tabstop
        if vim.bo.expandtab then width = "SPC:" .. vim.bo.shiftwidth end
        table.insert(res, enc:upper())
        table.insert(res, width)
    end

    return string.format(" %s ", table.concat(res, " | "))
end

---@return string
STL.render = function()
    local mode = vim.fn.mode()
    local truncate = not vim.g.is_wide

    return table.concat({
        STL.mode_component(mode),

        "%#BarGrey#",
        STL.folder_component(),

        "%#BarBlack#",
        STL.file_component(truncate),
        STL.diff_component(truncate),

        "%=",

        STL.recording_compoenent(),
        STL.selection_component(mode),
        STL.diagnostic_component(truncate),
        STL.lsp_compoenent(),
        STL.tab_component(),

        "%#BarGrey#",
        STL.code_component(truncate),
    })
end

vim.o.statusline = "%!v:lua.STL.render()"

return STL
