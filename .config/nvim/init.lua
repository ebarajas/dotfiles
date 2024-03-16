-- Set <SPACE> as leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

require("lazy").setup("plugins")

require("telescope")
require("lsp")

vim.opt.belloff = "all" -- no bells!!!!!

vim.opt.swapfile = false 

vim.opt.incsearch = true
vim.opt.ignorecase = true 	-- ignore case when searching
vim.opt.smartcase = true 	-- unless there is a capital letter in the search query
vim.opt.splitright = true 	-- always vsplit to the right 
vim.opt.splitbelow = true 	-- always hsplit to the bototm
vim.opt.showmatch = true
vim.opt.relativenumber = true
vim.opt.number = true

-- Use the OS clipboard instead of registers
vim.opt.clipboard = 'unnamedplus'

-- Tabs
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = true

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand
-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

autocmd("ModeChanged", {
  callback = function()
    local cmdtype = vim.fn.getcmdtype()
    if cmdtype == "/" or cmdtype == "?" then
      vim.opt.hlsearch = true
    else
      vim.opt.hlsearch = false
    end
  end,
  group = general,
  desc = "Highlighting matched words when searching",
})
