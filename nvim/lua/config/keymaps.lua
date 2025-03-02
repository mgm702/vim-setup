-- Existing mappings (example)
vim.keymap.set('n', '<C-t>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Telescope mappings
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { noremap = true, silent = true })

-- Filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,

})
