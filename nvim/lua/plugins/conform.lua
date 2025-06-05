return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				-- javascript = { "prettier" },
				-- typescript = { "prettier" },
				-- javascriptreact = { "prettier" },
				-- typescriptreact = { "prettier" },
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
					args = { "--auto-correct-all", "--stderr", "--force-exclusion", "--stdin", "$FILENAME" },
				},
			},
			format_on_save = function(bufnr)
				local ft = vim.bo[bufnr].filetype
				if ft == "ruby" then
					return nil -- Don't format Ruby files on save
				else
					return {
						lsp_fallback = true,
						async = false,
						timeout_ms = 1000,
					}
				end
			end,
		})

		-- Manual RuboCop formatting keymap
		vim.keymap.set("n", "<leader>fr", function()
			conform.format({ formatters = { "rubocop" } })
		end, { desc = "Format Ruby file with RuboCop" })
	end,
}

