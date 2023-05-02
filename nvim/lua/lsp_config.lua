ocal lsp = require('lspconfig')
local completion = require('completion')

local custom_attach = function()
    completion.on_attach()
    -- Python specifically isn't setting omnifunc correctly, ftplugin conflict
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

lsp.pylsp.setup{on_attach=custom_attach}
