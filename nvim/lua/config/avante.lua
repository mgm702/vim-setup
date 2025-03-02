-- config/avante.lua
local avante = require('avante')

avante.setup({
  -- Default provider (can be switched at runtime)
  provider = "claude",

  -- Claude configuration
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-7-sonnet-20250219",
    timeout = 30000,
    temperature = 0,
    max_tokens = 4096,
  },

  -- OpenAI configuration
  openai = {
    endpoint = "https://api.openai.com/v1",
    model = "gpt-4o",
    timeout = 30000,
    temperature = 0,
    max_tokens = 4096,
  },

  -- Grok configuration
  grok = {
    model = "grok-2-1212",
    temperature = 0,
    max_tokens = 4096,
  },

  -- UI settings
  ui = {
    width = 0.8, -- 80% of screen width
    height = 0.8, -- 80% of screen height
    border = "rounded",
  },

  -- File selector settings
  file_selector = {
    provider = "telescope", -- Options: "telescope", "mini.pick", "fzf"
  },

  -- Customize keymaps
  keymaps = {
    -- Add your custom keymaps here
  },

  -- Clipboard settings
  clipboard = {
    -- Configure clipboard behavior
    register = "+",
  },

  -- Context settings
  context = {
    -- How much context to include
    include_buffer_content = true,
    include_current_line = true,
  },
})

-- Optional: Add custom avante commands
vim.api.nvim_create_user_command("AvanteSwitch", function(opts)
  if opts.args == "claude" or opts.args == "openai" or opts.args == "grok" then
    avante.set_provider(opts.args)
    vim.notify("Switched to " .. opts.args .. " provider")
  else
    vim.notify("Invalid provider. Use 'claude', 'openai', or 'grok'", vim.log.levels.ERROR)
  end
end, {
  nargs = 1,
  complete = function()
    return { "claude", "openai", "grok" }
  end,
})
