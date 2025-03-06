-- nvim/lua/plugins/utils.lua
return {
  { "lewis6991/gitsigns.nvim", config = function() require("config.gitsigns") end }, -- Git signs
  { "numToStr/Comment.nvim", config = function() require("Comment").setup() end }, -- Commenting
  { "ggandor/leap.nvim", config = function() require("leap").add_default_mappings() end }, -- Navigation
  { "gbprod/yanky.nvim", config = function() require("yanky").setup() end }, -- Yank ring
}
