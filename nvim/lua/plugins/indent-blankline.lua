return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = { char = "│" },
		scope = { enabled = false }, -- LazyVim lets mini.indentscope handle the active line
		exclude = {
			filetypes = {
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
		},
	},
}
