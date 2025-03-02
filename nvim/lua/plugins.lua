local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Syntax highlighting
  { "nvim-treesitter/nvim-treesitter", config = function() require("config.treesitter") end },

  -- File explorer
  { "nvim-tree/nvim-tree.lua", config = function() require("config.nvim-tree") end },

  -- Status line
  { "nvim-lualine/lualine.nvim", config = function() require("config.lualine") end },

  -- Git integration
  { "lewis6991/gitsigns.nvim", config = function() require("config.gitsigns") end },

  -- Avante.nvim
  { "yetone/avante.nvim", config = function() require("config.avante") end },

  -- Commented Vimscript plugins (optional)
  -- { "tpope/vim-fugitive", -- Git integration; use if gitsigns.nvim isn't enough },
  -- { "tomasiser/vim-code-dark", -- Codedark theme, already loaded via vim.cmd },
})
