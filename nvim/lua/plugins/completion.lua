-- nvim/lua/plugins/completion.lua
return {
  {
    "ms-jpq/coq_nvim",
    branch = "coq",
    event = "InsertEnter",
    config = function()
      vim.g.coq_settings = {
        auto_start = "shut-up", -- Start automatically without prompts
        keymap = {
          recommended = true, -- Use COQ’s default keymaps
        },
      }
    end,
    dependencies = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" }, -- Prebuilt snippets
    },
  },
}
