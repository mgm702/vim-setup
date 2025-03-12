-- lua/config/avante.lua
local avante = require('avante')

-- Configure Avante with API keys
avante.setup({
  ui = {
    width = 0.8,
    height = 0.8,
    border = "rounded",
  },
  -- Clipboard settings
  clipboard = {
    register = "+",
  },
  -- Context settings
  context = {
    include_buffer_content = true,
    include_current_line = true,
  },
  -- Disable built-in keymaps to avoid conflicts
  keymaps = false,
})
