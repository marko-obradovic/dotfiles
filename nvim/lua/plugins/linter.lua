return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Configure linters per filetype
		lint.linters_by_ft = {
			lua = { "luacheck" },
			python = { "flake8" },
			javascript = { "eslint_d" },
		}

		-- Auto-lint on save or buffer read
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
			callback = function()
				lint.try_lint()
			end,
		})

		-- Configure diagnostic display
		vim.diagnostic.config({
			virtual_text = {
				prefix = "●",
				spacing = 4,
				source = "if_many",
			},
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "❌",
					[vim.diagnostic.severity.WARN] = "!",
					[vim.diagnostic.severity.INFO] = "i",
					[vim.diagnostic.severity.HINT] = "i",
				},
				texthl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticError",
					[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
					[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
					[vim.diagnostic.severity.HINT] = "DiagnosticHint",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticError",
					[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
					[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
					[vim.diagnostic.severity.HINT] = "DiagnosticHint",
				},
			},
		})
	end,
}
