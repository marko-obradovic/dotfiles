return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- auto-installs tools
		"williamboman/mason-lspconfig.nvim", -- bridge between mason & lspconfig
		"neovim/nvim-lspconfig", -- core LSP support
		"saghen/blink.cmp", -- completion integration
	},
	opts = {
		ui = {
			border = "rounded",
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Formatters
				"stylua", -- Lua
				"shfmt", -- Shell
				"prettier", -- JS, HTML, CSS
				"black", -- Python
				-- Linters
				"flake8", -- Python linter
				"shellcheck", -- Shell linter
				-- "luacheck", -- Lua linter
				-- LSP servers (if you use lspconfig)
				"lua-language-server",
				"bash-language-server",
			},
			auto_update = false,
			run_on_start = true,
		})
	end,
}
