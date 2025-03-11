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
    api_key = os.getenv("CLAUDE_API_KEY"),
  },
  -- OpenAI configuration
  openai = {
    endpoint = "https://api.openai.com/v1",
    model = "gpt-4o",
    timeout = 30000,
    temperature = 0,
    max_tokens = 4096,
    api_key = os.getenv("CHATGPT_API_KEY"),
  },
  -- Grok configuration
  grok = {
    model = "grok-2-1212",
    temperature = 0,
    max_tokens = 4096,
    api_key = os.getenv("GROK_API_KEY"),
  },
  -- UI settings
  ui = {
    width = 0.8,
    height = 0.8,
    border = "rounded",
  },
  -- File selector settings
  file_selector = {
    provider = "telescope",
  },
  -- Customize keymaps
  keymaps = {
    toggle = "<leader>aa",
    submit = "<C-s>",
    close = "q",
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

-- Define Avante keymappings
vim.keymap.set("n", "<leader>aa", "<cmd>Avante<cr>", { desc = "Open Avante" })
vim.keymap.set("v", "<leader>aa", "<cmd>Avante<cr>", { desc = "Open Avante with selection" })
vim.keymap.set("n", "<leader>ac", "<cmd>AvanteSwitch claude<cr>", { desc = "Switch to Claude" })
vim.keymap.set("n", "<leader>ao", "<cmd>AvanteSwitch openai<cr>", { desc = "Switch to OpenAI" })
vim.keymap.set("n", "<leader>ag", "<cmd>AvanteSwitch grok<cr>", { desc = "Switch to Grok" })

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
