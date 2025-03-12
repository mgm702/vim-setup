-- nvim/lua/plugins/completion.lua
return {
  {
    "ms-jpq/coq_nvim",
    branch = "coq",
    -- Change from InsertEnter to VimEnter or startup
    event = "VeryLazy", -- Load earlier in the startup process
    init = function()
      -- Set settings in init to ensure they're applied before loading
      vim.g.coq_settings = {
        auto_start = "shut-up", -- Start automatically without prompts
        keymap = {
          recommended = true, -- Use COQ's default keymaps
        },
        clients = {
          snippets = {
            enabled = true,
          },
          tags = {
            enabled = true,
          },
          paths = {
            enabled = true,
          },
        },
      }
    end,
    config = function()
      -- Force start the completion engine
      vim.defer_fn(function()
        vim.cmd("COQnow --shut-up")
      end, 100) -- Small delay to ensure Neovim is ready
    end,
    dependencies = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" }, -- Prebuilt snippets
    },
  },
}
