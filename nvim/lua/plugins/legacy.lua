return {
  { "mattn/emmet-vim" },
  { "mattn/webapi-vim" },
  { "mattn/gist-vim" },
  {
    "tpope/vim-bundler",
    lazy = false,
    ft = "ruby"
  },
  {
    "tpope/vim-rails",
    lazy = false,
    ft = "ruby"
  },
  {
    "mhinz/vim-grepper",
    lazy = false,
    config = function()
      vim.g.grepper = {
        tools = { "rg", "git", "grep" },
        searchreg = 1,
        quickfix = 1,
      }

      local function grep_current_dir()
        local oil = require("oil")
        local current_dir = oil.get_current_dir()
        if current_dir then
          vim.cmd("Grepper -dir " .. vim.fn.fnameescape(current_dir))
        else
          vim.cmd("Grepper")
        end
      end

      vim.keymap.set("n", "gr", grep_current_dir, { silent = true, desc = "Search with Grepper (current dir)" })

      vim.keymap.set("n", "gs", "<plug>(GrepperOperator)", { desc = "Grepper Operator (files)" })
      vim.keymap.set("x", "gs", "<plug>(GrepperOperator)", { desc = "Grepper Operator (files)" })
    end
  }
}
