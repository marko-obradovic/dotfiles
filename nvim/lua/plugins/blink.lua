return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},

			documentation = {
				auto_show = false,
			},
		},

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},

		fuzzy = {
			implementation = "lua",
		},
	},

	opts_extend = { "sources.default" },
}
