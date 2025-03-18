-- nvim/lua/plugins/linter.lua
return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("config.linter")() -- Load the configuration from config/linter.lua
    end,
  },
}
