return {
	"echasnovski/mini.indentscope",
	version = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"help",
				"dashboard",
				"neo-tree",
				"Trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})

		require("mini.indentscope").setup({
			symbol = "│",
			options = { try_as_border = true },
		})
		-- Custom color for the indent line
		vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#d79921", nocombine = true })
	end,
}
