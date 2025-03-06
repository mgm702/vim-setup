-- nvim/lua/plugins/ui.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = { ["<C-u>"] = false },
          },
        },
      })
    end,
  },
}
