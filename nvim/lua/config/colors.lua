local M = {}

-- function M.blend_bg(hex, amount) --
--     return require("snacks.util").blend(hex, colors.bg, amount)
-- end
--
-- function M.darken(hex, amount, bg) --
--     return require("snacks.util").blend(hex, bg or colors.bg, amount)
-- end
--
-- function M.lighten(hex, amount, fg) --
--     return require("snacks.util").blend(hex, fg or colors.fg, amount)
-- end

-- apply a list of highlights
---@param highlights table<string, vim.api.keyset.highlight>
M.apply = function(highlights)
    ---@param name string
    ---@param opts vim.api.keyset.highlight
    vim.iter(highlights):each(function(name, opts)
        vim.api.nvim_set_hl(0, name, opts) -- globally
    end)
end

return M
