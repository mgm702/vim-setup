return function()
  -- Basic setup
  require('leap').setup({
    case_sensitive = false,
    -- Use custom keys for the labeling of targets
    labels = { 'a', 's', 'd', 'f', 'j', 'k', 'l', ';' },
    -- Other options
    special_keys = {
      next_target = '<enter>',
      prev_target = '<tab>',
      next_group = '<space>',
      prev_group = '<tab>',
      multi_accept = '<enter>',
      multi_revert = '<backspace>',
    },
  })
  
  -- Don't add default mappings (s, S, gs)
  
  -- Create custom keymaps with f instead
  vim.keymap.set({'n', 'x', 'o'}, 'f', '<Plug>(leap-forward)', { silent = true })
  vim.keymap.set({'n', 'x', 'o'}, 'F', '<Plug>(leap-backward)', { silent = true })
  vim.keymap.set({'n', 'x', 'o'}, 'ff', '<Plug>(leap-cross-window)', { silent = true })
end
