require('nvim-treesitter.configs').setup({
  ensure_installed = { "lua", "vim", "yaml", "go", "ruby", "js", "py" }, -- Add languages as needed
  highlight = { enable = true },
  indent = { enable = true },
})
