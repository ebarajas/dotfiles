require('nvim-treesitter.configs').setup({
    -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#modules

    modules = {},
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "ruby" },

    sync_install = false,
    auto_install = true,

    ignore_install = { "javascript" },

    highlight = {
        enable = true,
    }
})
