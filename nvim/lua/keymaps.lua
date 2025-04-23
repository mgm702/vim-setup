-- nvim/lua/keymaps.lua

-- ================ Key Mappings ==================

-- Map kj to Escape in insert mode
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true })

-- Remap Y to yank the entire line (beginning to end), equivalent to yy
vim.keymap.set("n", "Y", "yy", { desc = "Yank entire line" })

-- Clear search highlighting with <leader><space>
vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Use tab to jump between matching brackets
vim.keymap.set('n', '<tab>', '%', { noremap = true })
vim.keymap.set('v', '<tab>', '%', { noremap = true })

-- Strip all trailing whitespace with <leader>W
vim.keymap.set('n', '<leader>W', ':%s/\\s\\+$//<CR>:let @/=""<CR>', { noremap = true, silent = true })

-- Avante.vim - key mappings
vim.keymap.set("n", "<leader>aa", "<cmd>Avante<cr>", { desc = "Open Avante" })
vim.keymap.set("v", "<leader>aa", "<cmd>Avante<cr>", { desc = "Open Avante with selection" })
vim.keymap.set("n", "<leader>ac", "<cmd>AvanteSwitchProvider claude<cr>", { desc = "Switch to Claude" })
vim.keymap.set("n", "<leader>ao", "<cmd>AvanteSwitchProvider openai<cr>", { desc = "Switch to OpenAI" })
-- vim.keymap.set("n", "<leader>ag", "<cmd>AvanteSwitchProvider grok<cr>", { desc = "Switch to Grok" })

-- BarBar.nvim - buffer/tab related key mappings

-- When in a split, close the window entirely, not just the buffer
vim.api.nvim_create_user_command('CloseBuffer', function()
  -- Check if we're in the last window
  if vim.fn.winnr('$') == 1 then
    vim.cmd('BufferClose')
  else
    -- Close the window entirely
    vim.cmd('close')
  end
end, {})

-- Make :q close the current buffer/window instead of quitting
vim.cmd('cnoreabbrev q CloseBuffer')

-- :Tc {number} to close specific buffer number
vim.api.nvim_create_user_command('Tc', function(opts)
  vim.cmd('BufferClose ' .. opts.args)
end, { nargs = 1 })

-- :Tex to open a new empty buffer
vim.api.nvim_create_user_command('Tex', function()
  vim.cmd('enew')
end, { nargs = 0 })

-- ex in normal mode to perform :Exp
vim.keymap.set('n', 'ex', ':e.<CR>', { noremap = true, silent = true })

-- tex in normal mode to perform :Tex
vim.keymap.set('n', 'tex', ':Tex<CR>', { noremap = true, silent = true })

-- Remap gt and gT for barbar
vim.keymap.set('n', 'gt', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gT', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })

-- Improved split handling for barbar
-- Create a new split with an empty buffer
vim.keymap.set('n', 'vs', '<cmd>vsplit | enew<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'sp', '<cmd>split | enew<cr>', { noremap = true, silent = true })

-- For moving between splits
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
