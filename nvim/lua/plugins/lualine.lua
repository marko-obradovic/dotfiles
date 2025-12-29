return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local custom_theme = require("lualine.themes.auto")

		for _, mode in pairs(custom_theme) do
			for _, section in pairs(mode) do
				section.bg = "#282828"
			end
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,

				globalstatus = true,

				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16,
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
						"RecordingEnter",
						"RecordingLeave",
					},
				},
			},

			sections = {
				lualine_a = {
					{
						"mode",
						color = function()
							local mode_colors = {
								n = { fg = "#ebdbb2", bg = "#282828", gui = "bold" },
								i = { fg = "#b8bb26", bg = "#282828", gui = "bold" },
								v = { fg = "#fabd2f", bg = "#282828", gui = "bold" },
								V = { fg = "#fabd2f", bg = "#282828", gui = "bold" },
								c = { fg = "#83a598", bg = "#282828", gui = "bold" },
								R = { fg = "#fb4934", bg = "#282828", gui = "bold" },
								s = { fg = "#d3869b", bg = "#282828", gui = "bold" },
								S = { fg = "#d3869b", bg = "#282828", gui = "bold" },
								t = { fg = "#fe8019", bg = "#282828", gui = "bold" },
							}
							local current_mode = vim.fn.mode()
							return mode_colors[current_mode] or { fg = "#ebdbb2", bg = "#282828", gui = "bold" }
						end,
					},

					{
						function()
							local reg = vim.fn.reg_recording()
							if reg == "" then
								return ""
							end
							return "REC @" .. reg
						end,
						color = { fg = "#fb4934", bg = "#282828", gui = "bold" },
					},
				},

				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},

			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
