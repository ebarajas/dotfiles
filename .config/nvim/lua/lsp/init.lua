require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "sorbet", "tsserver", "pyright" }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
    capabilities = capabilities
})

lspconfig.sorbet.setup({
    capabilities = capabilities
})

lspconfig.tsserver.setup({
    capabilities = capabilities
})

lspconfig.pyright.setup({
    capabilities = capabilities
})
