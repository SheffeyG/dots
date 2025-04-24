---@type snacks.picker.layout.Config
local win_input = {
    win = "input",
    height = 1,
    border = "solid",
    title = "{title} {live}",
    wo = {
        winhighlight = {
            Normal = "NormalLight",
            FloatBorder = "NormalLight",
            FloatTitle = "SnacksPickerInputTitle",
        },
    },
}

---@type snacks.picker.layout.Config
local win_preview = {
    win = "preview",
    title = "{preview}",
    border = "solid",
    wo = {
        winhighlight = {
            Normal = "NormalDark",
            FloatBorder = "NormalDark",
            FloatTitle = "SnacksPickerPreviewTitle",
        },
        signcolumn = "no",
        numberwidth = 4,
        wrap = false,
    },
}

---@type LazyPluginSpec
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        words = { enabled = true },
        input = { enabled = true },
        rename = { enabled = true },
        terminal = {
            env = {
                ZLE_RPROMPT_INDENT = 1, -- zsh prompt padding
                VIMRUNTIME = 1, -- to show a p10k prompt icon
            },
            win = {
                relative = "win",
                wo = { winbar = "" },
            },
        },
        statuscolumn = {
            left = { "mark", "git" },
            right = { "fold", "sign" },
        },
        scroll = {
            enabled = not vim.g.is_arm,
            filter = function(buf)
                return vim.g.snacks_scroll ~= false
                    and vim.b[buf].snacks_scroll ~= false
                    and vim.bo[buf].buftype ~= "terminal"
                    and vim.bo[buf].filetype ~= "blink-cmp-menu"
            end,
        },
        indent = {
            animate = { duration = 10 },
            filter = function(buf)
                local exclude = { "markdown", "gitcommit" }
                return vim.g.snacks_indent ~= false
                    and vim.b[buf].snacks_indent ~= false
                    and vim.bo[buf].buftype == ""
                    and not vim.tbl_contains(exclude, vim.bo[buf].filetype)
            end,
        },
        ---@type snacks.picker.Config
        picker = {
            prompt = "   ",
            layouts = {
                default = {
                    layout = {
                        box = "horizontal",
                        width = 0.8,
                        height = 0.8,
                        {
                            box = "vertical",
                            width = 0.4,
                            win_input,
                            { win = "list", border = "solid" },
                        },
                        win_preview,
                    },
                },
                vertical = {
                    layout = {
                        width = 0.5,
                        min_width = 80,
                        height = 0.8,
                        min_height = 25,
                        box = "vertical",
                        win_input,
                        { win = "list", height = 0.3 },
                        win_preview,
                    },
                },
                vscode = {
                    layout = {
                        row = 1,
                        width = 0.4,
                        min_width = 80,
                        height = 0.4,
                        box = "vertical",
                        win_input,
                        { win = "list", border = "solid" },
                    },
                },
            },
            ---@type snacks.picker.sources.Config
            sources = {
                files = { hidden = true, ignored = true },
                grep = { hidden = true, ignored = false },
                explorer = {
                    hidden = true,
                    ignored = false,
                    diagnostics = false,
                    replace_netrw = true,
                    layout = {
                        layout = {
                            width = 30,
                            position = "left",
                            box = "vertical",
                            { win = "list" },
                            { win = "input", height = 1 },
                        },
                    },
                },
            },
        },
    },
    keys = {
        {
            "<leader>e", -- set auto_close to true for narrow window
            function() Snacks.explorer.open({ auto_close = vim.api.nvim_win_get_width(0) <= 120 }) end,
            desc = "File Explorer Toggle",
        },
        { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
        -- { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
        { "<C-\\>", function() Snacks.terminal() end, desc = "Toggle Terminal", mode = { "n", "t" } },
        { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
        { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
        -- find
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find Buffers" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Find in Recent" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        -- git
        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
        { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
        { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
        { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
        -- grep
        { "<leader>ss", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Grep Selected", mode = { "n", "x" } },
        -- search
        { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
        { "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History" },
        { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
        { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
        { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
        { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
        { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
        { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
        { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
        { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
        { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
        { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
        { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
        { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
        { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
        { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
        -- LSP
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "gs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        { "gS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...) Snacks.debug.inspect(...) end
                _G.bt = function() Snacks.debug.backtrace() end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>uS")
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>ul")
                Snacks.toggle.line_number():map("<leader>uL")
                Snacks.toggle.diagnostics():map("<leader>ud")
                Snacks.toggle.inlay_hints():map("<leader>uh")
                Snacks.toggle.treesitter():map("<leader>uT")
                Snacks.toggle.indent():map("<leader>ug")
                Snacks.toggle.scroll():map("<leader>us")
                Snacks.toggle.dim():map("<leader>uD")
            end,
        })
    end,
}
