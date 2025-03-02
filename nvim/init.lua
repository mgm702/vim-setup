-- Load plugins
require('plugins')

-- Basic settings
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.mouse = 'a'
vim.opt.autochdir = true

-- Load color scheme from your .vimrc
-- vim.cmd('colorscheme default')

-- Load keymaps
require('config.keymaps')
