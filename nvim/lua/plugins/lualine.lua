return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Load and modify the default theme
		local custom_theme = require("lualine.themes.auto")

		-- Change the default background color for all modes
		for _, mode in pairs(custom_theme) do
			for _, section in pairs(mode) do
				section.bg = "#282828" -- your desired background color
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
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16, -- ~60fps
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
					},
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						color = function()
							local mode_colors = {
								n = { fg = "#ebdbb2", bg = "#282828", gui = "bold" }, -- NORMAL → light gray
								i = { fg = "#b8bb26", bg = "#282828", gui = "bold" }, -- INSERT → green
								v = { fg = "#fabd2f", bg = "#282828", gui = "bold" }, -- VISUAL → yellow
								V = { fg = "#fabd2f", bg = "#282828", gui = "bold" }, -- VISUAL LINE → yellow
								c = { fg = "#83a598", bg = "#282828", gui = "bold" }, -- COMMAND → blue
								R = { fg = "#fb4934", bg = "#282828", gui = "bold" }, -- REPLACE → red
								s = { fg = "#d3869b", bg = "#282828", gui = "bold" }, -- SELECT → magenta
								S = { fg = "#d3869b", bg = "#282828", gui = "bold" }, -- SELECT LINE → magenta
								t = { fg = "#fe8019", bg = "#282828", gui = "bold" }, -- TERMINAL → orange
							}
							local current_mode = vim.fn.mode()
							return mode_colors[current_mode] or { fg = "#ebdbb2", bg = "#282828", gui = "bold" }
						end,
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
