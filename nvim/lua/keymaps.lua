-- ================ Key Mappings ==================

-- Existing mappings (example)
vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>vs', ':vsplit<CR>', { noremap = true, silent = true, desc = "Vertical split" })
vim.keymap.set('n', '<leader>sp', ':split<CR>', { noremap = true, silent = true, desc = "Horizontal split" })

-- Map kj to Escape in insert mode
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true })

-- Clear search highlighting with <leader><space>
vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Use tab to jump between matching brackets
vim.keymap.set('n', '<tab>', '%', { noremap = true })
vim.keymap.set('v', '<tab>', '%', { noremap = true })

-- Filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,

})

-- Telescope - key mappings
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { noremap = true, silent = true })

-- Avante.vim - key mappings
vim.keymap.set("n", "<leader>aa", "<cmd>Avante<cr>", { desc = "Open Avante" })
vim.keymap.set("v", "<leader>aa", "<cmd>Avante<cr>", { desc = "Open Avante with selection" })
vim.keymap.set("n", "<leader>ac", "<cmd>AvanteSwitch claude<cr>", { desc = "Switch to Claude" })
vim.keymap.set("n", "<leader>ao", "<cmd>AvanteSwitch openai<cr>", { desc = "Switch to OpenAI" })
vim.keymap.set("n", "<leader>ag", "<cmd>AvanteSwitch grok<cr>", { desc = "Switch to Grok" })

-- Tab Related - key mappings

-- Make :q close the current tab instead of quitting
vim.cmd('cnoreabbrev q bd')

-- :Tc {number} to close specific tab number
vim.api.nvim_create_user_command('Tc', function(opts)
  vim.cmd('tabclose ' .. opts.args)
end, { nargs = 1 })

-- :Tex to open a new tab
vim.api.nvim_create_user_command('Tex', function()
  vim.cmd('tabnew')
end, { nargs = 0 })

-- ex in normal mode to perform :Exp
vim.keymap.set('n', 'ex', ':Exp<CR>', { noremap = true, silent = true })

-- tex in normal mode to perform :Tex
vim.keymap.set('n', 'tex', ':Tex<CR>', { noremap = true, silent = true })
