-- nvim/lua/config/linter.lua
return function()
	local lint = require("lint")

	-- Configure linters for specific filetypes
	lint.linters_by_ft = {
		ruby = { "rubocop" }, -- Use RuboCop for Ruby files
		go = { "golangcilint" }, -- Use Golangci-lint for Go files
		python = { "pylint" }, -- Use Pylint for Python files
		javascript = { "eslint_d" }, -- Use ESLint for JavaScript files
		javascriptreact = { "eslint_d" }, -- Use ESLint for JSX files
		typescript = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		["javascript.playwright"] = { "eslint_d" },
	}

	vim.diagnostic.config({
		severity_sort = true,
		severity = {
			min = vim.diagnostic.severity.WARN, -- This hides hints and info
		},
	})

  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()
      lint.try_lint()
    end,
  })
end
