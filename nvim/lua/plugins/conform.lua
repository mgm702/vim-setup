return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				ruby = { "rubocop" },
			},
			formatters = {
				prettier = {
					prepend_args = {
						"--single-quote",
						"--no-semi",
						"--trailing-comma=es5",
					},
				},
				rubocop = {
					args = { "--server", "--auto-correct-all", "--stderr", "--force-exclusion", "--stdin", "$FILENAME" },
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			},
		})
	end,
}
