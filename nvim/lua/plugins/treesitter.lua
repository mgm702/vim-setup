-- nvim/lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", 
          "vim", 
          "yaml", 
          "go", 
          "ruby", 
          "json", 
          "python",
          "c", 
          "html", 
          "php", 
          "sql", 
          "cpp", 
          "bash", 
          "dockerfile", 
          "css",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
