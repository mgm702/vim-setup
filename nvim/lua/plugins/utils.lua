-- nvim/lua/plugins/utils.lua
return {
  { "lewis6991/gitsigns.nvim", config = function() require("config.gitsigns") end }, -- Git signs
  { "numToStr/Comment.nvim", config = function() require("Comment").setup() end }, -- Commenting
  { "gbprod/yanky.nvim", config = function() require("yanky").setup() end }, -- Yank ring

  -- Navigation with Leap
  { 
    "ggandor/leap.nvim", 
    config = function() require("config.leap")() end 
  },
  
  -- File explorer as a buffer
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("config.oil")() end
  },
}
