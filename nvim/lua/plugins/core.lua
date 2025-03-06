-- nvim/lua/plugins/core.lua
return {
  { "tpope/vim-fugitive" }, -- Git integration
  { "mattn/emmet-vim" },    -- Emmet for HTML/CSS
  { "mattn/webapi-vim" },   -- Dependency for gist-vim
  { "mattn/gist-vim" },     -- Gist posting
  { "romgrk/barbar.nvim" }, -- Tabline/bufferline
  { "nvim-lualine/lualine.nvim", config = function() require("config.lualine") end }, --StatusLine
  { "akinsho/toggleterm.nvim", config = function() require("toggleterm").setup() end }, -- Terminal toggle
  { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- Better diff UI
  { "EdenEast/nightfox.nvim" }, -- Colorscheme option
  { "folke/tokyonight.nvim" },  -- Colorscheme option
  {
    "NTBBloodbath/doom-one.nvim",
    priority = 1000,
    config = function()
      vim.g.doom_one_dark_mode = false
      vim.g.doom_one_terminal_colors = true
      vim.g.doom_one_cursor_coloring = true
      vim.g.doom_one_italic_comments = true
      vim.g.doom_one_enable_treesitter = true
      vim.g.doom_one_transparent_background = false
      vim.g.doom_one_pumblend_enable = true
      vim.g.doom_one_pumblend_transparency = 20
      vim.g.doom_one_plugin_neorg = true
      vim.g.doom_one_plugin_nvim_tree = true
      vim.g.doom_one_plugin_telescope = true
      vim.g.doom_one_plugin_gitsigns = true
      vim.cmd("colorscheme doom-one")
    end,
  },
}
