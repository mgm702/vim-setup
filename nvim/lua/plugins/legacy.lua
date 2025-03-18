-- nvim/lua/plugins/legacy.lua
return {
  { "mattn/emmet-vim" },    -- Emmet for HTML/CSS
  { "mattn/webapi-vim" },   -- Dependency for gist-vim
  { "mattn/gist-vim" },     -- Gist posting
  {
    "tpope/vim-bundler",
    lazy = false, -- Load immediately
    ft = "ruby"   -- Load when Ruby files are opened
  },
  {
    "tpope/vim-rails",
    lazy = false, -- Load immediately
    ft = "ruby"   -- Load when Ruby files are opened
  },
  {
    "mhinz/vim-grepper",
    lazy = false, -- Load immediately
    config = function()
      -- Basic configuration
      vim.g.grepper = {
        tools = { "rg", "git", "grep" },
        searchreg = 1
      }

      -- Create the mapping for gr to activate Grepper
      vim.keymap.set("n", "gr", "<cmd>Grepper<cr>", { silent = true, desc = "Search with Grepper" })

      -- Optional: Operator mapping to search for the text under the cursor
      vim.keymap.set("n", "gs", "<plug>(GrepperOperator)", { desc = "Grepper Operator" })
      vim.keymap.set("x", "gs", "<plug>(GrepperOperator)", { desc = "Grepper Operator" })
    end
  }
}
