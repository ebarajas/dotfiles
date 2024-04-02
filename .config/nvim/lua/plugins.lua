local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "folke/neodev.nvim",
    "folke/which-key.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        config = function()
            require('plugins/telescope')
        end,
        dependencies = { {'nvim-lua/plenary.nvim' }}
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require('plugins/treesitter')
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects"
        },
        build = ":TSUpdate"
    }
})

