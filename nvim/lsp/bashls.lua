---@brief
--- https://github.com/bash-lsp/bash-language-server
--- Install with `npm i -g bash-language-server`

---@type vim.lsp.Config
return {
    cmd = { "bash-language-server", "start" },
    filetypes = { "bash", "sh", "zsh" },
    root_markers = { ".git" },
}
