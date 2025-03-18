-- nvim/lua/config/linter.lua
return function()
  local lint = require("lint")

  -- Map .jsx files to the javascriptreact filetype
  -- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  --   pattern = "*.jsx",
  --   callback = function()
  --     vim.bo.filetype = "javascriptreact" -- Set filetype to javascriptreact for JSX
  --   end,
  -- })

  -- Configure linters for specific filetypes
  lint.linters_by_ft = {
    ruby = { "rubocop" },      -- Use RuboCop for Ruby files
    go = { "golangcilint" },   -- Use Golangci-lint for Go files
    python = { "pylint" },     -- Use Pylint for Python files
    javascript = { "eslint_d" }, -- Use ESLint for JavaScript files
    javascriptreact = { "eslint_d" }, -- Use ESLint for JSX files
    typescript = { "eslint_d" },
    typescriptreact = { "eslint_d" },
  }

  -- Set up autocommand to run linters on specific events
  -- vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
  --   callback = function()
  --     require("lint").try_lint() -- Run the linter for the current filetype
  --   end,
  -- })
end
