return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		delay = 200,
		large_file_cutoff = 2000,
		large_file_overrides = {
			providers = { "lsp" },
		},
	},
	config = function(_, opts)
		require("illuminate").configure(opts)

		-- 🔦 Highlight colors (mimic LazyVim behavior)
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "CursorLine" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "CursorLine" })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "CursorLine" })

		-- 🔁 Simple toggle keymap (since Snacks isn't available)
		vim.keymap.set("n", "<leader>ux", function()
			local illuminate = require("illuminate")
			if require("illuminate.engine").is_paused() then
				illuminate.resume()
				print("Illuminate: ON")
			else
				illuminate.pause()
				print("Illuminate: OFF")
			end
		end, { desc = "Toggle word highlight" })

		-- ⏩ Navigation keymaps for references
		local function map(key, dir, buffer)
			vim.keymap.set("n", key, function()
				require("illuminate")["goto_" .. dir .. "_reference"](false)
			end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
		end

		map("]]", "next")
		map("[[", "prev")

		-- Reset keymaps after filetype plugins are loaded (to avoid overwrite)
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local buffer = vim.api.nvim_get_current_buf()
				map("]]", "next", buffer)
				map("[[", "prev", buffer)
			end,
		})
	end,
	keys = {
		{ "]]", desc = "Next Reference" },
		{ "[[", desc = "Prev Reference" },
	},
}
