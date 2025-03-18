-- nvim/lua/settings.lua

-- ================ Basic Settings ==================
-- Show line numbers
vim.opt.number = true
-- Show relative line numbers
vim.opt.relativenumber = true
-- Number of spaces a tab counts for
vim.opt.tabstop = 2
-- Size of indent
vim.opt.shiftwidth = 2
-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Don't wrap lines
vim.opt.wrap = false
-- Enable mouse in all modes
vim.opt.mouse = 'a'
-- Change directory to the current file
vim.opt.autochdir = true
-- Command history
vim.opt.history = 700
-- Show current mode
vim.opt.showmode = true
-- Show what commands you're typing
vim.opt.showcmd = true
-- Always show status line
vim.opt.laststatus = 2
-- Allow modelines
vim.opt.modeline = true
-- Show cursor position
vim.opt.ruler = true
-- Show file title in terminal tab
vim.opt.title = true
-- Command line height
vim.opt.cmdheight = 2
-- Command-line completion
vim.opt.wildmenu = true
-- Allow backspace in insert mode
vim.opt.backspace = 'indent,eol,start'
-- Minimal lines to keep above/below cursor
vim.opt.scrolloff = 3
-- Minimal columns to keep left/right of cursor
vim.opt.sidescrolloff = 5
-- Scroll sideways a character at a time
vim.opt.sidescroll = 1
-- Set listchars for invisible characters
vim.opt.listchars = {
  tab = '▸ ',
  trail = '-',
  extends = '>',
  precedes = '<',
  nbsp = '+'
}

-- ================ Search Settings ==================
-- Highlight search results
vim.opt.hlsearch = true
-- Incremental search
vim.opt.incsearch = true
-- Case insensitive search
vim.opt.ignorecase = true
-- Case sensitive when uppercase present
vim.opt.smartcase = true
-- Show matching brackets
vim.opt.showmatch = true

-- ================ Clipboard Settings ==================
-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- ================ Error Settings ==================
-- No sounds on error
vim.opt.errorbells = false
-- No visual bell
vim.opt.visualbell = false

-- Match HTML Tags
vim.g.loaded_matchit = 1

-- ================ Autocommands ==================
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.rb",
--   command = ":%s/\\s\\+$//e",
-- })
-- 
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*",
--   command = "silent! lcd %:p:h",
-- })

vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  command = "wincmd =",
})
